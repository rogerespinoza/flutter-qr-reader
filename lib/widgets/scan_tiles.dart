import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/providers/scan_list_provider.dart';
import 'package:qr_reader/utils/utils.dart';

class ScanTiless extends StatelessWidget {
  final String tipo;
  const ScanTiless({Key? key, required this.tipo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans;
    return ListView.builder(
        itemCount: scans.length,
        itemBuilder: (_, i) => Dismissible(
              key: UniqueKey(),
              background: Container(
                color: Colors.red,
              ),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                if (direction == DismissDirection.startToEnd) {
                  // print('startToEnd');
                } else if (direction == DismissDirection.endToStart) {
                  // print('endToStart');
                  Provider.of<ScanListProvider>(context, listen: false)
                      .deleteScanById(
                    scans[i].id!,
                  );
                }
              },
              child: ListTile(
                leading: Icon(
                  tipo == 'http' ? Icons.home_outlined : Icons.map,
                  color: Theme.of(context).primaryColor,
                ),
                title: Text(scans[i].valor),
                subtitle: Text(scans[i].id.toString()),
                trailing:
                    const Icon(Icons.keyboard_arrow_right, color: Colors.grey),
                onTap: () => launchURL(context, scans[i]),
              ),
            ));
  }
}
