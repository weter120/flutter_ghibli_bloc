import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ghibli_bloc/main/bloc/main_bloc.dart';
import 'package:flutter_ghibli_bloc/main/widgets/main_screen_body.dart';
import 'package:flutter_ghibli_bloc/utils/strings.dart';
import 'package:ghibli_api/ghibli_api.dart';

class MainScreen extends StatelessWidget {
  static MaterialPageRoute get route => MaterialPageRoute(builder: (context) => const MainScreen());

  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainBloc(context.read<GhibliApiRepository>()),
      child: Scaffold(
        appBar: AppBar(title: const Text(AppStrings.appName)),
        body: const SafeArea(
          child: MainScreenBody(),
        ),
      ),
    );
  }
}
