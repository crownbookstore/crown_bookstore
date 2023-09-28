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
