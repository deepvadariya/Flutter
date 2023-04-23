/////////////////////////////calculator////////////////////////////////
import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(home: MyApp(),));

}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  String s1 ="";
  String s2 ="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Calculator"),),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(s1,style: TextStyle(fontSize: 30.0),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(onPressed:(){
                s1 =s1+"1";
                setState(() {

                });
              },child: Text(’1’)),
              ElevatedButton(onPressed: () {
                s1 = s1 + "2";
                setState(() {

                });
              }, child: Text(’2’)),
              ElevatedButton(onPressed: () {
                s1 = s1 + "3";
                setState(() {

                });
              }, child: Text(’3’)),
              ElevatedButton(onPressed: () {
                s1 = s1 + "+";
                setState(() {

                });
              }, child: Text(’+’)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: (){
                s1 = s1+"4";
                setState(() {

                });
              },child: Text(’4’),),
              ElevatedButton(onPressed: () {
                s1 = s1 + "5";
                setState(() {

                });
              }, child: Text(’5’)),
              ElevatedButton(onPressed: () {
                s1 = s1 + "6";
                setState(() {

                });
              }, child: Text(’6’)),
              ElevatedButton(onPressed: () {
                s1 = s1 + "-";
                setState(() {

                });
              }, child: Text(’-’)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: () {
                s1 = s1 + "7";
                setState(() {

                });
              }, child: Text(’7’)),
              ElevatedButton(onPressed: () {
                s1 = s1 + "8";
                setState(() {

                });
              }, child: Text(’8’)),
              ElevatedButton(onPressed: () {
                s1 = s1 + "9";
                setState(() {

                });
              }, child: Text(’9’)),
              ElevatedButton(onPressed: () {
                s1 = s1 + "*";
                setState(() {

                });
              }, child: Text(’*’)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: () {
                s1 = "";
                setState(() {

                });
              }, child: Text(’AC’)),
              ElevatedButton(onPressed: () {
                s1 = s1 + "0";
                setState(() {

                });
              }, child: Text(’0’)),
              ElevatedButton(onPressed: () {
                List l1 = [];
                int sum = 0;
                var arr1 = s1.split(’+’);
                for (int i = 0; i < arr1.length; i++) {
                  sum += int.parse(arr1[i]);
                }
                s2 = sum.toString();
                setState(() {

                });
// int mul = 0;
// var arr2 = s1.split(’*’);
// for (int i = 0; i < arr2.length; i++) {
// mul = int.parse(arr2[i]) * int.parse(arr2[i]);
// }
// s2 = mul.toString();
// setState(() {
//
// });
              }, child: Text(’=’)),
              ElevatedButton(onPressed: () {
                s1 = s1 + "/";
                setState(() {

                });
              }, child: Text(’/’)),
            ],
          ),
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceAround,
// crossAxisAlignment: CrossAxisAlignment.center,
// children: [
// ElevatedButton(onPressed: () {
// int sum = 0;
// var arr1 = s1.split(’+’);
// for (int i = 0; i < arr1.length; i++) {
// sum += int.parse(arr1[i]);
// }
// s2 = sum.toString();
// setState(() {
//
// });
// }, child: Text(’+’)),
// ElevatedButton(onPressed: () {
// int sub = 0;
// var arr2 = s1.split(’-’);
// for (int i = 0; i < arr2.length; i++) {
// sub = int.parse(arr2[i++]) - int.parse(arr2[i]);
// }
// s2 = sub.toString();
// setState(() {
//
// });
// }, child: Text(’-’)),
// ElevatedButton(onPressed: () {
// int mul = 0;
// var arr2 = s1.split(’*’);
// for (int i = 0; i < arr2.length; i++) {
// mul = int.parse(arr2[i]) * int.parse(arr2[i]);
// }
// s2 = mul.toString();
// setState(() {
//
// });
// }, child: Text(’*’)),
// ElevatedButton(onPressed: () {
// double div = 0.0;
// var arr2 = s1.split(’-’);
// for (int i = 0; i < arr2.length; i++) {
// div = int.parse(arr2[i]) / int.parse(arr2[i++]);
// }
// s2 = div.toString();
// setState(() {
//
// });
// }, child: Text(’/’)),
// ],
// ),

          Text(s2,style: TextStyle(fontSize: 30.0),),
        ],
      ),
    );
  }
}