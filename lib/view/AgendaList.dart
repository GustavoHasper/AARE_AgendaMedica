import 'package:agenda_medica/components/AgendaTile.dart';
import 'package:agenda_medica/provider/Agendas.dart';
import 'package:agenda_medica/view/Agendaform.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AgendaList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Agendas agendamentos = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Agendamentos'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => AgendaForm()));
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: agendamentos.count,
        itemBuilder: (ctx, i) => AgendaTile(agendamentos.all.elementAt(i)),
      ),
    );
  }
}
