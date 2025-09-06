import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../models/alert_item.dart';
import '../data/sample_alerts.dart';
import 'widgets/alert_tile.dart';
import 'create_alert_page.dart';
import 'edit_alert_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<AlertItem> _alerts = List.from(sampleAlerts);

  //void _addAlert() {
    //setState(() {
      //_alerts.add(AlertItem("Probando", enabled: true));
    //});
  //}

  //FUNCIONES
  Future<void> _goToCreate() async {
    final result = await Navigator.of(context).push<String>(
      MaterialPageRoute(builder: (_) => const CreateAlertPage()),
    );
    if (result != null && result.trim().isNotEmpty) {
      setState(() {
        _alerts.add(AlertItem(result.trim(), enabled: true));
      });
    }
  }


  void _toggleAlert(int index, bool enabled) {
    setState(() => _alerts[index].enabled = enabled);
    // TODO: activar/desactivar geocerca real aquí
  }


  Future<void> _editAlert(int index) async {
    final current = _alerts[index];
    final result = await Navigator.of(context).push<String>(
      MaterialPageRoute(builder: (_) => EditAlertPage(initialText: current.title)),
    );

    if (result == null) return;

    if (result == '__DELETE__') {
      setState(() => _alerts.removeAt(index));
      return;
    }

    if (result.trim().isNotEmpty) {
      setState(() {
        _alerts[index] = AlertItem(result.trim(), enabled: current.enabled);
      });
    }
  }









//VISTA
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Memora')),
      body: _alerts.isEmpty
          ? const Center(
        child: Text("No hay alertas aún", style: TextStyle(color: Colors.white)),
      )
          : Scrollbar(
        thumbVisibility: true,
        child: ListView.separated(
          padding: kListPadding,
          itemCount: _alerts.length,
          separatorBuilder: (_, __) => const SizedBox(height: 6),
          itemBuilder: (context, index) {
            final alert = _alerts[index];
            return AlertTile(
              alert: alert,
              onChanged: (val) => _toggleAlert(index, val),
              onTap: () => _editAlert(index),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        //onPressed: _addAlert,
        onPressed: _goToCreate,
        backgroundColor: const Color(0xFFFFFFFF),
        foregroundColor: const Color(0xFF000000),
        child: const Icon(Icons.add),
      ),
    );
  }
}
