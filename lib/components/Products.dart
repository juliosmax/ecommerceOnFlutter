import 'package:demoecommerce/commons/common.dart';
import "package:flutter/material.dart";
import "package:demoecommerce/pages/product_details.dart";

  class Products extends StatefulWidget {
    @override
    _ProductsState createState() => _ProductsState();
  }
  
  class _ProductsState extends State<Products> {
    var products_list = [ { 
        "name":"Blazer",
        "picture":"images/products/blazer1.jpeg",
        "old_price":120.0,
        "price":80.0,
    },
    {
        "name":"Female Blazer",
        "picture":"images/products/blazer2.jpeg",
        "old_price":130.0,
        "price":90.0,
    },
    {
        "name":"Red Dress",
        "picture":"images/products/dress1.jpeg",
        "old_price":100.0,
        "price":90.0,
    },
    {
        "name":"Black Dress",
        "picture":"images/products/dress2.jpeg",
        "old_price":101.0,
        "price":81.0,
    },
    {
        "name":"Purple F. shoes",
        "picture":"images/products/hills1.jpeg",
        "old_price":120.0,
        "price":80.0,
    },
    {
        "name":"Red F. shoes",
        "picture":"images/products/hills2.jpeg",
        "old_price":120.0,
        "price":80.0,
    },
    {
        "name":"Black pants",
        "picture":"images/products/pants1.jpg",
        "old_price":50.0,
        "price":40.0,
    },
    {
        "name":"Grey pants",
        "picture":"images/products/pants2.jpeg",
        "old_price":60.0,
        "price":50.0,
    },
    {
        "name":"Grey shoes",
        "picture":"images/products/shoe1.jpg",
        "old_price":200.0,
        "price":100.0,
    },
    {
        "name":"sky blue skirt",
        "picture":"images/products/skt1.jpeg",
        "old_price":40.0,
        "price":30.0,
    },
    {
        "name":"Pink skirt",
        "picture":"images/products/skt2.jpeg",
        "old_price":120.0,
        "price":80.0,
    },
    ];
    @override
    Widget build(BuildContext context) {
      return GridView.builder(  itemCount: products_list.length,
       gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), 
       itemBuilder: (BuildContext context, int index)
       { 
         return Padding(padding: const EdgeInsets.all(8.0),
           child: Single_prod(
           prod_name: products_list[index]['name'],
           prod_picture: products_list[index]['picture'],  
           prod_old_price: products_list[index]["old_price"],
           prod_price: products_list[index]["price"],
         ));
         }
       );
    }
  }

  class Single_prod extends StatelessWidget {
    final prod_name;
    final prod_picture;
    final prod_old_price;
    final prod_price;
Single_prod({
  this.prod_name,
  this.prod_picture,
  this.prod_old_price,
  this.prod_price,
});

    @override
    Widget build(BuildContext context) {
      return Card(
        child: Hero(
          tag: prod_name,
          child: Material(
            child: InkWell(onTap: ()=> Navigator.of(context).push(new MaterialPageRoute(builder: (context)=>new ProductDetails(
                        product_detail_name: prod_name,
                        product_detail_old_price: prod_old_price,
                        product_detail_picture: prod_picture,
                        product_detail_price: prod_price,
            ))),
                   child: GridTile(
                     footer: Container(
                       color: Colors.white70,
                       child: Row(children: <Widget>[
                                  Expanded(child: Text(prod_name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
                                  Text("\$${prod_price}", style: TextStyle(color: deepOrange, fontWeight: FontWeight.bold, fontSize: 18))    
                              ],)
                     ),
                     child: Image.asset(prod_picture, fit: BoxFit.cover,),
                   ),
                   )
          ),
        )
      );
    }
  }