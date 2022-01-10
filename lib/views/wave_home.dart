import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wave_app/utils/margins.dart';
import 'package:wave_app/vm/waves_vm.dart';
import 'package:wave_app/widgets/customText.dart';

class Wave extends StatefulWidget {
  const Wave({Key? key}) : super(key: key);

  @override
  _WaveState createState() => _WaveState();
}

class _WaveState extends State<Wave> {
  @override
  Widget build(BuildContext context) {
    final waveModel = Provider.of<WaveViewModel>(context);
    
        return Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              verticalSpaceMassive,
              Center(
                child: CustomText(
                  "👋 Hey there!",
                  fontWeight: FontWeight.bold,
                ),
              ),
              verticalSpaceSmall,
              Container(
                height: 100,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Center(
                  child: CustomText(
                    "I am Mysterious and I am seriously hooking this flutter app to the blockchain cool right? I hope you have connected your Ethereum wallet, so you'd be able to wave at me!",
                    fontSize: 16,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              verticalSpaceMedium,
              Center(
                child: CustomText(
                  "So far, ${waveModel.waves} people have waved at me.",
                  fontSize: 16,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        );
  }
}
