import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'config/theme/theme_manger.dart';
import 'logic/cubit/events_cubit.dart';
import 'ui/home_screen.dart';

import 'utils/di/di_container.dart' as di;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task',
      theme: getApplicationTheme(),
      home:  BlocProvider<EventsCubit>(
        create: (context) => di.instance<EventsCubit>(),
        child: const HomeScreen(),
      ),
    );
  }
}
