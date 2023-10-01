import 'dart:developer';

import 'package:bookstore/controller/data_controller.dart';
import 'package:bookstore/controller/home_controller.dart';
import 'package:bookstore/model/category.dart';
import 'package:bookstore/router/route_name.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

import '../../constants.dart';
import '../../data.dart';
import '../../model/author.dart';
import '../../model/book.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final DataController dataController = Get.find();
    final HomeController homeController = Get.find();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: EdgeInsets.only(top: 16, left: 16, right: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(40),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Discover books",
                style: GoogleFonts.catamaran(
                  fontWeight: FontWeight.w900,
                  fontSize: 40,
                  height: 1,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              /* Padding(
                padding: EdgeInsets.only(right: 75),
                child: */
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Obx(() {
                  final selectedID = homeController.selectedCategoryID.value;
                  final categories = homeController.activeCategories;
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                        categories.length,
                        (index) => buildFilter(
                            item: categories[index],
                            selectedID: selectedID,
                            onTap: () =>
                                homeController.changeSelectedCategoryID(
                                    categories[index].id))),
                  );
                }),
              ),
              /* ), */
            ],
          ),
        ),
        Expanded(
          child: Container(
            child: Obx(() {
              final books = homeController.selectedCategoryBooks;
              log("SelectedCategoryBooks:${books.length}");
              return ListView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: List.generate(books.length,
                    (index) => buildBook(books[index], index, width)),
              );
            }),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Authors",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    InkWell(
                      onTap: () => dataController.changeBottomNavIndex(2),
                      child: Row(
                        children: [
                          Text(
                            "Show all",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: kPrimaryColor,
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Icon(
                            Icons.arrow_forward,
                            size: 18,
                            color: kPrimaryColor,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 100,
                margin: EdgeInsets.only(bottom: 16),
                child: Obx(() {
                  final authors = homeController.activeAuthors;
                  return ListView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: List.generate(authors.length,
                        (index) => buildAuthor(authors[index], index)),
                  );
                }),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

Widget buildFilter({
  required Category item,
  required String selectedID,
  void Function()? onTap,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(
      vertical: 0,
      horizontal: 5,
    ),
    child: GestureDetector(
      onTap: onTap,
      child: Container(
        /*  height: 50, */
        padding: EdgeInsets.only(bottom: 10, top: 10),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
          width: 3,
          color: selectedID == item.id ? kPrimaryColor : Colors.transparent,
        ))),
        child: Text(
          item.name,
          style: GoogleFonts.catamaran(
            color: selectedID == item.id ? kPrimaryColor : Colors.grey[400],
            fontSize: 14,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.5,
          ),
        ),
      ),
    ),
  );
}

Widget buildBook(Book book, int index, double width) {
  return GestureDetector(
    onTap: () {
      Get.toNamed(bookDetailPage, arguments: {"book": book});
    },
    child: Container(
      width: width * 0.45,
      /* color: Colors.red, */
      margin: EdgeInsets.only(right: 20, left: index == 0 ? 16 : 0, bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 15,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 8,
                    blurRadius: 12,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              margin: EdgeInsets.only(
                /*  bottom: 10, */
                top: 20,
              ),
              child: Hero(
                tag: book.title,
                child: CachedNetworkImage(
                  progressIndicatorBuilder: (context, url, status) {
                    return Shimmer.fromColors(
                      child: Container(
                        color: Colors.white,
                      ),
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.white,
                    );
                  },
                  errorWidget: (context, url, whatever) {
                    return const Text("Image not available");
                  },
                  imageUrl: book.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              book.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.catamaran(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              book.authorName ?? "",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget buildAuthor(Author author, int index) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.grey[200],
      borderRadius: BorderRadius.all(
        Radius.circular(15),
      ),
    ),
    padding: EdgeInsets.all(12),
    margin: EdgeInsets.only(right: 16, left: index == 0 ? 16 : 0),
    width: 255,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Card(
          elevation: 4,
          margin: EdgeInsets.all(0),
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          child: Container(
            width: 75,
            height: 75,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(author.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 12,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              author.fullname,
              style: GoogleFonts.catamaran(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                Icon(
                  Icons.library_books,
                  color: Colors.grey,
                  size: 14,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  author.books.toString() + " books",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}
