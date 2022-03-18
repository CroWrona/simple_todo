import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo/item.dart';
import 'package:todo/model.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Model> todo = [];
  TextEditingController todoController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Padding(padding:const EdgeInsets.symmetric(horizontal: 20,),
          child: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(children: todo.map((item) => Item(id: item.id,title: item.title,)).toList(),)
                    ),
                  ),
                ],
              ),
              Container(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.only(bottom: 20,),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),),
                  child: Center(
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: todoController,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              todo.add(Model(id: todo.length+1,title: todoController.text));
                              todoController.text = "";
                            });
                          },
                          child: const Icon(
                            Icons.add,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}