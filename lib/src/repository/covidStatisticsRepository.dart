import 'package:dio/dio.dart';
import 'package:flutter_covid/src/model/covid_statistics.dart';
import 'package:xml/xml.dart';

class CovidStatisticsRepository {

  late var _dio;
  CovidStatisticsRepository() {
    _dio = Dio(
      BaseOptions(
        baseUrl: "http://openapi.data.go.kr",
        queryParameters: {'ServiceKey': 'hGboGBB9IaBFmUfEh+I6Hbxl0aKY5gj+9U3/+PvUI+VIqgvtimuJEt2pReeoxM/vIjN0SjCk7d1ebss5SOLH/w==',
//          'startCreateDt':'20210727',
//          'endCreateDt':'20210727',
        },
      ),
    );
  }

  Future<Covid19StatisticsModel> fetchVovidStatistics() async {
    var response = await _dio.get('/openapi/service/rest/Covid19/getCovid19InfStateJson');

//    _dio.options.headers['content-Type'] = 'text/plain; charset=UTF-8';
//    _dio.options.headers['Access-Control-Allow-Origin'] = '*';
//    _dio.options.headers['Access-Control-Allow-Methods'] = 'GET , POST';
//    _dio.options.headers['Access-Control-Allow-Headers'] = 'Access-Control-Allow-Origin, Accept';
    print(response);

    final document = XmlDocument.parse(response.data);
    final results = document.findAllElements('item');
    if (results.isNotEmpty) {
      return Covid19StatisticsModel.fromXml(results.first);
    } else {
      return Future.value(null);
    }

  }

}
