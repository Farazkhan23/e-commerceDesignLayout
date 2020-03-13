import 'package:app_layout/Models/CartModel.dart';
import 'package:app_layout/Models/SoloModel.dart';
import 'package:flutter/material.dart';

class Solo extends StatefulWidget {
  final Function onClick;
  Solo({this.onClick});
  @override
  _SoloState createState() => _SoloState();
}

class _SoloState extends State<Solo> {
  List<SoloModel> soloItemList = [
    SoloModel(categoryName: "Fruits", itemList: [
      {"ItemName": "Apple", "Price": 50.0,'itemID': "1254",},
      {"ItemName": "Banana", "Price": 120.0,'itemID': "12544",},
      {"ItemName": "Mango", "Price": 10.0,'itemID': "1254242",},
    ]),
    SoloModel(categoryName: "Vegetables", itemList: [
      {"ItemName": "Bringal", "Price": 50.0,'itemID': "125412414",},
      {"ItemName": "Potato", "Price": 120.0,'itemID': "125441",},
      {"ItemName": "Tomato", "Price": 10.0,'itemID': "14",},
    ]),
  ];

  List<Widget> getItems(SoloModel item) {
    List<Widget> itemsWidget = [];

    for (var items in item.itemList) {
      itemsWidget.add(GestureDetector(
        onTap: () {
          widget.onClick(CartModel(itemID: items['itemID'], itemName: items['ItemName'], price: items['Price']));
        },
        child: Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: ListTile(
              title: Text(items['ItemName']),
              trailing: Text('${items['Price']}'),
            )),
      ));
    }
    return itemsWidget;
  }

  Widget getList(context, index) {
    SoloModel currentCategory = soloItemList[index];
    return ExpansionTile(
        title: Text(currentCategory.categoryName),
        children: getItems(currentCategory));
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
