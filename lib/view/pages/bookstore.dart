import 'package:bookstore/controller/cart_controller.dart';
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
          style: TextStyle(
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
            children: [
              buildNavigationItem(
                  item: navItems[0],
                  index: 0,
                  selectedIndex: navIndex,
                  onTap: () {
                    dataController.changeBottomNavIndex(0);
                  }),
              buildNavigationItem(
                  item: navItems[1],
                  index: 1,
                  selectedIndex: navIndex,
                  onTap: () {
                    dataController.changeBottomNavIndex(1);
                  }),
              buildNavigationItem(
                  item: navItems[2],
                  index: 2,
                  selectedIndex: navIndex,
                  onTap: () {
                    dataController.changeBottomNavIndex(2);
                  }),
              stackBuildNavigationItem(
                  item: navItems[3],
                  index: 3,
                  selectedIndex: navIndex,
                  onTap: () {
                    dataController.changeBottomNavIndex(3);
                  }),
              buildNavigationItem(
                  item: navItems[4],
                  index: 4,
                  selectedIndex: navIndex,
                  onTap: () {
                    dataController.changeBottomNavIndex(4);
                  })
            ],
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

Widget stackBuildNavigationItem(
    {required NavigationItem item,
    required int index,
    required int selectedIndex,
    void Function()? onTap}) {
  final CartController controller = Get.find();
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: 50,
      child: Stack(
        children: [
          Obx(() {
            final count = controller.myCart.length;
            return Positioned(
              right: 0,
              top: 10,
              child: CircleAvatar(
                radius: 10,
                backgroundColor:
                    selectedIndex == index ? kPrimaryColor : Colors.grey[400],
                child: Text(
                  "$count",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
            );
          }),
          Center(
            child: SvgPicture.asset(
              item.imagePath,
              color: selectedIndex == index ? kPrimaryColor : Colors.grey[400],
              width: 28,
              height: 28,
            ),
          ),
        ],
      ),
    ),
  );
}
