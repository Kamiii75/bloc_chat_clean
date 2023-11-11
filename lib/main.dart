import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'core/utils/bloc_export.dart';
import 'core/utils/injections.dart';
import 'core/utils/main_method.dart';
import 'core/utils/page_router.dart';

Future<void> main() async {
  await MainMethods.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
        builder: (context, orientation, screenType) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<WelcomeBloc>()),
        BlocProvider(create: (context) => sl<AuthBloc>()),

      ],
      child: MaterialApp.router(

        debugShowCheckedModeBanner: false,
        showSemanticsDebugger: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        routerConfig: NyAppRouter.returnRouter(),
      ),
    );});
  }
}


