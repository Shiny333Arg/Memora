// lib/ui/category_alert_form_page.dart
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../models/category_item.dart';

class CategoryAlertFormPage extends StatefulWidget {
  const CategoryAlertFormPage({
    super.key,
    this.isEditing = false,
    this.initialTitle,
    this.initialRadius = 500,
    this.initialCategoryId,
    required this.categories, // lista de categorías disponibles
    this.onDelete,            // opcional: callback si querés ejecutar algo extra al borrar
  });

  final bool isEditing;
  final String? initialTitle;
  final int initialRadius;
  final int? initialCategoryId;
  final List<CategoryItem> categories;
  final VoidCallback? onDelete;

  @override
  State<CategoryAlertFormPage> createState() => _CategoryAlertFormPageState();
}

class _CategoryAlertFormPageState extends State<CategoryAlertFormPage> {
  late final TextEditingController _titleCtrl;
  late double _radius;
  int? _categoryId;

  @override
  void initState() {
    super.initState();
    _titleCtrl = TextEditingController(text: widget.initialTitle ?? '');
    _radius = widget.initialRadius.toDouble().clamp(200, 1000);
    _categoryId = widget.initialCategoryId ??
        (widget.categories.isNotEmpty ? widget.categories.first.id : null);
  }

  @override
  void dispose() {
    _titleCtrl.dispose();
    super.dispose();
  }

  void _save() {
    final text = _titleCtrl.text.trim();
    if (text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Escribe un título para la alerta')),
      );
      return;
    }
    if (_categoryId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Selecciona una categoría')),
      );
      return;
    }

    Navigator.of(context).pop(<String, dynamic>{
      'type': 'category',
      'nota': text,
      'radius': _radius.round(),
      'categoryId': _categoryId,
    });
  }

  void _delete() {
    widget.onDelete?.call(); // opcional
    Navigator.of(context).pop('__DELETE__');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Respeta tu estilo de AppBar y colores
      appBar: AppBar(
        title: Text(widget.isEditing ? 'Editar alerta' : 'Nueva alerta'),
        actions: [
          if (widget.isEditing)
            IconButton(
              tooltip: 'Eliminar',
              onPressed: _delete,
              icon: const Icon(Icons.delete),
            ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Nota (mismo look & feel que tu CreateAlertPage)
            TextField(
              controller: _titleCtrl,
              autofocus: !widget.isEditing,
              style: const TextStyle(color: Colors.black), // letras negras
              textInputAction: TextInputAction.done,
              minLines: 6,
              maxLines: 6,
              maxLength: 255,
              onSubmitted: (_) => _save(),
              decoration: const InputDecoration(
                hintText: 'Añadir nota. Ej: Comprar lapiceras.',
                counterStyle: TextStyle(color: Colors.white),
              ),
            ),

            const SizedBox(height: 16),

            // Selector de categoría
            const Text('Categoría', style: TextStyle(color: Colors.white, fontSize: 16)),
            const SizedBox(height: 8),
            DropdownButtonFormField<int>(
              value: _categoryId,
              items: widget.categories
                  .map(
                    (c) => DropdownMenuItem<int>(
                  value: c.id,
                  child: Text(c.name),
                ),
              )
                  .toList(),
              onChanged: (v) => setState(() => _categoryId = v),
            ),

            const SizedBox(height: 24),

            // Slider de distancia (mismo estilo que el original)
            Text(
              'Distancia de detección: ${_radius.round()} m',
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
            Slider(
              value: _radius,
              min: 200,
              max: 1000,
              divisions: 8, // pasos de 100
              label: '${_radius.round()} m',
              onChanged: (val) => setState(() => _radius = val),
            ),

            const Spacer(),

            // Botonera
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
                      child: Text(widget.isEditing ? 'Guardar cambios' : 'Guardar'),
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
