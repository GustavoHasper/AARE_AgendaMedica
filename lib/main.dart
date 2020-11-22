import 'package:agenda_medica/provider/Agendas.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'view/AgendaList.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Agendas(),
      child: MaterialApp(
        title: 'Flutter Demo',
        home: AgendaList(),
      ),
    );
  }
}
