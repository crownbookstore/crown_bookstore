import 'package:bookstore/controller/data_controller.dart';
import 'package:bookstore/router/route_name.dart';
import 'package:bookstore/view/pages/author_page.dart';
import 'package:bookstore/view/pages/cart_page.dart';
import 'package:bookstore/view/pages/category_page.dart';
import 'package:bookstore/view/pages/home_page.dart';
import 'package:bookstore/view/pages/order_history_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:bookstore/data.dart';
import 'package:bookstore/constants.dart';
import 'package:google_fonts/google_fonts.dart';

List<Widget> pages = [
  HomePage(),
  CategoryPage(),
  AuthorPage(),
  CartPage(),
  OrderHistory(),
];

class Bookstore extends StatelessWidget {
  const Bookstore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DataController dataController = Get.find();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        brightness: Brightness.light,
        /* leading:  Icon(
          Icons.sort,
          color: kPrimaryColor,
          size: 28,
        )
        , */
        title: Text(
          "CROWN",
          textAlign: TextAlign.center,
          style: GoogleFonts.croissantOne(
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
            letterSpacing: 3,
            fontSize: 20,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(
              right: 16,
            ),
            child: InkWell(
              onTap: () => Get.toNamed(searchPage),
              child: Icon(
                Icons.search,
                color: Colors.grey[400],
                size: 28,
              ),
            ),
          ),
        ],
      ),
      body: Obx(() => pages[dataController.bottomNavIndex.value]),
      bottomNavigationBar: Container(
        height: 70,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
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
        child: Obx(() {
          final navIndex = dataController.bottomNavIndex.value;
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
                navItems.length,
                (index) => buildNavigationItem(
                    item: navItems[index],
                    index: index,
                    selectedIndex: navIndex,
                    onTap: () {
                      dataController.changeBottomNavIndex(index);
                    })),
          );
        }),
      ),
    );
  }

  Widget buildNavigationItem(
      {required NavigationItem item,
      required int index,
      required int selectedIndex,
      void Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 50,
        child: Center(
          child: SvgPicture.asset(
            item.imagePath,
            color: selectedIndex == index ? kPrimaryColor : Colors.grey[400],
            width: 28,
            height: 28,
          ),
        ),
      ),
    );
  }
}
