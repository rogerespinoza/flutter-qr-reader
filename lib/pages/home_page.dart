import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/pages/directions_page.dart';
import 'package:qr_reader/pages/maps_history_page.dart';
import 'package:qr_reader/providers/scan_list_provider.dart';
import 'package:qr_reader/providers/ui_provider.dart';
import 'package:qr_reader/widgets/custom_navigatorbar.dart';
import 'package:qr_reader/widgets/scan_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scanListProvider =
        Provider.of<ScanListProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Historial'),
        actions: [
          IconButton(
              onPressed: () {
                scanListProvider
                    .deleteScanByType(scanListProvider.typeSelected);
              },
              icon: const Icon(Icons.delete_forever))
        ],
      ),
      body: const Center(
        child: _HomePageBody(),
      ),
      bottomNavigationBar: const CustomNavigationBar(),
      floatingActionButton: const ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  const _HomePageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);

    final currentIndex = uiProvider.selectedMenuOpt;

    final scanListProvider =
        Provider.of<ScanListProvider>(context, listen: false);

    // to_do: data_base
    // DBProvider.db.database;
    // final tempScan = ScanModel(valor: 'http://google.com');
    // DBProvider.db.newScan(tempScan);
    // DBProvider.db.getScanById(1).then((value) => print(value?.valor));

    switch (currentIndex) {
      case 0:
        scanListProvider.typeSelected = 'geo';
        scanListProvider.chargeScansByType('geo');
        return const MapsHistoryPage();
      case 1:
        scanListProvider.typeSelected = 'http';
        scanListProvider.chargeScansByType('http');
        return const DirectionsPage();
      default:
        return const MapsHistoryPage();
    }
  }
}
