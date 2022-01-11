import 'package:flutter/material.dart';
import 'package:wave_app/backend/link_contract.dart';
import 'package:wave_app/injector.dart';

class WaveViewModel extends ChangeNotifier{

  final contract = inject<ContractLinkUp>();

  int? _waves = 0;

  int get waves => _waves!;

  Future<void> getWaves()async{
    final BigInt result =  await contract.getWaves();
    _waves = result.toInt();
    print(_waves);
    getAllWaves();
    notifyListeners();
  }

  Future<void> getAllWaves()async{
    final result = await contract.getAllWaves();
    print(result);
    notifyListeners();
  }


  Future<void> sendWave(String message)async{
    await contract.wave(message); 
    notifyListeners();
  }
}