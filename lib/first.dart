import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class First extends StatelessWidget {
  const First({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TIK TAC TOE"),
      ),
      body: ChangeNotifierProvider(create: (context) => Model(),child: Consumer<Model>(builder: (context, value, child) {
        return Column(
          children: [
            Expanded(
                child: Row(
                  children: [t(0), t(1), t(2)],
                )),
            Expanded(
                child: Row(
                  children: [t(3), t(4), t(5)],
                )),

            Expanded(
                child: Row(
                  children: [t(6), t(7), t(8)],
                )),
          ],
        );
      },),)
    );
  }

}

class Model extends ChangeNotifier {
  List<String>l = List.filled(9, "");
  String p1="O",p2="X";
  int cnt=0;
  String msg = "Game is Running...";
  int w=0;

  void t(int i) {
    Expanded(
        child: InkWell(
          onTap: () {
            if(l[i]=="" && w==0){

            }
          },
          child: Container(
            color: Colors.teal,
            margin: EdgeInsets.all(10),
            child: Center(
              child: Text(
                l[i],
                style: TextStyle(fontSize: 100,color: Colors.white),
              ),
            ),
          ),
        ));
  }

}
