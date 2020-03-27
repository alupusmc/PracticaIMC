import 'dart:ui';

import 'package:flutter/material.dart';


  void main() {
    runApp(MyApp());
  }


class MyApp extends StatefulWidget {
  @override
  _SliderWidgetState createState() {
    return _SliderWidgetState();
  }
}

class _SliderWidgetState extends State {
  double valuePeso = 70.0;
  double valueAltura = 180.0;
  var salud = "Aun no calculado";
  double imc = 0.0;
  var ruta = "assets/2.jpg";
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      title: 'Sliders',
      home: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(title: Text("Calculo de IMC joven ó adulto "),),
        body: Center(
          child: Column(
            children: <Widget>[

              Expanded(  child: Text('Estado de salud: '+salud)),
              Expanded( child: Image.asset(ruta),

              ),
              Expanded(  child: Text('IMC '+imc.toString()),


              ),
              RaisedButton(child: Text("Calcular IMC"),
                onPressed: (){ {
                  setState(()
                  {
                    _changeText();
                  });
                }
                },

                color: Colors.white,
                textColor: Colors.black,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                splashColor: Colors.grey,
              ),
              Expanded(   child: Text('Altura (cms): '+valueAltura.toString()) ),
              Expanded(
                child: Slider(
                  value: valueAltura,
                  min: 1,
                  max: 240,
                 // divisions: 10,
                  activeColor: Colors.black,
                  inactiveColor: Colors.white54,
                  label: "Altura (m)",
                  onChanged: (_value){
                    setState((){
                      valueAltura = _value;
                    });
                    print(_value);
                  },
                ),

              ),
              Expanded(  child: Text('Peso (kg): '+valuePeso.toString())),
              Expanded(
                child: Slider(
                  value: valuePeso,
                  min: 1,
                  max: 150,
                  //divisions: 10,
                  activeColor: Colors.black,
                  inactiveColor: Colors.white54,
                  label: "Peso (kg)",
                  onChanged: (_value){
                    setState((){
                      valuePeso = _value;
                    });
                    print(_value);
                  },
                ),)
            ],
          ),



        ),
      ),
    );
  }

  _changeText() {
var temp = 0.0;
imc = 0.0;
temp = valueAltura/100;
    imc = (valuePeso / ( temp*temp) );
  //imc = temp;


    if(imc>=35) {
      salud = "obesidad morbida";
      ruta = "assets/5.jpg";
    }
  else if(imc>=30 && imc <35){
  salud="obeso";
    ruta = "assets/4.jpg";
  }

else if(imc>=25 && imc <30){
salud="sobrepeso";
    ruta = "assets/3.jpg";
  }

else if(imc>=18.5 && imc <25){
salud="normal";
    ruta = "assets/2.jpg";
  }

    else if(imc<18.5){
      salud="bajo de peso";
    ruta = "assets/1.jpg";
  }
  }

}






