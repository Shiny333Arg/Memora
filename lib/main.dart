import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'ui/home_page.dart';

void main() => runApp(const MemoraApp());

class MemoraApp extends StatelessWidget {
  const MemoraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Memora',
      theme: appTheme,
      home: const HomePage(),
    );
  }
}
