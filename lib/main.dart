import 'package:flutter/material.dart';
import 'models/alert_item.dart';
import 'data/sample_alerts.dart';

void main() => runApp(const MemoraApp());

class MemoraApp extends StatelessWidget {
  const MemoraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // quita la cinta de "debug"
      title: 'Memora',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.white, // lo dejo como lo tenías
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _MySeparator extends StatelessWidget {
  const _MySeparator({super.key});
  @override
  Widget build(BuildContext context) => const SizedBox(height: 0);
}

class _HomePageState extends State<HomePage> {
  // Traemos datos iniciales (modelo AlertItem) desde sample_alerts.dart
  final List<AlertItem> _alerts = List.from(sampleAlerts);

  void _addAlert() {
    setState(() {
      _alerts.add(AlertItem("Probando", enabled: true));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF525252), // color de fondo

      // Header
      appBar: AppBar(
        backgroundColor: const Color(0xFF383838), // color de header
        title: const Text(
          "Memora",
          style: TextStyle(color: Color(0xFFFFFFFF)), // texto blanco
        ),
        centerTitle: true,
      ),

      // Lista con Scrollbar
      body: _alerts.isEmpty
          ? const Center(
        child: Text(
          "No hay alertas aún",
          style: TextStyle(color: Colors.white),
        ),
      )
          : Scrollbar(
        thumbVisibility: true,
        child: ListView.builder(
          itemCount: _alerts.length,
          itemBuilder: (context, index) {
            final alert = _alerts[index];
            return Card(
              margin: const EdgeInsets.symmetric(
                  vertical: 6.0, horizontal: 12.0),
              child: ListTile(
                leading:
                const Icon(Icons.location_on, color: Colors.red),
                title: Text(alert.title),
                trailing: Switch.adaptive(
                  value: alert.enabled,
                  onChanged: (val) {
                    setState(() => alert.enabled = val);
                    // aquí luego vas a activar/desactivar la geocerca real
                  },
                  // (opcional) personalización suave del switch
                  activeColor: const Color(0xFF1E3A8A),
                  inactiveThumbColor: const Color(0xFFDDE3F1),
                  inactiveTrackColor: const Color(0xFF3B4148),
                ),
                //onTap: () =>
                    //setState(() => alert.enabled = !alert.enabled),
              ),
            );
          },
        ),
      ),

      // Botón para añadir alertas
      floatingActionButton: FloatingActionButton(
        onPressed: _addAlert,
        backgroundColor: const Color(0xFFFFFFFF), // color de fondo
        foregroundColor: const Color(0xFF000000), // color del ícono
        child: const Icon(Icons.add),
      ),
    );
  }
}
