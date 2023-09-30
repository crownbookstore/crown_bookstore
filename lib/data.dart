import 'package:bookstore/constants.dart';
import 'package:bookstore/model/category.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavigationItem {
  String imagePath;

  NavigationItem(this.imagePath);
}

List<NavigationItem> navItems = [
  NavigationItem(AppIcon.home),
  NavigationItem(AppIcon.category),
  NavigationItem(AppIcon.writer),
  NavigationItem(AppIcon.cart),
  NavigationItem(AppIcon.orderHistory),
];

const images = [
  "https://as2.ftcdn.net/v2/jpg/03/84/32/27/1000_F_384322728_8cjbtuUDNQa5iEN2AsvY05g0No3DdUnc.jpg",
  "https://cdn-icons-png.flaticon.com/128/5504/5504614.png",
  "https://as2.ftcdn.net/v2/jpg/04/92/84/13/1000_F_492841341_FNmGgaZw7f2C3Pe0eF9dgPtcZo6DfZy7.jpg",
  "https://as1.ftcdn.net/v2/jpg/05/56/54/44/1000_F_556544420_Ea5HOBXciX6YsW8USTqku4Vp8eBFVFt9.jpg",
  "https://cdn-icons-png.flaticon.com/128/5540/5540505.png",
];
const desc =
    "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).";
