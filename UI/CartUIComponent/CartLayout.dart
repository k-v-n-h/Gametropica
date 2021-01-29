import 'package:treva_shop_flutter/Library/Language_Library/lib/easy_localization_delegate.dart';
import 'package:treva_shop_flutter/Library/Language_Library/lib/easy_localization_provider.dart';
import 'package:flutter/material.dart';
import 'package:treva_shop_flutter/ListItem/BrandDataList.dart';
import 'package:treva_shop_flutter/ListItem/CartItemData.dart';
import 'package:treva_shop_flutter/UI/CartUIComponent/Delivery.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class cart extends StatefulWidget {
  @override
  cartState createState() => cartState();
}

class cartState extends State<cart> {
  static final List<cartItem> items = new List();
  
   cartTotal() {
    if (items.length > 0) {
      num totalPrice = 0;
      for (int i=0; i < items.length; i++){
        
        List<double> cost = [];
        // cost.add(items[i].price);

        // for (num e in cost){
        //   totalPrice += e;
        //   print(cost);
        //   return totalPrice;
        // }
        cost.add(items[i].price);
        cost.forEach((num e) {totalPrice += e;});
        // print(totalPrice);
        // return totalPrice;

        // double sum = cost.reduce((value, element) => null)
        // cartItem();
        // totalPrice = int.parse(items[i].price) * items.length; 
        // print(totalPrice);
        // print(items[i].price);
        // setState(() {
        //   totalPrice += (cartItem().price * cartItem()[i]);
        // });
      }
    return totalPrice.toStringAsFixed(2);

    }
  }
  @override
  void initState() {
    super.initState();
    setState(() {
      // items.add(
      // cartItem(
      //   img: "assets/imgItem/flashsale3.JPG",
      //   id: 1,
      //   title: "Samsung Galaxy Note 9 8GB RAM",
      //   desc: "Internal 1 TB",
      //   price: "\$ 950",
      // ),
      // );
    });
  }


  // String price = cartItem().price;

  /// Declare price and value for chart
  int value = 1;
  int pay = 950;
  // int pay;

  @override
  Widget build(BuildContext context) {
    var data = EasyLocalizationProvider.of(context).data;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return EasyLocalizationProvider(
      data: data,
      child: Scaffold(
        //
        // app bar
        //

        appBar: AppBar(
          brightness: Brightness.dark,
          iconTheme: IconThemeData(color: Color(0xFF6991C7)),
          centerTitle: true,
          // backgroundColor: Color(0xff010855),
          backgroundColor: Color(0xff273250),
          title: Text(
            AppLocalizations.of(context).tr('cart'),
            style: TextStyle(
                fontFamily: "Gotik",
                fontSize: 18.0,
                color: Colors.white,
                fontWeight: FontWeight.w700),
          ),
          elevation: 1.0,
        ),

        //
        // bottom checkout Bar
        //
        bottomNavigationBar: Visibility(
          visible: items.length > 0,
          child: Padding(
            padding: EdgeInsets.only(bottom: 0),
            child: InkWell(
              onTap: () {
                cartTotal();
                Navigator.of(context).push(PageRouteBuilder(
                    pageBuilder: (_, __, ___) => new delivery()));
              },
              child: Container(
                height: 70,
                width: screenWidth - 215,
                decoration: BoxDecoration(
                  color: Color(0xff273250),
                ),
                child: Center(
                  child: Text(
                    'Check out',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),
          ),
        ),

        ///
        ///
        /// Checking item value of cart
        ///
        ///
        body: items.length > 0
            ? Column(
                children: <Widget>[
                  Expanded(
                    child: SingleChildScrollView(
                      child: ListView.builder(
                        primary: false,
                        itemCount: items.length,
                        shrinkWrap: true,
                        itemBuilder: (context, position) {
                          ///
                          /// Widget for list view slide delete
                          ///
                          return Slidable(
                            delegate: new SlidableDrawerDelegate(),
                            actionExtentRatio: 0.25,
                            actions: <Widget>[
                              // new IconSlideAction(
                              //   caption: AppLocalizations.of(context)
                              //       .tr('cartArchiveText'),
                              //   color: Colors.blue,
                              //   icon: Icons.archive,
                              //   onTap: () {
                              //     ///
                              //     /// SnackBar show if cart Archive
                              //     ///
                              //     Scaffold.of(context).showSnackBar(SnackBar(
                              //       content: Text(AppLocalizations.of(context)
                              //           .tr('cartArchice')),
                              //       duration: Duration(seconds: 2),
                              //       backgroundColor: Colors.blue,
                              //     ));
                              //   },
                              // ),
                            ],
                            secondaryActions: <Widget>[
                              new IconSlideAction(
                                key: Key(items[position].id.toString()),
                                caption: AppLocalizations.of(context)
                                    .tr('cartDelete'),
                                color: Colors.red,
                                icon: Icons.delete,
                                onTap: () {
                                  setState(() {
                                    items.removeAt(position);
                                  });

                                  ///
                                  /// SnackBar show if cart delete
                                  ///
                                  Scaffold.of(context).showSnackBar(SnackBar(
                                    content: Text(AppLocalizations.of(context)
                                        .tr('cartDeleted')),
                                    duration: Duration(seconds: 2),
                                    backgroundColor: Colors.redAccent,
                                  ));
                                },
                              ),
                            ],
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 1.0, left: 13.0, right: 13.0, bottom: 5),

                              /// Background Constructor for card
                              child: Container(
                                height: 220.0,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12.withOpacity(0.1),
                                      blurRadius: 3.5,
                                      spreadRadius: 0.4,
                                    )
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                            padding: EdgeInsets.all(10.0),

                                            /// Image item
                                            child: Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.white
                                                        .withOpacity(0.1),
                                                    boxShadow: [
                                                      BoxShadow(
                                                          color: Colors.black12
                                                              .withOpacity(0.1),
                                                          blurRadius: 0.5,
                                                          spreadRadius: 0.1)
                                                    ]),
                                                child: Image.asset(
                                                  '${items[position].img}',
                                                  height: 130.0,
                                                  width: 120.0,
                                                  fit: BoxFit.cover,
                                                ))),
                                        Flexible(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25.0,
                                                left: 10.0,
                                                right: 5.0),
                                            child: Column(
                                              /// Text Information Item
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  '${items[position].title}',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontFamily: "Sans",
                                                    color: Colors.black87,
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        top: 10.0)),
                                                Text(
                                                  '${items[position].desc}',
                                                  style: TextStyle(
                                                    color: Colors.black54,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 12.0,
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                // Padding(
                                                //     padding: EdgeInsets.only(
                                                //         top: 10.0)),
                                                // Text(
                                                //     '${items[position].price}'),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 18.0, left: 0.0),
                                                  // child: Container(
                                                  //   width: 112.0,
                                                  //   decoration: BoxDecoration(
                                                  //       color: Colors.white70,
                                                  //       border: Border.all(
                                                  //           color: Colors
                                                  //               .black12
                                                  //               .withOpacity(
                                                  //                   0.1))),
                                                    // child: Row(
                                                    //   mainAxisAlignment:
                                                    //       MainAxisAlignment
                                                    //           .spaceAround,
                                                    //   children: <Widget>[
                                                    //     /// Decrease of value item
                                                    //     InkWell(
                                                    //       onTap: () {
                                                    //         setState(() {
                                                    //           value = value - 1;
                                                    //           pay = 950 * value;
                                                    //           // pay = int.parse(items[
                                                    //           //             position]
                                                    //           //         .price) *
                                                    //           //     value;
                                                    //         });
                                                    //       },
                                                    //       child: Container(
                                                    //         height: 30.0,
                                                    //         width: 30.0,
                                                    //         decoration: BoxDecoration(
                                                    //             border: Border(
                                                    //                 right: BorderSide(
                                                    //                     color: Colors
                                                    //                         .black12
                                                    //                         .withOpacity(0.1)))),
                                                    //         child: Center(
                                                    //             child:
                                                    //                 Text("-")),
                                                    //       ),
                                                    //     ),
                                                    //     Padding(
                                                    //       padding:
                                                    //           const EdgeInsets
                                                    //                   .symmetric(
                                                    //               horizontal:
                                                    //                   18.0),
                                                    //       child: Text(
                                                    //           value.toString()),
                                                    //     ),

                                                    //     /// Increasing value of item
                                                    //     InkWell(
                                                    //       onTap: () {
                                                    //         setState(() {
                                                    //           value = value + 1;

                                                    //           // pay = 950 * value;
                                                    //           // pay = int.parse(items[
                                                    //           //             position]
                                                    //           //         .price) *
                                                    //           //     value;
                                                    //         });
                                                    //       },
                                                    //       child: Container(
                                                    //         height: 30.0,
                                                    //         width: 28.0,
                                                    //         decoration: BoxDecoration(
                                                    //             border: Border(
                                                    //                 left: BorderSide(
                                                    //                     color: Colors
                                                    //                         .black12
                                                    //                         .withOpacity(0.1)))),
                                                    //         child: Center(
                                                    //             child:
                                                    //                 Text("+")),
                                                    //       ),
                                                    //     ),
                                                    //   ],
                                                    // ),
                                                  // ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(padding: EdgeInsets.only(top: 8.0)),
                                    Divider(
                                      height: 2.0,
                                      color: Colors.black12,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 9.0, left: 10.0, right: 10.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10.0),

                                            /// Total price of item buy
                                            child: Text( 'Cost: \$ ' +
                                              // AppLocalizations.of(context)
                                              //         .tr('cartTotal') + '\$ ' + 
                                                  items[position].price.toString(),
                                              // pay.toString(),
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 15.5,
                                                  fontFamily: "Sans"),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                items.removeAt(position);
                                              });
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 10.0),
                                              child: Container(
                                                height: 40.0,
                                                width: 120.0,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFA3BDED),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    'Remove',
                                                    // AppLocalizations.of(context)
                                                    //     .tr('cartPay'),
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontFamily: "Sans",
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        scrollDirection: Axis.vertical,
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  OrderDetail(cartTotal()),
                  SizedBox(height: 15),
                ],
              )
            : noItemCart(),
      ),
    );
  }
}

class OrderDetail extends StatelessWidget {
  OrderDetail(this.totalPrice);
  String totalPrice;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth - 20,
      height: 130,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.1),
            blurRadius: 3.5,
            spreadRadius: 0.4,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 20, top: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Cart Total'),
                Text('\$ $totalPrice'),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, top: 20, bottom: 5, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[Text('Discount'), Text('\$ 0.00')],
            ),
          ),
          Divider(
            thickness: 1,
          ),
          Padding(
            padding: EdgeInsets.only(top: 5, left: 20, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Total Payable',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  '\$ $totalPrice',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


///
///
/// If no item cart this class showing
///
class noItemCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Container(
      width: 500.0,
      color: Colors.white,
      height: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
                padding:
                    EdgeInsets.only(top: mediaQueryData.padding.top + 50.0)),
            Image.asset(
              "assets/imgIllustration/IlustrasiCart.png",
              height: 300.0,
            ),
            Padding(padding: EdgeInsets.only(bottom: 10.0)),
            Text(
              'There are no items in your cart',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 18.5,
                  color: Colors.black.withOpacity(0.6),
                  fontFamily: "Popins"),
            ),
          ],
        ),
      ),
    );
  }
}
