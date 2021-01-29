import 'package:flutter/material.dart';
import 'package:treva_shop_flutter/Library/Language_Library/lib/easy_localization_provider.dart';
import 'package:treva_shop_flutter/ListItem/CartItemData.dart';
import 'package:treva_shop_flutter/UI/CartUIComponent/CartLayout.dart';
import 'favoriteItemData.dart';

class Favorites extends StatefulWidget {
  @override
  FavoritesState createState() => FavoritesState();
}

class FavoritesState extends State<Favorites> {
  static final List<favoriteItem> items = new List();
  @override
  void initState() {
    setState(() {
      // items.add(
      //   favoriteItem(
      //     img: "assets/imgItem/flashsale3.JPG",
      //     id: 1,
      //     title: "samsung phone",
      //     desc: 'description',
      //     price: '950',
      //   ),
      // );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var data = EasyLocalizationProvider.of(context).data;
    return EasyLocalizationProvider(
      data: data,
      child: Scaffold(
        appBar: AppBar(
          brightness: Brightness.dark,
          elevation: 1.0,
          iconTheme: IconThemeData(color: Color(0xFF6991C7)),
          centerTitle: true,
          // backgroundColor: Color(0xff293694),
          // backgroundColor: Color(0xff010855),
          backgroundColor: Color(0xff273250),
          title: Text(
            'Favorites',
            style: TextStyle(
              fontFamily: 'Gotik',
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
        body: items.length > 0
            ? ListView.builder(
                itemCount: items.length,
                shrinkWrap: true,
                itemBuilder: (context, position) {
                  return Padding(
                    padding: const EdgeInsets.only(
                        top: 1, left: 13, right: 13, bottom: 5),
                    child: Container(
                      height: 165,
                      // padding: EdgeInsets.only(bottom: 20),
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
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.all(10),

                                // image
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.1),
                                      boxShadow: [
                                        BoxShadow(
                                            color:
                                                Colors.black12.withOpacity(0.1),
                                            blurRadius: 0.5,
                                            spreadRadius: 0.1)
                                      ]),
                                  child: Image.asset(
                                    '${items[position].img}',
                                    height: 145,
                                    width: 120,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Padding(
                                  padding: EdgeInsets.only(left: 10, right: 5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      // Padding(
                                      //     padding: EdgeInsets.only(top: 10)),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            '${items[position].title}',
                                            style: TextStyle(
                                                fontFamily: 'sans',
                                                fontWeight: FontWeight.w700,
                                                color: Colors.black87),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          IconButton(
                                            icon: Icon(
                                              Icons.cancel,
                                              size: 15,
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                items.removeAt(position);
                                              });
                                            },
                                          )
                                        ],
                                      ),

                                      // Padding(
                                      //     padding: EdgeInsets.only(top: 2)),
                                      Text(
                                        '${items[position].desc}',
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(top: 10)),
                                      Text('\$ ${items[position].price}'),
                                      Padding(padding: EdgeInsets.only(top: 8)),
                                      Divider(
                                        height: 2,
                                        color: Colors.black12,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: 9, left: 10, right: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 10),
                                              child: InkWell(
                                                onTap: () {
                                                  cartState.items.add(
                                                    cartItem(
                                                      id: items[position].id,
                                                      title:
                                                          items[position].title,
                                                      img: items[position].img,
                                                      desc:
                                                          items[position].desc,
                                                      price:
                                                          items[position].price,
                                                    ),
                                                  );

                                                  setState(() {
                                                    items.removeAt(position);
                                                  });
                                                },
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 10.0),
                                                  child: Container(
                                                    height: 40.0,
                                                    width: 120.0,
                                                    decoration: BoxDecoration(
                                                        color: Colors.lightGreen
                                                        // color: Color(0xFFA3BDED),
                                                        ),
                                                    child: Center(
                                                      child: Text(
                                                        'Add To Cart',
                                                        // AppLocalizations.of(context)
                                                        //     .tr('cartPay'),
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontFamily: "Sans",
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
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
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              )
            : NoFavoritesCart(),
      ),
    );
  }
}

class NoFavoritesCart extends StatelessWidget {
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
              'No favorite items yet!',
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
