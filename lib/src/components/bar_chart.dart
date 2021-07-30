import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_covid/src/model/covid_statistics.dart';
import 'package:flutter_covid/src/util/data_utils.dart';

class CovidBarChart extends StatelessWidget {
  final List<Covid19StatisticsModel> covidDatas;
  final maxY;

  const CovidBarChart({
    Key? key,
    required this.covidDatas, required this.maxY,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var x = 0;

    return BarChart(
      BarChartData(
          alignment: BarChartAlignment.spaceAround,
          maxY: maxY*1.3,
          //20,
          barTouchData: BarTouchData(
            enabled: false,
            touchTooltipData: BarTouchTooltipData(
              tooltipBgColor: Colors.transparent,
              tooltipPadding: const EdgeInsets.all(0),
              tooltipMargin: 8,
              getTooltipItem: (BarChartGroupData group,
                  int groupIndex,
                  BarChartRodData rod,
                  int rodIndex,) {
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
              getTextStyles: (value) =>
              const TextStyle(
                  color: Color(0xff7589a2), fontWeight: FontWeight.bold, fontSize: 14),
              margin: 20,
              getTitles: (double value) {
//                print(value);
                return DataUtils.simpleDayFormat(covidDatas[value.toInt()].stateDt!);
              },
            ),
            leftTitles: SideTitles(showTitles: false),
          ),
          borderData: FlBorderData(
            show: false,
          ),
          barGroups: covidDatas.map<BarChartGroupData>((covidData) {
            return BarChartGroupData(
              x: x++,
              barRods: [
                BarChartRodData(y: covidData.calcDecideCnt,
                    colors: [Colors.lightBlueAccent, Colors.greenAccent])
              ],
              showingTooltipIndicators: [0],
            );
          }).toList()
      ),
    );
  }
}
