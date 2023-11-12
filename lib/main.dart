import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
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

          primarySwatch: Colors.blueGrey,
        ),
        routerConfig: NyAppRouter.returnRouter(),

        builder: EasyLoading.init(),
      ),
    );});
  }
}


