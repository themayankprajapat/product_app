import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:product_app/models/productmodel.dart';
import 'package:product_app/screens/home_screen.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ProductCardModelAdapter());
  await Hive.openBox<ProductCardModel>('productcardmodel');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Product App',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        textTheme: const TextTheme(
          headline5: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          headline6: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          subtitle1: TextStyle(
            letterSpacing: 1,
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          subtitle2: TextStyle(
            letterSpacing: 1,
            fontSize: 10,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            color: Colors.blueGrey,
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
