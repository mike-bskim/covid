import 'package:flutter/material.dart';
import 'package:flutter_covid/src/controller/covid_statistics_controller.dart';
import 'package:get/get.dart';


class App extends GetView<CovidStatisticsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('코로나 일변 현황'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Obx((){
          var info = controller.covidStatistic.value;
          return Column(
            children: [
//              infoWidget("기준일", info.stateDt ?? ''),
              InfoWidget("기준일", info.stateDt ?? ''),
              InfoWidget("기준시간", info.stateTime ?? ''),
              InfoWidget("확진자 수", info.decideCnt ?? ''),
              InfoWidget("검사진행 수", info.examCnt ?? ''),
              InfoWidget("사망자 수", info.deathCnt ?? ''),
              InfoWidget("치료중 환자 수", info.careCnt ?? ''),
              InfoWidget("결과 음성 수", info.resutlNegCnt ?? ''),
              InfoWidget("누적 검사 수", info.accExamCnt ?? ''),
              InfoWidget("누적 검사 완료 수", info.accExamCompCnt ?? ''),
              InfoWidget("누적 확진률", info.accDefRate ?? ''),
            ],
          );
        }),
      ),
    );
  }

  Widget infoWidget(String? title, String? value) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text('$title : ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
          Text('$value', style: TextStyle(fontSize: 15),),
        ],
      ),
    );
  }
}

class InfoWidget extends StatelessWidget {
  final title;
  final value;

  const InfoWidget(this.title, this.value);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text('$title : ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
          Text('$value', style: TextStyle(fontSize: 15),),
        ],
      ),
    );
  }
}

