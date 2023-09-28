import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants.dart';
import '../../../controller/cart_controller.dart';
import '../../pages/check_out_page.dart';

Widget nextButton() {
  CartController controller = Get.find();
  return //Next
      Container(
    height: 50,
    width: double.infinity,
    decoration: BoxDecoration(
      color: kPrimaryColor,
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
    ),
    child: TextButton(
      onPressed: () {
        if (controller.paymentOptions != PaymentOptions.None) {
          //Go To CheckOut Screen
          Navigator.of(Get.context!).pop();
          Get.to(() => const CheckOutScreen());
        }
      },
      child: Text("OK", style: TextStyle(color: Colors.white, fontSize: 16)),
    ),
  );
}
