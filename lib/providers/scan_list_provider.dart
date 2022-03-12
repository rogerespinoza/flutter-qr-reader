import 'package:flutter/material.dart';
import 'package:qr_reader/providers/db_provider.dart';

class ScanListProvider extends ChangeNotifier {
  List<ScanModel> scans = [];
  String typeSelected = 'http';

  Future<ScanModel> newScan(String valor) async {
    final newScan = ScanModel(valor: valor);
    final id = await DBProvider.db.newScan(newScan);

    newScan.id = id;

    if (typeSelected == newScan.tipo) {
      scans.add(newScan);
      notifyListeners();
    }
    return newScan;
  }

  chargeScans() async {
    final scans = await DBProvider.db.getAllScan();
    this.scans = scans;
    notifyListeners();
  }

  chargeScansByType(String type) async {
    final scans = await DBProvider.db.getScanByTipo(type);
    this.scans = [...scans];
    notifyListeners();
  }

  deleteAll() async {
    await DBProvider.db.deleteAllScan();
  }

  deleteScanByType(String tipo) async {
    // solo se elimina el item de db
    await DBProvider.db.deleteByType(tipo);
    // se actualiza la matriz de provider ejecutando este metodo
    chargeScansByType(typeSelected);
  }

  deleteScanById(int id) async {
    // solo se elimina el item de db
    await DBProvider.db.deleteScan(id);
    // se actualiza la matriz de provider ejecutando este metodo
    chargeScansByType(typeSelected);
  }
}
