import 'package:flutter/material.dart';
import 'package:wave_app/backend/link_contract.dart';
import 'package:wave_app/injector.dart';


class WaveViewModel extends ChangeNotifier{

  final contract = inject<ContractLinkUp>();

  int? _waves = 0;

  int get waves => _waves!;

  List _allWaves = [];

  List get allWaves => _allWaves;
  Future<void> getWaves()async{
    final BigInt result =  await contract.getWaves();
    _waves = result.toInt();
    print(_waves);
    notifyListeners();
  }

  Future<void> getAllWaves()async{
    final result = await contract.getAllWaves();
    // var time = result[0][0][2];
    // print(timeago.format(DateTime.parse("${time.toInt()}")));
    _allWaves = result[0];

    notifyListeners();
  }


  Future<void> sendWave(String message)async{
    await contract.wave(message); 
    notifyListeners();
  }
}