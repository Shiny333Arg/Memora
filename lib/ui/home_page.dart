import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../models/alert_item.dart';
import '../data/sample_alerts.dart';
import 'widgets/alert_tile.dart';
import 'category_alert_form_page.dart';
import 'place_time_alert_form_page.dart';
import '../data/sample_categories.dart';
/*import 'create_alert_page.dart';
import 'edit_alert_page.dart';*/


class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<AlertItem> _alerts = List.from(sampleAlerts);




  // Helpers para parsear el tipo devuelto por la pantalla
  AlertType _parseType(dynamic raw) {
    if (raw is AlertType) return raw;
    if (raw is String) {
      switch (raw) {
        case 'category': return AlertType.category;
        case 'placeTime': return AlertType.placeTime;
      }
    }
    return AlertType.category; // fallback
  }


  // ========== TOGGLE ==========
  void _toggleAlert(int index, bool enabled) {
    setState(() => _alerts[index].enabled = enabled);
  }



  // ========== ELEGIR EL TIPO DE ALERTA ==========
  void _showCreateTypePicker() {
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      backgroundColor: const Color(0xFF383838),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (ctx) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.store_mall_directory, color: Colors.white),
                title: const Text('Por categoría', style: TextStyle(color: Colors.white)),
                subtitle: const Text('Serás notificado cuando estés cerca de cualquier negocio de la categoría elegida',
                    style: TextStyle(color: Colors.white70)),
                onTap: () {
                  Navigator.pop(ctx);
                  _goToCreateCategory();
                },
              ),
              const Divider(height: 0),
              ListTile(
                leading: const Icon(Icons.place, color: Colors.white),
                title: const Text('Por ubicación y horario', style: TextStyle(color: Colors.white)),
                subtitle: const Text('Elige un punto en el mapa y cuándo debes ser notificado',
                    style: TextStyle(color: Colors.white70)),
                onTap: () {
                  Navigator.pop(ctx);
                  _goToCreatePlaceTime();
                },
              ),
              const SizedBox(height: 8),
            ],
          ),
        );
      },
    );
  }





  // ========== CREAR ==========
  /*Future<void> _goToCreate() async {
    // Esperamos un Mapa con los datos de la alerta nueva
    final result = await Navigator.of(context).push<Map<String, dynamic>>(
      MaterialPageRoute(builder: (_) => const CreateAlertPage()),
    );
    if (result == null) return;

    final type = _parseType(result['type']);
    final nota = (result['nota'] as String?)?.trim() ?? '';
    if (nota.isEmpty) return;

    setState(() {
      switch (type) {
        case AlertType.category:
          final radius = (result['radius'] as int?) ?? 500;
          final categoryId = result['categoryId'] as int? ?? 0; // ajusta a tu flujo real
          _alerts.add(
            AlertItem.category(
              title: nota,
              enabled: true,
              radius: radius,
              categoryId: categoryId,
            ),
          );
          break;

        case AlertType.placeTime:
          final placeId = result['placeId'] as int?; // id de tu tabla places (cuando tengas DB)
          final startTime = result['startTime'] as String? ?? '08:00';
          final endTime = result['endTime'] as String?;
          final daysMask = result['daysMask'] as int? ?? 0;
          final radius = result['radius'] as int?; // opcional para placeTime
          // si aún no usás placeId real, podés almacenar un número temporal o adaptar tu modelo
          _alerts.add(
            AlertItem.placeTime(
              title: nota,
              enabled: true,
              placeId: placeId ?? -1,
              startTime: startTime,
              endTime: endTime,
              daysMask: daysMask,
              radius: radius,
            ),
          );
          break;
      }
    });
  }*/





  // ========== EDITAR ==========
  /*Future<void> _editAlert(int index) async {
    final current = _alerts[index];

    // Para abrir la pantalla de edición necesitas pasarle los datos actuales:
    // - Si es CATEGORY: initialRadius, categoryId, etc.
    // - Si es PLACE_TIME: initialRadius?, placeId, start/end, daysMask, etc.
    // Aquí muestro un ejemplo mínimo con nota+radio; ajusta tu EditAlertPage para más campos.
    final result = await Navigator.of(context).push<dynamic>(
      MaterialPageRoute(
        builder: (_) => EditAlertPage(
          initialText: current.title,
          initialRadius: current.radius ?? 500, // si es placeTime y no tiene radius, muestra 500 p/editar
        ),
      ),
    );

    if (result == null) return;

    if (result == '__DELETE__') {
      setState(() => _alerts.removeAt(index));
      return;
    }

    if (result is Map) {
      final nota = (result['nota'] as String?)?.trim() ?? '';
      if (nota.isEmpty) return;

      final type = _parseType(result['type'] ?? current.type);
      setState(() {
        switch (type) {
          case AlertType.category:
            final radius = (result['radius'] as int?) ?? (current.radius ?? 500);
            final categoryId = result['categoryId'] as int? ??
                (current.categoryId ?? 0);
            _alerts[index] = AlertItem.category(
              title: nota,
              enabled: current.enabled,
              radius: radius,
              categoryId: categoryId,
            );
            break;

          case AlertType.placeTime:
            final placeId = result['placeId'] as int? ?? (current.placeId ?? -1);
            final startTime = result['startTime'] as String? ??
                (current.startTime ?? '08:00');
            final endTime = result['endTime'] as String? ?? current.endTime;
            final daysMask = result['daysMask'] as int? ?? current.daysMask;
            final radius = result['radius'] as int? ?? current.radius; // opcional
            _alerts[index] = AlertItem.placeTime(
              title: nota,
              enabled: current.enabled,
              placeId: placeId,
              startTime: startTime,
              endTime: endTime,
              daysMask: daysMask,
              radius: radius,
            );
            break;
        }
      });
    }
  }*/


// ================== CREAR (Categoría) ==================
  Future<void> _goToCreateCategory() async {
    final res = await Navigator.of(context).push<Map<String, dynamic>>(
      MaterialPageRoute(
        builder: (_) => CategoryAlertFormPage(
          isEditing: false,
          categories: sampleCategories, // o [] si aún no los tienes
        ),
      ),
    );
    if (res == null) return;

    final nota = (res['nota'] as String?)?.trim() ?? '';
    if (nota.isEmpty) return;

    final radius = (res['radius'] as int?) ?? 500;
    final categoryId = res['categoryId'] as int?;
    if (categoryId == null) return;

    setState(() {
      _alerts.add(
        AlertItem.category(
          title: nota,
          enabled: true,
          radius: radius,
          categoryId: categoryId,
        ),
      );
    });
  }

// ================== CREAR (Ubicación + horario) ==================
  Future<void> _goToCreatePlaceTime() async {
    final res = await Navigator.of(context).push<Map<String, dynamic>>(
      MaterialPageRoute(
        builder: (_) => PlaceTimeAlertFormPage(
          isEditing: false,
          onPickPlace: () async {
            // TODO: reemplazar por selector de mapa real
            // Debe devolver { 'placeId': int, 'placeName': String }
            return {'placeId': 10, 'placeName': 'Biblioteca'};
          },
        ),
      ),
    );
    if (res == null) return;

    final nota = (res['nota'] as String?)?.trim() ?? '';
    if (nota.isEmpty) return;

    setState(() {
      _alerts.add(
        AlertItem.placeTime(
          title: nota,
          enabled: true,
          placeId: res['placeId'] as int? ?? -1,
          startTime: res['startTime'] as String? ?? '08:00',
          //endTime: res['endTime'] as String?,
          daysMask: res['daysMask'] as int? ?? 31, // L-V por defecto
          radius: res['radius'] as int?, // opcional
        ),
      );
    });
  }

// ================== EDITAR (redirige según tipo) ==================
  Future<void> _editAlert(int index) async {
    final current = _alerts[index];

    switch (current.type) {
      case AlertType.category:
        {
          final res = await Navigator.of(context).push<dynamic>(
            MaterialPageRoute(
              builder: (_) => CategoryAlertFormPage(
                isEditing: true,
                initialTitle: current.title,
                initialRadius: current.radius ?? 500,
                initialCategoryId: current.categoryId,
                categories: sampleCategories, // o []
                onDelete: () {
                  setState(() => _alerts.removeAt(index));
                },
              ),
            ),
          );
          if (res == null || res == '__DELETE__') return;

          if (res is Map) {
            final nota = (res['nota'] as String?)?.trim() ?? '';
            if (nota.isEmpty) return;

            final radius = (res['radius'] as int?) ?? (current.radius ?? 500);
            final categoryId = res['categoryId'] as int? ?? current.categoryId;
            if (categoryId == null) return;

            setState(() {
              _alerts[index] = AlertItem.category(
                title: nota,
                enabled: current.enabled,
                radius: radius,
                categoryId: categoryId,
              );
            });
          }
          break;
        }

      case AlertType.placeTime:
        {
          final res = await Navigator.of(context).push<dynamic>(
            MaterialPageRoute(
              builder: (_) => PlaceTimeAlertFormPage(
                isEditing: true,
                initialTitle: current.title,
                //initialRadius: current.radius,
                initialStartTime: current.startTime ?? '08:00',
                //initialEndTime: current.endTime,
                initialDaysMask: current.daysMask,
                initialPlaceId: current.placeId,
                initialPlaceName: 'Lugar seleccionado', // opcional si guardas nombre
                onPickPlace: () async {
                  // TODO: abrir mapa real
                  return {'placeId': 11, 'placeName': 'UNPA UACO'};
                },
                onDelete: () {
                  setState(() => _alerts.removeAt(index));
                },
              ),
            ),
          );
          if (res == null || res == '__DELETE__') return;

          if (res is Map) {
            final nota = (res['nota'] as String?)?.trim() ?? '';
            if (nota.isEmpty) return;

            setState(() {
              _alerts[index] = AlertItem.placeTime(
                title: nota,
                enabled: current.enabled,
                placeId: res['placeId'] as int? ?? current.placeId ?? -1,
                startTime: res['startTime'] as String? ?? current.startTime ?? '08:00',
                //endTime: res['endTime'] as String? ?? current.endTime,
                daysMask: res['daysMask'] as int? ?? current.daysMask,
                radius: res['radius'] as int? ?? current.radius,
              );
            });
          }
          break;
        }
    }
  }






// ========== VISTA ==========
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
        onPressed: _showCreateTypePicker,
        backgroundColor: const Color(0xFFFFFFFF),
        foregroundColor: const Color(0xFF000000),
        child: const Icon(Icons.add),
      ),
    );
  }
}
