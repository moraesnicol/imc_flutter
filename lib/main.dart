import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
    
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora de IMC",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
        
                ),
                ),
        centerTitle: true,
        backgroundColor: Colors.tealAccent[400],
        toolbarHeight: 45,
        actions: [
          IconButton(
          icon: Icon(Icons.refresh_rounded), 
          onPressed: null,
          iconSize: 30,
          
          )
        ],
      ),     
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          
          Center(
            child: Icon(
              Icons.person_outline, 
              size: 130, 
              color: Colors.cyan,  
            ),
          ),
          Container(
            width: 250,
            height: 60,
            child: TextField(
              enableInteractiveSelection: false,
              autofocus: false,
              keyboardType: TextInputType.number,
              cursorColor: Colors.green,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.purpleAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
              ),
              decoration: InputDecoration(
                
                hintText: "Digite seu Peso (Kg)",
                alignLabelWithHint: true,
                
               hintStyle: 

                TextStyle(
                  color: Colors.purple,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  height: 2

              ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30)

                )
              ),
         ),
          ), 
          SizedBox(
            height: 20,
          ),
                   Container(
            width: 250,
            height: 60,
            child: TextField(
              enableInteractiveSelection: false,
              autofocus: false,
              keyboardType: TextInputType.number,
              cursorColor: Colors.green,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.purpleAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
              ),
              decoration: InputDecoration(
                
                hintText: "Digite sua Altura (Cm)",
                alignLabelWithHint: true,
                
               hintStyle: 

                TextStyle(
                  color: Colors.purple,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  height: 2

              ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30)

                )
              ),
         ),
          ),
            SizedBox(
            height: 45,
          ),
          Container(
            width: 220,
            height: 50,

            child: RaisedButton(
              color: Colors.greenAccent,
              elevation:8.0,
              splashColor: Colors.yellow[200],
              animationDuration: Duration(seconds: 4),
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(18.0),
                
                ),
              
              onPressed: () => print("Button Pressed"),
              child:  Text(
                "Calcular", 
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 35
                   ),
                ),
              
            ),
          ),
        ],
      ),
    );
  }
}