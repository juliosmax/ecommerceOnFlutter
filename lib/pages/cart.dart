import 'package:flutter/material.dart';
import 'package:demoecommerce/components/cart_products.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    //======APPBAR============
      appBar: new AppBar(
         elevation: 0.1,
         backgroundColor: Colors.red,
         title: new Text("Cart"),
         
         actions: <Widget>[
           new IconButton(
               icon: Icon(Icons.search, color: Colors.red,),
               onPressed: (){},
           ),
           new IconButton(
               icon: Icon(Icons.shopping_cart, color: Colors.white),
               onPressed: (){},
           )
         ],
      ),
      
       //====BODY============
        body: Cart_products(),


       //==BARRA DE NAVEGACION INFERIOR
      bottomNavigationBar: new Container(
                  color: Colors.white,
                  child: Row(children: <Widget>[
                           Expanded(child: ListTile(
                                 title: Text("Total"),
                                 subtitle: Text("\$230"),
                           )
                           ),
                           Expanded(child:  new MaterialButton(color: Colors.red,
                                            onPressed: (){}, 
                                            child: Text("Check Out",
                                                         style: TextStyle(color: Colors.white),),
                                                         ),
                           ),
                  ],)
      ),
    );
  }
}