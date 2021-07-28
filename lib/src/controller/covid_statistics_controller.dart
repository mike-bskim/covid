import 'package:flutter_covid/src/model/covid_statistics.dart';
import 'package:flutter_covid/src/repository/covidStatisticsRepository.dart';
import 'package:get/get.dart';

class CovidStatisticsController extends GetxController {

  CovidStatisticsRepository? _covidStatisticsRepository;
  Rx<Covid19StatisticsModel> covidStatistic = Covid19StatisticsModel().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _covidStatisticsRepository = CovidStatisticsRepository();
    fetchCovidState();
  }

  void fetchCovidState() async {
    var result = await _covidStatisticsRepository!.fetchVovidStatistics();
    if (result != null) {
      covidStatistic(result);
    }
  }
}