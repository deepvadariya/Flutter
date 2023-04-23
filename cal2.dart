//////////////////////////cal2//////////////////////

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Calculator(),));
}

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  TextEditingController fnum=new TextEditingController();
  TextEditingController snum=new TextEditingController();
  String ans="";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Calculator"),),
      body:
      Container(
        padding: EdgeInsets.only(top: 100,right: 20,left: 20),
        child: Column(
          children: [
            TextField(
              controller: fnum,
              decoration: InputDecoration(hintText: "number 1"),),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: snum,
              decoration: InputDecoration(hintText: "number 2"),),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(onPressed: () {
                  int fnumber=int.parse(fnum.text);
                  int snumber=int.parse(snum.text);

                  int sum=fnumber+snumber;
                  ans=sum.toString();

                  setState(() {

                  });

                }, child: Text("+")),
                ElevatedButton(onPressed: () {
                  int fnumber=int.parse(fnum.text);
                  int snumber=int.parse(snum.text);

                  int sum=fnumber-snumber;
                  ans=sum.toString();

                  setState(() {

                  });


                }, child: Text("-")),
                ElevatedButton(onPressed: () {
                  int fnumber=int.parse(fnum.text);
                  int snumber=int.parse(snum.text);

                  int sum=fnumber~/snumber;
                  ans=sum.toString();

                  setState(() {

                  });


                }, child: Text("/")),
                ElevatedButton(onPressed: () {
                  int fnumber=int.parse(fnum.text);
                  int snumber=int.parse(snum.text);

                  int sum=fnumber*snumber;
                  ans=sum.toString();

                  setState(() {

                  });


                }, child: Text("*"))


              ],
            ),
            SizedBox(
              height: 30,
            ),

            Center(child: Text("Answer is: "+ans)),
          ],
        ),

      ),
    );
  }
}