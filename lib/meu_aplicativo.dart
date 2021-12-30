import 'package:flutter/material.dart';
import 'package:cripto_moedas/pages/moedas_page.dart';

class MeuAplicativo extends StatelessWidget {
  const MeuAplicativo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cripto Moedas',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: MoedasPage(),
    );
  }
}
