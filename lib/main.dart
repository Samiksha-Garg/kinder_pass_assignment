import 'package:flutter/material.dart';
import 'package:kinder_pass_assignment/helper/theme.dart';
import 'package:kinder_pass_assignment/providers/news.dart';
import 'package:kinder_pass_assignment/screens/home/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<News>(
          create: (context) => News(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: theme(),
          home: const HomeScreen()),
    );
  }
}
