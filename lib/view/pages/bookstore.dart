import 'package:bookstore/controller/cart_controller.dart';
import 'package:bookstore/controller/data_controller.dart';
import 'package:bookstore/router/route_name.dart';
import 'package:bookstore/utils/fun.dart';
import 'package:bookstore/view/pages/author_page.dart';
import 'package:bookstore/view/pages/cart_page.dart';
import 'package:bookstore/view/pages/category_page.dart';
import 'package:bookstore/view/pages/home_page.dart';
import 'package:bookstore/view/pages/new_checkout_page.dart';
import 'package:bookstore/view/pages/order_history_page.dart';
import 'package:bookstore/view/widgets/cart/my_gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
    final CartController cartController = Get.find();
    final DataController dataController = Get.find();
    return Scaffold(
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 56,
            ),
            //AppIcon
            Center(
              child: CircleAvatar(
                radius: 80,
                backgroundColor: kPrimaryColor,
                child: CircleAvatar(
                  radius: 79,
                  backgroundColor: Colors.white,
                  child: Image.asset(
                    AppIcon.logo,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            const SizedBox(
              height: 20,
            ),
            Obx(() {
              final userData = cartController.userOrderData;
              return userData.isEmpty
                  ? const SizedBox()
                  : Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //Name
                          Center(
                            child: Text(
                              userData[0],
                              style: GoogleFonts.catamaran(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          //Phone
                          DrawerItem(
                            label: "📞 Phone:",
                            text: userData[2],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          //Address
                          DrawerItem(
                            label: "🪩 Address:",
                            text: userData[3],
                          ),
                        ],
                      ),
                    );
            }),
            const SizedBox(
              height: 15,
            ),
            //Contact Us
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "📒 Contact Us: ",
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            //FBlink
            ContactItem(
              onPressed: () => launchSocialApp(facebookBaseUrl),
              text: "Facebook",
              icon: FontAwesomeIcons.facebook,
              color: Colors.blue,
            ),
            const SizedBox(
              height: 5,
            ),
            //MessengerLink
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
              height: 5,
            ),
            //Viberlink
            ContactItem(
              onPressed: () => launchSocialApp(viberBaseUrl),
              text: "+959420086031",
              icon: FontAwesomeIcons.viber,
              color: Color(0xFF7C65F3),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        brightness: Brightness.light,
        leading: DrawerIconWidget(),
        title: Text(
          "CROWN",
          textAlign: TextAlign.center,
          style: GoogleFonts.catamaran(
            fontWeight: FontWeight.w900,
            fontSize: 25,
            height: 1,
            color: kPrimaryColor,
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
                color: kPrimaryColor,
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

class ContactItem extends StatelessWidget {
  final Color color;
  final String text;
  final IconData icon;
  final void Function()? onPressed;
  const ContactItem({
    Key? key,
    required this.onPressed,
    required this.color,
    required this.text,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),
            const SizedBox(
              width: 15,
            ),
            Text(
              text,
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
      ).withColor(color),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final String label;
  final String text;
  const DrawerItem({
    Key? key,
    required this.label,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 40,
            top: 5,
          ),
          child: Text(
            text,
            style: GoogleFonts.catamaran(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

class DrawerIconWidget extends StatelessWidget {
  const DrawerIconWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Scaffold.of(context).openDrawer();
      },
      icon: Icon(
        Icons.sort,
        color: kPrimaryColor,
        size: 28,
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

extension WidgetExtension on ElevatedButton {
  Widget withColor(Color color) {
    return ElevatedButtonTheme(
      data: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(backgroundColor: color)),
      child: this,
    );
  }
}
