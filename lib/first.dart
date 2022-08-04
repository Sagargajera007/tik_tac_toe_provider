import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class First extends StatelessWidget {
  const First({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TIK TAC TOE"),
      ),
      body: Column(
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
      ),
    );
  }

  Widget t(int i) {
    return Expanded(
        child: InkWell(
      onTap: () {
        if(l[i]="" && w=0){

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

class Model extends ChangeNotifier {
  List<String>l = List.filled(9, "");
  String p1="O",p2="X";
  int cnt=0;
  String msg = "Game is Running...";
  int w=0;


}
