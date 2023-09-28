import 'package:bookstore/controller/cart_controller.dart';
import 'package:bookstore/controller/data_controller.dart';
import 'package:bookstore/controller/home_controller.dart';
import 'package:bookstore/model/hive_book.dart';
import 'package:bookstore/router/route_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants.dart';
import 'model/hive_purchase.dart';
import 'router/router.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter<HiveBook>(HiveBookAdapter());
  await Hive.openBox<HiveBook>(boxName);
  Hive.registerAdapter<HivePurchase>(HivePurchaseAdapter());
  await Hive.openBox<HivePurchase>(purchaseBox);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(DataController());
    Get.put(HomeController());
    Get.put(CartController());
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.catamaranTextTheme(),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: homePage,
      getPages: routeList,
    );
  }
}
