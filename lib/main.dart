import 'package:flutter/material.dart';

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
        colorSchemeSeed: Colors.white,
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

class _HomePageState extends State<HomePage> {
  // Lista de alertas simuladas (por ahora texto fijo).
  final List<String> _alerts = [
    "Recordar entregar el trabajo práctico",
    "Comprar hojas A4",
    "Visitar la biblioteca"
  ];

  void _addAlert() {
    // Más adelante: abrir pantalla o modal para crear alerta.
    // Por ahora, añadimos un ejemplo rápido.
    setState(() {
      _alerts.add("Nueva alerta generada");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF525252), //color de fondo


      //header
      appBar: AppBar(
        backgroundColor: const Color(0xFF383838), //color de header
        title: const Text(
          "Memoraaaaaaaaaaaaa",
          style: TextStyle(color: Color(0xFFFFFFFF),), // texto blanco
        ),
        centerTitle: true,
      ),


      body: _alerts.isEmpty
          ? const Center(child: Text("No hay alertas aún"))
          : Scrollbar(
        thumbVisibility: true, // hace visible la barra de scroll
        child: ListView.builder(
          itemCount: _alerts.length,
          itemBuilder: (context, index) {
            final alert = _alerts[index];
            return Card(
              margin: const EdgeInsets.symmetric(
                  vertical: 6.0, horizontal: 12.0),
              child: ListTile(
                leading: const Icon(Icons.location_on, color: Colors.red),
                title: Text(alert),
              ),
            );
          },
        ),
      ),



      //botón para añadir alertas
      floatingActionButton: FloatingActionButton(
        onPressed: _addAlert,
        backgroundColor: const Color(0xFFFFFFFF), // color de fondo (azul en este caso)
        foregroundColor: const Color(0xFF000000), // color del ícono (blanco)
        child: const Icon(Icons.add),
      ),
    );
  }
}
