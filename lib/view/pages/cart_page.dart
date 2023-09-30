import 'package:bookstore/constants.dart';
import 'package:bookstore/model/book.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controller/cart_controller.dart';
import '../widgets/cart/division_dialog.dart';
import '../widgets/cart/next_button.dart';
import '../widgets/cart/payment_options.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(top: 16, left: 16, right: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(40),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 8,
                    blurRadius: 12,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Text(
                "Your Cart",
                style: GoogleFonts.catamaran(
                  fontWeight: FontWeight.w900,
                  fontSize: 40,
                  height: 1,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Obx(
              () => cartController.myCart.isNotEmpty
                  ? Expanded(
                      child: ListView(
                        children: cartController.myCart.entries.map((e) {
                          final product = e.value[1] as Book;
                          final count = e.value[0] as int;
                          return Card(
                            margin:
                                EdgeInsets.only(top: 10, left: 10, right: 10),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                  ),
                                  child: /*FIXME: CachedNetworkImage */
                                      CachedNetworkImage(
                                    imageUrl: product.image,
                                    // "$baseUrl$itemUrl${controller.getItem(product.id).photo}/get",
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(product.title,
                                          style: TextStyle(
                                            fontSize: 12,
                                          )),
                                      SizedBox(height: 5),
                                      Text(
                                        "${product.price} ကျပ်",
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          cartController.reduceCount(product);
                                        },
                                        icon: Icon(Icons.remove),
                                      ),
                                      Text(count.toString()),
                                      IconButton(
                                        onPressed: () {
                                          cartController.addCount(product);
                                        },
                                        icon: Icon(Icons.add),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    )
                  : const Expanded(
                      child: Center(
                        child: Text(
                          "No products yet....",
                        ),
                      ),
                    ),
            ),
            // AddPromotionWidget(),
            Align(
              alignment: Alignment.bottomCenter,
              child: GetBuilder<CartController>(builder: (controller) {
                return Container(
                  width: double.infinity,
                  height: 200,
                  child: Card(
                    elevation: 3,
                    margin: EdgeInsets.only(
                      top: 10,
                      left: 10,
                      right: 10,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                            left: 10,
                            right: 10,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "ကုန်ပစ္စည်းအတွက် ကျသင့်ငွေ",
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                "${controller.subTotal} ကျပ်",
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Obx(() {
                          final hasError =
                              controller.firstTimePressedCart.value &&
                                  controller.townShipNameAndFee.isEmpty;
                          return Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: hasError
                                    ? Colors.red
                                    : Colors.white.withOpacity(0),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 10,
                                left: 10,
                                right: 10,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  //DropDown TownShip List
                                  Container(
                                    width: 250,
                                    height: 50,
                                    child: GetBuilder<CartController>(
                                        builder: (controller) {
                                      return InkWell(
                                        onTap: () {
                                          //Show Dialog
                                          showDialog(
                                              barrierColor:
                                                  Colors.white.withOpacity(0),
                                              context: context,
                                              builder: (context) {
                                                return divisionDialogWidget();
                                              });
                                        },
                                        child: Container(
                                          child: Row(children: [
                                            //Township Name
                                            Expanded(
                                              child: Text(
                                                controller.townShipNameAndFee[
                                                        "townName"] ??
                                                    "မြို့နယ်",
                                                maxLines: 1,
                                                style: const TextStyle(
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ),
                                            //DropDown Icon
                                            const Expanded(
                                                child: Icon(FontAwesomeIcons
                                                    .angleRight)),
                                          ]),
                                        ),
                                      );
                                    }),
                                  ),
                                  GetBuilder<CartController>(
                                      builder: (controller) {
                                    return Row(
                                      children: [
                                        Text(
                                          controller.townShipNameAndFee.isEmpty
                                              ? "0 ကျပ်"
                                              : " ${controller.townShipNameAndFee["fee"]} ကျပ်",
                                          style: const TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    );
                                  }),
                                ],
                              ),
                            ),
                          );
                        }),
                        Container(
                          width: double.infinity,
                          height: 40,
                          margin: const EdgeInsets.only(
                            left: 10,
                            top: 10,
                            right: 10,
                          ),
                          padding: EdgeInsets.only(left: 10, right: 10),
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(25, 25, 25, 1),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "စုစုပေါင်း ကျသင့်ငွေ   =  ",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              GetBuilder<CartController>(builder: (controller) {
                                return Text(
                                  controller.townShipNameAndFee.isEmpty
                                      ? "${controller.subTotal}"
                                      : "${controller.subTotal + controller.townShipNameAndFee["fee"]} ကျပ်",
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                );
                              }),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
            Container(
              width: double.infinity,
              height: 45,
              margin: const EdgeInsets.only(
                  top: 10, left: 10, right: 10, bottom: 10),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(kPrimaryColor),
                ),
                onPressed: () {
                  if (cartController.checkToAcceptOrder()) {
                    //TODO: SHOW DIALOG TO CHOOSE OPTION,THEN GO TO CHECKOUT
                    Get.defaultDialog(
                      backgroundColor: Colors.white70,
                      titlePadding: EdgeInsets.all(8),
                      contentPadding: EdgeInsets.all(0),
                      title: "ရွေးချယ်ရန်",
                      content: const PaymentOptionContent(),
                      barrierDismissible: false,
                      confirm: nextButton(),
                    );
                    //Get.toNamed(checkOutScreen);
                  }
                },
                child: Text(
                  "Order တင်ရန် နှိပ်ပါ",
                  style: TextStyle(
                    wordSpacing: 1,
                    letterSpacing: 1,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
