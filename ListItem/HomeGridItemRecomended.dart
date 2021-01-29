import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:http/http.dart' as http;
// import 'package:json_annotation/json_annotation.dart';
// import 'package:graphql/src/websocket/messages.dart';
// part 'GridItem.g.dart';

// @JsonSerializable()
class GridItem {
  final String id;
  final String img;
  final String title;
  final double price;
  final String rattingValue;
  final bool isFavorite;
  final String itemSale;
  final String description;

  GridItem(
      {this.id,
      this.img,
      this.title,
      this.price,
      this.rattingValue,
      this.isFavorite,
      this.itemSale,
      this.description});

  // factory GridItem.fromJson(Map<String,dynamic> data ) => _$GridItemFromJson(data);
  // Map<String, dynamic> toJson() => _$GridItemToJson(this);



  // factory GridItem.fromJson(List<dynamic> product) {
  //   print(product);

  //   // print('this is passtest ' + product[0]['title']);

  //   for (int i = 0; i < product.length; i++) {
  //     // print(product[i]['id']);
  //     print(product[i]['title']);
  //     gridItemArray.add(GridItem(
  //         id: product[i]['id'].toString(),
  //         title: product[i]['title'],
  //         img: product[i]['images'][i]
  //             ['src'], // src is where the image link is located
  //         price: product[i]['price'],
  //         description: product[i]['body_html']));
  //     GridItem(
  //         id: product[i]['id'].toString(),
  //         title: product[i]['title'],
  //         img: product[i]['images'][i]
  //             ['src'], // src is where the image link is located
  //         price: product[i]['price'],
  //         description: product[i]['body_html']);
  //     print("data id pass test");

  //     return GridItem(
  //         id: product[i]['id'].toString(),
  //         title: product[i]['title'],
  //         img: product[i]['images'][i]['src'],
  //         price: product[i]['price'],
  //         description: product[i]['body_html']);
    // }

    // return GridItem();
    // return GridItem(
    //   id: product[0]['id'].toString(),
    //   title: product[0]['title'],
    //   img: product[0]['images'][0]
    //       ['src'], // src is where the image link is located
    //   price: product[0]['price'],
    //   // itemSale: "892 Sale",
    //   // rattingValue: "4.2",
    //   description: product[0]['body_html'],
    // );
  }


// }

// jsonDecode(response.body)['products'][0]['images'][0]['src'] getting the image of the product

List<GridItem> gridItemArray = [
  GridItem(
      id: "1",
      img: "assets/imgItem/whitekeyboard.jpg",
      title: "White Keyboard",
      price: 29.99,
      itemSale: "932 Sale",
      rattingValue: "4.8",
      // isFavorite: bool,
      description: 'White Keyboard from blah'),
  GridItem(
      id: "2",
      img: "assets/imgItem/whitemouses.jpg",
      title: "White Mouse",
      price: 59.99,
      itemSale: "892 Sale",
      rattingValue: "4.2",
      description: 'Descriptions'),
  GridItem(
    id: "3",
    img: "assets/imgItem/picun.jpg",
    title: "headset",
    price: 4.99,
    itemSale: "1422 Sale",
    rattingValue: "4.7",
    description:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the "
        "industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and "
        "scrambled it to make a type specimen book.\n\nIt has survived not only five centuries, but also "
        "the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the "
        "1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with "
        "desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
  ),
  GridItem(
    id: "4",
    img: "assets/imgItem/rgbChair.jpg",
    title: "RGB Gaming Chair",
    price: 14.99,
    itemSale: "523 Sale",
    rattingValue: "4.4",
    description:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. ",
  ),
  GridItem(
    id: "5",
    img: "assets/imgItem/rgbPad.jpg",
    title: "XL RGB Mouse Pad",
    price: 19.99,
    itemSale: "130 Sale",
    rattingValue: "4.5",
    description: "Lorem Ipsum . ",
  ),
  GridItem(
    id: "6",
    img: "assets/imgItem/grips.jpg",
    title: "Joystick Grips",
    price: 3.99,
    itemSale: "110 Sale",
    rattingValue: "4.8",
    description:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. ",
  ),
  GridItem(
    id: "7",
    img: "assets/imgItem/charging.jpg",
    title: "Charging Dock",
    price: 15.99,
    itemSale: "654 Sale",
    rattingValue: "4.1",
    description:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. ",
  ),
  GridItem(
    id: "8",
    img: "assets/imgItem/monitor.jpg",
    title: "Curved Monitor",
    price: 99.99,
    itemSale: "1542 Sale",
    rattingValue: "4.1",
    description:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  ),
];

// Future<List<GridItem2>> fetchProducts() async {
//   http.Response response = await http.get(
//     Uri.encodeFull(
//         'https://d10488ac9cb4ebf93cd46ef9a32f8e34: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@gametropica-com.myshopify.com/admin/api/2020-10/products.json'),
//     headers: {
//       'X-Shopify-Storefront-Access-Token': "5c2c5dd99a253ac9ae6ea6349a3ef261",
//       'Accept': "application/json",
//     },
//   );

//   // Use the compute function to run parsePhotos in a separate isolate.
//   return compute(parseProducts, response.body);
// }

// A function that converts a response body into a List<Photo>.
List<GridItem2> parseProducts(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<GridItem2>((json) => GridItem2.fromJson(json)).toList();
}

class GridItem2 {
  final String id;
  final String img;
  final String title;
  final double price;
  final String rattingValue;
  final bool isFavorite;
  final String itemSale;
  final String description;

  GridItem2(
      {this.id,
      this.img,
      this.title,
      this.price,
      this.rattingValue,
      this.isFavorite,
      this.itemSale,
      this.description});

  // ignore: missing_return
  factory GridItem2.fromJson(Map<String, dynamic> product) {
    int i;
    for (i = 0; i < product.length; i++) {
      return GridItem2(
        id: product[i]['id'].toString(),
        title: product[i]['title'],
        img: product[i]['images'][i]
            ['src'], // src is where the image link is located
        price: product[i]['price'],
        description: product[i]['body_html'],
      );
    }
  }
}


/////////////////////////////////////////////////////////////////////////////
/// To parse this JSON data, do
//
// To parse this JSON data, do
//
//     final gridItem3 = gridItem3FromJson(jsonString);


List<GridItem3> gridItem3FromJson(String str) => List<GridItem3>.from(json.decode(str).map((x) => GridItem3.fromJson(x)));

String gridItem3ToJson(List<GridItem3> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GridItem3 {
    GridItem3({
        this.id,
        this.title,
        this.bodyHtml,
        this.vendor,
        this.productType,
        this.createdAt,
        this.handle,
        this.updatedAt,
        this.publishedAt,
        this.templateSuffix,
        this.publishedScope,
        this.tags,
        this.adminGraphqlApiId,
        this.variants,
        this.options,
        this.images,
        this.image,
        this.status,
    });

    int id;
    String title;
    String bodyHtml;
    Vendor vendor;
    ProductType productType;
    DateTime createdAt;
    String handle;
    DateTime updatedAt;
    DateTime publishedAt;
    String templateSuffix;
    PublishedScope publishedScope;
    Tags tags;
    String adminGraphqlApiId;
    List<Variant> variants;
    List<Option> options;
    List<Image> images;
    Image image;
    String status;

    factory GridItem3.fromJson(Map<String, dynamic> json) => GridItem3(
        id: json["id"],
        title: json["title"],
        bodyHtml: json["body_html"],
        vendor: vendorValues.map[json["vendor"]],
        productType: productTypeValues.map[json["product_type"]],
        createdAt: DateTime.parse(json["created_at"]),
        handle: json["handle"],
        updatedAt: DateTime.parse(json["updated_at"]),
        publishedAt: json["published_at"] == null ? null : DateTime.parse(json["published_at"]),
        templateSuffix: json["template_suffix"] == null ? null : json["template_suffix"],
        publishedScope: publishedScopeValues.map[json["published_scope"]],
        tags: tagsValues.map[json["tags"]],
        adminGraphqlApiId: json["admin_graphql_api_id"],
        variants: List<Variant>.from(json["variants"].map((x) => Variant.fromJson(x))),
        options: List<Option>.from(json["options"].map((x) => Option.fromJson(x))),
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        image: Image.fromJson(json["image"]),
        status: json["status"] == null ? null : json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "body_html": bodyHtml,
        "vendor": vendorValues.reverse[vendor],
        "product_type": productTypeValues.reverse[productType],
        "created_at": createdAt.toIso8601String(),
        "handle": handle,
        "updated_at": updatedAt.toIso8601String(),
        "published_at": publishedAt == null ? null : publishedAt.toIso8601String(),
        "template_suffix": templateSuffix == null ? null : templateSuffix,
        "published_scope": publishedScopeValues.reverse[publishedScope],
        "tags": tagsValues.reverse[tags],
        "admin_graphql_api_id": adminGraphqlApiId,
        "variants": List<dynamic>.from(variants.map((x) => x.toJson())),
        "options": List<dynamic>.from(options.map((x) => x.toJson())),
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "image": image.toJson(),
        "status": status == null ? null : status,
    };
}

class Image {
    Image({
        this.id,
        this.productId,
        this.position,
        this.createdAt,
        this.updatedAt,
        this.alt,
        this.width,
        this.height,
        this.src,
        this.variantIds,
        this.adminGraphqlApiId,
    });

    int id;
    int productId;
    int position;
    DateTime createdAt;
    DateTime updatedAt;
    dynamic alt;
    int width;
    int height;
    String src;
    List<int> variantIds;
    String adminGraphqlApiId;

    factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"],
        productId: json["product_id"],
        position: json["position"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        alt: json["alt"],
        width: json["width"],
        height: json["height"],
        src: json["src"],
        variantIds: List<int>.from(json["variant_ids"].map((x) => x)),
        adminGraphqlApiId: json["admin_graphql_api_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "position": position,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "alt": alt,
        "width": width,
        "height": height,
        "src": src,
        "variant_ids": List<dynamic>.from(variantIds.map((x) => x)),
        "admin_graphql_api_id": adminGraphqlApiId,
    };
}

class Option {
    Option({
        this.id,
        this.productId,
        this.name,
        this.position,
        this.values,
    });

    int id;
    int productId;
    Name name;
    int position;
    List<String> values;

    factory Option.fromJson(Map<String, dynamic> json) => Option(
        id: json["id"],
        productId: json["product_id"],
        name: nameValues.map[json["name"]],
        position: json["position"],
        values: List<String>.from(json["values"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "name": nameValues.reverse[name],
        "position": position,
        "values": List<dynamic>.from(values.map((x) => x)),
    };
}

enum Name { COLOR, SHIPS_FROM, EMITTING_COLOR, WATTAGE, TITLE, FRAME_COLOR, SIZE, BUNDLE }

final nameValues = EnumValues({
    "Bundle": Name.BUNDLE,
    "Color": Name.COLOR,
    "Emitting Color": Name.EMITTING_COLOR,
    "Frame Color": Name.FRAME_COLOR,
    "Ships From": Name.SHIPS_FROM,
    "Size": Name.SIZE,
    "Title": Name.TITLE,
    "Wattage": Name.WATTAGE
});

enum ProductType { EMPTY, MOBILE, PC }

final productTypeValues = EnumValues({
    "": ProductType.EMPTY,
    "Mobile": ProductType.MOBILE,
    "PC": ProductType.PC
});

enum PublishedScope { WEB }

final publishedScopeValues = EnumValues({
    "web": PublishedScope.WEB
});

enum Tags { EMPTY, MOTHERBOARD }

final tagsValues = EnumValues({
    "": Tags.EMPTY,
    "motherboard": Tags.MOTHERBOARD
});

class Variant {
    Variant({
        this.id,
        this.productId,
        this.title,
        this.price,
        this.sku,
        this.position,
        this.inventoryPolicy,
        this.compareAtPrice,
        this.fulfillmentService,
        this.inventoryManagement,
        this.option1,
        this.option2,
        this.option3,
        this.createdAt,
        this.updatedAt,
        this.taxable,
        this.barcode,
        this.grams,
        this.imageId,
        this.weight,
        this.weightUnit,
        this.inventoryItemId,
        this.inventoryQuantity,
        this.oldInventoryQuantity,
        this.requiresShipping,
        this.adminGraphqlApiId,
    });

    int id;
    int productId;
    String title;
    String price;
    String sku;
    int position;
    InventoryPolicy inventoryPolicy;
    String compareAtPrice;
    FulfillmentService fulfillmentService;
    InventoryManagement inventoryManagement;
    String option1;
    String option2;
    Option3 option3;
    DateTime createdAt;
    DateTime updatedAt;
    bool taxable;
    String barcode;
    int grams;
    int imageId;
    int weight;
    WeightUnit weightUnit;
    int inventoryItemId;
    int inventoryQuantity;
    int oldInventoryQuantity;
    bool requiresShipping;
    String adminGraphqlApiId;

    factory Variant.fromJson(Map<String, dynamic> json) => Variant(
        id: json["id"],
        productId: json["product_id"],
        title: json["title"],
        price: json["price"],
        sku: json["sku"],
        position: json["position"],
        inventoryPolicy: inventoryPolicyValues.map[json["inventory_policy"]],
        compareAtPrice: json["compare_at_price"] == null ? null : json["compare_at_price"],
        fulfillmentService: fulfillmentServiceValues.map[json["fulfillment_service"]],
        inventoryManagement: inventoryManagementValues.map[json["inventory_management"]],
        option1: json["option1"],
        option2: json["option2"] == null ? null : json["option2"],
        option3: json["option3"] == null ? null : option3Values.map[json["option3"]],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        taxable: json["taxable"],
        barcode: json["barcode"] == null ? null : json["barcode"],
        grams: json["grams"],
        imageId: json["image_id"] == null ? null : json["image_id"],
        weight: json["weight"],
        weightUnit: weightUnitValues.map[json["weight_unit"]],
        inventoryItemId: json["inventory_item_id"],
        inventoryQuantity: json["inventory_quantity"],
        oldInventoryQuantity: json["old_inventory_quantity"],
        requiresShipping: json["requires_shipping"],
        adminGraphqlApiId: json["admin_graphql_api_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "title": title,
        "price": price,
        "sku": sku,
        "position": position,
        "inventory_policy": inventoryPolicyValues.reverse[inventoryPolicy],
        "compare_at_price": compareAtPrice == null ? null : compareAtPrice,
        "fulfillment_service": fulfillmentServiceValues.reverse[fulfillmentService],
        "inventory_management": inventoryManagementValues.reverse[inventoryManagement],
        "option1": option1,
        "option2": option2 == null ? null : option2,
        "option3": option3 == null ? null : option3Values.reverse[option3],
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "taxable": taxable,
        "barcode": barcode == null ? null : barcode,
        "grams": grams,
        "image_id": imageId == null ? null : imageId,
        "weight": weight,
        "weight_unit": weightUnitValues.reverse[weightUnit],
        "inventory_item_id": inventoryItemId,
        "inventory_quantity": inventoryQuantity,
        "old_inventory_quantity": oldInventoryQuantity,
        "requires_shipping": requiresShipping,
        "admin_graphql_api_id": adminGraphqlApiId,
    };
}

enum FulfillmentService { OBERLO, MANUAL }

final fulfillmentServiceValues = EnumValues({
    "manual": FulfillmentService.MANUAL,
    "oberlo": FulfillmentService.OBERLO
});

enum InventoryManagement { SHOPIFY }

final inventoryManagementValues = EnumValues({
    "shopify": InventoryManagement.SHOPIFY
});

enum InventoryPolicy { DENY }

final inventoryPolicyValues = EnumValues({
    "deny": InventoryPolicy.DENY
});

enum Option3 { THE_2_METER_66_FT, THE_3_METER_99_FT, THE_5_METER_165_FT, THE_10_METER_33_FT }

final option3Values = EnumValues({
    "10Meter 33FT": Option3.THE_10_METER_33_FT,
    "2Meter 6.6FT": Option3.THE_2_METER_66_FT,
    "3Meter 9.9FT": Option3.THE_3_METER_99_FT,
    "5Meter 16.5FT": Option3.THE_5_METER_165_FT
});

enum WeightUnit { LB }

final weightUnitValues = EnumValues({
    "lb": WeightUnit.LB
});

enum Vendor { GAMETROPICA_COM }

final vendorValues = EnumValues({
    "gametropica.com": Vendor.GAMETROPICA_COM
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}

