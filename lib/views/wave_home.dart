import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:wave_app/utils/buttonStyle.dart';
import 'package:wave_app/utils/margins.dart';
import 'package:wave_app/views/all_wavers.dart';
import 'package:wave_app/vm/waves_vm.dart';
import 'package:wave_app/widgets/button.dart';
import 'package:wave_app/widgets/customText.dart';
import 'package:wave_app/widgets/textField.dart';

class Wave extends StatefulWidget {
  const Wave({Key? key}) : super(key: key);

  @override
  _WaveState createState() => _WaveState();
}

TextEditingController messageController = TextEditingController();

class _WaveState extends State<Wave> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WaveViewModel>.reactive(
      viewModelBuilder: () => WaveViewModel(),
      onModelReady: (waveModel) => waveModel.getWaves(),
      builder: (context, waveModel, child) {
        if (waveModel.busy) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return Scaffold(
          resizeToAvoidBottomInset: true,
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
              verticalSpaceMedium,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  children: [
                    CustomTextField(
                      title: "Send me a wave...",
                      controller: messageController,
                    ),
                    verticalSpaceMedium,
                    CustomButton(
                      buttonText: "Send Wave",
                      buttonStyle: buttonStyle(color: Colors.grey),
                      onPressed: () {
                        waveModel.sendWave(messageController.text);
                        messageController.clear();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AllWavers(),
                          ),
                        );
                      },
                    ),
                    verticalSpaceMedium,
                    CustomButton(
                      buttonText: "See Wavers",
                      buttonStyle: buttonStyle(color: Colors.green),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AllWavers(),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
