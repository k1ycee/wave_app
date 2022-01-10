import 'package:get_it/get_it.dart';
import 'package:wave_app/backend/link_contract.dart';

GetIt inject =  GetIt.instance;


void injector(){
  inject.registerLazySingleton(() => ContractLinkUp());
}