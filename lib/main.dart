import 'package:flutter/material.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'dart:io' show Platform;
import 'views/viewRouter.dart';
import 'services/db/dbService.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 👇 Detecta plataforma y configura SQLite
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }

  await DBService.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Huella de Carbono',
      debugShowCheckedModeBanner: false,
      home: const ViewRouter(),
    );
  }
}