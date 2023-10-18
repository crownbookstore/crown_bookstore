import 'dart:developer';
import 'dart:isolate';

import 'package:bookstore/model/category.dart';
import 'package:bookstore/model/division.dart';
import 'package:bookstore/server/reference.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/author.dart';
import '../model/book.dart';

class HomeController extends GetxController {
  RxList<Category> categories = <Category>[].obs;
  RxList<Author> authors = <Author>[].obs;
  RxList<Book> books = <Book>[].obs;
  RxList<Book> selectedCategoryBooks = <Book>[].obs;
  RxList<Book> categoryBooks = <Book>[].obs;
  RxList<Book> authorBooks = <Book>[].obs;
  RxList<Category> activeCategories = <Category>[].obs;
  RxList<Author> activeAuthors = <Author>[].obs;
  RxList<Division> divisions = <Division>[].obs;
  var selectedCategoryID = "".obs;

  void changeSelectedCategoryID(String id) {
    selectedCategoryID.value = id;
    selectedCategoryBooks.value =
        books.where((e) => e.categoryId == id).toList();
  }

  void changeCategoryBooks(String id) {
    categoryBooks.value = books.where((e) => e.categoryId == id).toList();
  }

  void changeAuthorBooks(String id) {
    authorBooks.value = books.where((e) => e.authorId == id).toList();
  }

  Future<void> getCategories() async {
    final snapshot = await FirebaseReference.categoryCollection
        .orderBy("dateTime", descending: true)
        .get();
    categories.value = snapshot.docs.map((e) => e.data()).toList();
    activeCategories.value = categories.where((e) => e.active).toList();
    selectedCategoryID.value = activeCategories.first.id;
  }

  Future<void> getBooks() async {
    final snapshot = await FirebaseReference.bookCollection
        .orderBy("dateTime", descending: true)
        .get();
    for (var doc in snapshot.docs) {
      books.add(doc.data());
      try {
        final index = authors.indexWhere((e) => e.id == doc.data().authorId);
        final preCount = authors[index].books ?? 0;
        authors[index] = authors[index].copyWith(books: preCount + 1);
        activeAuthors.value = authors.where((e) => e.active).toList();
      } catch (e) {
        log("Author books increase error: $e");
      }
    }
/*     books.value = snapshot.docs.map((e) => e.data()).toList();
 */
    selectedCategoryBooks.value =
        books.where((e) => e.categoryId == activeCategories.first.id).toList();
  }

  Future<void> getAuthors() async {
    final snapshot = await FirebaseReference.authorCollection
        .orderBy("dateTime", descending: true)
        .get();
    authors.value = snapshot.docs.map((e) => e.data()).toList();
    activeAuthors.value = authors.where((e) => e.active).toList();
  }

  Future<void> getDivisions() async {
    final snapshot =
        await FirebaseReference.divisionCollection.orderBy("dateTime").get();
    divisions.value = snapshot.docs.map((e) => e.data()).toList();
  }

  @override
  void onInit() {
    getCategories().then((value) => getAuthors().then((value) => getBooks()));

    getDivisions();
    super.onInit();
  }
}
