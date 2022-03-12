import 'package:flutter/material.dart';
import 'package:qr_reader/widgets/scan_tiles.dart';

class MapsHistoryPage extends StatelessWidget {
  const MapsHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final scanListProvider = Provider.of<ScanListProvider>(context);
    // final scans = scanListProvider.scans;
    return const ScanTiless(tipo: 'geo');
  }
}
