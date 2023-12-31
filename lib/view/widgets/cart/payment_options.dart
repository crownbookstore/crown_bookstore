import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../constants.dart';
import 'custom_checkbox.dart';

class PaymentOptionContent extends StatelessWidget {
  const PaymentOptionContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomCheckBox(
            height: 50,
            options: PaymentOptions.CashOnDelivery,
            icon: FontAwesomeIcons.truck,
            iconColor: kPrimaryColor,
            text: "ပစ္စည်း ရောက်မှ ငွေချေမယ်",
          ),
          SizedBox(height: 5),
          CustomCheckBox(
            height: 50,
            options: PaymentOptions.PrePay,
            icon: FontAwesomeIcons.moneyBill,
            iconColor: kPrimaryColor,
            text: "ငွေကြိုလွှဲမယ်",
          ),
        ],
      ),
    );
  }
}
