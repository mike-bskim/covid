import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_covid/src/canvas/arrow_clip_path.dart';
import 'package:flutter_covid/src/components/covid_statistics_viewer.dart';
import 'package:flutter_covid/src/controller/covid_statistics_controller.dart';
import 'package:get/get.dart';

class App extends GetView<CovidStatisticsController> {
  App({Key? key}) : super(key: key);

//  var headerTopZone = 0.0;

  List<Widget> _background(double headerTopZone) {
    return [
      // 배경 녹색
      Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.topLeft,
            colors: [
              Color(0xff3c727c),
              Color(0xff285861),
            ],
          ),
        ),
      ),
      // 코로나 이미지
      Positioned(
        left: -110,
        top: headerTopZone + 50,
        child: Container(
          child: Image.asset(
            'assets/covid_img.png',
            width: Get.size.width * 0.7,
          ),
        ),
      ),
      // 기준일자 표시
      Positioned(
        top: headerTopZone + 10,
        left: 0,
        right: 0,
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0xff3D4840), // 0xff1A421F 0xff195f68
            ),
            child: Obx(()=> Text(
              controller.todayData.standDayString,
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            )),
          ),
        ),
      ),
      // 확진자 및 누적
      Positioned(
        top: headerTopZone + 80,
        right: 40,
        child: CovidStatisticsViewer(
          title: '확진자',
          addedCount: controller.todayData.calcDecideCnt,
          totalCount: controller.todayData.decideCnt!,
          titleColor: Colors.white,
          subValueColor: Colors.white,
          upDown: controller.calcDirection(controller.todayData.calcDecideCnt),
          dense: true,
        ),
      )
    ];
  }

  Widget _todayStatistics() {
    return Obx(()=> Row(
      children: [
        Expanded(
          child: CovidStatisticsViewer(
            title: '격리해제',
            addedCount: controller.todayData.calcClearCnt,
            totalCount: controller.todayData.clearCnt!,
            upDown: controller.calcDirection(controller.todayData.calcClearCnt),
            dense: true,
          ),
        ),
        Container(
          height: 60,
          child: VerticalDivider(
            color: Color(0xffc7c7c7),
            thickness: 1,
          ),
        ),
        Expanded(
          child: CovidStatisticsViewer(
            title: '검사중',
            addedCount: controller.todayData.calcExamCnt,
            totalCount: controller.todayData.examCnt!,
            upDown: controller.calcDirection(controller.todayData.calcExamCnt),
            dense: true,
          ),
        ),
        Container(
          height: 60,
          child: VerticalDivider(
            color: Color(0xffc7c7c7),
            thickness: 1,
          ),
        ),
        Expanded(
          child: CovidStatisticsViewer(
            title: '사망자',
            addedCount: controller.todayData.calcDeathCnt,
            totalCount: controller.todayData.deathCnt!,
            upDown: controller.calcDirection(controller.todayData.calcDeathCnt),
            dense: true,
          ),
        ),
      ],
    ));
  }

  Widget _covidTrendsChart() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          '확진자 추이',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        AspectRatio(
          aspectRatio: 1.7,
          child: Card(
            elevation: 0,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
//            color: const Color(0xff2c4260),
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY: 20,
                barTouchData: BarTouchData(
                  enabled: false,
                  touchTooltipData: BarTouchTooltipData(
                    tooltipBgColor: Colors.transparent,
                    tooltipPadding: const EdgeInsets.all(0),
                    tooltipMargin: 8,
                    getTooltipItem: (
                      BarChartGroupData group,
                      int groupIndex,
                      BarChartRodData rod,
                      int rodIndex,
                    ) {
                      return BarTooltipItem(
                        rod.y.round().toString(),
                        TextStyle(
                          color: Colors.black, // Bar 값 색상
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    },
                  ),
                ),
                titlesData: FlTitlesData(
                  show: true,
                  bottomTitles: SideTitles(
                    showTitles: true,
                    getTextStyles: (value) => const TextStyle(
                        color: Color(0xff7589a2), fontWeight: FontWeight.bold, fontSize: 14),
                    margin: 20,
                    getTitles: (double value) {
                      switch (value.toInt()) {
                        case 0:
                          return 'Mn';
                        case 1:
                          return 'Te';
                        case 2:
                          return 'Wd';
                        case 3:
                          return 'Tu';
                        case 4:
                          return 'Fr';
                        case 5:
                          return 'St';
                        case 6:
                          return 'Sn';
                        default:
                          return '';
                      }
                    },
                  ),
                  leftTitles: SideTitles(showTitles: false),
                ),
                borderData: FlBorderData(
                  show: false,
                ),
                barGroups: [
                  BarChartGroupData(
                    x: 0,
                    barRods: [
                      BarChartRodData(y: 8, colors: [Colors.lightBlueAccent, Colors.greenAccent])
                    ],
                    showingTooltipIndicators: [0],
                  ),
                  BarChartGroupData(
                    x: 1,
                    barRods: [
                      BarChartRodData(y: 10, colors: [Colors.lightBlueAccent, Colors.greenAccent])
                    ],
                    showingTooltipIndicators: [0],
                  ),
                  BarChartGroupData(
                    x: 2,
                    barRods: [
                      BarChartRodData(y: 14, colors: [Colors.lightBlueAccent, Colors.greenAccent])
                    ],
                    showingTooltipIndicators: [0],
                  ),
                  BarChartGroupData(
                    x: 3,
                    barRods: [
                      BarChartRodData(y: 15, colors: [Colors.lightBlueAccent, Colors.greenAccent])
                    ],
                    showingTooltipIndicators: [0],
                  ),
                  BarChartGroupData(
                    x: 3,
                    barRods: [
                      BarChartRodData(y: 13, colors: [Colors.lightBlueAccent, Colors.greenAccent])
                    ],
                    showingTooltipIndicators: [0],
                  ),
                  BarChartGroupData(
                    x: 3,
                    barRods: [
                      BarChartRodData(y: 10, colors: [Colors.lightBlueAccent, Colors.greenAccent])
                    ],
                    showingTooltipIndicators: [0],
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var headerTopZone = Get.mediaQuery.padding.top + AppBar().preferredSize.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Icon(
          Icons.menu,
          color: Colors.white,
        ),
        title: Text(
          '코로나 일변 현황',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        actions: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Icon(
              Icons.notifications,
              color: Colors.white,
            ),
          )
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: <Widget>[
          ..._background(headerTopZone),
          Positioned(
            top: headerTopZone + 200,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  )),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    children: [
                      _todayStatistics(),
                      SizedBox(
                        height: 20,
                      ),
                      _covidTrendsChart(),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget infoWidget(String? title, String? value) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(
            '$title : ',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          Text(
            '$value',
            style: TextStyle(fontSize: 15),
          ),
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
          Text(
            '$title : ',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          Text(
            '$value',
            style: TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }
}
