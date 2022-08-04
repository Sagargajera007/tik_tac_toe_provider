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
            Container(
              height: 50,
              child: Text(
                value.msg,
                style: TextStyle(fontSize: 40,color: Colors.black),
              ),
            ),
            Expanded(
                child: Row(
                  children: [value.t(0), value.t(1), value.t(2)],
                )),
            Expanded(
                child: Row(
                  children: [value.t(3), value.t(4), value.t(5)],
                )),

            Expanded(
                child: Row(
                  children: [value.t(6), value.t(7), value.t(8)],
                )),
            ElevatedButton(onPressed: () {
              value.reset();
            }, child: Text("Reset"))
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

  Widget t(int i) {
    return Expanded(
        child: InkWell(
          onTap: () {
            if(l[i]==""&&w==0)
            {
              if(cnt%2==0)

              {
                l[i]=p1;
              }
              else
              {
                l[i]=p2;
              }
              cnt++;
              win();
              notifyListeners();
            }
          },
          child: Container(
            color: Colors.teal,
            margin: EdgeInsets.all(1),
            child: Center(
              child: Text(
                l[i],
                style: TextStyle(fontSize: 100,color: Colors.white),
              ),
            ),
          ),
        ));
  }

  win()
  {
    if((l[0]==p1&&l[1]==p1&&l[2]==p1)||
        (l[3]==p1&&l[4]==p1&&l[5]==p1)||
        (l[6]==p1&&l[7]==p1&&l[8]==p1)||
        (l[0]==p1&&l[3]==p1&&l[6]==p1)||
        (l[1]==p1&&l[4]==p1&&l[7]==p1)||
        (l[2]==p1&&l[5]==p1&&l[8]==p1)||
        (l[0]==p1&&l[4]==p1&&l[8]==p1)||
        (l[2]==p1&&l[4]==p1&&l[6]==p1))
    {
      msg="$p1 is Winner.";
      w=1;
    }
    else if((l[0]==p2&&l[1]==p2&&l[2]==p2)||
        (l[3]==p2&&l[4]==p2&&l[5]==p2)||
        (l[6]==p2&&l[7]==p2&&l[8]==p2)||
        (l[0]==p2&&l[3]==p2&&l[6]==p2)||
        (l[1]==p2&&l[4]==p2&&l[7]==p2)||
        (l[2]==p2&&l[5]==p2&&l[8]==p2)||
        (l[0]==p2&&l[4]==p2&&l[8]==p2)||
        (l[2]==p2&&l[4]==p2&&l[6]==p2))
    {
      msg="$p2 is Winner.";
      w=1;
    }
    else if(l[0]!=""&&l[1]!=""&&l[2]!=""&&l[3]!=""&&l[4]!=""&&l[5]!=""&&l[6]!=""&&l[7]!=""&&l[8]!="")
    {
      msg="Mach is Drow.";
    }
  }

  void reset() {
    l = List.filled(9, "");
    cnt = 0;
    w=0;
    msg="Game is Running...";
    notifyListeners();
  }
}
