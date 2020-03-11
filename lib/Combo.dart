import 'package:flutter/material.dart';

class Combo extends StatefulWidget {
  @override
  _ComboState createState() => _ComboState();
}

class _ComboState extends State<Combo> {
  // TODO: Make a model and try to build the list lazily
  List<Map<dynamic, dynamic>> comboList = [
    {
      'ComboName': ["Mango", "Orange", "Apple"],
      'ComboPrice': 150
    },
    {
      'ComboName': ["Mango", "Orange", "Apple"],
      'ComboPrice': 150
    },
    {
      'ComboName': ["Mango", "Orange", "Apple"],
      'ComboPrice': 150
    },
    {
      'ComboName': ["Mango", "Orange", "Apple","Pineapple"],
      'ComboPrice': 150
    },
  ];

  Text getComboName(List<String> combos) {
    String comboName = '';
    for (var item in combos) {
      comboName += item;
      if (combos.indexOf(item) != combos.length - 1) comboName += " + ";
    }
    return Text(comboName,style:TextStyle(fontSize:22,color:Colors.black),);
  }

  Widget getList(context, index) {
    var currentCategory = comboList[index];
    return Container(
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
            child: getComboName(currentCategory['ComboName']),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Rs.${currentCategory['ComboPrice']}',style:TextStyle(color:Colors.blueGrey,fontSize:20)),
          )
        ],
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
