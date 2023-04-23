//////////////////// car add search/////////////////////////

import 'package:flutter/material.dart';




void main() {
  runApp(MaterialApp(
    home:car(),

  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}): super(key: key);

// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: (Text("Car")),

      ),

      body: Center(

      ),
    );
  }
}

class car extends StatefulWidget {

  const car({Key? key}) : super(key: key);



  @override
  State<car> createState() => _carState();
}

class _carState extends State<car> {


  TextEditingController txtcarname = new TextEditingController();
  TextEditingController txtcarcolor = new TextEditingController();
  TextEditingController txtcarprice = new TextEditingController();
  List<CarClass> Cardetail=[];
  int m=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Car")),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextField(
            controller: txtcarname,
            decoration: InputDecoration(labelText: "Enter Car Name"),
          ),
          TextField(
            controller: txtcarcolor,
            decoration: InputDecoration(labelText: "Enter Car Color"),
          ),
          TextField(
            controller: txtcarprice,
            decoration: InputDecoration(labelText: "Enter Car price"),
          ),
/*Slider(
min: 3,
max: 10,
value: carprice,
onChanged: (value) {
carprice = value!;
print(value);
setState(() {});
}),*/
          ElevatedButton(
              onPressed: () {


                CarClass newcar=new CarClass();
                newcar.carname=txtcarname.text;
                newcar.carcolor=txtcarcolor.text;
                newcar.carprice=int.parse(txtcarprice.text) as String;

                Cardetail.add(newcar);
                m = Cardetail.length;



                setState(() {});
              },
              child: Text("Save")),

          Text(m.toString())

        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)
          {
            return secondpage(Cardetail);
          },));
        },
        child: Icon(Icons.navigate_next),
      ),
    );
  }
}

class secondpage extends StatefulWidget {
//const secondpage({Key? key}) : super(key: key);
  List<CarClass> carshow=[];
  secondpage(this.carshow);

  @override
  State<secondpage> createState() => _secondpageState();
}

class _secondpageState extends State<secondpage> {
  String crname="";
  String crcolor="";
  int crprice=0;
  int ctr=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: (Text("secondpage")),),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("Car Name: "+crname),
          Text("Car color: "+crcolor),
          Text("Car price: "+crprice.toString()),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed: (){

                ctr=0;
                crname=widget.carshow[ctr].carname;
                crcolor=widget.carshow[ctr].carcolor;
                crprice=widget.carshow[ctr].carprice as int ;

                print(widget.carshow);
                setState(() {

                });



              }, child: Text("First")),

              ElevatedButton(onPressed: (){
                if(ctr>0){
                  ctr=ctr-1;
                  crname=widget.carshow[ctr].carname;
                  crcolor=widget.carshow[ctr].carcolor;
                  crprice=widget.carshow[ctr].carprice as int ;
                  print(widget.carshow);
                }else{
                  ctr=0;
                }
                setState(() {

                });
              }, child: Text("previous")),

              ElevatedButton(onPressed: (){
                if(ctr<widget.carshow.length-1){
                  ctr=ctr+1;
                  crname=widget.carshow[ctr].carname;
                  crcolor=widget.carshow[ctr].carcolor;
                  crprice=widget.carshow[ctr].carprice as int ;
                  print(widget.carshow);

                }else{
                  ctr=widget.carshow.length-1;
                }
                setState(() {

                });
              }, child: Text("next")),

              ElevatedButton(
                  onPressed: () {
                    ctr = widget.carshow.length - 1;
                    crname = widget.carshow[ctr].carname;
                    crcolor = widget.carshow[ctr].carcolor;
                    crprice = widget.carshow[ctr].carprice as int ;
                    print(widget.carshow);
                    setState(() {});
                  },
                  child: Text("Last")),



            ],
          ),

        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return thirdpage(widget.carshow);
            },
          ));
        },
        child: Icon(Icons.navigate_next),
      ),
    );
  }
}

class thirdpage extends StatefulWidget {
  List<CarClass> Cars=[];
  thirdpage(this.Cars);

  @override
  State<thirdpage> createState() => _thirdpageState();
}

class _thirdpageState extends State<thirdpage> {
  TextEditingController txtcrcr= new TextEditingController();
  TextEditingController txtprc= new TextEditingController();
  int counter=0;
  String showcar="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Third page")),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextField(controller: txtcrcr,decoration: InputDecoration(labelText: "Enter Car color: "),),

          TextField(controller: txtprc, decoration: InputDecoration(labelText: "Enter price: "),),

          ElevatedButton(onPressed: (){

            for(counter=0;counter<widget.Cars.length;counter++)
            {
              if(int.parse(txtprc.text) >=
                  widget.Cars[counter].carprice.length &&
                  widget.Cars[counter].carcolor== txtcrcr.text)
              {
                showcar+= widget.Cars[counter].carname;
                showcar+",";
              }
//else{
//print("please enter valid input details");
//}

            }
            setState(() {

            });

          }, child: Icon(Icons.search),

          ),
          Text(showcar),
        ],
      ),
    );
  }
}

/////lib 2 file//////////////////////////
class CarClass{
  String carname="";
  String carcolor="";
  String carprice="";

}