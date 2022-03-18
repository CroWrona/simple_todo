import 'package:flutter/material.dart';

class Item extends StatefulWidget {
  final int id;
  final String title;
  Item({required this.id,required this.title});

  @override
  _ItemState createState() => _ItemState();
}

class _ItemState extends State<Item> {
  int Done = 0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          Done++;if(Done>2){Done=0;}
        });
      },
      child: Card(
        margin: const EdgeInsets.only(top: 10,),
        color: Done==0 ? Colors.white:Done==1 ? Colors.green : Colors.red,
        shape: RoundedRectangleBorder(
          borderRadius:BorderRadius.circular(15.0),
        ),
        elevation: 10,
        child: ListTile(
          textColor: Colors.black,
          title: Text(widget.title),
          trailing: Text('${widget.id}'),
        ),
      ),
    );
  }
}