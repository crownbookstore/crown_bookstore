import 'package:bookstore/constants.dart';
import 'package:bookstore/view/pages/home_page.dart';
import 'package:bookstore/view/pages/search/controller/search_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

import '../../../router/route_name.dart';

class SearchPage extends GetView<SearchController> {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: BorderSide(
        color: kPrimaryColor,
      ),
      borderRadius: BorderRadius.all(Radius.circular(15)),
    );
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 16, left: 10, right: 16),
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
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () => Get.back(),
                    icon: Icon(
                      FontAwesomeIcons.arrowLeft,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Search",
                    style: GoogleFonts.catamaran(
                      fontWeight: FontWeight.w900,
                      fontSize: 40,
                      height: 1,
                    ),
                  ),
                ],
              ),
            ),
            //Search Input
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: SizedBox(
                height: 50,
                child: Obx(() {
                  return TextField(
                    autofocus: true,
                    onChanged: (v) => controller.debouncer.run(() {
                      controller.startSearch(v);
                    }),
                    decoration: InputDecoration(
                      hintText:
                          "Search books by ${controller.selectedSearchType.value!.name}",
                      contentPadding: EdgeInsets.symmetric(vertical: 5),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      focusedBorder: border,
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey[400],
                        size: 35,
                      ),
                    ),
                  );
                }),
              ),
            ),
            //Search Type List
            Obx(() {
              return Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Wrap(
                  children: searchTypes.map((e) {
                    final isSelected =
                        controller.selectedSearchType.value!.type == e.type;
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: ChoiceChip(
                        onSelected: (eb) => controller.changeSearchType(e),
                        selectedColor: kPrimaryColor,
                        label: Text(
                          e.name,
                        ),
                        labelStyle: TextStyle(
                          color: isSelected ? Colors.white : Colors.black,
                        ),
                        selected: isSelected,
                      ),
                    );
                  }).toList(),
                ),
              );
            }),
            const SizedBox(
              height: 15,
            ),
            //Search Result
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Obx(() {
                  final books = controller.searchResults;
                  if (books.isNotEmpty) {
                    return GridView.builder(
                      itemCount: books.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.6,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 15,
                      ),
                      itemBuilder: (context, index) {
                        final book = books[index];
                        return InkWell(
                          onTap: () {
                            Get.toNamed(bookDetailPage,
                                arguments: {"book": book});
                          },
                          child: Container(
                            child: Column(
                              children: [
                                //Image
                                Expanded(
                                    flex: 12,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 0,
                                            blurRadius: 8,
                                            offset: Offset(0, 3),
                                          ),
                                        ],
                                      ),
                                      child: CachedNetworkImage(
                                        progressIndicatorBuilder:
                                            (context, url, status) {
                                          return Shimmer.fromColors(
                                            child: Container(
                                              color: Colors.white,
                                            ),
                                            baseColor: Colors.grey.shade300,
                                            highlightColor: Colors.white,
                                          );
                                        },
                                        errorWidget: (context, url, whatever) {
                                          return const Text(
                                              "Image not available");
                                        },
                                        imageUrl: book.image,
                                        fit: BoxFit.cover,
                                      ),
                                    ) /* CachedNetworkImage(
                                            progressIndicatorBuilder:
                                                (context, url, status) {
                                              return Shimmer.fromColors(
                                                child: Container(
                                                  color: Colors.white,
                                                ),
                                                baseColor: Colors.grey.shade300,
                                                highlightColor: Colors.white,
                                              );
                                            },
                                            errorWidget: (context, url, whatever) {
                                              return const Text(
                                                  "Image not available");
                                            },
                                            imageUrl: book.image,
                                            fit: BoxFit.contain,
                                          ),
                                         */
                                    ),
                                const SizedBox(
                                  height: 5,
                                ),
                                //Name
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    book.title,
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: GoogleFonts.catamaran(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                                /* const SizedBox(
                                  height: 5,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: */
                                Text(
                                  "${book.price} MMK",
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: GoogleFonts.catamaran(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                /* ), */
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                  return const SizedBox();
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
