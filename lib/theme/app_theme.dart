import 'package:flutter/material.dart';

// Colores centralizados
const kBgColor = Color(0xFF525252);
const kAppBarColor = Color(0xFF383838);
const kAppBarText = Color(0xFFFFFFFF);

const kSwitchActive = Color(0xFF1E3A8A);
const kSwitchThumbInactive = Color(0xFFDDE3F1);
const kSwitchTrackInactive = Color(0xFF3B4148);

// Espaciados / estilos
const kListPadding = EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0);
const kCardRadius = 12.0;

// Tema de la app
final ThemeData appTheme = ThemeData(
  useMaterial3: true,
  colorSchemeSeed: Colors.white, // respetando tu configuración
  scaffoldBackgroundColor: kBgColor,
  appBarTheme: const AppBarTheme(
    backgroundColor: kAppBarColor,
    centerTitle: true,
    titleTextStyle: TextStyle(
      color: kAppBarText,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
    iconTheme: IconThemeData(color: kAppBarText),
  ),
  cardTheme: const CardThemeData(
    surfaceTintColor: Colors.transparent,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(kCardRadius)),
    ),
    margin: EdgeInsets.zero,
  ),

);
