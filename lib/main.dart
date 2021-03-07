import 'package:flutter/material.dart';

//
void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

//
//
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
//

class _HomeState extends State<Home> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _infoText = "Informe seus dados :)";

//function resetfields
  void _resetFields() {
    weightController.text = "";
    heightController.text = "";
    setState(() {
      _infoText = "Informe seus dados :)";
      _formKey = GlobalKey<FormState>();
    });
  }

//
// function calculateimc
  void _calculate() {
    setState(() {
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text) / 100;
      double imc = weight / (height * height);
      print(imc);
      if (imc < 18.6) {
        _infoText = "Você está abaixo do peso (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 18.6 && imc < 24.9) {
        _infoText = "Você está no peso ideal (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 24.9 && imc < 29.9) {
        _infoText = "Você está com sobrepeso (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 29.9 && imc < 34.9) {
        _infoText = "Obesidade grau I (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 34.9 && imc < 39.9) {
        _infoText = "Obesidade Grau II (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 40) {
        _infoText = "Obesidade Grau III (${imc.toStringAsPrecision(3)})";
      }
    });
  }
//

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Calculadora de IMC",
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
            onPressed: _resetFields,
            iconSize: 30,
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 80.0),
          child: Form(
            key: _formKey,
            child: Column(
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
                  child: TextFormField(
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
                        hintStyle: TextStyle(
                            color: Colors.purple,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            height: 2),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30))),
                    controller: weightController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Digite seu peso";
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 250,
                  height: 60,
                  child: TextFormField(
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
                        hintStyle: TextStyle(
                            color: Colors.purple,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            height: 2),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30))),
                    controller: heightController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Digite sua altura";
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 38),
                  child: Container(
                    width: 220,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.greenAccent,
                          onPrimary: Colors.red[900],
                          elevation: 8.0,
                          animationDuration: Duration(seconds: 4),
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(18.0),
                          )),
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          _calculate();
                        }
                      },
                      child: Text(
                        "Calcular",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 35),
                      ),
                    ),
                  ),
                ),
                Text(
                  _infoText,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.red, fontSize: 30),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
