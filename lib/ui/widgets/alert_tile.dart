import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../models/alert_item.dart';

class AlertTile extends StatelessWidget {
  const AlertTile({
    super.key,
    required this.alert,
    required this.onChanged,
  });

  final AlertItem alert;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.location_on, color: Colors.red),
        title: Text(alert.title),
        trailing: Switch.adaptive(
          value: alert.enabled,
          onChanged: onChanged,
          activeColor: kSwitchActive,
          inactiveThumbColor: kSwitchThumbInactive,
          inactiveTrackColor: kSwitchTrackInactive,
        ),
      ),
    );
  }
}
