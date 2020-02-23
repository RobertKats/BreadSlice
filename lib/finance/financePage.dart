import 'package:flutter/material.dart';
import 'dart:math';


class FinancePage extends StatefulWidget{
    @override
    State<StatefulWidget> createState() => FinaState();

}


class FinaState extends State<FinancePage>{
   TextEditingController fv;
   TextEditingController pv;
   TextEditingController i;
   TextEditingController n;

   TextEditingController r;
   TextEditingController pmt;
   String myState;



  @override
  void initState(){
      fv = new TextEditingController();
      pv = new TextEditingController();
      i = new TextEditingController();
      n = new TextEditingController();
      r = new TextEditingController();
      pmt = new TextEditingController();
      myState = "a";
      super.initState();
  }

  void update(){
    if(myState == "a") return  FinaMath.solveA(fv,pv,i,n);
    else if(myState == "b") FinaMath.solveB(fv,pmt,r,n);
   
  }
  void _flip(){
    if(myState == "a"){
       myState = "b";
    }else{
       myState = "a";
    }
    setState(() {
      
    });
   
  }
  
  Widget _whatState(){
      if(myState == "a") return _stateA();
      else if(myState == "b") return _stateB();
      else return null;
  } 

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
          appBar: new AppBar(
            actions: <Widget>[
              new IconButton(icon: Icon(Icons.all_out), onPressed:()=> update()),
              new IconButton(icon: Icon(Icons.flip), onPressed:()=> _flip())
            ],
          ),
            body: _whatState(),
    );
  }
  
  Widget _stateB(){
    return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                   _row("V",fv),
                   _row("PMT",pmt),
                   _row("r",r),
                   _row("n",n),
              ],
            );
  }
  

  Widget _stateA(){
    return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                   _row("FV",fv),
                   _row("PV",pv),
                   _row("n",n),
                   _row("i",i),
              ],
            );
  }


  Widget _row(String text,TextEditingController ctrl){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
          _text(text), 
          _user(ctrl)
      ],
    );
  }

  Widget _text(String text){
      return Container(
        child: Text(text,
        textAlign: TextAlign.center,
          style: TextStyle(
              height: 2,
              color: Colors.white,
              fontSize: 20
          ) ,
        ),
        color: Color(0xFF770732),
        constraints: BoxConstraints(
                maxWidth: 100,
                minWidth: 100,
                minHeight: 50,
                maxHeight: 50,
            ),
      );
  }
  Widget _user(TextEditingController ctrl){
    return Center(
          child: Container(
            alignment: Alignment.center,
          constraints: BoxConstraints(
                maxWidth: 235,
                minWidth: 235,
                minHeight: 50,
                maxHeight: 50,
            ),
          color: Color(0xFF770732),
          child: TextField(
            keyboardType: TextInputType.numberWithOptions(decimal:true),
            controller: ctrl,
            style: TextStyle(
              color: Colors.white
            ),
            decoration: InputDecoration(
              border: InputBorder.none, 
              isDense: true,
              hintText: 'number',
              hintStyle: TextStyle(
                color: Colors.grey,
                inherit: false,
              )
            )
          ),
        )
        );

  }

}

class FinaMath{
     // TextEditingController fv;
      // TextEditingController pv;
      // TextEditingController i;
      // TextEditingController n;
      // TextEditingController r;
      // TextEditingController pmt;


      // FinaMath(TextEditingController fv, TextEditingController pv,
      //         TextEditingController i, TextEditingController n){
      //           this.fv = fv;
      //           this.pv = pv;
      //           this.i = i;
      //           this.n = n;
      //         }
      static void solveB(TextEditingController v, TextEditingController pmt,
              TextEditingController r, TextEditingController n){
          double vD = _textToDouble(v);
          double pmtD = _textToDouble(pmt);
          double rD = _textToDouble(r);
          double nD = _textToDouble(n);

          if(vD == null){
            double out = pmtD *  (pow((1 + rD),nD) - 1) / rD;
            v.text = out.toStringAsFixed(5);
          } 
          


      }
      static void solveA(TextEditingController fv, TextEditingController pv,
              TextEditingController i, TextEditingController n){
          print("math");
          double fvD = _textToDouble(fv);
          double pvD = _textToDouble(pv);
          double iD = _textToDouble(i);
          double nD = _textToDouble(n);
          if(fvD == null){
            print("Solving for fv");
              double out = pvD * pow((1+iD), nD);
              fv.text = out.toStringAsFixed(5);
          }
          else if(pvD == null){
            print("Solving for pv");
            double out = fvD / pow((1+iD), nD);
            pv.text = out.toStringAsFixed(5);
          }
          else if(iD == null){
            print("Solving for i");
            double out = pow(  (fvD/pvD) , (1/nD) );
            out = out - 1;
            i.text = out.toStringAsFixed(5);
          }
          else if(nD == null){
            print("Solving for n");
            double out = log((fvD/pvD)) / log(1+iD); //(fvD/pvD) 
            n.text = out.toStringAsFixed(5);
          }else{
            print("welp");
          }

      }

      static double _textToDouble(TextEditingController a){
      double out = 0;
      try{
         if(a.text == null) return null;
         out = double.parse(a.text);
        }on FormatException{
          a.text = "";
          return null;
        }
      return out;
  }

    


}

