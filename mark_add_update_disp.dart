/////////// student add update display marksheet//////////////
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home:student(),));
}

class student extends StatefulWidget {
  const student({Key? key}) : super(key: key);


  @override
  State<student> createState() => _studentState();
}

class _studentState extends State<student> {

  List<Student> lststu=[];

  TextEditingController txtsname=TextEditingController();
  TextEditingController txtrollno=TextEditingController();
  TextEditingController txtsub1=TextEditingController();
  TextEditingController txtsub2=TextEditingController();
  TextEditingController txtsub3=TextEditingController();
  int m=0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("student"),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [

          TextField(controller: txtsname,
            decoration: InputDecoration(labelText: "Student name"),),

          TextField(controller: txtrollno,
            decoration: InputDecoration(labelText: "Student roll no"),),

          TextField(controller: txtsub1,
            decoration: InputDecoration(labelText: "marks 1"),),

          TextField(controller: txtsub2,
            decoration: InputDecoration(labelText: "marks 2"),),

          TextField(controller: txtsub3,
            decoration: InputDecoration(labelText: "marks 3"),),

          ElevatedButton(onPressed: (){

            Student newstu=new Student();
            newstu.stuname=txtsname.text;
            newstu.rollno=int.parse(txtrollno.text);
            newstu.sub1=int.parse(txtsub1.text);
            newstu.sub2=int.parse(txtsub2.text);
            newstu.sub3=int.parse(txtsub3.text);

            lststu.add(newstu);
            m=lststu.length;
            setState(() {

            });

          }, child: Text("save")),

          Text(m.toString()),


        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)
          {
            return displaystudent(lststu);
          },));
        },child: Icon(Icons.navigate_next),
      ),
    );

  }
}

class Student{
  String stuname="";
  int rollno=0;
  int sub1=0;
  int sub2=0;
  int sub3=0;
}

class displaystudent extends StatefulWidget {
  List<Student> lststu=[];
  displaystudent(this.lststu);

  @override
  State<displaystudent> createState() => _displaystudentState();
}

class _displaystudentState extends State<displaystudent> {
  void refreshPage()
  {
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Display.."),
      ),

      body: ListView.builder(itemCount: widget.lststu.length,
          itemBuilder: (context,index)
          {
            return Card(
              child: ListTile(
                title: Text(widget.lststu[index].stuname),
                subtitle: Text(widget.lststu[index].rollno.toString()),
                leading: Icon(Icons.star_sharp),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)
                  {
                    return studentdetails(widget.lststu);
                  },
                  )).then((value) => refreshPage());
                },
              ),
            );
          }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)
          {
            return searchstudent(widget.lststu);
          },));
        },child: Icon(Icons.navigate_next),
      ),
    );
  }
}

class studentdetails extends StatefulWidget {
  List<Student> lststu=[];

  studentdetails(this.lststu);

  @override
  State<studentdetails> createState() => _studentdetailsState();
}

class _studentdetailsState extends State<studentdetails> {
  void refreshPage()
  {
    setState(() {

    });
  }
  int index=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("student details.."),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("Student Details.."),

          Text("Student Name:"+ widget.lststu[index].stuname),
          Text("Student roll no:"+widget.lststu[index].rollno.toString()),
          Text("Student marks 1:"+widget.lststu[index].sub1.toString()),
          Text("Student marks 2:"+widget.lststu[index].sub2.toString()),
          Text("Student rmarks 3:"+widget.lststu[index].sub3.toString()),

          ElevatedButton(onPressed: (){

            widget.lststu.removeAt(index);

            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)
            {
              return displaystudent(widget.lststu);
            },)).then((value) => refreshPage());

          }, child:Text("Delete")),

          ElevatedButton(onPressed: (){

            Navigator.push(context, MaterialPageRoute(builder: (context)
            {
              return updatestu(widget.lststu,index);
            }));

          }, child: Text("Update"))
        ],
      ),
    );
  }
}




class searchstudent extends StatefulWidget {
  List<Student> lststu=[];
  searchstudent(this.lststu);

  @override
  State<searchstudent> createState() => _searchstudentState();
}

class _searchstudentState extends State<searchstudent> {

  TextEditingController txtrollno = new TextEditingController();
  int counter = 0;
  String showStudentName = "";
  String Mark1 = "";
  String Mark2 = "";
  String Mark3 = "";
  String txt = "";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Search student .."),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

        children: [

          TextField(controller: txtrollno,
            decoration: InputDecoration(labelText: "Enter Student roll no:"),),


          ElevatedButton(onPressed: (){

            for(int counter=0;counter<widget.lststu.length;counter++)
            {
              if(int.parse(txtrollno.text)==widget.lststu[counter].rollno)
              {
                showStudentName=widget.lststu[counter].stuname;
                Mark1=widget.lststu[counter].sub1.toString();
                Mark2=widget.lststu[counter].sub2.toString();
                Mark3=widget.lststu[counter].sub3.toString();
                txt = "Successfully";
                break;
              }
              else
              {
                txt="Student Not found..";
              }
            }
            setState(() {

            });
          }, child:Text("Search..")),
          Text("Student Name:"+showStudentName),
          Text("Student Mark 1"+Mark1 ),
          Text("Student Mark 2 "+Mark2),
          Text("Student Mark 3"+Mark3),
          Text(txt),


        ],
      ),

    );
  }
}


class updatestu extends StatefulWidget {
  List<Student> lststu=[];
  int index=0;
  updatestu(this.lststu,this.index);


  @override
  State<updatestu> createState() => _updatestuState();
}

class _updatestuState extends State<updatestu> {
  TextEditingController txtname = new TextEditingController();
  TextEditingController txtrollno = new TextEditingController();
  TextEditingController txtsub1 = new TextEditingController();
  TextEditingController txtsub2 = new TextEditingController();
  TextEditingController txtsub3 = new TextEditingController();

  void refreshPage()
  {
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update student.."),

      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextField(controller: txtname,
            decoration: InputDecoration(labelText: "Student name"),),

          TextField(controller: txtrollno,
            decoration: InputDecoration(labelText: "Student roll no"),),

          TextField(controller: txtsub1,
            decoration: InputDecoration(labelText: "Student marks 1"),),

          TextField(controller: txtsub2,
            decoration: InputDecoration(labelText: "Student marks 2"),),

          TextField(controller: txtsub3,
            decoration: InputDecoration(labelText: "Student marks 3"),),

          ElevatedButton(onPressed: (){
            widget.lststu[widget.index].stuname=txtname.text;
            widget.lststu[widget.index].rollno=int.parse(txtrollno.text);
            widget.lststu[widget.index].sub1=int.parse(txtsub1.text);
            widget.lststu[widget.index].sub2=int.parse(txtsub2.text);
            widget.lststu[widget.index].sub3=int.parse(txtsub3.text);

            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)
            {
              return displaystudent(widget.lststu);
            })).then((value) => refreshPage());




          }, child: Text("Update..")),


        ],
      ),
    );
  }
}