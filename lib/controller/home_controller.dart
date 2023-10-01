import 'package:bookstore/model/category.dart';
import 'package:bookstore/server/reference.dart';
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
    final snapshot =
        await FirebaseReference.categoryCollection.orderBy("name").get();
    categories.value = snapshot.docs.map((e) => e.data()).toList();
    activeCategories.value = categories.where((e) => e.active).toList();
    selectedCategoryID.value = activeCategories.first.id;
  }

  Future<void> getBooks() async {
    final snapshot =
        await FirebaseReference.bookCollection.orderBy("title").get();
    books.value = snapshot.docs.map((e) => e.data()).toList();
    selectedCategoryBooks.value =
        books.where((e) => e.categoryId == activeCategories.first.id).toList();
  }

  Future<void> getAuthors() async {
    final snapshot =
        await FirebaseReference.authorCollection.orderBy("fullname").get();
    authors.value = snapshot.docs.map((e) => e.data()).toList();
    activeAuthors.value = authors.where((e) => e.active).toList();
  }

  @override
  void onInit() {
    getCategories().then((value) => getBooks());
    getAuthors();
    super.onInit();
  }
}
