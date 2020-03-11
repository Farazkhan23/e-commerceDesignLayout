import 'package:flutter/material.dart';

class Solo extends StatefulWidget {
  @override
  _SoloState createState() => _SoloState();
}

class _SoloState extends State<Solo> {
  // TODO: Make a model and try to build the list lazily
  List<Map<dynamic, dynamic>> soloItemList = [
    {
      'CategoryName': "Fruits",
      'ItemList': [
        {"ItemName": "Apple", "Price": 50},
        {"ItemName": "Banana", "Price": 120},
        {"ItemName": "Mango", "Price": 10},
      ]
    },
    {
      'CategoryName': "Vegetables",
      'ItemList': [
        {"ItemName": "Spinach", "Price": 50},
        {"ItemName": "Tomato", "Price": 120},
        {"ItemName": "Potato", "Price": 10},
      ]
    },
    {
      'CategoryName': "Chicken",
      'ItemList': [
        {"ItemName": "Tandoori", "Price": 50},
        {"ItemName": "Hydrabadi", "Price": 120},
      ]
    },
    {
      'CategoryName': "Chicken",
      'ItemList': [
        {"ItemName": "Tandoori", "Price": 50},
        {"ItemName": "Hydrabadi", "Price": 120},
      ]
    },
    {
      'CategoryName': "Chicken",
      'ItemList': [
        {"ItemName": "Tandoori", "Price": 50},
        {"ItemName": "Hydrabadi", "Price": 120},
      ]
    }
  ];

  List<Widget> getItems(List itemList) {
    List<Widget> items = [];

    for (var item in itemList) {
      items.add(Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: ListTile(
            title: Text(item['ItemName']),
            trailing: Text('${item['Price']}'),
          )));
    }
    return items;
  }

  Widget getList(context, index) {
    var currentCategory = soloItemList[index];
    return ExpansionTile(
        title: Text(currentCategory['CategoryName']),
        children: getItems(currentCategory['ItemList']));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemBuilder: getList,
        itemCount: soloItemList.length,
      ),
    );
  }
}
