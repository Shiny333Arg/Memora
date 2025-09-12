// lib/ui/place_time_alert_form_page.dart
import 'package:flutter/material.dart';

class PlaceTimeAlertFormPage extends StatefulWidget {
  const PlaceTimeAlertFormPage({
    super.key,
    this.isEditing = false,
    this.initialTitle,
    this.initialStartTime = '08:00',
    //this.initialEndTime,
    this.initialDaysMask = 31, // L-V
    this.initialPlaceId,
    this.initialPlaceName,
    this.onPickPlace, // callback para abrir el mapa y devolver {placeId, placeName}
    this.onDelete,    // opcional: lógica extra al borrar
  });

  final bool isEditing;
  final String? initialTitle;
  final String initialStartTime;
  //final String? initialEndTime;
  final int initialDaysMask;
  final int? initialPlaceId;
  final String? initialPlaceName;
  final Future<Map<String, dynamic>?> Function()? onPickPlace;
  final VoidCallback? onDelete;

  @override
  State<PlaceTimeAlertFormPage> createState() => _PlaceTimeAlertFormPageState();
}

class _PlaceTimeAlertFormPageState extends State<PlaceTimeAlertFormPage> {
  late final TextEditingController _titleCtrl;
  late String _startTime;
  //String? _endTime;
  int _daysMask = 31;

  int? _placeId;
  String _placeName = 'Sin lugar seleccionado';

  @override
  void initState() {
    super.initState();
    _titleCtrl = TextEditingController(text: widget.initialTitle ?? '');
    _startTime = widget.initialStartTime;
    //_endTime = widget.initialEndTime;
    _daysMask = widget.initialDaysMask;
    _placeId = widget.initialPlaceId;
    _placeName = widget.initialPlaceName ?? _placeName;
  }

  @override
  void dispose() {
    _titleCtrl.dispose();
    super.dispose();
  }

  // ---- Helpers de bitmask de días ----
  bool _dayOn(int bit) => (_daysMask & bit) != 0;
  void _setDay(int bit, bool on) {
    setState(() => _daysMask = on ? (_daysMask | bit) : (_daysMask & ~bit));
  }

  Widget _dayChip(String label, int bit) {
    final selected = _dayOn(bit);
    return ChoiceChip(
      label: Text(label),
      selected: selected,
      onSelected: (v) => _setDay(bit, v),
    );
  }

  // ---- Time pickers ----
  Future<void> _pickStartTime() async {
    final parts = _startTime.split(':');
    final initial = TimeOfDay(
      hour: int.tryParse(parts[0]) ?? 8,
      minute: int.tryParse(parts[1]) ?? 0,
    );
    final picked = await showTimePicker(context: context, initialTime: initial);
    if (picked != null) {
      final h = picked.hour.toString().padLeft(2, '0');
      final m = picked.minute.toString().padLeft(2, '0');
      setState(() => _startTime = '$h:$m');
    }
  }

  /*Future<void> _pickEndTime() async {
    final base = _endTime ?? '09:00';
    final parts = base.split(':');
    final initial = TimeOfDay(
      hour: int.tryParse(parts[0]) ?? 9,
      minute: int.tryParse(parts[1]) ?? 0,
    );
    final picked = await showTimePicker(context: context, initialTime: initial);
    if (picked != null) {
      final h = picked.hour.toString().padLeft(2, '0');
      final m = picked.minute.toString().padLeft(2, '0');
      setState(() => _endTime = '$h:$m');
    }
  }*/

  // ---- Lugar (mapa placeholder) ----
  Future<void> _pickPlace() async {
    if (widget.onPickPlace == null) return;
    final res = await widget.onPickPlace!.call();
    if (res == null) return;
    setState(() {
      _placeId = res['placeId'] as int?;
      _placeName = (res['placeName'] as String?) ?? _placeName;
    });
  }

  // ---- Guardar/Borrar ----
  void _save() {
    final title = _titleCtrl.text.trim();
    if (title.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Escribe una nota')),
      );
      return;
    }
    if (_placeId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Selecciona un lugar en el mapa')),
      );
      return;
    }
    if (_daysMask == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Selecciona al menos un día')),
      );
      return;
    }

    Navigator.of(context).pop(<String, dynamic>{
      'type': 'placeTime',
      'nota': title,
      'placeId': _placeId,
      'startTime': _startTime,
      //'endTime': _endTime, // puede ser null
      'daysMask': _daysMask,
    });
  }

  void _delete() {
    widget.onDelete?.call();
    Navigator.of(context).pop('__DELETE__');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar con opción de borrar en edición
      appBar: AppBar(
        title: Text(widget.isEditing ? 'Editar alerta (Ubicación + horario)' : 'Nueva alerta (Ubicación + horario)'),
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
            // Nota (mismo estilo que antes)
            TextField(
              controller: _titleCtrl,
              autofocus: !widget.isEditing,
              style: const TextStyle(color: Colors.black),
              minLines: 4,
              maxLines: 4,
              maxLength: 255,
              decoration: const InputDecoration(
                hintText: 'Añadir nota. Ej: Comprar lapiceras.',
                counterStyle: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 16),

            // ----- Mapa (placeholder) -----
            const Text('Lugar', style: TextStyle(color: Colors.white, fontSize: 16)),
            const SizedBox(height: 8),
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF3B4148),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFF5A6068)),
                ),
                child: Stack(
                  children: [
                    const Center(
                      child: Text(
                        'Mapa (placeholder)',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                    Positioned(
                      left: 12,
                      right: 12,
                      bottom: 12,
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              _placeName,
                              style: const TextStyle(color: Colors.white),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(width: 8),
                          OutlinedButton.icon(
                            onPressed: _pickPlace,
                            icon: const Icon(Icons.place),
                            label: const Text('Seleccionar en el mapa'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // ----- Horario -----
            //const Text('Horario', style: TextStyle(color: Colors.white, fontSize: 16)),
            //const SizedBox(height: 8),
            /*Row(
              children: [
                Expanded(
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text('Inicio', style: TextStyle(color: Colors.white)),
                    subtitle: Text(_startTime, style: const TextStyle(color: Colors.white)),
                    trailing: const Icon(Icons.access_time),
                    onTap: _pickStartTime,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text('Fin (opcional)', style: TextStyle(color: Colors.white)),
                    subtitle: Text(_endTime ?? '—', style: const TextStyle(color: Colors.white)),
                    trailing: const Icon(Icons.access_time),
                    onTap: _pickEndTime,
                  ),
                ),
              ],
            ),*/
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Horario', style: TextStyle(color: Colors.white)),
              subtitle: Text(_startTime, style: const TextStyle(color: Colors.white)),
              trailing: const Icon(Icons.access_time),
              onTap: _pickStartTime,
            ),

            const SizedBox(height: 8),

            // ----- Días -----
            const Text('Días', style: TextStyle(color: Colors.white, fontSize: 16)),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: [
                _dayChip('Lu', 1),
                _dayChip('Ma', 2),
                _dayChip('Mi', 4),
                _dayChip('Ju', 8),
                _dayChip('Vi', 16),
                _dayChip('Sa', 32),
                _dayChip('Do', 64),
              ],
            ),

            const Spacer(),

            // ----- Botonera -----
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
