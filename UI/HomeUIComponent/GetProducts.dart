import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:treva_shop_flutter/ListItem/HomeGridItemRecomended.dart';

// Future<List<GridItem>> fetchAlbum() =>
//     Future.delayed(Duration(seconds: 1), () async {
//       // List<GridItem> gridItem;

//       http.Response response = await http.get(
//         Uri.encodeFull(
//             'https'),
//         headers: {
//           'X-Shopify-Storefront-Access-Token':
//           'Accept': "application/json",
//         },
//       );

//       List<dynamic> productdata = jsonDecode(response.body);

//       // var products = productdata['products'];
//       // var productList = productdata['products'] as List;

//       if (response.statusCode == 200) {
//         List<dynamic> productdata = jsonDecode(response.body);

//         // List<GridItem> users =
//         //     productdata.map((data) => GridItem.fromJson(data)).toList();
//         // var productdata = jsonDecode(response.body);
//         var products = jsonDecode(response.body);
//         // print(products['products']);
//         // var productObjects = productdata['products'] as List;
//         // If the server did return a 200 OK response,
//         // then parse the JSON.

//         // for (int i = 0; i < products.length; i++) {
//         //   // print(product[i]['id']);
//         //   // print(product[i]['title']);
//         //   gridItemArray.add(GridItem(
//         //       id: products[i]['id'].toString(),
//         //       title: products[i]['title'],
//         //       img: products[i]['images'][i]
//         //           ['src'], // src is where the image link is located
//         //       price: products[i]['price'],
//         //       description: products[i]['body_html']));
//         //   // return GridItem(
//         //   //     id: products[i]['id'].toString(),
//         //   //     title: products[i]['title'],
//         //   //     img: products[i]['images'][i]
//         //   //         ['src'], // src is where the image link is located
//         //   //     price: products[i]['price'],
//         //   //     description: products[i]['body_html']);
//         // }

//         // var gridItem = productObjects
//         //     .map<GridItem>((productdata) => GridItem.fromJson(products))
//         //     .toList();
//         print('fetch api works ' + response.statusCode.toString());
//         // print(productdata['products'].length);
//         // print("product list");
//         // print(gridItem);

//         // print(productdata['products'][0]['id']);
//         // print(productdata['products'][5]['title']);
//         // print(productdata['products'][0]['images'][0]['src']); image link

//         // return users;
//         // return gridItem;
//         // return GridItem.fromJson(productObjects);
//         // return GridItem.fromJson(productdata['products']);
//       } else {
//         // If the server did not return a 200 OK response,
//         // then throw an exception.
//         throw Exception('Failed to load products');
//       }
//       // print(response.body['title']);
//     });

// Future<List<GridItem>> getDataFromFakeServer() async {
//   return await Future.delayed(Duration(seconds: 2), () {
//     http.Response reponse = http.get(
//       Uri.encodeFull(
//           ''),
//       headers: {
//         'X-Shopify-Storefront-Access-Token': "",
//         'Accept': "application/json",
//       },
//     );

//     List<dynamic> data = jsonDecode(response);
//     List<GridItem> users = data.map((data) => GridItem.fromJson(data)).toList();
//     return users;
//   });

//   Future<List<GridItem2>> fetchProducts() async {
// http.Response response = await http.get(
//   Uri.encodeFull(
//       'https'),
//   headers: {
//     'X-Shopify-Storefront-Access-Token': "token",
//     'Accept': "application/json",
//   },
// );

// // Use the compute function to run parsePhotos in a separate isolate.
// return compute(parseProducts, response.body);
// }

/////////////////////////////////////////////////////////////////////////
///
///


  Future<List<GridItem3>> getProducts() async {
    try {
      final http.Response response = await http.get(
        Uri.encodeFull(
            'HTTP'),
        headers: {
          'X-Shopify-Storefront-Access-Token':
              "TOKEN",
          'Accept': "application/json",
        },
      );
      if (response.statusCode == 200){

        var productdata = jsonDecode(response.body);
        final List<GridItem3> gridItem3 = gridItem3FromJson(productdata['products']);
        return gridItem3;
      } else {
      return List<GridItem3>();
      }
    } catch (e) {
      return List<GridItem3>();
    }
  }
