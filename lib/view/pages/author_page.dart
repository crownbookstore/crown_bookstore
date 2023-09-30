import 'package:bookstore/controller/home_controller.dart';
import 'package:bookstore/router/route_name.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

import '../../constants.dart';

class AuthorPage extends StatelessWidget {
  const AuthorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                "Authors",
                style: GoogleFonts.catamaran(
                  fontWeight: FontWeight.w900,
                  fontSize: 40,
                  height: 1,
                ),
              ),
              SizedBox(
                height: 10,
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
              final authors = homeController.authors;
              return authors.isNotEmpty
                  ? GridView.builder(
                      itemCount: authors.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        childAspectRatio: 10 / 16,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 10,
                      ),
                      itemBuilder: (context, index) {
                        final author = authors[index];
                        return InkWell(
                          onTap: () {
                            Get.toNamed(authorDetailPage,
                                arguments: {"author": author});
                            homeController.changeAuthorBooks(author.id);
                          },
                          child: Container(
                            child: Column(
                              children: [
                                //Image
                                Expanded(
                                  flex: 3,
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
                                      imageUrl: author.image,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),

                                const SizedBox(
                                  height: 5,
                                ),
                                //Name
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    author.fullname,
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
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
    );
  }
}
