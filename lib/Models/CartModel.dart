import 'package:flutter/material.dart';

class CartModel{
  String itemName,itemID;
  double price;

  CartModel({@required this.itemID,@required this.itemName,@required this.price});
}