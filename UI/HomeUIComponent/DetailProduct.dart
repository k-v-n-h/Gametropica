// import 'dart:async';
import 'package:share/share.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
// import 'package:flutter_share/flutter_share.dart';
import 'package:treva_shop_flutter/Library/Language_Library/lib/easy_localization_delegate.dart';
import 'package:treva_shop_flutter/Library/Language_Library/lib/easy_localization_provider.dart';
import 'package:treva_shop_flutter/Library/carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:treva_shop_flutter/ListItem/BrandDataList.dart';
import 'package:treva_shop_flutter/ListItem/CartItemData.dart';
import 'package:treva_shop_flutter/ListItem/HomeGridItemRecomended.dart';
import 'package:treva_shop_flutter/UI/CartUIComponent/CartLayout.dart';
import 'package:treva_shop_flutter/UI/HomeUIComponent/ChatItem.dart';
import 'package:treva_shop_flutter/UI/CartUIComponent/Delivery.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:treva_shop_flutter/UI/HomeUIComponent/Home.dart';
import 'package:treva_shop_flutter/UI/HomeUIComponent/ReviewLayout.dart';

// ignore: camel_case_types
class detailProduk extends StatefulWidget {
  GridItem gridItem;
  detailProduk(this.gridItem);

  @override
  _detailProdukState createState() => _detailProdukState(gridItem);
}

/// Detail Product for Recomended Grid in home screen
// ignore: camel_case_types
class _detailProdukState extends State<detailProduk> {
  double rating = 3.5;
  int starCount = 5;

  /// Declaration List item HomeGridItemRe....dart Class
  final GridItem gridItem;
  _detailProdukState(this.gridItem);

  // _detailProduk({Key key}) : super(key:key);

  @override
  static BuildContext ctx;
  int valueItemChart = 0;
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  /// BottomSheet for view more in specification
  void _bottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return SingleChildScrollView(
            child: Container(
              color: Colors.black26,
              child: Padding(
                padding: const EdgeInsets.only(top: 2.0),
                child: Container(
                  height: 1500.0,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0))),
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(top: 20.0)),
                      Center(
                          child: Text(
                        AppLocalizations.of(context).tr('description'),
                        style: _subHeaderCustomStyle,
                      )),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20.0, left: 20.0, right: 20.0, bottom: 20.0),
                        child: Text(
                          gridItem.description,
                            // AppLocalizations.of(context).tr('longLorem'),
                            style: _detailText),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text(
                          AppLocalizations.of(context).tr('spesifications'),
                          style: TextStyle(
                              fontFamily: "Gotik",
                              fontWeight: FontWeight.w600,
                              fontSize: 15.0,
                              color: Colors.black,
                              letterSpacing: 0.3,
                              wordSpacing: 0.5),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, left: 20.0),
                        child: Text(
                          AppLocalizations.of(context).tr('loremIpsum'),
                          style: _detailText,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  /// Custom Text black
  static var _customTextStyle = TextStyle(
    color: Colors.black,
    fontFamily: "Gotik",
    fontSize: 17.0,
    fontWeight: FontWeight.w800,
  );

  /// Custom Text for Header title
  static var _subHeaderCustomStyle = TextStyle(
      color: Colors.black54,
      fontWeight: FontWeight.w700,
      fontFamily: "Gotik",
      fontSize: 16.0);

  /// Custom Text for Detail title
  static var _detailText = TextStyle(
      fontFamily: "Gotik",
      color: Colors.black54,
      letterSpacing: 0.3,
      wordSpacing: 0.5);

  Widget build(BuildContext context) {
    // screen sizes
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    /// Variable Component UI use in bottom layout "Top Rated Products"
    // var _suggestedItem = Padding(
    //   padding: const EdgeInsets.only(left: 15.0, right: 20.0, top: 30.0, bottom: 20.0),
    //   child: Container(
    //     height: 280.0,
    //     child: Column(
    //       children: <Widget>[
    //         Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: <Widget>[
    //             Text(
    //               AppLocalizations.of(context).tr('topRated'),
    //               style: TextStyle(
    //                   fontWeight: FontWeight.w600,
    //                   fontFamily: "Gotik",
    //                   fontSize: 15.0),
    //             ),
    //             InkWell(
    //               onTap: () {},
    //               child: Text(
    //                 AppLocalizations.of(context).tr('seeAll'),
    //                 style: TextStyle(
    //                     color: Colors.indigoAccent.withOpacity(0.8),
    //                     fontFamily: "Gotik",
    //                     fontWeight: FontWeight.w700),
    //               ),
    //             )
    //           ],
    //         ),
    //         Expanded(
    //           child: ListView(
    //             padding: EdgeInsets.only(top: 20.0, bottom: 2.0),
    //             scrollDirection: Axis.horizontal,
    //             children: <Widget>[
    //               FavoriteItem(
    //                 image: "assets/imgItem/shoes1.jpg",
    //                 title: AppLocalizations.of(context).tr('productTitle1'),
    //                 Salary: "\$ 10",
    //                 Rating: "4.8",
    //                 sale: AppLocalizations.of(context).tr('productSale1'),
    //               ),
    //               Padding(padding: EdgeInsets.only(left: 10.0)),
    //               FavoriteItem(
    //                 image: "assets/imgItem/acesoris1.jpg",
    //                 title: AppLocalizations.of(context).tr('productTitle2'),
    //                 Salary: "\$ 200",
    //                 Rating: "4.2",
    //                 sale: AppLocalizations.of(context).tr('productSale2'),
    //               ),
    //               Padding(padding: EdgeInsets.only(left: 10.0)),
    //               FavoriteItem(
    //                 image: "assets/imgItem/kids1.jpg",
    //                 title: AppLocalizations.of(context).tr('productTitle3'),
    //                 Salary: "\$ 3",
    //                 Rating: "4.8",
    //                 sale: AppLocalizations.of(context).tr('productSale3'),
    //               ),
    //               Padding(padding: EdgeInsets.only(left: 10.0)),
    //               FavoriteItem(
    //                 image: "assets/imgItem/man1.jpg",
    //                 title:AppLocalizations.of(context).tr('productTitle1'),
    //                 Salary: "\$ 8",
    //                 Rating: "4.4",
    //                 sale: AppLocalizations.of(context).tr('productSale2'),
    //               ),
    //               Padding(padding: EdgeInsets.only(right: 10.0)),
    //             ],
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );

    var data = EasyLocalizationProvider.of(context).data;
    ;
    return EasyLocalizationProvider(
      data: data,
      child: Scaffold(
        key: _key,
        appBar: AppBar(
          actions: <Widget>[
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                    PageRouteBuilder(pageBuilder: (_, __, ___) => new cart()));
              },
              child: Stack(
                alignment: AlignmentDirectional(-1.0, -0.8),
                children: <Widget>[
                  IconButton(
                      onPressed: null,
                      icon: Icon(
                        Icons.shopping_cart,
                        color: Colors.black26,
                      )),
                  CircleAvatar(
                    radius: 10.0,
                    backgroundColor: Colors.red,
                    child: Text(
                      valueItemChart.toString(),
                      style: TextStyle(color: Colors.white, fontSize: 13.0),
                    ),
                  ),
                ],
              ),
            ),
          ],
          elevation: 0.5,
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text(
            gridItem.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black54,
              fontSize: 20.0,
              fontFamily: "Gotik",
            ),
          ),
        ),
        body: Column(
          children: <Widget>[
            Flexible(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    /// Header image slider
                    Container(
                      height: 300.0,
                      child: Hero(
                        tag: "hero-grid-${gridItem.id}",
                        child: Material(
                          child: new Carousel(
                            dotColor: Colors.black26,
                            dotIncreaseSize: 1.7,
                            dotBgColor: Colors.transparent,
                            autoplay: false,
                            boxFit: BoxFit.cover,
                            images: [
                              AssetImage(gridItem.img),
                              AssetImage(gridItem.img),
                              AssetImage(gridItem.img),
                            ],
                          ),
                        ),
                      ),
                    ),

                    /// Background white title,price and ratting
                    Container(
                        decoration:
                            BoxDecoration(color: Colors.white, boxShadow: [
                          BoxShadow(
                            color: Color(0xFF656565).withOpacity(0.15),
                            blurRadius: 1.0,
                            spreadRadius: 0.2,
                          )
                        ]),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 15.0, top: 10.0, right: 10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(0.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      gridItem.title,
                                      style: _customTextStyle,
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                  padding: EdgeInsets.only(top: 5.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        '\$ ' + gridItem.price.toString(),
                                        style: _customTextStyle,
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(left: screenWidth - 180)),
                                      FavoriteButton(
                                        gridTitle: gridItem.title,
                                        gridPrice: gridItem.price,
                                        gridImg: gridItem.img,
                                        gridId: gridItem.id,
                                        gridDesc: gridItem.description,
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(left: 10, right: 10)),
                                      ShareButton(),
                                    ],
                                  )),
                              Padding(
                                  padding:
                                      EdgeInsets.only(top: 10.0, bottom: 10)),
                              // Padding(
                              //   padding: EdgeInsets.only(
                              //       top: 0, bottom: 10, right: 25),
                              //   child: Row(
                              //     mainAxisAlignment: MainAxisAlignment.end,
                              //     children: [
                              //       FavoriteButton(
                              //         gridDesc: gridItem.description,
                              //         gridId: gridItem.id,
                              //         gridImg: gridItem.img,
                              //         gridPrice: gridItem.price,
                              //         gridTitle: gridItem.title,
                              //       ),
                              //       Padding(padding: EdgeInsets.only(left: 25)),
                              //       ShareButton(),
                              //     ],
                              //   ),
                              // ),
                              // Divider(
                              //   color: Colors.black12,
                              //   height: 1.0,
                              // ),
                              // Padding(
                              //   padding: const EdgeInsets.only(
                              //       top: 10.0, bottom: 10.0),
                              //   child: Row(
                              //     mainAxisAlignment:
                              //         MainAxisAlignment.spaceBetween,
                              //     children: <Widget>[
                              //       Row(
                              //         children: <Widget>[
                              //           Container(
                              //             height: 30.0,
                              //             width: 75.0,
                              //             decoration: BoxDecoration(
                              //               color: Colors.lightGreen,
                              //               borderRadius: BorderRadius.all(
                              //                   Radius.circular(20.0)),
                              //             ),
                              //             child: Row(
                              //               crossAxisAlignment:
                              //                   CrossAxisAlignment.center,
                              //               mainAxisAlignment:
                              //                   MainAxisAlignment.center,
                              //               children: <Widget>[
                              //                 Text(
                              //                   gridItem.rattingValue,
                              //                   style: TextStyle(
                              //                       color: Colors.white),
                              //                 ),
                              //                 Padding(
                              //                     padding:
                              //                         EdgeInsets.only(left: 8.0)),
                              //                 Icon(
                              //                   Icons.star,
                              //                   color: Colors.white,
                              //                   size: 19.0,
                              //                 ),
                              //               ],
                              //             ),
                              //           ),
                              //           Padding(
                              //               padding: EdgeInsets.only(
                              //                   right: screenWidth - 190)),
                              //           Row(
                              //             children: <Widget>[
                              //               FavoriteButton(
                              //                   gridTitle: gridItem.title,
                              //                   gridPrice: gridItem.price,
                              //                   gridImg: gridItem.img,
                              //                   gridId: gridItem.id,
                              //                   gridDesc: gridItem.description),
                              //             ],
                              //           ),
                              //           Padding(
                              //             padding: EdgeInsets.only(left: 20),
                              //           ),
                              //           ShareButton()
                              //         ],
                              //       ),

                              //       // this was the number of sales on the right hand side under the picture
                              //       Padding(
                              //         padding: const EdgeInsets.only(right: 15.0),
                              //         child: Text(
                              //           '',
                              //           // gridItem.itemSale,
                              //           style: TextStyle(
                              //               color: Colors.black54,
                              //               fontSize: 13.0,
                              //               fontWeight: FontWeight.w500),
                              //         ),
                              //       ),
                            ],
                          ),
                        )
                        // ],
                        ),
                    // ),
                    // ),
//
                    /// Background white for chose Size and Color
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Container(
                        height: 220.0,
                        width: 600.0,
                        decoration:
                            BoxDecoration(color: Colors.white, boxShadow: [
                          BoxShadow(
                            color: Color(0xFF656565).withOpacity(0.15),
                            blurRadius: 1.0,
                            spreadRadius: 0.2,
                          )
                        ]),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 20.0, left: 20.0, right: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(AppLocalizations.of(context).tr('size'),
                                  style: _subHeaderCustomStyle),
                              Row(
                                children: <Widget>[
                                  RadioButtonCustom(
                                    txt: AppLocalizations.of(context).tr('s'),
                                  ),
                                  Padding(padding: EdgeInsets.only(left: 15.0)),
                                  RadioButtonCustom(
                                    txt: AppLocalizations.of(context).tr('m'),
                                  ),
                                  Padding(padding: EdgeInsets.only(left: 15.0)),
                                  RadioButtonCustom(
                                    txt: AppLocalizations.of(context).tr('l'),
                                  ),
                                  Padding(padding: EdgeInsets.only(left: 15.0)),
                                  RadioButtonCustom(
                                    txt: AppLocalizations.of(context).tr('xl'),
                                  ),
                                ],
                              ),
                              Padding(padding: EdgeInsets.only(top: 15.0)),
                              Divider(
                                color: Colors.black12,
                                height: 1.0,
                              ),
                              Padding(padding: EdgeInsets.only(top: 10.0)),
                              Text(
                                AppLocalizations.of(context).tr('color'),
                                style: _subHeaderCustomStyle,
                              ),
                              Row(
                                children: <Widget>[
                                  RadioButtonColor(Colors.black),
                                  Padding(padding: EdgeInsets.only(left: 15.0)),
                                  RadioButtonColor(Colors.white),
                                  Padding(padding: EdgeInsets.only(left: 15.0)),
                                  RadioButtonColor(Colors.blue),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    /// Background white for description
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Container(
                        width: 600.0,
                        decoration:
                            BoxDecoration(color: Colors.white, boxShadow: [
                          BoxShadow(
                            color: Color(0xFF656565).withOpacity(0.15),
                            blurRadius: 1.0,
                            spreadRadius: 0.2,
                          )
                        ]),
                        child: Padding(
                          padding: EdgeInsets.only(top: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, right: 20.0),
                                child: Text(
                                  AppLocalizations.of(context)
                                      .tr('description'),
                                  style: _subHeaderCustomStyle,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 15.0,
                                    right: 20.0,
                                    bottom: 40.0,
                                    left: 20.0),
                                child: Text(
                                
                                  gridItem.description,
                                    style: _detailText),
                              ),
                              //
                              // view more tab 
                              //
                              // Padding(
                              //   padding: const EdgeInsets.only(bottom: 15.0),
                              //   child: Center(
                              //     child: InkWell(
                              //       onTap: () {
                              //         _bottomSheet();
                              //       },
                              //       child: Text(
                              //         AppLocalizations.of(context)
                              //             .tr('viewMore'),
                              //         style: TextStyle(
                              //           color: Colors.indigoAccent,
                              //           fontSize: 15.0,
                              //           fontFamily: "Gotik",
                              //           fontWeight: FontWeight.w700,
                              //         ),
                              //       ),
                              //     ),
                              //   ),
                              // )
                            ],
                          ),
                        ),
                      ),
                    ),

                    /// Background white for Ratting
                    // Padding(
                    //   padding: const EdgeInsets.only(top: 10.0),
                    //   child: Container(
                    //     width: 600.0,
                    //     decoration:
                    //         BoxDecoration(color: Colors.white, boxShadow: [
                    //       BoxShadow(
                    //         color: Color(0xFF656565).withOpacity(0.15),
                    //         blurRadius: 1.0,
                    //         spreadRadius: 0.2,
                    //       )
                    //     ]),
                    //     child: Padding(
                    //       padding: EdgeInsets.only(
                    //           top: 20.0, left: 20.0, right: 20.0),
                    //       child: Column(
                    //         crossAxisAlignment: CrossAxisAlignment.start,
                    //         children: <Widget>[
                    //           Row(
                    //             mainAxisAlignment:
                    //                 MainAxisAlignment.spaceBetween,
                    //             children: <Widget>[
                    //               Text(
                    //                 AppLocalizations.of(context).tr('review'),
                    //                 style: _subHeaderCustomStyle,
                    //               ),
                    //               Padding(
                    //                 padding: const EdgeInsets.only(
                    //                     left: 20.0, top: 15.0, bottom: 15.0),
                    //                 child: Row(
                    //                   crossAxisAlignment:
                    //                       CrossAxisAlignment.start,
                    //                   mainAxisAlignment:
                    //                       MainAxisAlignment.start,
                    //                   children: <Widget>[
                    //                     InkWell(
                    //                       child: Padding(
                    //                           padding: EdgeInsets.only(
                    //                               top: 2.0, right: 3.0),
                    //                           child: Text(
                    //                             AppLocalizations.of(context)
                    //                                 .tr('viewAll'),
                    //                             style: _subHeaderCustomStyle
                    //                                 .copyWith(
                    //                                     color:
                    //                                         Colors.indigoAccent,
                    //                                     fontSize: 14.0),
                    //                           )),
                    //                       onTap: () {
                    //                         Navigator.of(context).push(
                    //                             PageRouteBuilder(
                    //                                 pageBuilder: (_, __, ___) =>
                    //                                     ReviewsAll()));
                    //                       },
                    //                     ),
                    //                     Padding(
                    //                       padding: const EdgeInsets.only(
                    //                           right: 15.0, top: 2.0),
                    //                       child: Icon(
                    //                         Icons.arrow_forward_ios,
                    //                         size: 18.0,
                    //                         color: Colors.black54,
                    //                       ),
                    //                     )
                    //                   ],
                    //                 ),
                    //               )
                    //             ],
                    //           ),
                    //           Row(
                    //             children: <Widget>[
                    //               Row(
                    //                   mainAxisAlignment:
                    //                       MainAxisAlignment.start,
                    //                   children: <Widget>[
                    //                     StarRating(
                    //                       size: 25.0,
                    //                       starCount: 5,
                    //                       rating: 4.0,
                    //                       color: Colors.yellow,
                    //                     ),
                    //                     SizedBox(width: 5.0),
                    //                     Text(
                    //                       AppLocalizations.of(context)
                    //                           .tr('reviews'),
                    //                     )
                    //                   ]),
                    //             ],
                    //           ),
                    //           Padding(
                    //             padding: EdgeInsets.only(
                    //                 left: 0.0,
                    //                 right: 20.0,
                    //                 top: 15.0,
                    //                 bottom: 7.0),
                    //             child: _line(),
                    //           ),
                    //           _buildRating(
                    //               AppLocalizations.of(context).tr('date'),
                    //               AppLocalizations.of(context)
                    //                   .tr('ratingReview'), (rating) {
                    //             setState(() {
                    //               this.rating = rating;
                    //             });
                    //           }, "assets/avatars/avatar-1.jpg"),
                    //           Padding(
                    //             padding: EdgeInsets.only(
                    //                 left: 0.0,
                    //                 right: 20.0,
                    //                 top: 15.0,
                    //                 bottom: 7.0),
                    //             child: _line(),
                    //           ),
                    //           _buildRating(
                    //               AppLocalizations.of(context).tr('date'),
                    //               AppLocalizations.of(context)
                    //                   .tr('ratingReview'), (rating) {
                    //             setState(() {
                    //               this.rating = rating;
                    //             });
                    //           }, "assets/avatars/avatar-4.jpg"),
                    //           Padding(
                    //             padding: EdgeInsets.only(
                    //                 left: 0.0,
                    //                 right: 20.0,
                    //                 top: 15.0,
                    //                 bottom: 7.0),
                    //             child: _line(),
                    //           ),
                    //           _buildRating(
                    //               AppLocalizations.of(context).tr('date'),
                    //               AppLocalizations.of(context)
                    //                   .tr('ratingReview'), (rating) {
                    //             setState(() {
                    //               this.rating = rating;
                    //             });
                    //           }, "assets/avatars/avatar-2.jpg"),
                    //           Padding(padding: EdgeInsets.only(bottom: 20.0)),
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // ),

                    // _suggestedItem
                  ],
                ),
              ),
            ),

            /// If user click icon chart SnackBar show
            /// this code to show a SnackBar
            /// and Increase a valueItemChart + 1
            InkWell(
              onTap: () {
                print('${gridItem.title}');
                cartState.items.add(cartItem(
                  id: int.parse(gridItem.id),
                  title: gridItem.title,
                  price: gridItem.price,
                  img: gridItem.img,
                  desc: gridItem.description,
                ));
                Flushbar(
                  flushbarPosition: FlushbarPosition.TOP,
                  messageText: Text(
                    'Item added to your cart',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  duration: Duration(milliseconds: 1500),
                  icon: Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                    size: 35,
                  ),
                )..show(context);
                setState(() {
                  valueItemChart++;
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: Container(
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        height: 60.0,
                        width: screenWidth - 215.0,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            border: Border.all(color: Colors.black12)),
                        child: Center(
                          child: Text(
                            'Add to Cart',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),

                      /// Chat Icon
                      // InkWell(
                      //   onTap: () {
                      //     Navigator.of(context).push(PageRouteBuilder(
                      //         pageBuilder: (_, ___, ____) => new chatItem()));
                      //   },
                      //   child: Container(
                      //     height: 40.0,
                      //     width: 60.0,
                      //     decoration: BoxDecoration(
                      //         color: Colors.white12.withOpacity(0.1),
                      //         border: Border.all(color: Colors.black12)),
                      //     child: Center(
                      //       child: Image.asset("assets/icon/message.png",
                      //           height: 20.0),
                      //     ),
                      //   ),
                      // ),

                      /// Button Pay
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(PageRouteBuilder(
                              pageBuilder: (_, __, ___) => new delivery()));
                        },
                        child: Container(
                          height: 60.0,
                          width: screenWidth - 215,
                          decoration: BoxDecoration(
                            color: Colors.green,
                          ),
                          child: Center(
                            child: Text(
                              'Buy Now',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildRating(
      String date, String details, Function changeRating, String image) {
    return ListTile(
      leading: Container(
        height: 45.0,
        width: 45.0,
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
            borderRadius: BorderRadius.all(Radius.circular(50.0))),
      ),
      title: Row(
        children: <Widget>[
          StarRating(
              size: 20.0,
              rating: 3.5,
              starCount: 5,
              color: Colors.yellow,
              onRatingChanged: changeRating),
          SizedBox(width: 8.0),
          Text(
            date,
            style: TextStyle(fontSize: 12.0),
          )
        ],
      ),
      subtitle: Text(
        details,
        style: _detailText,
      ),
    );
  }
}

/// favorite button
// class FavoriteButton extends StatelessWidget {
//   FavoriteButton({Key key, this.isFavorited: false, @required this.onChanged})
//       : super(key: key);
//   final bool isFavorited;
//   final ValueChanged<bool> onChanged;

//   void _toggleFavorite() {
//     onChanged(!isFavorited);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         _toggleFavorite();
//         if (isFavorited == false) {
//           Flushbar(
//             flushbarPosition: FlushbarPosition.TOP,
//             messageText: Text(
//               'Item added to Favorites',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 17,
//               ),
//             ),
//             duration: Duration(seconds: 2),
//             icon: Icon(
//               Icons.favorite_border,
//               color: Colors.white,
//               size: 25,
//             ),
//           )..show(context);
//         } else {
//           Flushbar(
//             flushbarPosition: FlushbarPosition.TOP,
//             messageText: Text(
//               'Item removed from Favorites',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 17,
//               ),
//             ),
//             duration: Duration(seconds: 2),
//             icon: Icon(
//               Icons.favorite_border,
//               color: Colors.white,
//               size: 25,
//             ),
//           )..show(context);
//         }
//       },
//       child: Container(
//         child: Column(
//           children: <Widget>[
//             isFavorited
//                 ? Icon(
//                     Icons.favorite,
//                     color: Colors.red,
//                     size: 25,
//                   )
//                 : Icon(
//                     Icons.favorite_border,
//                     color: Colors.black54,
//                     size: 25,
//                   ),
//           ],
//         ),
//       ),
//     );
//   }
// }

/// Share button

class ShareButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void shareItem(BuildContext context) {
      final RenderBox box = context.findRenderObject();
      final String text = 'Check this out! \n :ITEM-URL: ';
      Share.share(text,
          subject: text,
          sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
    }

    return InkWell(
      onTap: () {
        shareItem(context);
      },
      child: Icon(Icons.share, size: 20, color: Colors.black54),
    );
  }
}

/// RadioButton for item choose in size
class RadioButtonCustom extends StatefulWidget {
  String txt;

  RadioButtonCustom({this.txt});

  @override
  _RadioButtonCustomState createState() => _RadioButtonCustomState(this.txt);
}

class _RadioButtonCustomState extends State<RadioButtonCustom> {
  _RadioButtonCustomState(this.txt);

  String txt;
  bool itemSelected = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: InkWell(
        onTap: () {
          setState(() {
            if (itemSelected == false) {
              setState(() {
                itemSelected = true;
              });
            } else if (itemSelected == true) {
              setState(() {
                itemSelected = false;
              });
            }
          });
        },
        child: Container(
          height: 37.0,
          width: 37.0,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                  color: itemSelected ? Colors.black54 : Colors.green),
              shape: BoxShape.circle),
          child: Center(
            child: Text(
              txt,
              style: TextStyle(
                  color: itemSelected ? Colors.black54 : Colors.green),
            ),
          ),
        ),
      ),
    );
  }
}

/// RadioButton for item choose in color
class RadioButtonColor extends StatefulWidget {
  Color clr;

  RadioButtonColor(this.clr);

  @override
  _RadioButtonColorState createState() => _RadioButtonColorState(this.clr);
}

class _RadioButtonColorState extends State<RadioButtonColor> {
  bool itemSelected = true;
  Color clr;

  _RadioButtonColorState(this.clr);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: InkWell(
        onTap: () {
          if (itemSelected == false) {
            setState(() {
              itemSelected = true;
            });
          } else if (itemSelected == true) {
            setState(() {
              itemSelected = false;
            });
          }
        },
        child: Container(
          height: 37.0,
          width: 37.0,
          decoration: BoxDecoration(
              color: clr,
              border: Border.all(
                  color: itemSelected ? Colors.black26 : Colors.green,
                  width: 2.0),
              shape: BoxShape.circle),
        ),
      ),
    );
  }
}

/// Class for card product in "Top Rated Products"
class FavoriteItem extends StatelessWidget {
  String image, rating, salary, title, sale;

  FavoriteItem({this.image, this.rating, this.salary, this.title, this.sale});

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Padding(
      padding: const EdgeInsets.only(left: 5.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            boxShadow: [
              BoxShadow(
                color: Color(0xFF656565).withOpacity(0.15),
                blurRadius: 4.0,
                spreadRadius: 1.0,
//           offset: Offset(4.0, 10.0)
              )
            ]),
        child: Wrap(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  height: 150.0,
                  width: 150.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(7.0),
                          topRight: Radius.circular(7.0)),
                      image: DecorationImage(
                          image: AssetImage(image), fit: BoxFit.cover)),
                ),
                Padding(padding: EdgeInsets.only(top: 15.0)),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Text(
                    title,
                    style: TextStyle(
                        letterSpacing: 0.5,
                        color: Colors.black54,
                        fontFamily: "Sans",
                        fontWeight: FontWeight.w500,
                        fontSize: 13.0),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 1.0)),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Text(
                    salary,
                    style: TextStyle(
                        fontFamily: "Sans",
                        fontWeight: FontWeight.w500,
                        fontSize: 14.0),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 15.0, right: 15.0, top: 5.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            rating,
                            style: TextStyle(
                                fontFamily: "Sans",
                                color: Colors.black26,
                                fontWeight: FontWeight.w500,
                                fontSize: 12.0),
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 14.0,
                          )
                        ],
                      ),
                      Text(
                        sale,
                        style: TextStyle(
                            fontFamily: "Sans",
                            color: Colors.black26,
                            fontWeight: FontWeight.w500,
                            fontSize: 12.0),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget _line() {
  return Container(
    height: 0.9,
    width: double.infinity,
    color: Colors.black12,
  );
}
