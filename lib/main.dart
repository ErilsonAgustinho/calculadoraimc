import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calcular IMC ",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.blue),
      home: CalculadoraIMCPage(),
    );
  }
}

class CalculadoraIMC {
  double CalcularIMC(double peso, double altura) {
    return peso / (altura * altura);
  }
}

class CalculadoraIMCPage extends StatefulWidget {
  _CalculadoraIMGPageState createState() => _CalculadoraIMGPageState();
}

class _CalculadoraIMGPageState extends State<CalculadoraIMCPage> {
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  double resultadoIMC = 0.0;

  void calcularIMC() {
    double peso = double.tryParse(pesoController.text) ?? 0.0;
    double altura = double.tryParse(alturaController.text) ?? 0.0;

    setState(() {
      resultadoIMC = CalculadoraIMC().CalcularIMC(peso, altura);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calcular IMC"),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 200.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
                controller: alturaController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Altura(m)")),
            Padding(padding: EdgeInsets.symmetric(vertical: 20)),
            TextField(
              controller: pesoController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Peso(kg)"),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 20)),
            ElevatedButton(
              onPressed: calcularIMC,
              child: Text("Calcular IMC"),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 20)),
            Text(
                "Seu IMC é : ${resultadoIMC.toStringAsFixed(2)}, e você está com ${classificarIMC(resultadoIMC)}")
          ],
        ),
      ),
      backgroundColor: Colors.blue,
    );
  }
}

String classificarIMC(double imc) {
  if (imc < 18.5) {
    return "Magreza";
  } else if (imc >= 18.5 && imc <= 24.9) {
    return "Peso Normal";
  } else if (imc >= 25 && imc <= 29.9) {
    return "Sobrepeso";
  } else if (imc >= 30 && imc <= 34.9) {
    return "Obesidade Grau I";
  } else if (imc >= 35 && imc <= 39.9) {
    return "Obesidade Grau II";
  } else {
    return "Obesidade Grau III";
  }
}
