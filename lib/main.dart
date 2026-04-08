import 'package:flutter/material.dart';
import 'models/quest.dart';
import 'pages/home_page.dart';
import 'pages/quest_detail_page.dart';
import 'pages/quest_form_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const routeHome = '/';
  static const routeDetail = '/detail';
  static const routeForm = '/form';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quest Book',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
      ),
      initialRoute: routeHome,
      routes: {
        routeHome: (_) => const HomePage(),
      },
      onGenerateRoute: (settings) {
        // Route dengan data (arguments) kita tangani di sini
        if (settings.name == routeDetail) {
          final quest = settings.arguments as Quest;
          return MaterialPageRoute(
            builder: (_) => QuestDetailPage(quest: quest),
            settings: settings,
          );
        }

        if (settings.name == routeForm) {
          // Bisa null (create) atau Quest (edit)
          final quest = settings.arguments as Quest?;
          return MaterialPageRoute(
            builder: (_) => QuestFormPage(existing: quest),
            settings: settings,
          );
        }

        return null;
      },
      );
  }
}