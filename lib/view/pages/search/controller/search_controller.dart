import 'package:bookstore/constants.dart';
import 'package:bookstore/controller/home_controller.dart';
import 'package:bookstore/model/book.dart';
import 'package:bookstore/model/search_type.dart';
import 'package:get/get.dart';

import '../../../../utils/debouncer.dart';

class SearchController extends GetxController {
  final HomeController homeController = Get.find();
  RxList<Book> searchResults = <Book>[].obs;
  Debouncer debouncer = Debouncer(milliseconds: 800);
  Rxn<SearchType> selectedSearchType = Rxn<SearchType>(searchTypes.first);
  void changeSearchType(SearchType e) => selectedSearchType.value = e;

  void startSearch(String value) {
    switch (selectedSearchType.value!.type) {
      case SearchingType.bookTitle:
        searchResults.value = homeController.books
            .where((e) => makeStringList(e.title).contains(value))
            .toList();
        break;
      case SearchingType.categoryName:
        searchResults.value = homeController.books
            .where((e) => makeStringList(e.categoryName ?? "").contains(value))
            .toList();
        break;
      case SearchingType.authorName:
        searchResults.value = homeController.books
            .where((e) => makeStringList(e.authorName ?? "").contains(value))
            .toList();
        break;
      default:
    }
  }

  List<String> makeStringList(String value) {
    List<String> subName = [];
    var subList = value.split('');
    for (var i = 0; i < subList.length; i++) {
      subName.add(value.substring(0, i + 1).toLowerCase());
    }
    return subName;
  }
}
