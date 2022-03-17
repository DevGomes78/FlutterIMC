import 'package:flutter/material.dart';
import 'package:imc/pages/page_imc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: PageImc(),
    );
  }
}
