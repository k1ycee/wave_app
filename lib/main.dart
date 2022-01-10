import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:wave_app/injector.dart';
import 'package:wave_app/views/wave_home.dart';
import 'package:wave_app/vm/waves_vm.dart';

void main() async{
  injector();
  await dotenv.load(fileName: ".env");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (context) => WaveViewModel(),
        child: Wave(),
      ),
    );
  }
}
