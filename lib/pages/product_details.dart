import 'package:demoecommerce/home.dart';
import "package:flutter/material.dart";
import "package:demoecommerce/main.dart";

class ProductDetails extends StatefulWidget {
  final product_detail_picture;
  final product_detail_price;
  final product_detail_old_price;
  final product_detail_name;

  ProductDetails({
    this.product_detail_picture,
    this.product_detail_price,
    this.product_detail_name,
    this.product_detail_old_price,
  });

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        backgroundColor: Colors.red,
        title: InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => new HomePage()));
            },
            child: Text('FashApp')),
        actions: <Widget>[
          new IconButton(
              icon: Icon(Icons.search, color: Colors.white), onPressed: () {}),
        ],
      ),
      body: new ListView(
        children: <Widget>[
          new Container(
            height: 300.00,
            child: GridTile(
              child: Container(
                color: Colors.white,
                child: Image.asset(widget.product_detail_picture),
              ),
              footer: new Container(
                color: Colors.white70,
                child: ListTile(
                    leading: new Text(
                      widget.product_detail_name,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    title: new Row(children: <Widget>[
                      Expanded(
                        child: new Text(
                          "${widget.product_detail_old_price}",
                          style: TextStyle(
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough),
                        ),
                      ),
                      Expanded(
                        child: new Text(
                          "\$${widget.product_detail_price}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.red),
                        ),
                      ),
                    ])),
              ),
            ),
          ),

          //=======THE FIRST BUTTON=======
          Row(children: <Widget>[ 
            //======THE SIZE BUTTON=======
            Expanded(
              child: MaterialButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return new AlertDialog(
                          title: new Text("Size"),
                          content: new Text("Choose the new size"),
                          actions: <Widget>[
                            new MaterialButton(
                              onPressed: () {
                                Navigator.of(context).pop(context);
                              },
                              child: new Text(
                                "close",
                                style: TextStyle(color: Colors.blue),
                              ),
                            )
                          ],
                        );
                      });
                },
                color: Colors.white,
                textColor: Colors.grey,
                elevation: 0.2,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: new Text("Size"),
                    ),
                    Expanded(
                      child: new Icon(Icons.arrow_drop_down),
                    ),
                  ],
                ),
              ),
            ),

            //======THE COLOR BUTTON=======
            Expanded(
              child: MaterialButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return new AlertDialog(
                          title: new Text("Colors"),
                          content: new Text("Choose the new color"),
                          actions: <Widget>[
                            new MaterialButton(
                              onPressed: () {
                                Navigator.of(context).pop(context);
                              },
                              child: new Text(
                                "close",
                                style: TextStyle(color: Colors.blue),
                              ),
                            )
                          ],
                        );
                      });
                },
                color: Colors.white,
                textColor: Colors.grey,
                elevation: 0.2,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: new Text("Color"),
                    ),
                    Expanded(
                      child: new Icon(Icons.arrow_drop_down),
                    ),
                  ],
                ),
              ),
            ),

            //======THE QUANTITY BUTTON=======
            Expanded(
              child: MaterialButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return new AlertDialog(
                          title: new Text("Quantity"),
                          content: new Text("Choose the Quantity"),
                          actions: <Widget>[
                            new MaterialButton(
                              onPressed: () {
                                Navigator.of(context).pop(context);
                              },
                              child: new Text(
                                "close",
                                style: TextStyle(color: Colors.blue),
                              ),
                            )
                          ],
                        );
                      });
                },
                color: Colors.white,
                textColor: Colors.grey,
                elevation: 0.2,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: new Text("Qty"),
                    ),
                    Expanded(
                      child: new Icon(Icons.arrow_drop_down),
                    ),
                  ],
                ),
              ),
            ),
          ]),
          //======THE SECOND BUTTON======
          Row(
            children: <Widget>[
              //======THE SIZE BUTTON=======
              Expanded(
                child: MaterialButton(
                    onPressed: () {},
                    color: Colors.red,
                    textColor: Colors.white,
                    elevation: 0.2,
                    child: new Text("Buy Now!")),
              ),
              new IconButton(
                  icon: Icon(Icons.add_shopping_cart),
                  color: Colors.red,
                  onPressed: null),
              new IconButton(
                  icon: Icon(Icons.favorite_border),
                  color: Colors.red,
                  onPressed: null),
            ],
          ),
          Divider(),
          new ListTile(
              title: new Text("Product Details"),
              subtitle: new Text(
                  "Es un producto no abtruso, genial , para quitarse lo desmazalado, porque es inherente a lo actual , a la epoca moderna , es intrinseco a su modo de ser, el no abdicar , el no claudicar es sinonimo de esperanza que persevera a travez del suspiro que provoca tu pensar en mi pensar, dia y noche transcurren y discurren , si tienes desesperacion usala como inspiracion")
                  ),
          new Row(children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 5, 5, 5),
              child: new Text("Product name ",
                  style: TextStyle(color: Colors.grey)),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: new Text(widget.product_detail_name),
            )
          ]),
          new Row(children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 5, 5, 5),
              child: new Text("Product brand ",
                  style: TextStyle(color: Colors.grey)),
            ),
            // REMEMBER TO CREATE A PRODUCT BRAND
            Padding(
              padding: const EdgeInsets.all(5),
              child: new Text("Brand XX"),
            )
          ]),
          new Row(children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 5, 5, 5),
              child: new Text("Product conditions ",
                  style: TextStyle(color: Colors.grey)),
            ),
            // REMEMBER TO CREATE A CONDITION
            Padding(
              padding: const EdgeInsets.all(5),
              child: new Text("New"),
            )
          ]
          ),
          Divider(),
         Padding(padding: const EdgeInsets.all(20.0),
                 child: Text("Productos similares") )
          ,
          Container(
            height: 360.0,
            child: Similar_products(),
          )
        ],
      ),
    );
  }
}

class Similar_products extends StatefulWidget {
  @override
  _Similar_productsState createState() => _Similar_productsState();
}

class _Similar_productsState extends State<Similar_products> {
  var products_list = [
    {
      "name": "Blazer",
      "picture": "images/products/blazer1.jpeg",
      "old_price": 120.0,
      "price": 80.0,
    },
    {
      "name": "Purple F. shoes",
      "picture": "images/products/hills1.jpeg",
      "old_price": 120.0,
      "price": 80.0,
    },
    {
      "name": "Red F. shoes",
      "picture": "images/products/hills2.jpeg",
      "old_price": 120.0,
      "price": 80.0,
    },
    {
      "name": "Pink skirt",
      "picture": "images/products/skt2.jpeg",
      "old_price": 120.0,
      "price": 80.0,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: products_list.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Similar_Single_prod(
            prod_name: products_list[index]['name'],
            prod_picture: products_list[index]['picture'],
            prod_old_price: products_list[index]["old_price"],
            prod_price: products_list[index]["price"],
          );
        });
  }
}

class Similar_Single_prod extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_old_price;
  final prod_price;
  Similar_Single_prod({
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
          child: InkWell(
        onTap: () => Navigator.of(context).push(new MaterialPageRoute(
            builder: (context) => new ProductDetails(
                  product_detail_name: prod_name,
                  product_detail_old_price: prod_old_price,
                  product_detail_picture: prod_picture,
                  product_detail_price: prod_price,
                ))),
        child: GridTile(
          footer: Container(
              color: Colors.white70,
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: Text(prod_name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16))),
                  Text("\$${prod_price}",
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold))
                ],
              )),
          child: Image.asset(
            prod_picture,
            fit: BoxFit.cover,
          ),
        ),
      )),
    ));
  }
}
