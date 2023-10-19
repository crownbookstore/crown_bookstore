import 'dart:developer';

import 'package:bookstore/controller/cart_controller.dart';
import 'package:bookstore/view/pages/check_out_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants.dart';
import '../../utils/fun.dart';
import '../widgets/cart/division_dialog.dart';
import '../widgets/cart/my_gradient_button.dart';
import 'bookstore.dart';

class NewCheckoutPage extends StatelessWidget {
  const NewCheckoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find();
    return Scaffold(
      backgroundColor: scaffoldBackground,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: appBarColor,
        title: Text("Checkout"),
        centerTitle: true,
        titleTextStyle: GoogleFonts.catamaran(
          fontWeight: FontWeight.w900,
          fontSize: 30,
          height: 1,
          color: Colors.black,
        ),
        leading: Container(
          margin: EdgeInsets.only(
            top: 7,
            bottom: 10,
            left: 7,
          ),
          width: 40,
          child: ElevatedButton(
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(0),
              alignment: Alignment.center,
              padding: MaterialStateProperty.all(EdgeInsets.all(0)),
              backgroundColor: MaterialStateProperty.all(Colors.white),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              )),
              overlayColor: MaterialStateProperty.all(Colors.black12),
            ),
            onPressed: Get.back,
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          //Step Title
          StepTitle(),
          const SizedBox(
            height: 20,
          ),
          //Step Body
          Expanded(
            child: Obx(() {
              final currentIndex = cartController.checkOutStep.value;
              switch (currentIndex) {
                case 1:
                  return FormWidget();
                case 2:
                  return PaymentWidget();
                case 3:
                default:
                  return Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ButtonWidget(
                            cartController: cartController,
                            title: 'နောက်သို့',
                            onPressed: () {
                              cartController.changeStepIndex(2);
                            },
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          ButtonWidget(
                            cartController: cartController,
                            title: 'အတည်ပြု',
                            onPressed: () {
                              cartController.proceedToPay();
                            },
                          ),
                        ],
                      ),
                    ),
                  );
              }
            }),
          ),
        ],
      ),
      bottomNavigationBar: Obx(() {
        final paymentStep = cartController.paymentOptionStep.value;
        final checkOutStep = cartController.checkOutStep.value;
        if (paymentStep == 2 && checkOutStep == 2) {
          return Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonWidget(
                  cartController: cartController,
                  title: 'နောက်သို့',
                  onPressed: () {
                    cartController.changeStepIndex(1);
                  },
                ),
                const SizedBox(
                  width: 20,
                ),
                ButtonWidget(
                  cartController: cartController,
                  title: 'ရှေ့ဆက်ရန်',
                  onPressed: () {
                    if (cartController.checkToAcceptOrder() &&
                        cartController.checkToAcceptPrepay()) {
                      cartController.changeStepIndex(3);
                    }
                  },
                ),
              ],
            ),
          );
        } else {
          return const SizedBox();
        }
      }),
    );
  }
}

class StepTitle extends StatelessWidget {
  const StepTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Personal Info
          StepTitleItem(
            hasLeftLine: false,
            title: "ကိုယ်ရေးအချက်အလက်",
            index: 1,
          ),
          //Payment
          StepTitleItem(
            title: "ငွေပေးချေမှု",
            index: 2,
          ),
          //Confirmation
          StepTitleItem(
            title: "အတည်ပြု",
            hasRightLine: false,
            index: 3,
          ),
        ],
      ),
    );
  }
}

class StepTitleItem extends StatelessWidget {
  final bool hasLeftLine;
  final bool hasRightLine;
  final String title;
  final int index;
  const StepTitleItem({
    Key? key,
    this.hasLeftLine = true,
    this.hasRightLine = true,
    required this.title,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find();
    return Obx(() {
      final currentIndex = cartController.checkOutStep.value;
      return Expanded(
        child: InkWell(
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
/*           onTap: () => cartController.changeStepIndex(index),
 */
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //Circle
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: 2,
                      color: hasLeftLine ? kPrimaryColor : Colors.white,
                    ),
                  ),
                  CircleAvatar(
                    radius: 8,
                    backgroundColor: kPrimaryColor,
                    child: CircleAvatar(
                      radius: 6,
                      backgroundColor:
                          currentIndex >= index ? kPrimaryColor : Colors.white,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 2,
                      color: hasRightLine ? kPrimaryColor : Colors.white,
                    ),
                  ),
                ],
              ),
              //Text
              Text(
                title,
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
            ],
          ),
        ),
      );
    });
  }
}

class PaymentWidget extends StatelessWidget {
  const PaymentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find();
    return Column(
      children: [
        //Options Payment
        Obx(() {
          final paymentOptions = cartController.paymentOptions.value;
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              paymentOptions == PaymentOptions.deliveryHome
                  ? PaymentOptionItem(
                      title: "အိမ်အရောက်ငွေချေ",
                      index: 1,
                    )
                  : const SizedBox(),
              paymentOptions == PaymentOptions.deliveryHome
                  ? PaymentOptionItem(
                      title: "ငွေကြိုလွဲ",
                      index: 2,
                    )
                  : const SizedBox(),
              /* paymentOptions == PaymentOptions.pushGate
                  ? PaymentOptionItem(
                      title: "ဂိတ်တင်",
                      index: 3,
                    )
                  : const SizedBox(), */
            ],
          );
        }),
        //Body
        Expanded(child: Obx(() {
          final currentPaymentIndex = cartController.paymentOptionStep.value;
          switch (currentPaymentIndex) {
            case 1:
              //Cash On Delivery
              return CashOnDeliveryWidget(cartController: cartController);
            case 2:
              //PrePay
              return PrepayWidget(cartController: cartController);
            case 3:
              //Gate
              return PushGateWidget(cartController: cartController);
            default:
              return Container();
          }
        })),
      ],
    );
  }
}

class PushGateWidget extends StatelessWidget {
  const PushGateWidget({
    Key? key,
    required this.cartController,
  }) : super(key: key);

  final CartController cartController;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        margin: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 25,
        ),
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: MyElevatedButton(
                gradient: LinearGradient(
                    colors: [Color(0xFF4070FF), Color(0xFFE94B9C)]),
                borderRadius: BorderRadius.all(Radius.circular(5)),
                height: 35,
                onPressed: () => launchSocialApp(messengerBaseUrl),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      FontAwesomeIcons.facebookMessenger,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      "Messenger",
                      style: GoogleFonts.catamaran(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(child: Container()),
                    Icon(
                      FontAwesomeIcons.chevronRight,
                      color: Colors.white,
                      size: 12,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text("(သို့မဟုတ်)"),
            ContactItem(
              onPressed: () => launchSocialApp(viberBaseUrl),
              text: "+959420086031",
              icon: FontAwesomeIcons.viber,
              color: Color(0xFF7C65F3),
            ),
            Text("သို့ဆက်သွယ်ပေးပါ။"),
            const SizedBox(
              height: 25,
            ),
            ButtonWidget(
              cartController: cartController,
              title: 'နောက်သို့',
              onPressed: () {
                cartController.changeStepIndex(1);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CashOnDeliveryWidget extends StatelessWidget {
  const CashOnDeliveryWidget({
    Key? key,
    required this.cartController,
  }) : super(key: key);

  final CartController cartController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
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
                  "${cartController.subTotal} ကျပ်",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          //Division
          Obx(() {
            final hasError = cartController.firstTimePressedCart.value &&
                cartController.townShipNameAndFee.isEmpty;
            return Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: hasError ? Colors.red : Colors.white.withOpacity(0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  left: 10,
                  right: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    //DropDown TownShip List
                    Container(
                      width: 250,
                      height: 50,
                      child: GetBuilder<CartController>(builder: (controller) {
                        return InkWell(
                          onTap: () {
                            //Show Dialog
                            showDialog(
                                barrierColor: Colors.white.withOpacity(0),
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
                                  controller.townShipNameAndFee["townName"] ??
                                      "မြို့နယ်",
                                  maxLines: 1,
                                  style: const TextStyle(
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                              //DropDown Icon
                              const Expanded(
                                  child: Icon(FontAwesomeIcons.angleRight)),
                            ]),
                          ),
                        );
                      }),
                    ),
                    GetBuilder<CartController>(builder: (controller) {
                      return Text(
                        controller.townShipNameAndFee.isEmpty
                            ? "0 ကျပ်"
                            : " ${controller.townShipNameAndFee["fee"]} ကျပ်",
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.end,
                      );
                    }),
                  ],
                ),
              ),
            );
          }),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Text(
              "ပို့ခစျေးမှာ 5kgအတွက်သာဖြစ်ပါသည်",
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.5,
              ),
            ),
          ),
          //Total
          Container(
            width: double.infinity,
            height: 40,
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
          //Continue
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonWidget(
                  cartController: cartController,
                  title: 'နောက်သို့',
                  onPressed: () {
                    cartController.changeStepIndex(1);
                  },
                ),
                const SizedBox(
                  width: 20,
                ),
                ButtonWidget(
                  cartController: cartController,
                  title: 'ရှေ့ဆက်ရန်',
                  onPressed: () {
                    if (cartController.checkToAcceptOrder()) {
                      cartController.changeStepIndex(3);
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ButtonWidget extends StatelessWidget {
  final void Function()? onPressed;
  final String title;
  const ButtonWidget({
    Key? key,
    required this.onPressed,
    required this.title,
    required this.cartController,
  }) : super(key: key);

  final CartController cartController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: ElevatedButton(
        style: buttonStyle,
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}

class PrepayWidget extends StatelessWidget {
  const PrepayWidget({
    Key? key,
    required this.cartController,
  }) : super(key: key);

  final CartController cartController;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Image.asset(
                      "assets/kbz_pay.webp",
                      width: 112,
                      height: 63,
                    ),
                    const SizedBox(height: 5),
                  ],
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      " Nyein Chan Nay Win",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        primary: Colors.black,
                        textStyle: const TextStyle(fontSize: 16),
                      ),
                      onPressed: () {
                        Clipboard.setData(
                                new ClipboardData(text: "09764397743"))
                            .then((_) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                  "KBZ Pay Account နံပါတ် 09 420 08 6031 ကို Copy ကူး လိုက်ပါပြီ")));
                        });
                      },
                      child: const Text('09 420 08 6031'),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Image.asset(
                      "assets/wave_pay.png",
                      width: 112,
                      height: 63,
                    ),
                    SizedBox(height: 5),
                  ],
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      " Nyein Chan Nay Win",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        primary: Colors.black,
                        textStyle: const TextStyle(fontSize: 16),
                      ),
                      onPressed: () {
                        Clipboard.setData(
                                new ClipboardData(text: "28630128600633901"))
                            .then((_) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                  "WavePay Account နံပါတ် 09 420 08 6031 ကို Copy ကူး လိုက်ပါပြီ")));
                        });
                      },
                      child: const Text('09 420 08 6031'),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),

            //Button
            OutlinedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.black, width: 2),
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              )),
              onPressed: () => getBankSlip(cartController),
              child: Text("KBZ Pay / WavePay Screenshot"),
            ),
            //Image String
            Obx(
              () => SizedBox(
                height: 50,
                /* width: size.width, */
                child: Row(children: [
                  SizedBox(
                    width: size.width * 0.7,
                    child: Text(
                      cartController.bankSlipImage.value,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.black,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  cartController.bankSlipImage.value.isNotEmpty
                      ? SizedBox(
                          width: 50,
                          child: IconButton(
                            onPressed: () =>
                                cartController.setBankSlipImage(""),
                            icon: Icon(
                              FontAwesomeIcons.times,
                              color: Colors.black,
                            ),
                          ),
                        )
                      : SizedBox(height: 0, width: 0),
                ]),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
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
                    "${cartController.subTotal} ကျပ်",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            //Division
            Obx(() {
              final hasError = cartController.firstTimePressedCart.value &&
                  cartController.townShipNameAndFee.isEmpty;
              return Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: hasError ? Colors.red : Colors.white.withOpacity(0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                    left: 10,
                    right: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      //DropDown TownShip List
                      Container(
                        width: 250,
                        height: 50,
                        child:
                            GetBuilder<CartController>(builder: (controller) {
                          return InkWell(
                            onTap: () {
                              //Show Dialog
                              showDialog(
                                  barrierColor: Colors.white.withOpacity(0),
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
                                    controller.townShipNameAndFee["townName"] ??
                                        "မြို့နယ်",
                                    maxLines: 1,
                                    style: const TextStyle(
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                                //DropDown Icon
                                const Expanded(
                                    child: Icon(FontAwesomeIcons.angleRight)),
                              ]),
                            ),
                          );
                        }),
                      ),
                      GetBuilder<CartController>(builder: (controller) {
                        return Text(
                          controller.townShipNameAndFee.isEmpty
                              ? "0 ကျပ်"
                              : " ${controller.townShipNameAndFee["fee"]} ကျပ်",
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.end,
                        );
                      }),
                    ],
                  ),
                ),
              );
            }),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Text(
                  "ပို့ခစျေးမှာ 5kgအတွက်သာဖြစ်ပါသည်",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ),
            //Total
            Container(
              width: double.infinity,
              height: 40,
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
            //Continue
/* 
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtonWidget(
                    cartController: cartController,
                    title: 'နောက်သို့',
                    onPressed: () {
                      cartController.changeStepIndex(1);
                    },
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  ButtonWidget(
                    cartController: cartController,
                    title: 'ရှေ့ဆက်ရန်',
                    onPressed: () {
                      if (cartController.checkToAcceptOrder() &&
                          cartController.checkToAcceptPrepay()) {
                        cartController.changeStepIndex(3);
                      }
                    },
                  ),
                ],
              ),
            ),
           */
          ],
        ),
      ),
    );
  }
}

class PaymentOptionItem extends StatelessWidget {
  final int index;
  final String title;
  const PaymentOptionItem({
    Key? key,
    required this.index,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find();
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: /* Expanded(child:  */ Obx(() {
        final currentIndex = cartController.paymentOptionStep.value;
        return InkWell(
          onTap: () => cartController.changePaymentOptionIndex(index),
          child: Container(
            padding: EdgeInsets.only(
              left: 5,
              right: 5,
            ),
            decoration: BoxDecoration(
                color: currentIndex == index ? kPrimaryColor : Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(
                  15,
                )),
                border: Border.all(
                  color: kPrimaryColor,
                )),
            height: 50,
            child: Center(
                child: Text(
              title,
              style: TextStyle(
                fontSize: 12,
                color: currentIndex == index ? Colors.white : Colors.black,
              ),
            )),
          ),
        );
      } /* ) */),
    );
  }
}
