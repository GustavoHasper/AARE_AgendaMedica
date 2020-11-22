import 'package:agenda_medica/model/Agenda.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AgendaTile extends StatelessWidget {
  final Agenda agenda;
  const AgendaTile(this.agenda);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // leading: Text(agenda.nomePaci),
      title: Text(agenda.nomePaci),
      subtitle: Text(agenda.emailPaci),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.delete),
              color: Colors.red,
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                          title: Text('Deletar Agendamento'),
                          content: Text('Deseja realmente deletar este Agendamento?'),
                          actions: <Widget>[
                            FlatButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('Não'),
                            ),
                            FlatButton(
                              onPressed: () {
                                Provider.of(context, listen: false)
                                    .remove(agenda);
                                Navigator.of(context).pop();
                              },
                              child: Text('Sim'),
                            ),
                          ],
                        ));
              },
            )
          ],
        ),
      ),
    );
  }
}
