import 'package:bookstore/controller/home_controller.dart';
import 'package:bookstore/router/route_name.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

import '../../constants.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key}) : super(key: key);

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
                "Categories",
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
              final categories = homeController.categories;
              return categories.isNotEmpty
                  ? GridView.builder(
                      itemCount: categories.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        childAspectRatio: 10 / 14,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 10,
                      ),
                      itemBuilder: (context, index) {
                        final category = categories[index];
                        return InkWell(
                          onTap: () {
                            Get.toNamed(categoryDetailPage,
                                arguments: {"category": category});
                            homeController.changeCategoryBooks(category.id);
                          },
                          child: Container(
                            child: Column(
                              children: [
                                //Image
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 5,
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
                                      /* imageBuilder: (context, imageProvider) {
                                        return Container(
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: imageProvider,
                                              ),
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(10),
                                                topRight: Radius.circular(
                                                  10,
                                                ),
                                              )),
                                        );
                                      }, */
                                      imageUrl: category.image,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                //Name
                                Text(
                                  category.name,
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: GoogleFonts.catamaran(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
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
