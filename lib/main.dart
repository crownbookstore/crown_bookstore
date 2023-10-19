import 'package:bookstore/controller/cart_controller.dart';
import 'package:bookstore/controller/data_controller.dart';
import 'package:bookstore/controller/home_controller.dart';
import 'package:bookstore/model/hive_book.dart';
import 'package:bookstore/router/route_name.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants.dart';
import 'model/hive_purchase.dart';
import 'router/router.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
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
    Get.put(CartController());
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: GoogleFonts.catamaranTextTheme(),
          bottomSheetTheme: BottomSheetThemeData(
            modalBackgroundColor: Colors.transparent,
            backgroundColor: Colors.transparent,
          )),
      debugShowCheckedModeBanner: false,
      initialRoute: homePage,
      getPages: routeList,
    );
  }
}
