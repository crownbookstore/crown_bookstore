import 'package:bookstore/controller/home_controller.dart';
import 'package:bookstore/model/author.dart';
import 'package:bookstore/model/category.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

class AuthorDetailPage extends StatelessWidget {
  const AuthorDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find();
    final Author author = Get.arguments["author"] as Author;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
                  Expanded(
                    child: Text(
                      author.fullname,
                      style: GoogleFonts.catamaran(
                        fontWeight: FontWeight.w900,
                        fontSize: 40,
                        height: 1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Obx(() {
                  final books = homeController.authorBooks;
                  return books.isNotEmpty
                      ? GridView.builder(
                          itemCount: books.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.6,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 15,
                          ),
                          itemBuilder: (context, index) {
                            final book = books[index];
                            return InkWell(
                              onTap: () {},
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
                                                color: Colors.grey
                                                    .withOpacity(0.5),
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
                                            errorWidget:
                                                (context, url, whatever) {
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
                                      flex: 1,
                                      child: Text(
                                        book.title,
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style: GoogleFonts.catamaran(
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        "${book.price} MMK",
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: GoogleFonts.catamaran(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        )
                      : const SizedBox();
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
