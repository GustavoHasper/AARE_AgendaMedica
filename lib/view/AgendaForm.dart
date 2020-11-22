import 'package:agenda_medica/model/Agenda.dart';
import 'package:agenda_medica/provider/Agendas.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// class MeuForm extends StatefulWidget {
//   @override
//   MeuFormState createState() {
//     return MeuFormState();
//   }
// }

class AgendaForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final Map<String, Object> _formData = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Novo Agendamento'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                // if (_formKey.currentState.validate()) {
                //   Scaffold.of(context).showSnackBar(
                //       SnackBar(content: Text('Agendamento realizado com sucesso!')));

                _formKey.currentState.save();

                Provider.of<Agendas>(context, listen: false).save(
                  Agenda(
                    id: _formData['id'],
                    nomePaci: _formData['nomePaci'],
                    dataAgendamento: _formData['dataAgendamento'],
                    horaAgendamento: _formData['horaAgendamento'],
                    celularPaci: _formData['celularPaci'],
                    emailPaci: _formData['emailPaci'],
                  ),
                );

                Navigator.of(context).pop();
              }
              // },
              )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                decoration: new InputDecoration(labelText: 'Nome Completo'),
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Insira um nome válido';
                  }
                  return null;
                },
                onSaved: (value) => _formData['nomePaci'] = value,
              ),
              TextFormField(
                decoration:
                    new InputDecoration(labelText: 'Data do agendamento'),
                keyboardType: TextInputType.datetime,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Insira uma data válida';
                  }
                  return null;
                },
                onSaved: (value) => _formData['dataAgendamento'] = value,
              ),
              TextFormField(
                decoration:
                    new InputDecoration(labelText: 'Hora do agendamento'),
                keyboardType: TextInputType.datetime,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Insira uma hora válida';
                  }
                  return null;
                },
                onSaved: (value) => _formData['horaAgendamento'] = value,
              ),
              TextFormField(
                decoration: new InputDecoration(
                    labelText: 'Médico responsável pelo atendimento'),
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Insira um nome válido';
                  }
                  return null;
                },
                onSaved: (value) => _formData['nomePaci'] = value,
              ),
              TextFormField(
                decoration: new InputDecoration(
                    labelText: 'Número do celular do paciente'),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Insira um número válido';
                  }
                  return null;
                },
                onSaved: (value) => _formData['celularPaci'] = value,
              ),
              TextFormField(
                decoration:
                    new InputDecoration(labelText: 'E-mail do paciente'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Insira um email válido';
                  }
                  return null;
                },
                onSaved: (value) => _formData['emailPaci'] = value,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
