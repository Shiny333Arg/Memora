import 'package:flutter/material.dart';

class EditAlertPage extends StatefulWidget {
  const EditAlertPage({
    super.key,
    required this.initialText,
    required this.initialRadius,
  });

  final String initialText;
  final int initialRadius;

  @override
  State<EditAlertPage> createState() => _EditAlertPageState();
}

class _EditAlertPageState extends State<EditAlertPage> {
  late final TextEditingController _controller;
  late double _radius;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialText);
    _radius = widget.initialRadius.toDouble().clamp(200, 1000);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _save() {
    final text = _controller.text.trim();
    if (text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Escribe un título para la alerta')),
      );
      return;
    }
    Navigator.of(context).pop(<String, dynamic>{
      'nota': text,
      'radio': _radius.round(),
    });
  }

  void _delete() {
    // Señal simple para “borrar”
    Navigator.of(context).pop<String>('__DELETE__');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar alerta'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            tooltip: 'Eliminar',
            onPressed: _delete,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              style: const TextStyle(color: Colors.black),
              minLines: 6,
              maxLines: 6,
              maxLength: 255,
              decoration: const InputDecoration(
                hintText: 'Editar nota…',
                counterStyle: TextStyle(color: Colors.white),
              ),
              onSubmitted: (_) => _save(),
            ),


            const SizedBox(height: 24),


            Text(
              'Distancia de detección: ${_radius.round()} m',
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
            Slider(
              value: _radius,
              min: 200,
              max: 1000,
              divisions: 8,
              label: '${_radius.round()} m',
              onChanged: (v) => setState(() => _radius = v),
            ),

            const Spacer(),
            SafeArea(
              top: false,
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Cancelar'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: FilledButton(
                      onPressed: _save,
                      child: const Text('Guardar cambios'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
