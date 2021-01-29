import 'package:flutter/material.dart';
import 'package:treva_shop_flutter/UI/HomeUIComponent/FlashSale.dart';

class Brand {
  final String id;
  final String name;
  final String img;
  final String desc;
  final items item;

  const Brand({
    this.img,
    this.id,
    this.name,
    this.desc,
    this.item,
  });
}

class items {
  final String itemName;
  final String itemPrice;
  final String itemRatting;
  final String itemSale;
  final String itemId;
  final String itemImg;

  const items(
      {this.itemName,
      this.itemPrice,
      this.itemRatting,
      this.itemSale,
      this.itemId,
      this.itemImg});
}

List<Brand> brandData = [
  const Brand(
      name: "Playstation",
      id: "1",
      img: "assets/imgBrand/pslogo.jpg",
      desc:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
      item: items(
          itemImg: "assets/imgBrand/pslogo.jpg",
          itemId: "1",
          itemName: "PS Stuff",
          itemPrice: "\$ 100",
          itemRatting: "4.5",
          itemSale: "200 Sale")),

  const Brand(
      name: "Xbox",
      id: "2",
      img: "assets/imgBrand/whitexboxcontroller.jpg",
      desc:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
      item: items(
          itemImg: "assets/imgBrand/whitexboxcontroller.jpg",
          itemId: "1",
          itemName: "Xbox Stuff",
          itemPrice: "\$ 1500",
          itemRatting: "4.5",
          itemSale: "250 Sale")),
  const Brand(
      name: "PC",
      id: "3",
      img: "assets/imgBrand/pc.jpg",
      desc:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
      item: items(
          itemImg: "assets/imgBrand/pc.jpg",
          itemId: "1",
          itemName: "PC stuff",
          itemPrice: "\$ 250",
          itemRatting: "4.5",
          itemSale: "200 Sale")),
  const Brand(
    name: 'Mobile',
    id: '4',
    img: 'assets/imgBrand/MB.jpg',
    desc: 'Mobile Gaming',
    item: items(),
  ),
  const Brand(
      name: "Accessories",
      id: "5",
      img: "assets/imgBrand/accessories.jpg",
      desc:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
      item: items(
          itemImg: "assets/imgBrand/accessories.jpg",
          itemId: "1",
          itemName: "Accessories",
          itemPrice: "\$ 100",
          itemRatting: "4.5",
          itemSale: "200 Sale")),
  // const Brand(
  //     name: "Samsung Tech",
  //     id: "6",
  //     img: "assets/imgBrand/samsungHeader.png",
  //     desc:
  //     "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
  //     item: items(
  //         itemImg: "assets/imgPromo/imgPromo2.jpg",
  //         itemId: "1",
  //         itemName: "Samsung Galaxy S8+ 256 GB",
  //         itemPrice: "\$ 800",
  //         itemRatting: "4.5",
  //         itemSale: "200 Sale")),
  // const Brand(
  //     name: "Sony Tech",
  //     id: "7",
  //     img: "assets/imgBrand/sonyHeader.png",
  //     desc:
  //     "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
  //     item: items(
  //         itemImg: "assets/imgPromo/imgPromo8.jpg",
  //         itemId: "1",
  //         itemName: "SmartWarch Sonny",
  //         itemPrice: "\$ 100",
  //         itemRatting: "4.5",
  //         itemSale: "200 Sale")),
];
