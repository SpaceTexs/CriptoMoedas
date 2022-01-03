import 'package:cripto_moedas/models/moeda.dart';
import 'package:cripto_moedas/repositories/moeda_repository.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MoedasPage extends StatefulWidget {
  MoedasPage({Key? key}) : super(key: key);

  @override
  _MoedasPageState createState() => _MoedasPageState();
}

class _MoedasPageState extends State<MoedasPage> {
  final tabela = MoedaRepository.tabela;
  NumberFormat real = NumberFormat.currency(
      locale: 'pt_BR',
      name:
          'R\$'); // no simbolo $ precisa colocar uma barra invertida pq o flutter usa o simbolo
  List<Moeda> selecionada = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cripo Moedas'),
      ),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int moeda) {
          return ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(
                  12)), //arrendonda a borda de cada linha selecionada
            ),
            leading: (selecionada.contains(tabela[moeda]))
                ? CircleAvatar(
                    child: Icon(Icons.check),
                  )
                : SizedBox(
                    child: Image.asset(tabela[moeda].icone),
                    width: 40,
                  ),
            title: Text(
              tabela[moeda].nome,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,

                /// para especificar a cor do texto  color: Colors.indigo,
              ),
            ),
            trailing: Text(
              real.format(tabela[moeda].preco),
            ),
            // selected:false, // essa propriedade se true significa que está selecionado se false não está
            selected: selecionada.contains(tabela[
                moeda]), // essa propriedade verifica se está selecionada a moeda
            selectedTileColor: Colors
                .indigo[50], // altera a cor de fundo de uma linha selecionada
            onLongPress: () {
              // o setState redesenha a tela com a mudança feita ,sem ele a tela ficaria com o mesmo layout sem mudanças
              setState(
                () {
                  (selecionada.contains(tabela[
                          moeda])) // operador ternario se moeda seleciona
                      ? selecionada.remove(tabela[moeda]) // remove moeda
                      : selecionada.add(tabela[moeda]);
                  // print(tabela[moeda].nome); // se não adiciona moeda
                },
              );
            },
          );
        },
        padding: EdgeInsets.all(16),
        separatorBuilder: (_, ___) => Divider(),
        itemCount: tabela.length,
      ),
    );
  }
}
