import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app_cubit_logics.dart';
import 'package:travel_app/cubit/app_cubits.dart';
// import 'package:travel_app/model/data_model.dart';s
import 'package:travel_app/services/data_services.dart';
// import 'package:travel_app/pages/detail_page.dart';
// import 'package:travel_app/pages/welcome_page.dart';
// import 'package:travel_app/pages/navpages/main_page.dart';
// import 'package:travel_app/pages/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider<AppCubits>(
          create: (context) => AppCubits(data: DataServices()),
          child: const AppCubitLogics()),
    );
  }
}
