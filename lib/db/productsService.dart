import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/productsModel.dart';
import 'dart:async';

class ProductsService {
  Firestore _firestore= Firestore.instance;
  String collection= 'products';

  Future<List<ProductsModel>> getFeaturedProducts()=>
     _firestore.collection(collection).where('category', isEqualTo: 'men').getDocuments().then((snap){
        List<ProductsModel> productosList =[];
        snap.documents.map((snapshot) => productosList.add(ProductsModel.fromSnapshot(snapshot)));
        return productosList;
      });

  
  


 

}