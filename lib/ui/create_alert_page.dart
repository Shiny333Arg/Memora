import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class CreateAlertPage extends StatefulWidget {
  const CreateAlertPage({super.key});

  @override
  State<CreateAlertPage> createState() => _CreateAlertPageState();
}

class _CreateAlertPageState extends State<CreateAlertPage> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onSave() {
    final text = _controller.text.trim();
    if (text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Escribe un título para la alerta')),
      );
      return;
    }
    Navigator.of(context).pop(text); // devolvemos el título
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nueva alerta')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              autofocus: true,
              style: const TextStyle(color: Colors.black), // letras negras
              textInputAction: TextInputAction.done,
              minLines: 6, // altura mínima equivalente a 2 líneas
              maxLines: 6, // evita que crezca más al escribir
              maxLength: 255,
              onSubmitted: (_) => _onSave(),
              decoration: const InputDecoration(
                //labelText: 'Título de la alerta',
                //hintText: 'Ej.: Entregar trabajo práctico',
                hintText: 'Añadir nota. Ej: Comprar lapiceras.',
                counterStyle: TextStyle(color: Colors.white),
              ),
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
                      onPressed: _onSave,
                      child: const Text('Guardar'),
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
