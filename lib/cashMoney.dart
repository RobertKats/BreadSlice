import 'package:flutter/material.dart';



class MyForum extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => MyForumState();

}
class MyForumState extends State<MyForum>{

 // final _formKey = GlobalKey<MyForumState>();
  Map<String,TextEditingController> data = new Map<String,TextEditingController>();
  int listSize = 1;
  Map<String,int> subListSizes = new Map<String,int>();
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: new AppBar(
          title:  Text("Cash"),
      ),
      floatingActionButton: new FloatingActionButton(
        heroTag: 'btn10',
          onPressed: () {
            listSize++;
            setState(() {
              
            });
              //var temp = data['2'].text;
              //print(temp);
          },
      ),
        body: new Center(
            child: listBuild(),
        ),
    );
  }

  Widget subListBuild(String key){
    return ListView.builder(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
        itemBuilder:(context,i){
          if(i == subListSizes[key]-1){
            return FloatingActionButton(
              heroTag: new UniqueKey().toString(),
                onPressed: (){
                    subListSizes[key] = subListSizes[key] + 1;
                    print( "key is  " + key + " " +  subListSizes[key].toString());
                    setState(() {
                      
                    });

                },
            );
          }
          return subListCard(key);
        },
        itemCount: subListSizes[key],
    );
  }

  Widget listBuild(){
    return ListView.builder(
        itemBuilder:(context,i){
          return testTwo(context, i);
        },
        itemCount: listSize,
    );
  }

  Widget subListCard(String key){
    return 
    new GestureDetector(
      onLongPress: (){
          print("boop");
          subListSizes[key]--;
          setState(() {
            
          });
      },
      child: new Padding (
        padding: EdgeInsets.symmetric(horizontal: 30.00),
        child: new Center (
      //  child: ConstrainedBox(
           // constraints: BoxConstraints( maxWidth: 300  ),
        child: Container(
          child: TextField(
              decoration: null,
          ),
         
         decoration: BoxDecoration(
           color: Colors.lightGreen,
           border: Border.all(color: Colors.blue, width: 1),
           borderRadius: BorderRadius.all(Radius.circular(30)),
         ),
         padding: EdgeInsets.symmetric(vertical: 10.00)
    )
    )
    )
    );
  }
  
  
  Widget testTwo(BuildContext context, int i){
    if (subListSizes[i.toString()] == null)
    subListSizes[i.toString()]  = 1;
    return Container(
      child: _item(i.toString()),     
      // decoration: BoxDecoration(
      //   border: Border.all(),
      // ),
        
    );

  }

  Widget _item(String key){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        
        _itemText(key),
      
        subListBuild(key),
        
      ],
    );
 
  }
  Widget _itemText(String key){
      if(data[key+'1'] != null)
      data[key+'1'] = new TextEditingController();
    if(data[key+'2'] != null)
      data[key+'2'] = new TextEditingController();
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Flexible(
            //padding: EdgeInsets.all(1),
            child: TextField(
              controller: data[key+'1'], 
            ),
          ),
          new Padding(
            padding: EdgeInsets.all(20),
            child: Container(),
          ),
          new Flexible(
              child:  TextField(
                      controller: data[key+'2'],
                      keyboardType: TextInputType.number,
                    ),
          ),
        ]
        ,
        );
  }
}