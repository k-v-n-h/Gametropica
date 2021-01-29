import 'dart:async';
import 'dart:convert';
import 'package:flushbar/flushbar.dart';
import 'package:treva_shop_flutter/Library/Language_Library/lib/easy_localization_delegate.dart';
import 'package:treva_shop_flutter/Library/Language_Library/lib/easy_localization_provider.dart';
import 'package:treva_shop_flutter/Library/carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:treva_shop_flutter/Library/countdown_timer/countDownTimer.dart';
import 'package:treva_shop_flutter/ListItem/CartItemData.dart';
import 'package:treva_shop_flutter/ListItem/HomeGridItemRecomended.dart';
import 'package:treva_shop_flutter/UI/FavoritesComponent/favoriteItemData.dart';
import 'package:treva_shop_flutter/UI/FavoritesComponent/favoritesItems.dart';
import 'package:treva_shop_flutter/UI/FavoritesComponent/favoritesLayout.dart';
import 'package:treva_shop_flutter/UI/HomeUIComponent/AppbarGradient.dart';
import 'package:treva_shop_flutter/UI/HomeUIComponent/CategoryDetail.dart';
import 'package:treva_shop_flutter/UI/HomeUIComponent/DetailProduct.dart';
import 'package:treva_shop_flutter/UI/HomeUIComponent/FlashSale.dart';
import 'package:treva_shop_flutter/UI/HomeUIComponent/MenuDetail.dart';
import 'package:treva_shop_flutter/UI/HomeUIComponent/PromotionDetail.dart';
import 'package:treva_shop_flutter/UI/CartUIComponent/CartLayout.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:treva_shop_flutter/UI/HomeUIComponent/GetProducts.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

/// Component all widget in home
class _MenuState extends State<Menu> with TickerProviderStateMixin {
  /// Declare class GridItem from HomeGridItemReoomended.dart in folder ListItem
  GridItem3 gridItem;
  // ItemGrid(this.gridItem);
  // _MenuState(this.gridItem);
  bool isStarted = false;

  //fetch api request to store
  // ignore: missing_return
  // Future<String> fetchAlbum() async {
  //   http.Response response = await http.get(
  //     Uri.encodeFull(
  //         'https://gametropica-com.myshopify.com/admin/oauth/install_custom_app?client_id=8f8287041f59022286b1fc2f44993427&signature=eyJfcmFpbHMiOnsibWVzc2FnZSI6ImV5SmxlSEJwY21WelgyRjBJam94TmpBNE5qZ3dPRGN3TENKd1pYSnRZVzVsYm5SZlpHOXRZV2x1SWpvaVoyRnRaWFJ5YjNCcFkyRXRZMjl0TG0xNWMyaHZjR2xtZVM1amIyMGlMQ0pqYkdsbGJuUmZhV1FpT2lJNFpqZ3lPRGN3TkRGbU5Ua3dNakl5T0RaaU1XWmpNbVkwTkRrNU16UXlOeUlzSW5CMWNuQnZjMlVpT2lKamRYTjBiMjFmWVhCd0luMD0iLCJleHAiOiIyMDIwLTEyLTI5VDIzOjQ3OjUwLjE2NloiLCJwdXIiOm51bGx9fQ%3D%3D--f4f24468b396c077a6ff4d450525c1899f156c39'),
  //   );
  //   print(response.body);
  // }

  @override
  Widget build(BuildContext context) {
    var data = EasyLocalizationProvider.of(context).data;
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double size = mediaQueryData.size.height;

    //fetch api request to store

    // Future<Album> fetchAlbum() async {
    //   final response = await http.get('https://jsonplaceholder.typicode.com/albums/1');

    //   if (response.statusCode == 200) {
    //     // If the server did return a 200 OK response,
    //     // then parse the JSON.
    //     return Album.fromJson(jsonDecode(response.body));
    //   } else {
    //     // If the server did not return a 200 OK response,
    //     // then throw an exception.
    //     throw Exception('Failed to load album');
    //   }
    // }

    /// Navigation to MenuDetail.dart if user Click icon in category Menu like a example camera
    var onClickMenuIcon = () {
      Navigator.of(context).push(PageRouteBuilder(
          pageBuilder: (_, __, ___) => new menuDetail(),
          transitionDuration: Duration(milliseconds: 750),

          /// Set animation with opacity
          transitionsBuilder:
              (_, Animation<double> animation, __, Widget child) {
            return Opacity(
              opacity: animation.value,
              child: child,
            );
          }));
    };

    /// Navigation to promoDetail.dart if user Click icon in Week Promotion
    var onClickWeekPromotion = () {
      Navigator.of(context).push(PageRouteBuilder(
          pageBuilder: (_, __, ___) => new promoDetail(),
          transitionDuration: Duration(milliseconds: 750),
          transitionsBuilder:
              (_, Animation<double> animation, __, Widget child) {
            return Opacity(
              opacity: animation.value,
              child: child,
            );
          }));
    };

    /// Navigation to categoryDetail.dart if user Click icon in Category
    var onClickCategory = () {
      Navigator.of(context).push(PageRouteBuilder(
          pageBuilder: (_, __, ___) => new categoryDetail(),
          transitionDuration: Duration(milliseconds: 750),
          transitionsBuilder:
              (_, Animation<double> animation, __, Widget child) {
            return Opacity(
              opacity: animation.value,
              child: child,
            );
          }));
    };

    /// Declare device Size
    var deviceSize = MediaQuery.of(context).size;

    /// ImageSlider in header
    var imageSlider = Container(
      height: 220.0,
      child: new Carousel(
        boxFit: BoxFit.cover,
        dotColor: Color(0xFF6991C7).withOpacity(0.8),
        dotSize: 5.5,
        dotSpacing: 16.0,
        dotBgColor: Colors.transparent,
        showIndicator: true,
        overlayShadow: true,
        overlayShadowColors: Colors.grey.withOpacity(0.9),
        overlayShadowSize: 0.7,
        images: [
          AssetImage("assets/img/controller.jpeg"),
          AssetImage("assets/img/headset.jpg"),
          AssetImage("assets/imgBrand/whiteController.jpg"),
          AssetImage("assets/img/desktop.jpg"),
          AssetImage("assets/img/keyboard.jpg"),
        ],
      ),
    );

    /// CategoryIcon Component
    // var categoryIcon = Container(
    //   color: Colors.white,
    //   padding: EdgeInsets.only(top: 20.0),
    //   alignment: AlignmentDirectional.centerStart,
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: <Widget>[
    //       Padding(
    //         padding: EdgeInsets.only(left: 20.0, top: 0.0,right: 20.0),
    //         child: Text(
    //           AppLocalizations.of(context).tr('menu'),
    //           style: TextStyle(
    //               fontSize: 13.5,
    //               fontFamily: "Sans",
    //               fontWeight: FontWeight.w700),
    //         ),
    //       ),
    //       Padding(padding: EdgeInsets.only(top: 20.0)),

    //       /// Get class CategoryIconValue
    //       CategoryIconValue(
    //         tap1: onClickMenuIcon,
    //         icon1: "assets/icon/camera.png",
    //         title1: AppLocalizations.of(context).tr('camera'),
    //         tap2: onClickMenuIcon,
    //         icon2: "assets/icon/food.png",
    //         title2: AppLocalizations.of(context).tr('food'),
    //         tap3: onClickMenuIcon,
    //         icon3: "assets/icon/handphone.png",
    //         title3: AppLocalizations.of(context).tr('handphone'),
    //         tap4: onClickMenuIcon,
    //         icon4: "assets/icon/game.png",
    //         title4: AppLocalizations.of(context).tr('gamming'),
    //       ),
    //       Padding(padding: EdgeInsets.only(top: 23.0)),
    //       CategoryIconValue(
    //         icon1: "assets/icon/fashion.png",
    //         tap1: onClickMenuIcon,
    //         title1: AppLocalizations.of(context).tr('fashion'),
    //         icon2: "assets/icon/health.png",
    //         tap2: onClickMenuIcon,
    //         title2: AppLocalizations.of(context).tr('healthCare'),
    //         icon3: "assets/icon/pc.png",
    //         tap3: onClickMenuIcon,
    //         title3: AppLocalizations.of(context).tr('computer'),
    //         icon4: "assets/icon/mesin.png",
    //         tap4: onClickMenuIcon,
    //         title4: AppLocalizations.of(context).tr('equipment'),
    //       ),
    //       Padding(padding: EdgeInsets.only(top: 23.0)),
    //       CategoryIconValue(
    //         icon1: "assets/icon/otomotif.png",
    //         tap1: onClickMenuIcon,
    //         title1: AppLocalizations.of(context).tr('otomotif'),
    //         icon2: "assets/icon/sport.png",
    //         tap2: onClickMenuIcon,
    //         title2: AppLocalizations.of(context).tr('sport'),
    //         icon3: "assets/icon/ticket.png",
    //         tap3: onClickMenuIcon,
    //         title3: AppLocalizations.of(context).tr('ticketCinema'),
    //         icon4: "assets/icon/book.png",
    //         tap4: onClickMenuIcon,
    //         title4: AppLocalizations.of(context).tr('books'),
    //       ),
    //       Padding(padding: EdgeInsets.only(bottom: 30.0))
    //     ],
    //   ),
    // );

    /// ListView a WeekPromotion Component
    var PromoHorizontalList = Container(
      color: Colors.grey[300],
      height: 230.0,
      padding: EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(
                  left: 20.0, top: 15.0, bottom: 3.0, right: 20.0),
              child: Text(
                'Week promos',
                style: TextStyle(
                    fontSize: 15.0,
                    fontFamily: "Sans",
                    fontWeight: FontWeight.w700),
              )),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 10.0),
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Padding(padding: EdgeInsets.only(left: 20.0)),
                InkWell(
                    onTap: onClickWeekPromotion,
                    // child: Image.asset("assets/imgPromo/Discount1.png"),
                    ),
                Padding(padding: EdgeInsets.only(left: 10.0)),
                InkWell(
                    onTap: onClickWeekPromotion,
                    // child: Image.asset("assets/imgPromo/Discount3.png"),
                    ),
                Padding(padding: EdgeInsets.only(left: 10.0)),
                InkWell(
                  onTap: onClickWeekPromotion,
                  // child: Image.asset("assets/imgPromo/Discount2.png"),
                ),
                Padding(padding: EdgeInsets.only(left: 10.0)),
                // InkWell(
                //     onTap: onClickWeekPromotion,
                //     child: Image.asset("assets/imgPromo/Discount4.png")),
                // Padding(padding: EdgeInsets.only(left: 10.0)),
                // InkWell(
                //     onTap: onClickWeekPromotion,
                //     child: Image.asset("assets/imgPromo/Discount5.png")),
                // Padding(padding: EdgeInsets.only(left: 10.0)),
                // InkWell(
                //     onTap: onClickWeekPromotion,
                //     child: Image.asset("assets/imgPromo/Discount6.png")),
              ],
            ),
          ),
        ],
      ),
    );

    /// FlashSale component
    // var FlashSell = Container(
    //   height: 390.0,
    //   decoration: BoxDecoration(
    //     /// To set Gradient in flashSale background
    //     gradient: LinearGradient(colors: [
    //       Color(0xFF7F7FD5).withOpacity(0.8),
    //       Color(0xFF86A8E7),
    //       Color(0xFF91EAE4)
    //     ]),
    //   ),

    //   /// To set FlashSale Scrolling horizontal
    //   child: ListView(
    //     scrollDirection: Axis.horizontal,

    //     children: <Widget>[
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.start,
    //         children: <Widget>[
    //           Padding(
    //             padding:
    //             EdgeInsets.only(left: mediaQueryData.padding.left + 20),
    //           ),
    //           Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: <Widget>[
    //               Image.asset(
    //                 "assets/img/flashsaleicon.png",
    //                 height: deviceSize.height * 0.087,
    //               ),
    //               Text(
    //                 AppLocalizations.of(context).tr('flash'),
    //                 style: TextStyle(
    //                   fontFamily: "Popins",
    //                   fontSize: 30.0,
    //                   fontWeight: FontWeight.w600,
    //                   color: Colors.white,
    //                 ),
    //               ),
    //               Text(
    //                 AppLocalizations.of(context).tr('sale'),
    //                 style: TextStyle(
    //                   fontFamily: "Sans",
    //                   fontSize: 28.0,
    //                   fontWeight: FontWeight.w400,
    //                   color: Colors.white,
    //                 ),
    //               ),
    //               Padding(
    //                 padding:
    //                 EdgeInsets.only(top: mediaQueryData.padding.top + 30),
    //               ),
    //               Text(
    //                 AppLocalizations.of(context).tr('endSaleIn'),
    //                 style: TextStyle(
    //                   fontFamily: "Sans",
    //                   fontSize: 15.0,
    //                   fontWeight: FontWeight.w600,
    //                   color: Colors.white,
    //                 ),
    //               ),
    //               Padding(
    //                 padding: EdgeInsets.only(top: 2.0),
    //               ),
    //              CountDownTimer(

    //                secondsRemaining: 86400,
    //                whenTimeExpires: () {
    //                   setState(() {
    //                     //hasTimerStopped = true;
    //                   });
    //                 },
    //                 countDownTimerStyle: TextStyle(
    //                     fontFamily: "Sans",
    //                           fontSize: 19.0,
    //                           letterSpacing: 2.0,
    //                           fontWeight: FontWeight.w600,
    //                           color: Colors.white,)
    //               ),
    //             ],
    //           )
    //         ],
    //       ),
    //       Padding(padding: EdgeInsets.only(left: 40.0)),

    //       /// Get a component flashSaleItem class
    //       flashSaleItem(
    //         image: "assets/imgItem/mackbook.jpg",
    //         title: AppLocalizations.of(context).tr('fTitle1'),
    //         normalprice: "\$ 2,020",
    //         discountprice: "\$ 1,300",
    //         ratingvalue: "(56)",
    //         place: AppLocalizations.of(context).tr('fPlace1'),
    //         stock: AppLocalizations.of(context).tr('fAvailable1'),
    //         colorLine: 0xFFFFA500,
    //         widthLine: 50.0,
    //       ),
    //       Padding(padding: EdgeInsets.only(left: 10.0)),
    //       flashSaleItem(
    //         image: "assets/imgItem/flashsale2.jpg",
    //         title: AppLocalizations.of(context).tr('fTitle2'),
    //         normalprice: "\$ 14",
    //         discountprice: "\$ 10",
    //         ratingvalue: "(16)",
    //         place: AppLocalizations.of(context).tr('fPlace2'),
    //         stock:  AppLocalizations.of(context).tr('fAvailable2'),
    //         colorLine: 0xFF52B640,
    //         widthLine: 100.0,
    //       ),
    //       Padding(padding: EdgeInsets.only(left: 10.0)),
    //       flashSaleItem(
    //         image: "assets/imgItem/flashsale3.jpg",
    //         title:  AppLocalizations.of(context).tr('fTitle3'),
    //         normalprice: "\$ 1,000",
    //         discountprice: "\$ 950",
    //         ratingvalue: "(20)",
    //         place: AppLocalizations.of(context).tr('fPlace3'),
    //         stock:  AppLocalizations.of(context).tr('fAvailable3'),
    //         colorLine: 0xFF52B640,
    //         widthLine: 90.0,
    //       ),
    //       Padding(padding: EdgeInsets.only(left: 10.0)),
    //       flashSaleItem(
    //         image: "assets/imgItem/flashsale4.jpg",
    //         title: AppLocalizations.of(context).tr('fTitle4'),
    //         normalprice: "\$ 25",
    //         discountprice: "\$ 20",
    //         ratingvalue: "(22)",
    //         place: AppLocalizations.of(context).tr('fPlace4'),
    //         stock: AppLocalizations.of(context).tr('fAvailable4'),
    //         colorLine: 0xFFFFA500,
    //         widthLine: 30.0,
    //       ),
    //       Padding(padding: EdgeInsets.only(left: 10.0)),
    //       flashSaleItem(
    //         image: "assets/imgItem/flashsale5.jpg",
    //         title: AppLocalizations.of(context).tr('fTitle5'),
    //         normalprice: "\$ 50",
    //         discountprice: "\$ 30",
    //         ratingvalue: "(10)",
    //         place: AppLocalizations.of(context).tr('fPlace5'),
    //         stock: AppLocalizations.of(context).tr('fAvailable5'),
    //         colorLine: 0xFF52B640,
    //         widthLine: 100.0,
    //       ),
    //       Padding(padding: EdgeInsets.only(left: 10.0)),
    //     ],
    //   ),
    // );

    /// Category Component in bottom of flash sale
    var categoryImageBottom = Container(
      height: 310.0,
      color: Colors.grey[300],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0),
            child: Text(
              AppLocalizations.of(context).tr('category'),
              style: TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Sans"),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(padding: EdgeInsets.only(top: 15.0)),
                        CategoryItemValue(
                          image: "assets/img/ps4controller.jpeg",
                          title: 'product',
                          // title: AppLocalizations.of(context).tr('fashionMan'),
                          tap: onClickCategory,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.0),
                        ),
                        CategoryItemValue(
                          image: "assets/img/keyboard.jpg",
                          title: 'product2',
                          // title:AppLocalizations.of(context).tr('fashionGirl'),
                          tap: onClickCategory,
                        ),
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(left: 10.0)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(top: 15.0)),
                      CategoryItemValue(
                        image: "assets/imgItem/category3.png",
                        title: AppLocalizations.of(context).tr('smartphone'),
                        tap: onClickCategory,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      CategoryItemValue(
                        image: "assets/imgItem/category4.png",
                        title: AppLocalizations.of(context).tr('computer'),
                        tap: onClickCategory,
                      ),
                    ],
                  ),
                  // Padding(padding: EdgeInsets.only(left: 10.0)),
                  // Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: <Widget>[
                  //     Padding(padding: EdgeInsets.only(top: 15.0)),
                  //     CategoryItemValue(
                  //       image: "assets/imgItem/category5.png",
                  //       title: AppLocalizations.of(context).tr('sport'),
                  //       tap: onClickCategory,
                  //     ),
                  //     Padding(
                  //       padding: EdgeInsets.only(top: 10.0),
                  //     ),
                  //     CategoryItemValue(
                  //       image: "assets/imgItem/category6.png",
                  //       title: AppLocalizations.of(context).tr('fashionKids'),
                  //       tap: onClickCategory,
                  //     ),
                  //   ],
                  // ),
                  Padding(padding: EdgeInsets.only(left: 10.0)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(top: 15.0)),
                      CategoryItemValue(
                        image: "assets/img/xbox.jpeg",
                        title: 'product 3',
                        tap: onClickCategory,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      CategoryItemValue(
                        image: "assets/img/headset.jpg",
                        title: 'product 4',
                        tap: onClickCategory,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );

    ///  Grid item in bottom of Category
    var Grid = SingleChildScrollView(
      child: Container(
        color: Colors.grey[300],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0),
              child: Text(
                'Recently Added',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 17.0,
                ),
              ),
            ),

            /// To set GridView item
            GridView.count(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 17.0,
              childAspectRatio: 0.545,
              crossAxisCount: 2,
              primary: false,
              children: [
                FutureBuilder<List<GridItem3>>(
                  future: getProducts(),
                  // ignore: missing_return
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return new Center(child: CircularProgressIndicator());
                        break;
                      default:
                        return ItemGrid(gridItem);
                    }
                    // return snapshot.hasData
                    //     ? ItemGrid(gridItem)
                    //     : Center(child: CircularProgressIndicator());
                  },
                  // initialData: 1,
                ),
              ],
              // children: List.generate(
              //   gridItemArray.length,
              //   (index) => ItemGrid(gridItemArray[index]),) // ItemGrid(gridItem)
            ),
          ],
        ),
      ),
    );

    return EasyLocalizationProvider(
      data: data,
      child: Scaffold(
        backgroundColor: Colors.black,

        /// Use Stack to costume a appbar
        body: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(
                          top: mediaQueryData.padding.top + 55.5)),

                  /// Call var imageSlider
                  imageSlider,

                  /// Call var categoryIcon
                  ///
                  // categoryIcon,
                  //
                  // Padding(
                  //   padding: EdgeInsets.only(top: 10.0),
                  // ),

                  /// Call var PromoHorizontalList
                  ///
                  // PromoHorizontalList,

                  /// Call var a FlashSell, i am sorry Typo :v
                  ///
                  // FlashSell,
                  // Padding(
                  //   padding: EdgeInsets.only(top: 3.0),
                  // ),

                  // categoryImageBottom,
                  // Padding(
                  //   padding: EdgeInsets.only(bottom: 8.0),
                  // ),

                  /// Call a Grid variable, this is item list in Recomended item
                  Grid,
                ],
              ),
            ),

            /// Get a class AppbarGradient
            /// This is a Appbar in home activity
            AppbarGradient(),
          ],
        ),
      ),
    );
  }
}

/// ItemGrid in bottom item "Recomended" item
class ItemGrid extends StatelessWidget {
  /// Get data from HomeGridItem.....dart classz
  GridItem gridItem;
  ItemGrid(this.gridItem);
  bool _isFavorited = false;

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return InkWell(
      onTap: () {
        Navigator.of(context).push(PageRouteBuilder(
            pageBuilder: (_, __, ___) => new detailProduk(gridItem),
            transitionDuration: Duration(milliseconds: 900),

            /// Set animation Opacity in route to detailProduk layout
            transitionsBuilder:
                (_, Animation<double> animation, __, Widget child) {
              return Opacity(
                opacity: animation.value,
                child: child,
              );
            }));
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(15.0),
            ),
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
                /// Set Animation image to detailProduk layout
                Hero(
                  tag: "hero-grid-${gridItem.id}",
                  child: Material(
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(PageRouteBuilder(
                            pageBuilder: (_, __, ___) =>
                                new detailProduk(gridItem),
                            transitionDuration: Duration(milliseconds: 900),

                            /// Set animation Opacity in route to detailProduk layout
                            transitionsBuilder: (_, Animation<double> animation,
                                __, Widget child) {
                              return Opacity(
                                opacity: animation.value,
                                child: child,
                              );
                            }));

                        //
                        // This bottom comment zooms the picture you tap on.
                        //
                        // Navigator.of(context).push(PageRouteBuilder(
                        //     opaque: false,
                        //     pageBuilder: (BuildContext context, _, __) {
                        //       return new Material(
                        //         color: Colors.black54,
                        //         child: Container(
                        //           padding: EdgeInsets.all(30.0),
                        //           child: InkWell(
                        //             child: Hero(
                        //                 tag: "hero-grid-${gridItem.id}",
                        //                 child: Image.asset(
                        //                   gridItem.img,
                        //                   width: 300.0,
                        //                   height: 300.0,
                        //                   alignment: Alignment.center,
                        //                   fit: BoxFit.contain,
                        //                 )),
                        //             onTap: () {
                        //               Navigator.pop(context);
                        //             },
                        //           ),
                        //         ),
                        //       );
                        //     },
                        //     transitionDuration: Duration(milliseconds: 500)));
                      },

                      /// size of the Recommended tiles
                      child: Container(
                        height: mediaQueryData.size.height / 3.4,
                        width: 200.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(7.0),
                                topRight: Radius.circular(7.0)),
                            image: DecorationImage(
                                // image: AssetImage(gridItem.img),
                                image: NetworkImage(gridItem.image.src),
                                fit: BoxFit.cover)),
                      ),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 7.0)),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Text(
                    gridItem.title,
                    overflow: TextOverflow.ellipsis,
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
                    '\$ ' + gridItem.price.toString(),
                    style: TextStyle(
                        fontFamily: "Sans",
                        fontWeight: FontWeight.w500,
                        fontSize: 14.0),
                  ),
                ),

                Padding(
                  padding:
                      const EdgeInsets.only(left: 15.0, right: 15.0, top: 0.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          FavoriteButton(
                            gridDesc: gridItem.description,
                            gridId: gridItem.id.toString(),
                            gridImg: gridItem.image.src,
                            gridPrice: gridItem.,
                            gridTitle: gridItem.title,
                          ),
                          Padding(
                              padding: EdgeInsets.only(left: 15, bottom: 15)),
                          // Text(
                          //   gridItem.rattingValue,
                          //   style: TextStyle(
                          //       fontFamily: "Sans",
                          //       color: Colors.black26,
                          //       fontWeight: FontWeight.w500,
                          //       fontSize: 12.0),
                          // ),
                          ShareButton(),
                          // Icon(
                          //   Icons.share,
                          //   color: Colors.black54,
                          //   size: 20.0,
                          // ),
                        ],
                      ),
                      // Text(
                      //   '',
                      //   // gridItem.itemSale,
                      //   style: TextStyle(
                      //       fontFamily: "Sans",
                      //       color: Colors.black26,
                      //       fontWeight: FontWeight.w500,
                      //       fontSize: 12.0),
                      // ),
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

/// favorite button for  statelesswidget
class FavoriteButton extends StatefulWidget {
  final String gridId, gridImg, gridTitle, gridDesc;
  final double gridPrice;
  // GridItem gridItem;
  // FavoriteButton(this.gridItem);
  FavoriteButton(
      {Key key,
      // this.gridItem,
      this.gridId,
      this.gridDesc,
      this.gridImg,
      this.gridPrice,
      this.gridTitle})
      : super(key: key);
  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  // class FavoriteButton extends StatelessWidget {

  // final GridItem gridItem;
  // _FavoriteButtonState(this.gridItem);
  bool _isFavorited = false;

  void _toggleFavorite() {
    setState(() {
      _isFavorited = !_isFavorited;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // fetchAlbum();
        print(widget.gridId);
        FavoritesState.items.add(favoriteItem(
          id: int.parse(widget.gridId),
          title: widget.gridTitle,
          price: widget.gridPrice,
          img: widget.gridImg,
          desc: widget.gridDesc,
        ));
        _toggleFavorite();
        if (_isFavorited == true) {
          Flushbar(
            flushbarPosition: FlushbarPosition.TOP,
            messageText: Text(
              'Item added to Favorites',
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
              ),
            ),
            duration: Duration(milliseconds: 1500),
            icon: Icon(
              Icons.favorite_border,
              color: Colors.white,
              size: 25,
            ),
          )..show(context);
        } else {
          // setState(() {
          FavoritesState.items.clear();
          // FavoritesState.items.remove(itemGrid);
          // FavoritesState.items.remove(favoriteItem());
          // });
          Flushbar(
            flushbarPosition: FlushbarPosition.TOP,
            messageText: Text(
              'Item removed from Favorites',
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
              ),
            ),
            duration: Duration(milliseconds: 1500),
            icon: Icon(
              Icons.favorite_border,
              color: Colors.white,
              size: 25,
            ),
          )..show(context);
        }
      },
      child: Container(
        child: Column(
          children: <Widget>[
            _isFavorited
                ? Icon(
                    Icons.favorite,
                    color: Colors.red,
                  )
                : Icon(
                    Icons.favorite_border,
                    color: Colors.black54,
                  ),
          ],
        ),
      ),
    );
  }
}

/// Component FlashSaleItem
// class flashSaleItem extends StatelessWidget {
//   final String image;
//   final String title;
//   final String normalprice;
//   final String discountprice;
//   final String ratingvalue;
//   final String place;
//   final String stock;
//   final int colorLine;
//   final double widthLine;

//   flashSaleItem(
//       {this.image,
//       this.title,
//       this.normalprice,
//       this.discountprice,
//       this.ratingvalue,
//       this.place,
//       this.stock,
//       this.colorLine,
//       this.widthLine});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             InkWell(
//               onTap: () {
//                 Navigator.of(context).push(PageRouteBuilder(
//                     pageBuilder: (_, __, ___) => new flashSale(),
//                     transitionsBuilder:
//                         (_, Animation<double> animation, __, Widget child) {
//                       return Opacity(
//                         opacity: animation.value,
//                         child: child,
//                       );
//                     },
//                     transitionDuration: Duration(milliseconds: 850)));
//               },
//               child: Container(
//                 height: 310.0,
//                 width: 145.0,
//                 color: Colors.white,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     SizedBox(
//                       height: 140.0,
//                       width: 145.0,
//                       child: Image.asset(
//                         image,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                     Padding(
//                       padding:
//                           EdgeInsets.only(left: 8.0, right: 8.0, top: 15.0),
//                       child: Text(title,
//                           style: TextStyle(
//                               fontSize: 10.5,
//                               fontWeight: FontWeight.w500,
//                               fontFamily: "Sans")),
//                     ),
//                     Padding(
//                       padding:
//                           EdgeInsets.only(left: 10.0, top: 5.0, right: 10.0),
//                       child: Text(normalprice,
//                           style: TextStyle(
//                               fontSize: 10.5,
//                               decoration: TextDecoration.lineThrough,
//                               color: Colors.black54,
//                               fontWeight: FontWeight.w600,
//                               fontFamily: "Sans")),
//                     ),
//                     Padding(
//                       padding:
//                           EdgeInsets.only(left: 10.0, top: 5.0, right: 10.0),
//                       child: Text(discountprice,
//                           style: TextStyle(
//                               fontSize: 12.0,
//                               color: Color(0xFF7F7FD5),
//                               fontWeight: FontWeight.w800,
//                               fontFamily: "Sans")),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(
//                           left: 10.0, top: 5.0, right: 10.0),
//                       child: Row(
//                         children: <Widget>[
//                           Icon(
//                             Icons.star,
//                             size: 11.0,
//                             color: Colors.yellow,
//                           ),
//                           Icon(
//                             Icons.star,
//                             size: 11.0,
//                             color: Colors.yellow,
//                           ),
//                           Icon(
//                             Icons.star,
//                             size: 11.0,
//                             color: Colors.yellow,
//                           ),
//                           Icon(
//                             Icons.star,
//                             size: 11.0,
//                             color: Colors.yellow,
//                           ),
//                           Icon(
//                             Icons.star_half,
//                             size: 11.0,
//                             color: Colors.yellow,
//                           ),
//                           Text(
//                             ratingvalue,
//                             style: TextStyle(
//                                 fontSize: 10.0,
//                                 fontWeight: FontWeight.w500,
//                                 fontFamily: "Sans",
//                                 color: Colors.black38),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(
//                           left: 10.0, top: 5.0, right: 10.0),
//                       child: Row(
//                         children: <Widget>[
//                           Icon(
//                             Icons.location_on,
//                             size: 11.0,
//                             color: Colors.black38,
//                           ),
//                           Text(
//                             place,
//                             style: TextStyle(
//                                 fontSize: 10.0,
//                                 fontWeight: FontWeight.w500,
//                                 fontFamily: "Sans",
//                                 color: Colors.black38),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(
//                           top: 10.0, left: 10.0, right: 10.0),
//                       child: Text(
//                         stock,
//                         style: TextStyle(
//                             fontSize: 10.0,
//                             fontWeight: FontWeight.w500,
//                             fontFamily: "Sans",
//                             color: Colors.black),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(
//                           top: 4.0, left: 10.0, right: 10.0),
//                       child: Container(
//                         height: 5.0,
//                         width: widthLine,
//                         decoration: BoxDecoration(
//                             color: Color(colorLine),
//                             borderRadius:
//                                 BorderRadius.all(Radius.circular(4.0)),
//                             shape: BoxShape.rectangle),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             )
//           ],
//         )
//       ],
//     );
//   }
// }

/// Component category item bellow FlashSale
class CategoryItemValue extends StatelessWidget {
  String image, title;
  GestureTapCallback tap;

  CategoryItemValue({
    this.image,
    this.title,
    this.tap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tap,
      child: Container(
        height: 105.0,
        width: 160.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(3.0)),
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(3.0)),
            color: Colors.black.withOpacity(0.25),
          ),
          child: Center(
              child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontFamily: "Berlin",
              fontSize: 18.5,
              letterSpacing: 0.7,
              fontWeight: FontWeight.w800,
            ),
          )),
        ),
      ),
    );
  }
}

// /// Component item Menu icon bellow a ImageSlider
// class CategoryIconValue extends StatelessWidget {
//   String icon1, icon2, icon3, icon4, title1, title2, title3, title4;
//   GestureTapCallback tap1, tap2, tap3, tap4;

//   CategoryIconValue(
//       {this.icon1,
//       this.tap1,
//       this.icon2,
//       this.tap2,
//       this.icon3,
//       this.tap3,
//       this.icon4,
//       this.tap4,
//       this.title1,
//       this.title2,
//       this.title3,
//       this.title4});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: <Widget>[
//         InkWell(
//           onTap: tap1,
//           child: Column(
//             children: <Widget>[
//               Image.asset(
//                 icon1,
//                 height: 19.2,
//               ),
//               Padding(padding: EdgeInsets.only(top: 7.0)),
//               Text(
//                 title1,
//                 style: TextStyle(
//                   fontFamily: "Sans",
//                   fontSize: 10.0,
//                   fontWeight: FontWeight.w500,
//                 ),
//               )
//             ],
//           ),
//         ),
//         InkWell(
//           onTap: tap2,
//           child: Column(
//             children: <Widget>[
//               Image.asset(
//                 icon2,
//                 height: 26.2,
//               ),
//               Padding(padding: EdgeInsets.only(top: 0.0)),
//               Text(
//                 title2,
//                 style: TextStyle(
//                   fontFamily: "Sans",
//                   fontSize: 10.0,
//                   fontWeight: FontWeight.w500,
//                 ),
//               )
//             ],
//           ),
//         ),
//         InkWell(
//           onTap: tap3,
//           child: Column(
//             children: <Widget>[
//               Image.asset(
//                 icon3,
//                 height: 22.2,
//               ),
//               Padding(padding: EdgeInsets.only(top: 4.0)),
//               Text(
//                 title3,
//                 style: TextStyle(
//                   fontFamily: "Sans",
//                   fontSize: 10.0,
//                   fontWeight: FontWeight.w500,
//                 ),
//               )
//             ],
//           ),
//         ),
//         InkWell(
//           onTap: tap4,
//           child: Column(
//             children: <Widget>[
//               Image.asset(
//                 icon4,
//                 height: 19.2,
//               ),
//               Padding(padding: EdgeInsets.only(top: 7.0)),
//               Text(
//                 title4,
//                 style: TextStyle(
//                   fontFamily: "Sans",
//                   fontSize: 10.0,
//                   fontWeight: FontWeight.w500,
//                 ),
//               )
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
