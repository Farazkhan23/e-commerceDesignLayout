import 'package:app_layout/Models/CartModel.dart';
import 'package:app_layout/Models/ComboModel.dart';
import 'package:flutter/material.dart';

class Combo extends StatefulWidget {
   final Function onClick;
  Combo({this.onClick});
  @override
  _ComboState createState() => _ComboState();
}

class _ComboState extends State<Combo> {
  List<ComboModel> comboList = [
    ComboModel(itemID: "1444447424",comboName:["Mango", "Orange", "Apple"],price: 150.0 )
  ];

  String getComboName(List<String> combos) {
    String comboName = '';
    for (var item in combos) {
      comboName += item;
      if (combos.indexOf(item) != combos.length - 1) comboName += " + ";
    }
    return comboName;
  }

  Widget getList(context, index) {
    ComboModel currentCategory = comboList[index];
    return GestureDetector(
      onTap: (){
        widget.onClick(CartModel(itemID: currentCategory.itemID, itemName: getComboName(currentCategory.comboName), price: currentCategory.price));
      },
          child: Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(blurRadius: 2,color:Colors.grey,offset: Offset(0, 0))]
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(getComboName(currentCategory.comboName),style:TextStyle(fontSize:22,color:Colors.black),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Rs.${currentCategory.price}',style:TextStyle(color:Colors.blueGrey,fontSize:20)),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemBuilder: getList,
        itemCount: comboList.length,
      ),
    );
  }
}
