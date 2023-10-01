import 'package:bookstore/constants.dart';
import 'package:bookstore/controller/cart_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:bookstore/data.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

import '../../model/book.dart';

class BookDetail extends StatefulWidget {
  BookDetail();

  @override
  State<BookDetail> createState() => _BookDetailState();
}

class _BookDetailState extends State<BookDetail> {
  late ScrollController _scrollController;
  bool isHideAuthor = false;
  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
              ScrollDirection.forward &&
          isHideAuthor) {
        setState(() {
          isHideAuthor = false;
        });
      }
      if (_scrollController.position.userScrollDirection ==
              ScrollDirection.reverse &&
          !isHideAuthor) {
        setState(() {
          isHideAuthor = true;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(() {});
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final CartController cartController = Get.find();
    final Book book = Get.arguments["book"] as Book;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              //Background Image
              Container(
                height: size.height * 0.5,
                width: size.width,
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

              //Content
              Positioned(
                top: 0,
                left: 0,
                child: SizedBox(
                  height: size.height,
                  width: size.width,
                  child: ListView(
                    shrinkWrap: true,
                    controller: _scrollController,
                    physics: const BouncingScrollPhysics(),
                    children: [
                      Container(
                        width: size.width,
                        height: size.height * 0.46,
                        color: Colors.transparent,
                      ),
                      Container(
                        width: size.width,
                        /* 
                        height: size.height * 0.5, */
                        padding: EdgeInsets.only(top: 64),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                          ),
                        ),
                        child: Container(
                          padding: EdgeInsets.only(
                            right: 32,
                            left: 32,
                            bottom: 16,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                book.title,
                                style: GoogleFonts.catamaran(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  height: 1,
                                ),
                              ),
                              Text(
                                book.authorName ?? "",
                                style: GoogleFonts.catamaran(
                                  fontSize: 18,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 8),
                                child: Row(
                                  children: [
                                    Row(
                                      children: <Widget>[
                                        Icon(
                                          Icons.star,
                                          size: 20,
                                          color: kStarsColor,
                                        ),
                                        Icon(
                                          Icons.star,
                                          size: 20,
                                          color: kStarsColor,
                                        ),
                                        Icon(
                                          Icons.star,
                                          size: 20,
                                          color: kStarsColor,
                                        ),
                                        Icon(
                                          Icons.star,
                                          size: 20,
                                          color: kStarsColor,
                                        ),
                                        Icon(
                                          Icons.star_half,
                                          size: 20,
                                          color: kStarsColor,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 12,
                                    ),
                                    Text(
                                      book.score.toString(),
                                      style: GoogleFonts.catamaran(
                                        fontSize: 16,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                /* book.description */ desc,
                                style: GoogleFonts.catamaran(
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(
                                height: 120,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              //Author Avatar
              isHideAuthor
                  ? const SizedBox()
                  : Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 32, bottom: (size.height * 0.5) - (75 / 2)),
                        child: Card(
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
                                image: NetworkImage(book.authorImage ?? ""),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
              //Back Button
              Padding(
                padding: EdgeInsets.only(
                  top: 48,
                  left: 32,
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      height: 42,
                      width: 42,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.arrow_back,
                          color: kPrimaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        height: 100,
        width: size.width,
        padding: EdgeInsets.only(
          top: 16,
          left: 32,
          right: 32,
          bottom: 32,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: size.width / 2 - 44,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                boxShadow: [
                  BoxShadow(
                    color: kPrimaryColor.withOpacity(0.4),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: Center(
                child: Obx(() {
                  final isAdded = cartController.myCart.containsKey(book.id);
                  return InkWell(
                    onTap:
                        isAdded ? () {} : () => cartController.addCount(book),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          isAdded ? "Added" : "Add To Cart",
                          style: GoogleFonts.catamaran(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Icon(
                          FontAwesomeIcons.cartShopping,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
            Container(
              width: size.width / 2 - 44,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: Offset(0, 0),
                  ),
                ],
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${book.price} ကျပ်",
                      style: GoogleFonts.catamaran(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    /* SizedBox(
                                      width: 8,
                                    ),
                                    Icon(
                                      Icons.content_copy,
                                      color: kPrimaryColor,
                                      size: 20,
                                    ), */
                  ],
                ),
              ),
            ),
          ].reversed.toList(),
        ),
      ),
    );
  }
}
