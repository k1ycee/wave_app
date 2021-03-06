import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ContractLinkUp {
  late Client httpClient;
  late Web3Client ethClient;

  static String rinkbyAddress = dotenv.env["RINKEBY_ADDRESS"]!;

  ContractLinkUp() {
    httpClient = Client();
    ethClient = Web3Client(dotenv.env["ETH_CLIENT"]!, httpClient);
  }

  Future<List<dynamic>> query(String functionName, List<dynamic> args) async {
    final contract = await loadContract();
    final ethFunction = contract.function(functionName);
    final result = await ethClient.call(
        contract: contract, function: ethFunction, params: args);
    return result;
  }

  Future<DeployedContract> loadContract() async {
    String abi = await rootBundle.loadString("assets/wave_abi.json");
    String contractAddress = dotenv.env["CONTRACT_ADDRESS"]!;

    final contract = DeployedContract(
      ContractAbi.fromJson(abi, "WavePortal"),
      EthereumAddress.fromHex(contractAddress),
    );

    return contract;
  }

  Future<BigInt> getWaves() async {
    List<dynamic> result = await query("getTotalWaves", []);
    return result[0];
  }

  Future<List<dynamic>> getAllWaves() async {
    List<dynamic> result = await query("getAllWaves", []);
    return result;
  }

  Future<String> send(String functionName, List<dynamic> args) async {
    EthPrivateKey credential =
        EthPrivateKey.fromHex(dotenv.env["ETH_PRIVATEKEY"]!);

    DeployedContract contract = await loadContract();
    final ethFunction = contract.function(functionName);
    final result = ethClient.sendTransaction(
      credential,
      Transaction.callContract(
        contract: contract,
        function: ethFunction,
        parameters: args,
        maxGas: 300000
      ),
      chainId: 4,
    );
    return result;
  }

  Future wave(String message) async {
    String result = await send("wave", [message]);
    return result;
  }
}
