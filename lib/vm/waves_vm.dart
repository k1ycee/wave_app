import 'package:flutter/material.dart';
import 'package:wave_app/backend/link_contract.dart';
import 'package:wave_app/injector.dart';

class WaveViewModel extends ChangeNotifier {
  final contract = inject<ContractLinkUp>();

  int? _waves = 0;

  int get waves => _waves!;

  List _allWaves = [];

  List get allWaves => _allWaves;

  bool _busy = false;
  bool get busy => _busy;

  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }

  Future<void> getWaves() async {
    setBusy(true);
    final BigInt result = await contract.getWaves();
    _waves = result.toInt();
    setBusy(false);
    notifyListeners();
  }

  Future<void> getAllWaves() async {
    setBusy(true);
    final result = await contract.getAllWaves();
    _allWaves = result[0];
    setBusy(false);
    notifyListeners();
  }

  Future<void> sendWave(String message) async {
    setBusy(true);
    await contract.wave(message);
    getAllWaves();
    setBusy(false);
    notifyListeners();
  }
}
