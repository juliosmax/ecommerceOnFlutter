import 'package:demoecommerce/components/Products.dart';
import 'package:demoecommerce/pages/login.dart';
import 'package:demoecommerce/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:demoecommerce/pages/cart.dart';
import 'package:provider/provider.dart'; 
import './commons/common.dart';


//mis propios imports
import 'package:demoecommerce/components/horizontal_listview.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  TextEditingController _searchTextController= TextEditingController();
  @override
  Widget build(BuildContext context) {
    final user= Provider.of<UserProvider>(context);
    Widget image_carrousel = new Container(
      height: 200.0,
      child: new Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('images/c1.jpg'),
          AssetImage('images/m1.jpeg'),
          AssetImage('images/m2.jpg'),
          AssetImage('images/w1.jpeg'),
          AssetImage('images/w3.jpeg'),
          AssetImage('images/w4.jpeg'),
        ],
        autoplay: true,
        dotSize: 4.0,
        indicatorBgPadding: 2.0,
        dotBgColor: Colors.transparent,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
      ),
    );
    return Scaffold(
      appBar: new AppBar(
        iconTheme: IconThemeData(color: deepOrange),
        elevation: 0.0,
        backgroundColor: white,
        title: Material(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.grey[50],
                              elevation: 0.0,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 0.0),
                                child: TextFormField(
                                  controller: _searchTextController,
                                  decoration: InputDecoration(
                                    icon: Icon(Icons.search),
                                    border: InputBorder.none,
                                    hintText: "Search",
                                    ),
                                  
                                ),
                              ),
                            ),
        actions: <Widget>[
          new IconButton(
              icon: Icon(Icons.search, color: deepOrange), onPressed: () {}),
          new IconButton(
              icon: Icon(Icons.shopping_cart, color: deepOrange),
              onPressed: () { 
                 Navigator.push(context, MaterialPageRoute(builder: (context)=> new Cart()));
              })
        ],
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: Text('JuliosMax'),
              accountEmail: Text('julsmaxX@dart.com'),
              currentAccountPicture: GestureDetector(
                  child: new CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: Icon(Icons.person, color: Colors.white))),
              decoration: new BoxDecoration(color: Colors.red),
            ),
            //body
            InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text('Home Page'),
                  leading: Icon(Icons.home,color: Colors.red),
                )),
            InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text('My account'),
                  leading: Icon(Icons.person,color: Colors.red),
                )),
            InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text('My orders'),
                  leading: Icon(Icons.shopping_basket,color: Colors.red),
                )),
            InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Cart()));
                },
                child: ListTile(
                  title: Text('Shopping cart'),
                  leading: Icon(Icons.shopping_cart, color: Colors.red,),
                )),
            InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text('Favourite'),
                  leading: Icon(Icons.favorite,color: Colors.red),
                )),
            Divider(),

            InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text('Settings'),
                  leading: Icon(Icons.settings),
                )),
            InkWell(
                onTap: () {
                  user.signOut();
                  changeScreenReplacemente(context, Login());
                },
                child: ListTile(
                  title: Text('Log out'),
                  leading: Icon(Icons.transit_enterexit),
                )),
          ],
        ),
      ),
      body: new Column(children: <Widget>[
        // AQUI COMIENZA LAS IMAGENES DEL CARROUSEL
        image_carrousel,
        new Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container( alignment: Alignment.centerLeft,
                           child: Text('Categories'),
        ),),
        //HORIZONTAL LIST VIEW BEGINS HERE
        HorizontalList(),
        new Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container( alignment: Alignment.centerLeft,
                           child: Text('New Products'),
        )),
       
       //PRODUCTS GRID VIEW 
          
          Flexible(child: Products()),
        
      ]),
    );
  }
}
