import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:wave_app/vm/waves_vm.dart';
import 'package:wave_app/widgets/customText.dart';
import 'package:timeago/timeago.dart' as timeago;

class AllWavers extends StatefulWidget {
  const AllWavers({Key? key}) : super(key: key);

  @override
  _AllWaversState createState() => _AllWaversState();
}

class _AllWaversState extends State<AllWavers> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WaveViewModel>.reactive(
      viewModelBuilder: () => WaveViewModel(),
      onModelReady: (waveModel) => waveModel.getAllWaves(),
      builder: (context, waveModel, child) {
        if (waveModel.busy) {
          return Scaffold(
            appBar: AppBar(
              title: CustomText(
                "Hall of Wavers",
                fontSize: 20,
                color: Colors.white,
              ),
              elevation: 0,
              leading: Container(),
              centerTitle: true,
            ),
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (waveModel.allWaves.length == 0) {
          return Scaffold(
            appBar: AppBar(
              title: CustomText(
                "Hall of Wavers",
                fontSize: 20,
                color: Colors.white,
              ),
              elevation: 0,
              leading: Container(),
              centerTitle: true,
            ),
            body: Center(
              child: CustomText(
                "No one has waved at you yet 😢",
              ),
            ),
          );
        }
        return Scaffold(
          appBar: AppBar(
            title: CustomText(
              "Hall of Wavers",
              fontSize: 20,
              color: Colors.white,
            ),
            elevation: 0,
            leading: Container(),
            centerTitle: true,
          ),
          body: ListView.builder(
            itemCount: waveModel.allWaves.length,
            itemBuilder: (context, index) {
              return Card(
                child: Container(
                  height: 90,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 5.0, vertical: 5.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          "${waveModel.allWaves[index][1].toString()} 👋",
                          fontSize: 16,
                        ),
                        CustomText(
                          "${waveModel.allWaves[index][0].toString()}",
                          fontSize: 14,
                          overflow: TextOverflow.ellipsis,
                          color: Colors.blueAccent,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CustomText(
                              "${timeago.format(DateTime.parse("${waveModel.allWaves[index][2].toInt()}"))}",
                              fontSize: 14,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
