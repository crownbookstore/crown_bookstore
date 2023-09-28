import 'package:bookstore/router/route_name.dart';
import 'package:bookstore/view/pages/categories_detail.dart';
import 'package:bookstore/view/pages/search/search_page.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../view/pages/author_detail.dart';
import '../view/pages/book_detail.dart';
import '../view/pages/bookstore.dart';
import '../view/pages/search/bin/search_binding.dart';

List<GetPage<dynamic>> routeList = [
  GetPage(name: homePage, page: () => Bookstore()),
  GetPage(name: bookDetailPage, page: () => BookDetail()),
  GetPage(
    name: categoryDetailPage,
    page: () => CategoryDetailPage(),
    transition: Transition.size,
    curve: Curves.easeIn,
  ),
  GetPage(
    name: authorDetailPage,
    page: () => AuthorDetailPage(),
    transition: Transition.size,
    curve: Curves.easeIn,
  ),
  GetPage(
    name: searchPage,
    page: () => SearchPage(),
    binding: SearchBinding(),
    transition: Transition.size,
    curve: Curves.easeIn,
  ),
];
