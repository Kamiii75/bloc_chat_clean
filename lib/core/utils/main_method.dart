import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'injections.dart'as di;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'bloc_export.dart';

class MainMethods {
  static Future<void> init() async {
    // init binding
    WidgetsFlutterBinding.ensureInitialized();

    // load env
    await dotenv.load();
    // init supabase
    String supabaseUrl = dotenv.env["SUPABASE_URL"]??"";
    String supabaseKey = dotenv.env["SUPABASE_KEY"]??"";
    await Supabase.initialize(url: supabaseUrl, anonKey: supabaseKey);



    // set the orientation to portrait only (there is no need for landscape)
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getTemporaryDirectory(),
    );
    await di.init();

  }
}
