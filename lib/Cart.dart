import 'package:app_layout/Models/CartModel.dart';
import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  final List<CartModel> cartItems;
  Cart({@required this.cartItems});
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  double totalPrice = 0.0;
  getPrice() {
    for (var item in widget.cartItems) {
      setState(() {
        totalPrice += item.price;
      });
    }
  }

  @override
  void initState() {
    getPrice();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Cart"),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                  itemCount: widget.cartItems.length,
                  itemBuilder: (context, index) {
                    CartModel currentItem = widget.cartItems[index];
                    return ListTile(
                      title: Text(currentItem.itemName),
                      trailing: Text(currentItem.price.toString()),
                    );
                  },
                ),
              ),
              Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.red),
                padding: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      "Total : Rs $totalPrice",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
