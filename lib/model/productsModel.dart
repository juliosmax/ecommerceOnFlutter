import 'package:cloud_firestore/cloud_firestore.dart';

class ProductsModel {

   // CONSTANTES
    static const String BRAND= 'brand';
    static const String CATEGORY= 'category';
    static const String NAME = 'name';
    static const String ID= 'id';
    static const String IMAGE_URL = 'imageUrl';
    static const String PRICE= 'price';
    static const String COLORS= 'colors';

    //private variables
    String _brand;
    String _category;
    String _name;
    String _id;
     double _price;
    List _colors;
    String _imageUrl;

    //getters
    String get brand => _brand;
    String get category => _category;
    String get name => _name;
    String get id => _id;
    double get price => _price;
    List get colors => _colors;
    String get imageUrl => _imageUrl;


    ProductsModel.fromSnapshot(DocumentSnapshot snapshot){
      _brand = snapshot.data[BRAND];
      _category=snapshot.data[CATEGORY];
      _name= snapshot.data[NAME];
      _id= snapshot.data[ID];
      _imageUrl=snapshot.data[IMAGE_URL];
      _price=snapshot.data[PRICE];
      _colors=snapshot.data[COLORS];
    }

}