////////////////////////slider////////////////////////////////// 
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Scroll(),));
}

class Myapp extends StatefulWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  bool a=false;
  bool b=false;

  Color clr=Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: clr,
      body:
      Container(
        child: Column(
          children: [
            Row(
              children: [
                Checkbox(value:a, onChanged:(value) {
                  setState(() {
                    a=value!;

                  });
                  if(a==true){
                    clr=Colors.blue;
                  }
                  else{
                    clr=Colors.white;
                  }

                },),
                Text("blue"),
              ],
            ),
            Row(
              children: [
                Checkbox(value:b, onChanged:(value) {
                  setState(() {
                    b=value!;

                  });
                  if(b==true){
                    clr=Colors.green;
                  }
                  else{
                    clr=Colors.white;
                  }

                },),
                Text("green"),
              ],
            ),


          ],
        ),
      ),
    );
  }
}

class Scroll extends StatefulWidget {
  const Scroll({Key? key}) : super(key: key);

  @override
  State<Scroll> createState() => _ScrollState();
}

class _ScrollState extends State<Scroll> {
  double rvalue=1;
  double gvalue=1;
  double bvalue=1;
  Color clr=Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: clr,
      body:
      Container(
        child: Column(
          children: [
            Slider(min:1,max:256,value:rvalue , onChanged:(value) {
              print(rvalue);
              rvalue=value;
              setState(() {
                clr=Color.fromRGBO(rvalue.round(), gvalue.round(),bvalue.round(), 1);


              });
            },),
            Slider(min:1,max:256,value:gvalue , onChanged:(value) {
              print(gvalue);
              gvalue=value;
              setState(() {
                clr=Color.fromRGBO(rvalue.round(),gvalue.round(),bvalue.round(), 1);


              });
            },),
            Slider(min:1,max:256,value:bvalue , onChanged:(value) {
              print(bvalue);
              bvalue=value;
              setState(() {
                clr=Color.fromRGBO(rvalue.round(),gvalue.round(),bvalue.round(), 1);


              });
            },)
          ],
        ),
      ),
    );
  }
}