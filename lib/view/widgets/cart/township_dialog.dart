import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/cart_controller.dart';
import '../../../model/division.dart';

Widget townShipDialog({required Division division}) {
  CartController controller = Get.find();
  return Align(
    alignment: Alignment.bottomCenter,
    child: Container(
      width: 400,
      height: MediaQuery.of(Get.context!).size.height,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(),
          bottom: BorderSide(),
          left: BorderSide(),
          right: BorderSide(),
        ),
        color: Colors.white,
      ),
      child: /* ListView(
        children: division.townships.map((map) {
          return SizedBox(
            height: map.value.length * 50,
            child:  */
          ListView.builder(
              primary: false,
              itemCount: division.townships.length,
              itemBuilder: (context, index) {
                final township = division.townships[index];
                return TextButton(
                  onPressed: () {
                    controller.setTownShipNameAndShip(
                      name: township.name,
                      fee: "${township.fee}",
                    );
                    //Pop this dialog
                    Get.back();
                    Get.back();
                  },
                  child: Text(
                    township.name,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                );
              }),
      /* );
        }).toList(), */
    ),
  );
}
