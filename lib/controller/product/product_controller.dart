import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:dbirr/controller/my_controller.dart';

import 'package:dbirr/models/product.dart';
import 'package:dbirr/views/product/products.dart';

class ProductController extends MyController {
  List<Product> products = [];
  DataTableSource? data;

  ProductController();

  @override
  void onInit() {
    super.onInit();

    Product.dummyList.then((value) {
      products = value;
      data = MyData(products);
      update();
    });
  }

  void goToCreateProduct() {
    Get.toNamed('/apps/ecommerce/add_product');
  }
}
