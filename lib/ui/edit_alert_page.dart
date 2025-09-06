import 'package:flutter/material.dart';

class EditAlertPage extends StatefulWidget {
  const EditAlertPage({
    super.key,
    required this.initialText,
  });

  final String initialText;

  @override
  State<EditAlertPage> createState() => _EditAlertPageState();
}

class _EditAlertPageState extends State<EditAlertPage> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialText);
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
    Navigator.of(context).pop<String>(text); // devolvemos el nuevo título
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
                counterStyle: TextStyle(color: Colors.black),
              ),
              onSubmitted: (_) => _save(),
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
