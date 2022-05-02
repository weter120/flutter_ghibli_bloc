import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ghibli_bloc/main/screen/main_screen.dart';
import 'package:flutter_ghibli_bloc/utils/strings.dart';
import 'package:ghibli_api/ghibli_api.dart';

void main() {
  runApp(const GhibliApp());
}

class GhibliApp extends StatelessWidget {
  const GhibliApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => GhibliApiRepository(),
      child: MaterialApp(
        title: AppStrings.appName,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MainScreen(),
      ),
    );
  }
}
