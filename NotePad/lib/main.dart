import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
void main(){
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: listWidgets(),
      theme: ThemeData(
        primaryColor: Colors.blue,
        accentColor: Colors.lime,
        brightness:Brightness.dark
      ),
    )
  );
}
class listWidgets extends StatefulWidget {
  @override
  _listWidgetsState createState() => _listWidgetsState();
}

class _listWidgetsState extends State<listWidgets> {
  String input="";
  List list=List();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Note",
          textDirection: TextDirection.ltr,
        ),
      actions: <Widget>[
        Icon(Icons.search),
      ],),
     drawer: Drawer(),
    floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          showDialog(context: context,
            builder: (BuildContext context){
            return AlertDialog(
              title: Text("Add notes"),
              content: TextField(
                onChanged:(String value){
                  input=value;
                },
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text('Add'),
                  onPressed: (){
                    setState(() {
                      list.add(input);
                    });
                    Navigator.of(context).pop();
                  } )
              ],
            );
            }
          );
        },
      ),
      body: ListView.builder(
        itemCount: list.length,
          itemBuilder:(BuildContext context,int index){
            return Dismissible(
              key:Key(list[index]),
              child: ListTile(
                title: Text(list[index]),
              ),
              onDismissed: (direction){
                setState(() {
                  list.removeAt(index);
                });
              },
            );
          }
      ),



    );
  }
}




