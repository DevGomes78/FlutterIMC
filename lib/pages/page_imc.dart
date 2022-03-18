import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imc/components/text_widget.dart';

class PageImc extends StatefulWidget {
  const PageImc({Key? key}) : super(key: key);

  @override
  _PageImcState createState() => _PageImcState();
}

class _PageImcState extends State<PageImc> {
  var pesoController = TextEditingController();
  var alturaController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _infoText = '';

  void _resetcampos() {
    pesoController.text = '';
    alturaController.text = '';
    _infoText = '';
    setState(() {
      _formKey = GlobalKey<FormState>();
    });
  }

  void CalcImc() {
    setState(() {
      double peso = double.parse(pesoController.text);
      double altura = double.parse(alturaController.text) / 100;
      double imc = peso / (altura * altura);

        if (imc < 18.6) {
          _infoText = "Abaixo do peso ${imc.toStringAsPrecision(3)}";
        } else if (imc >= 18.6 && imc < 24.9) {
          _infoText = "Peso ideal ${imc.toStringAsPrecision(3)}";
        } else if (imc >= 24.9 && imc < 29.9) {
          _infoText = "acima do Peso ${imc.toStringAsPrecision(3)}";
        } else if (imc >= 29.9 && imc < 34.9) {
          _infoText = "Obesidade grau I ${imc.toStringAsPrecision(3)}";
        } else if (imc >= 34.9 && imc < 39.9) {
          _infoText = "Obesidade grau II ${imc.toStringAsPrecision(3)}";
        } else if (imc >= 40) {
          _infoText = "Obesidade grau III ${imc.toStringAsPrecision(3)}";
        }
      }
      );
    }

        @override
        Widget build(BuildContext context)
    {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Calculadora de IMC'),
          centerTitle: true,
          backgroundColor: Color(0xFFF1A7DFF),
          actions: [
            IconButton(
                onPressed: _resetcampos,
                icon: const Icon(
                  Icons.refresh,
                  color: Colors.white,
                ))
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'images/coracao.png',
                    color: Colors.red,
                  ),
                ),
                TextWidget(
                  'Peso',
                  'Informe o Peso',
                  pesoController,
                  TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Informe seu Peso!';
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextWidget(
                  'Altura',
                  'Informe a altura',
                  alturaController,
                  TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'insira sua altura!';
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                buildGestureDetector(),
                const SizedBox(height: 20),
                Text(
                  _infoText,
                  style: const TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    buildGestureDetector() {
      return GestureDetector(
        onTap: CalcImc,
        child: Container(
          alignment: Alignment.center,
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0xFFF1A7DFF),
          ),
          child: const Text(
            'calcular',
            style: TextStyle(
              fontSize: 22,
              color: Colors.white,
            ),
          ),
        ),
      );
    }
  }
