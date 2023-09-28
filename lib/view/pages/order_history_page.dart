import 'package:bookstore/controller/cart_controller.dart';
import 'package:bookstore/controller/data_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../model/hive_purchase.dart';
import '../../constants.dart';

class OrderHistory extends StatelessWidget {
  const OrderHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DataController dataController = Get.find();
    CartController controller = Get.find();
    final size = MediaQuery.of(context).size;
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
                "Order History",
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
            Expanded(
              child: ValueListenableBuilder(
                valueListenable:
                    Hive.box<HivePurchase>(purchaseBox).listenable(),
                builder: (context, Box<HivePurchase> box, widget) {
                  return box.isNotEmpty
                      ? SizedBox(
                          height: size.height,
                          width: size.width,
                          child: ListView(
                            children: List.generate(box.values.length, (index) {
                              final purchase = box.values.toList()[index];
                              return Obx(() {
                                final isExpanded =
                                    controller.purchaseId.value == purchase.id;
                                return Dismissible(
                                  key: Key(purchase.id),
                                  background: Container(
                                    color: Colors.black12,
                                  ),
                                  onDismissed: (direction) {
                                    box.delete(purchase.id);
                                  },
                                  direction: DismissDirection.startToEnd,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ExpansionPanelList(
                                        expansionCallback: (index,
                                                isExpanded) =>
                                            controller.setPurchaseId(
                                                isExpanded ? "" : purchase.id),
                                        children: [
                                          ExpansionPanel(
                                            isExpanded:
                                                controller.purchaseId.value ==
                                                    purchase.id,
                                            canTapOnHeader: true,
                                            headerBuilder: (context, isExpand) {
                                              return ListTile(
                                                leading: CircleAvatar(
                                                  backgroundColor:
                                                      kPrimaryColor,
                                                  radius: 15,
                                                  child: Text(
                                                    "${index + 1}",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                                title: Text(
                                                    "ကုန်ပစ္စည်းအရေအတွက် = ${purchase.items.length}ခု"),
                                                subtitle: Text(
                                                    "${purchase.totalPrice} ကျပ် "
                                                    "ပို့ခ ${purchase.deliveryTownshipInfo[1]}ကျပ် ပေါင်းပြီး"),
                                                trailing: Text(
                                                    "${purchase.dateTime.day}/${purchase.dateTime.month}/${purchase.dateTime.year}"),
                                              );
                                            },
                                            body: SizedBox(
                                              height:
                                                  purchase.items.length * 50,
                                              width: size.width * 0.8,
                                              child: ListView.builder(
                                                padding: EdgeInsets.all(0),
                                                itemCount:
                                                    purchase.items.length,
                                                itemBuilder: (_, o) {
                                                  final item =
                                                      purchase.items[o];
                                                  final price = item.price;
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 5),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          item.name,
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 12),
                                                        ),
                                                        const SizedBox(
                                                          width: 25,
                                                        ),
                                                        Text(
                                                          "$price x  ${item.count} ခု",
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 10),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ]),
                                  ),
                                );
                              });
                            }),
                          ),
                        )
                      : const Center(
                          child: Text("No order history."),
                        );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
