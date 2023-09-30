import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_storage/firebase_storage.dart';

import 'package:mybodystuff/Model/productModel.dart';
import 'package:mybodystuff/Singletones/app_data.dart';
import 'package:mybodystuff/Utils/utils.dart';
import 'package:mybodystuff/constants.dart';

class FirebaseRepo {
  //make it singleTone class
  static final FirebaseRepo _singleton = FirebaseRepo._internal();
  factory FirebaseRepo() {
    return _singleton;
  }
  FirebaseRepo._internal();
  //code starts from here

  // final FirebaseStorage _storage = FirebaseStorage.instance;
  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final _productCollection = FirebaseFirestore.instance.collection('products');
  final _youtubeVideoCollection =
      FirebaseFirestore.instance.collection('youtube_video');

  Future<String> getYoutubeVideoLink() async {
    try {
      var res = await _youtubeVideoCollection.get();
      appData.title = res.docs.first.data()['title'];
      appData.body = res.docs.first.data()['body'];
      return res.docs.first.data()['url'] ?? '';
    } on FirebaseException catch (e) {
      kLog(e.code);
      return '';
    }
  }

  Future<List<ProductModel>> getProductList() async {
    try {
      List<ProductModel> list = [];
      String id = await getDeviceId();
      var res = await _productCollection.doc(id).get();
      if (res.exists) {
        if (res.data()?['productList'] != null) {
          res.data()!['productList'].forEach((json) {
            list.add(ProductModel.fromJson(json));
          });
        }
      }
      return list;
    } on FirebaseException catch (e) {
      kLog(e.code);
      return [];
    }
  }

  Future<bool> saveProduct(ProductModel model) async {
    try {
      String id = await getDeviceId();
      model.deviceId = id;
      Map<String, dynamic> paylaod = {
        'productList': FieldValue.arrayUnion([model.toJson()]),
      };
      var res = await _productCollection.doc(id).get();
      if (res.exists) {
        await _productCollection.doc(id).update(paylaod);
      } else {
        await _productCollection.doc(id).set(paylaod);
      }
      return true;
    } on FirebaseException catch (e) {
      kLog(e.code);
      return false;
    }
  }
}
