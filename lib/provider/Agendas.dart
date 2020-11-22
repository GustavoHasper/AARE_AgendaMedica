import 'dart:math';

import 'package:agenda_medica/model/Agenda.dart';
import 'package:flutter/cupertino.dart';

class Agendas with ChangeNotifier {
  final Map<String, Agenda> _itens = {};

  List<Agenda> get all {
    return [..._itens.values];
  }

  int get count {
    return _itens.length;
  }

  void save(Agenda agenda) {
    final id = Random().nextDouble().toString();
    _itens.putIfAbsent(
        id,
        () => Agenda(
              id: id,
              celularPaci: agenda.celularPaci,
              dataAgendamento: agenda.dataAgendamento,
              emailPaci: agenda.emailPaci,
              horaAgendamento: agenda.horaAgendamento,
              nomePaci: agenda.nomePaci,
            ));

    notifyListeners();
  }

  void remove(Agenda agenda) {
    _itens.remove(agenda.id);
    notifyListeners();
  }
}
