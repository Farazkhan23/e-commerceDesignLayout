import 'package:app_layout/Cart.dart';
import 'package:app_layout/Combo.dart';
import 'package:app_layout/Models/CartModel.dart';
import 'package:app_layout/Solo.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SafeArea(child: MyHomePage()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  TabController _controller;
  List<CartModel> cart = [];
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  getClickedItem(CartModel newItem) {
    setState(() {
      cart.add(newItem);
    });
  }

  @override
  void initState() {
    _controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Cart(cartItems: cart);
            }));
          },
          label: Text("Cart (${cart.length})"),
          icon: Icon(Icons.shopping_cart),
        ),
        body: CustomScrollView(slivers: <Widget>[
          SliverAppBar(
            elevation: 5,
            floating: false,
            pinned: true,
            expandedHeight: 200,
            title: Text("Categories"),
            centerTitle: true,
            bottom: TabBar(controller: _controller, tabs: [
              Tab(
                text: "Solo",
              ),
              Tab(
                text: "Combo",
              )
            ]),
          ),
          SliverFillRemaining(
            hasScrollBody: true,
            fillOverscroll: false,
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: TabBarView(
                controller: _controller,
                children: <Widget>[
                  Solo(
                    onClick: getClickedItem,
                  ),
                  Combo(
                    onClick: getClickedItem,
                  )
                ],
              ),
            ),
          )
        ]));
  }
}
