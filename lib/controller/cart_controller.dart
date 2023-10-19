import 'dart:convert';

import 'package:bookstore/model/book.dart';
import 'package:bookstore/model/hive_book.dart';
import 'package:bookstore/server/reference.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:uuid/uuid.dart';
import '../constants.dart';
import '../model/hive_purchase.dart';
import '../model/purchase.dart';
import '../utils/show_loading.dart';
import '../view/widgets/cart/next_button.dart';
import '../view/widgets/cart/payment_options.dart';

class CartController extends GetxController {
  final GlobalKey<FormState> form = GlobalKey();
  RxList<String> userOrderData = <String>[].obs;
  final RxMap<String, List<dynamic>> myCart = <String, List<dynamic>>{}.obs;
  Map<String, dynamic> townShipNameAndFee = {};
  var firstTimePressedCart = false.obs;
  var bankSlipImage = "".obs;
  var checkOutStep = 1.obs;
  var paymentOptionStep = 0.obs;
  var paymentOptions = PaymentOptions.None.obs;
  var paymentMethod = PaymentMethod.cashOnDelivery.obs;
  int mouseIndex = -1; //Mouse Region
  Box<HivePurchase> purchaseHiveBox = Hive.box(purchaseBox);
  var purchaseId = "".obs;

  void setPurchaseId(String value) {
    purchaseId.value = value;
  }

  void setPaymentMethod(PaymentMethod method) => paymentMethod.value = method;
  void addCount(Book product) {
    if (myCart.containsKey(product.id)) {
      var previousCount = myCart[product.id]![0] as int;
      myCart[product.id] = [previousCount + 1, product];
    } else {
      myCart.putIfAbsent(product.id, () => [1, product]);
    }
    update([myCart]);
    updateSubTotal(true);
  }

  void reduceCount(Book p) {
    final previousCount = myCart[p.id]![0] as int;
    if (previousCount > 1) {
      myCart[p.id] = [previousCount - 1, p];
    } else {
      myCart.remove(p.id);
    }
    updateSubTotal(true);
  }

  int subTotal = 0;
  void updateSubTotal(bool isUpdate) {
    if (subTotal != 0) {
      subTotal = 0;
    }
    int price = 0;
    for (var list in myCart.values) {
      final item = list[1] as Book;
      final count = list[0] as int;

      //---for normal products----//
      price += (item.discountPrice ?? item.price.round()) * count;
    }
    subTotal = price;
    if (isUpdate) {
      update();
    }
  }

  bool checkToAcceptPrepay() {
    if (bankSlipImage.isEmpty) {
      Get.snackbar('Error', "Plase pick a screenshot.");
      return false;
    } else {
      return true;
    }
  }

  bool checkCart() {
    if (myCart.isEmpty) {
      Get.snackbar('Error', "Cart is empty");
      return false;
    } else {
      return true;
    }
  }

  bool checkToAcceptOrder() {
    if (myCart.isEmpty) {
      Get.snackbar('Error', "Cart is empty");
      return false;
    } else if (townShipNameAndFee.isEmpty) {
      Get.snackbar('Error', "Need to choose a township");
      firstTimePressedCart.value = true;
      return false;
    } else {
      return true;
    }
  }

  //Go to messenger
  void launchMessenger() async {
    // Convert the product object to a JSON string
    String productJson = jsonEncode(myCart.toJson());

    // Encode the JSON string for use in a URL
    String encodedProduct = Uri.encodeComponent(productJson);

    // Compose your deep link with the encoded data
    Uri deepLink = Uri.parse('$messengerBaseUrl');

    // Check if the app can launch the deep link
/*     if (await canLaunchUrl(deepLink)) {
 */
    await launchUrl(deepLink);
    /* } else {
      throw 'Could not launch $deepLink';
    } */
  }

  void changeMouseIndex(int i) {
    // Change Mouse Region
    mouseIndex = i;
    debugPrint("On Mouse Exist************");
    update();
  }

  String? townshipName;
  void setTownshipName(String? val) {
    townshipName = val!;
    update();
  }

  void setTownShipNameAndShip({required String name, required String fee}) {
    townShipNameAndFee = {
      "townName": name,
      "fee": int.parse(fee),
    };
    update();
  }

  void changePaymentOptions(PaymentOptions option) {
    paymentOptions.value = option;
    paymentOptionStep.value = 0;
    if (option == PaymentOptions.pushGate) {
      paymentOptionStep.value = 3;
    } else {
      paymentOptionStep.value = 1;
    }
  }

  //Change Step Index
  void changeStepIndex(int value) {
    if (value == 2) {
      //Need to choose payment options
      Get.defaultDialog(
        backgroundColor: Colors.white70,
        titlePadding: EdgeInsets.all(8),
        contentPadding: EdgeInsets.all(0),
        title: "ရွေးချယ်ရန်",
        content: const PaymentOptionContent(),
        barrierDismissible: false,
        confirm: nextButton(),
      );
    }
    checkOutStep.value = value;
  }

  void changePaymentOptionIndex(int value) => paymentOptionStep.value = value;

  //Set Bank Slip Image
  void setBankSlipImage(String image) {
    bankSlipImage.value = image;
  }

  List<String> getUserOrderData() {
    return sharedPref.getStringList("userOrder") ?? [];
  }

  //Set User's Order Data or Not
  Future<void> setUserOrderData({
    required String name,
    required String email,
    required String phone,
    required String address,
    required String note,
  }) async {
    //Making Purchase Model
    try {} catch (e) {}
    final list = getUserOrderData();
    //Check data already contain with the same data inside SharedPreference
    if (list.isEmpty) {
      await sharedPref
          .setStringList("userOrder", [name, email, phone, address, note]);
    } else if ( //Something is changed by User,then we restore
        (name != list[0]) ||
            (email != list[1]) ||
            (phone != list[2]) ||
            (address != list[3]) ||
            (note != list[4])) {
      await sharedPref
          .setStringList("userOrder", [name, email, phone, address]);
    }
  }

  late SharedPreferences sharedPref;
  @override
  void onInit() async {
    sharedPref = await SharedPreferences.getInstance();
    userOrderData.value = getUserOrderData();
    if (userOrderData.isNotEmpty) {
      checkOutStep.value = 1;
    }
    super.onInit();
  }

  ///Get for Payment Method
  String getPaymentMethod(/* PaymentMethod method */) {
    switch (paymentOptionStep.value) {
      case 2:
        return bankSlip;
      case 1:
        return cashOnDelivery;
      default:
        return "Something Wrong!";
    }
  }

  List<Book> getProducts() => myCart.entries.map((e) {
        final product = e.value[1] as Book;
        final count = e.value[0] as int;
        return product.copyWith(
          image: product.image,
          description: "",
          count: count,
        );
      }).toList();

  Future<void> proceedToPay() async {
    showLoading();
    final total = subTotal + townShipNameAndFee["fee"] as int;
    try {
      final list = getUserOrderData();
      final _purchase = PurchaseModel(
        total: total,
        paymentMethod: getPaymentMethod(/* paymentMethod.value */),
        dateTime: DateTime.now().toString(),
        id: Uuid().v1(),
        items: myCart.entries.map((e) {
          final product = e.value[1] as Book;
          final count = e.value[0] as int;
          return product.copyWith(
            image: product.image,
            description: "",
            count: count,
          );
        }).toList(),
        name: list[0],
        email: list[1],
        phone: list[2],
        address: list[3],
        bankSlipImage: bankSlipImage.value.isEmpty ? null : bankSlipImage.value,
        deliveryTownshipInfo: [
          townShipNameAndFee["townName"],
          townShipNameAndFee["fee"]
        ],
      );
      final hivePurchase = HivePurchase(
        id: Uuid().v1(),
        items: _purchase.items
            .map((e) => HiveBook(
                  id: e.id,
                  name: e.title,
                  image: e.image,
                  price: e.discountPrice ?? e.price,
                  count: e.count!,
                ))
            .toList(),
        totalPrice: total,
        deliveryTownshipInfo: _purchase.deliveryTownshipInfo,
        dateTime: DateTime.now(),
      );
      FirebaseReference.checkUploadImage(
              bankSlipImage.value.isNotEmpty, "orders", bankSlipImage.value)
          .then((value) async {
        await FirebaseReference.orderDocument(_purchase.id)
            .set(_purchase.copyWith(bankSlipImage: value));
        hideLoading();
        Get.back();
        Get.snackbar("လူကြီးမင်း Order တင်ခြင်း", 'အောင်မြင်ပါသည်');
        clearAll();
        purchaseHiveBox.put(hivePurchase.id, hivePurchase);
      });
    } catch (e) {
      hideLoading();
      Get.snackbar("လူကြီးမင်း Order တင်ခြင်း", 'မအောင်မြင်ပါ');
      print("proceed to pay error $e");
    }
  }

  void clearAll() {
    myCart.clear();
    subTotal = 0;
    townshipName = "";
    townShipNameAndFee = {};
    paymentOptions = PaymentOptions.None.obs;
    bankSlipImage = "".obs;
    checkOutStep.value = 1;
    paymentOptionStep.value = 0;
    firstTimePressedCart = false.obs;
  }
}
