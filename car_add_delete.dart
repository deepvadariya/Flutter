////////////////////////////// Car Add and delete //////////////////////////////////

// Main.dart
//import ’package:demo6/viewCar.dart’;
//import ’carDetail.dart’;
import "package:flutter/cupertino.dart";

import 'package:flutter/material.dart';


List<CarDetail> l1 = [];
void main() {
  runApp(
    MaterialApp(home: MyApp()),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController cname = new TextEditingController();
  TextEditingController ccomp = new TextEditingController();
  TextEditingController cprice = new TextEditingController();
  TextEditingController ccolor = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My App"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(controller: cname,decoration: InputDecoration(labelText: "Enter Car Name"),),
          TextField(controller: ccomp,decoration: InputDecoration(labelText: "Enter Car Company"),),
          TextField(controller: cprice,decoration: InputDecoration(labelText: "Enter Car Price"),),
          TextField(controller: ccolor,decoration: InputDecoration(labelText: "Enter Car Color"),),
          ElevatedButton(onPressed: () {
            CarDetail c1 = new CarDetail();
            c1.cName = cname.text;
            c1.cCompany = ccomp.text;
            c1.cPrice = int.parse(cprice.text);
            c1.cColor = ccolor.text;
            l1.add(c1);
          }, child: Text("Add")),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ViewCars(l1);
        },));
      },child: Icon(Icons.keyboard_arrow_right),),
    );
  }
}

//viewCar.dart

//import ’package:demo6/viewParticular.dart’;
//import ’package:flutter/material.dart’;
//import ’carDetail.dart’;

class ViewCars extends StatefulWidget {

  List<CarDetail> l2 = [];
  ViewCars(this.l2);

  @override
  State<ViewCars> createState() => _ViewCarsState();
}

class _ViewCarsState extends State<ViewCars> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Details"),),
      body: ListView.builder(itemCount: widget.l2.length,itemBuilder: (context, index) {
        return Card(child: ListTile(leading: Icon(Icons.car_rental),title: Text(widget.l2[index].cName),subtitle:
        Text(widget.l2[index].cCompany),onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ViewCar(widget.l2,index);
          },));
        },));
      },),
    );
  }
}

//viewParticular.dart
//import ’package:demo6/main.dart’;
//import ’package:flutter/material.dart’;
//import ’carDetail.dart’;


class ViewCar extends StatefulWidget {

  List<CarDetail> l2 = [];
  int i = 0;
  ViewCar(this.l2,this.i);

  @override
  State<ViewCar> createState() => _ViewCarState();
}

class _ViewCarState extends State<ViewCar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Details"),),
      body: Column(
        children: [
          Text("Car Name: "+widget.l2[widget.i].cName),
          Text("Car Company: "+widget.l2[widget.i].cCompany),
          Text("Car Color: "+widget.l2[widget.i].cColor),
          Text("Car Price: "+widget.l2[widget.i].cPrice.toString()),
          ElevatedButton(onPressed: () {
            L2.removeAt(index);
          }, child: Text("Delete")),
        ],
      ),
    );
  }
}

class L2 {

}


//carDetail.dart
class CarDetail{
  String cName = "";
  String cCompany = "";
  int cPrice = 0;
  String cColor = "";
}