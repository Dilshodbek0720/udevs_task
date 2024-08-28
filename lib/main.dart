import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'src/config/app/app.dart';
import 'src/features/presentation/cubits/select_current_day/select_current_day_cubit.dart';
import 'src/features/presentation/pages/locator.dart';

void main() {
  setupLocator();
  runApp(BlocProvider(
    create: (context) => SelectCurrentDayCubit(),
    child: const MainApp(),
  ));
}
