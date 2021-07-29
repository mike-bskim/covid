import 'package:flutter_covid/src/canvas/arrow_clip_path.dart';
import 'package:flutter_covid/src/model/covid_statistics.dart';
import 'package:flutter_covid/src/repository/covidStatisticsRepository.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CovidStatisticsController extends GetxController {

  CovidStatisticsRepository? _covidStatisticsRepository;
  Rx<Covid19StatisticsModel> _todayData = Covid19StatisticsModel().obs;
  RxList<Covid19StatisticsModel> _weekDatas = <Covid19StatisticsModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _covidStatisticsRepository = CovidStatisticsRepository();
    fetchCovidState();
  }

  void fetchCovidState() async {
    var sDate = DateFormat('yyyyMMdd').format(DateTime.now().subtract(Duration(days: 8)));
    var eDate = DateFormat('yyyyMMdd').format(DateTime.now());
    var results = await _covidStatisticsRepository!.fetchCovidStatistics(sDate: sDate, eDate: eDate);
    if (results.isNotEmpty) {
      for(var i=0; i<results.length; i++){
        if(i<results.length-1) {
          results[i].updateCalcAboutYesterday(results[i+1]);
        }
      }
      _weekDatas.addAll(results.sublist(0, results.length-1));
      _todayData(_weekDatas.first);
//      print(_weekDatas);
    }
  }

  Covid19StatisticsModel get todayData => _todayData.value; // ?? Covid19StatisticsModel.empty();

  ArrowDirection calcDirection(double cnt) {
    if (cnt > 0) {
      return ArrowDirection.UP;
    } else if (cnt < 0) {
      return ArrowDirection.DOWN;
    } else {
      return ArrowDirection.MIDDLE;
    }
  }

}