import 'package:dio/dio.dart';
import 'package:flutter_covid/src/model/covid_statistics.dart';
import 'package:xml/xml.dart';

class CovidStatisticsRepository {
  late var _dio;

  CovidStatisticsRepository() {
    _dio = Dio(
      BaseOptions(
        baseUrl: "http://openapi.data.go.kr",
        queryParameters: {
          'ServiceKey':
          '',
        },
      ),
    );
  }

  Future<List<Covid19StatisticsModel>> fetchCovidStatistics({String? sDate, String? eDate}) async {
    var query = Map<String, String>();
    if (sDate != null) query.putIfAbsent('startCreateDt', () => sDate);
    if (eDate != null) query.putIfAbsent('endCreateDt', () => eDate);
    print('sDate: $sDate, eDate: $eDate');

    var response = await _dio.get('/openapi/service/rest/Covid19/getCovid19InfStateJson',
      queryParameters: query,
    );

    final document = XmlDocument.parse(response.data); // xmlTmp
    final results = document.findAllElements('item');
    if (results.isNotEmpty) {
      return results
          .map<Covid19StatisticsModel>((element) => Covid19StatisticsModel.fromXml(element))
          .toList();
    } else {
      return Future.value(null);
    }
  }
}


//    _dio.options.headers['content-Type'] = 'text/plain; charset=UTF-8';
//    _dio.options.headers['Access-Control-Allow-Origin'] = '*';
//    _dio.options.headers['Access-Control-Allow-Methods'] = 'GET , POST';
//    _dio.options.headers['Access-Control-Allow-Headers'] = 'Access-Control-Allow-Origin, Accept';



//  final xmlTmp = '''
//<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
//<response>
//    <header>
//        <resultCode>00</resultCode>
//        <resultMsg>NORMAL SERVICE.</resultMsg>
//    </header>
//    <body>
//        <items>
//            <item>
//                <accDefRate>1.6923831912</accDefRate>
//                <accExamCnt>11433345</accExamCnt>
//                <accExamCompCnt>11158584</accExamCompCnt>
//                <careCnt>20398</careCnt>
//                <clearCnt>166375</clearCnt>
//                <createDt>2021-07-25 09:32:34.468</createDt>
//                <deathCnt>2073</deathCnt>
//                <decideCnt>188846</decideCnt>
//                <examCnt>274761</examCnt>
//                <resutlNegCnt>10969738</resutlNegCnt>
//                <seq>583</seq>
//                <stateDt>20210725</stateDt>
//                <stateTime>00:00</stateTime>
//                <updateDt>2021-07-30 17:32:46.32</updateDt>
//            </item>
//            <item>
//                <accDefRate>1.6794723832</accDefRate>
//                <accExamCnt>11430522</accExamCnt>
//                <accExamCompCnt>11155825</accExamCompCnt>
//                <careCnt>20045</careCnt>
//                <clearCnt>165246</clearCnt>
//                <createDt>2021-07-24 09:38:51.376</createDt>
//                <deathCnt>2068</deathCnt>
//                <decideCnt>187359</decideCnt>
//                <examCnt>274697</examCnt>
//                <resutlNegCnt>10968466</resutlNegCnt>
//                <seq>582</seq>
//                <stateDt>20210724</stateDt>
//                <stateTime>00:00</stateTime>
//                <updateDt>2021-07-30 17:32:12.574</updateDt>
//            </item>
//            <item>
//                <accDefRate>1.6716933876</accDefRate>
//                <accExamCnt>11388302</accExamCnt>
//                <accExamCompCnt>11110291</accExamCompCnt>
//                <careCnt>19458</careCnt>
//                <clearCnt>164206</clearCnt>
//                <createDt>2021-07-23 09:37:34.575</createDt>
//                <deathCnt>2066</deathCnt>
//                <decideCnt>185730</decideCnt>
//                <examCnt>278011</examCnt>
//                <resutlNegCnt>10924561</resutlNegCnt>
//                <seq>581</seq>
//                <stateDt>20210723</stateDt>
//                <stateTime>00:00</stateTime>
//                <updateDt>2021-07-30 17:31:08.803</updateDt>
//            </item>
//            <item>
//                <accDefRate>1.6623896928</accDefRate>
//                <accExamCnt>11343915</accExamCnt>
//                <accExamCompCnt>11074419</accExamCompCnt>
//                <careCnt>18964</careCnt>
//                <clearCnt>163073</clearCnt>
//                <createDt>2021-07-22 09:39:47.617</createDt>
//                <deathCnt>2063</deathCnt>
//                <decideCnt>184100</decideCnt>
//                <examCnt>269496</examCnt>
//                <resutlNegCnt>10890319</resutlNegCnt>
//                <seq>580</seq>
//                <stateDt>20210722</stateDt>
//                <stateTime>00:00</stateTime>
//                <updateDt>2021-07-30 17:30:29.087</updateDt>
//            </item>
//            <item>
//                <accDefRate>1.6499277055</accDefRate>
//                <accExamCnt>11298671</accExamCnt>
//                <accExamCompCnt>11046484</accExamCompCnt>
//                <careCnt>18565</careCnt>
//                <clearCnt>161634</clearCnt>
//                <createDt>2021-07-21 09:38:25.219</createDt>
//                <deathCnt>2060</deathCnt>
//                <decideCnt>182259</decideCnt>
//                <examCnt>252187</examCnt>
//                <resutlNegCnt>10864225</resutlNegCnt>
//                <seq>579</seq>
//                <stateDt>20210721</stateDt>
//                <stateTime>00:00</stateTime>
//                <updateDt>2021-07-30 17:29:30.83</updateDt>
//            </item>
//            <item>
//                <accDefRate>1.6396190423</accDefRate>
//                <accExamCnt>11251984</accExamCnt>
//                <accExamCompCnt>11007313</accExamCompCnt>
//                <careCnt>18072</careCnt>
//                <clearCnt>160347</clearCnt>
//                <createDt>2021-07-20 09:37:01.254</createDt>
//                <deathCnt>2059</deathCnt>
//                <decideCnt>180478</decideCnt>
//                <examCnt>244671</examCnt>
//                <resutlNegCnt>10826835</resutlNegCnt>
//                <seq>578</seq>
//                <stateDt>20210720</stateDt>
//                <stateTime>00:00</stateTime>
//                <updateDt>2021-07-30 17:27:35.927</updateDt>
//            </item>
//            <item>
//                <accDefRate>1.6347766623</accDefRate>
//                <accExamCnt>11202431</accExamCnt>
//                <accExamCompCnt>10961742</accExamCompCnt>
//                <careCnt>17512</careCnt>
//                <clearCnt>159630</clearCnt>
//                <createDt>2021-07-19 09:38:09.418</createDt>
//                <deathCnt>2058</deathCnt>
//                <decideCnt>179200</decideCnt>
//                <examCnt>240689</examCnt>
//                <resutlNegCnt>10782542</resutlNegCnt>
//                <seq>577</seq>
//                <stateDt>20210719</stateDt>
//                <stateTime>00:00</stateTime>
//                <updateDt>2021-07-30 17:27:04.937</updateDt>
//            </item>
//            <item>
//                <accDefRate>1.6265100601</accDefRate>
//                <accExamCnt>11175979</accExamCnt>
//                <accExamCompCnt>10940541</accExamCompCnt>
//                <careCnt>16939</careCnt>
//                <clearCnt>158953</clearCnt>
//                <createDt>2021-07-18 09:33:01.419</createDt>
//                <deathCnt>2057</deathCnt>
//                <decideCnt>177949</decideCnt>
//                <examCnt>235438</examCnt>
//                <resutlNegCnt>10762592</resutlNegCnt>
//                <seq>576</seq>
//                <stateDt>20210718</stateDt>
//                <stateTime>00:00</stateTime>
//                <updateDt>2021-07-30 17:26:33.013</updateDt>
//            </item>
//        </items>
//        <numOfRows>10</numOfRows>
//        <pageNo>1</pageNo>
//        <totalCount>11</totalCount>
//    </body>
//</response>
//  ''';
