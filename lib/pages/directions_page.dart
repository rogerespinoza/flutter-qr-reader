import 'package:flutter/material.dart';
import 'package:qr_reader/widgets/scan_tiles.dart';

class DirectionsPage extends StatelessWidget {
  const DirectionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ScanTiless(tipo: 'http');
  }
}