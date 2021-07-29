import 'package:dio/dio.dart';
import 'package:flutter_covid/src/model/covid_statistics.dart';
import 'package:xml/xml.dart';

class CovidStatisticsRepository {
  late var _dio;
  final xmlTmp = '''
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<response>
    <header>
        <resultCode>00</resultCode>
        <resultMsg>NORMAL SERVICE.</resultMsg>
    </header>
    <body>
        <items>
            <item>
                <accDefRate>1.7175707917</accDefRate>
                <accExamCnt>11585615</accExamCnt>
                <accExamCompCnt>11261661</accExamCompCnt>
                <careCnt>20850</careCnt>
                <clearCnt>170494</clearCnt>
                <createDt>2021-07-28 09:36:06.387</createDt>
                <deathCnt>2083</deathCnt>
                <decideCnt>193427</decideCnt>
                <examCnt>323954</examCnt>
                <resutlNegCnt>11068234</resutlNegCnt>
                <seq>586</seq>
                <stateDt>20210728</stateDt>
                <stateTime>00:00</stateTime>
                <updateDt>null</updateDt>
            </item>
            <item>
                <accDefRate>1.7071723951</accDefRate>
                <accExamCnt>11528609</accExamCnt>
                <accExamCompCnt>11219195</accExamCompCnt>
                <careCnt>20823</careCnt>
                <clearCnt>168629</clearCnt>
                <createDt>2021-07-27 09:35:45.815</createDt>
                <deathCnt>2079</deathCnt>
                <decideCnt>191531</decideCnt>
                <examCnt>309414</examCnt>
                <resutlNegCnt>11027664</resutlNegCnt>
                <seq>585</seq>
                <stateDt>20210727</stateDt>
                <stateTime>00:00</stateTime>
                <updateDt>2021-07-27 10:08:37.339</updateDt>
            </item>
            <item>
                <accDefRate>1.6992241235</accDefRate>
                <accExamCnt>11472346</accExamCnt>
                <accExamCompCnt>11191343</accExamCompCnt>
                <careCnt>20724</careCnt>
                <clearCnt>167365</clearCnt>
                <createDt>2021-07-26 09:40:26.165</createDt>
                <deathCnt>2077</deathCnt>
                <decideCnt>190166</decideCnt>
                <examCnt>281003</examCnt>
                <resutlNegCnt>11001177</resutlNegCnt>
                <seq>584</seq>
                <stateDt>20210726</stateDt>
                <stateTime>00:00</stateTime>
                <updateDt>null</updateDt>
            </item>
            <item>
                <accDefRate>1.6924008113</accDefRate>
                <accExamCnt>11433347</accExamCnt>
                <accExamCompCnt>11158586</accExamCompCnt>
                <careCnt>20400</careCnt>
                <clearCnt>166375</clearCnt>
                <createDt>2021-07-25 09:32:34.468</createDt>
                <deathCnt>2073</deathCnt>
                <decideCnt>188848</decideCnt>
                <examCnt>274761</examCnt>
                <resutlNegCnt>10969738</resutlNegCnt>
                <seq>583</seq>
                <stateDt>20210725</stateDt>
                <stateTime>00:00</stateTime>
                <updateDt>null</updateDt>
            </item>
            <item>
                <accDefRate>1.6794988233</accDefRate>
                <accExamCnt>11430525</accExamCnt>
                <accExamCompCnt>11155828</accExamCompCnt>
                <careCnt>20048</careCnt>
                <clearCnt>165246</clearCnt>
                <createDt>2021-07-24 09:38:51.376</createDt>
                <deathCnt>2068</deathCnt>
                <decideCnt>187362</decideCnt>
                <examCnt>274697</examCnt>
                <resutlNegCnt>10968466</resutlNegCnt>
                <seq>582</seq>
                <stateDt>20210724</stateDt>
                <stateTime>00:00</stateTime>
                <updateDt>null</updateDt>
            </item>
            <item>
                <accDefRate>1.6717199382</accDefRate>
                <accExamCnt>11388305</accExamCnt>
                <accExamCompCnt>11110294</accExamCompCnt>
                <careCnt>19461</careCnt>
                <clearCnt>164206</clearCnt>
                <createDt>2021-07-23 09:37:34.575</createDt>
                <deathCnt>2066</deathCnt>
                <decideCnt>185733</decideCnt>
                <examCnt>278011</examCnt>
                <resutlNegCnt>10924561</resutlNegCnt>
                <seq>581</seq>
                <stateDt>20210723</stateDt>
                <stateTime>00:00</stateTime>
                <updateDt>null</updateDt>
            </item>
            <item>
                <accDefRate>1.6624163319</accDefRate>
                <accExamCnt>11343918</accExamCnt>
                <accExamCompCnt>11074422</accExamCompCnt>
                <careCnt>18967</careCnt>
                <clearCnt>163073</clearCnt>
                <createDt>2021-07-22 09:39:47.617</createDt>
                <deathCnt>2063</deathCnt>
                <decideCnt>184103</decideCnt>
                <examCnt>269496</examCnt>
                <resutlNegCnt>10890319</resutlNegCnt>
                <seq>580</seq>
                <stateDt>20210722</stateDt>
                <stateTime>00:00</stateTime>
                <updateDt>null</updateDt>
            </item>
            <item>
                <accDefRate>1.6499811252</accDefRate>
                <accExamCnt>11298677</accExamCnt>
                <accExamCompCnt>11046490</accExamCompCnt>
                <careCnt>18571</careCnt>
                <clearCnt>161634</clearCnt>
                <createDt>2021-07-21 09:38:25.219</createDt>
                <deathCnt>2060</deathCnt>
                <decideCnt>182265</decideCnt>
                <examCnt>252187</examCnt>
                <resutlNegCnt>10864225</resutlNegCnt>
                <seq>579</seq>
                <stateDt>20210721</stateDt>
                <stateTime>00:00</stateTime>
                <updateDt>null</updateDt>
            </item>
            <item>
                <accDefRate>1.6396458500</accDefRate>
                <accExamCnt>11251987</accExamCnt>
                <accExamCompCnt>11007316</accExamCompCnt>
                <careCnt>18075</careCnt>
                <clearCnt>160347</clearCnt>
                <createDt>2021-07-20 09:37:01.254</createDt>
                <deathCnt>2059</deathCnt>
                <decideCnt>180481</decideCnt>
                <examCnt>244671</examCnt>
                <resutlNegCnt>10826835</resutlNegCnt>
                <seq>578</seq>
                <stateDt>20210720</stateDt>
                <stateTime>00:00</stateTime>
                <updateDt>null</updateDt>
            </item>
            <item>
                <accDefRate>1.6348035828</accDefRate>
                <accExamCnt>11202434</accExamCnt>
                <accExamCompCnt>10961745</accExamCompCnt>
                <careCnt>17515</careCnt>
                <clearCnt>159630</clearCnt>
                <createDt>2021-07-19 09:38:09.418</createDt>
                <deathCnt>2058</deathCnt>
                <decideCnt>179203</decideCnt>
                <examCnt>240689</examCnt>
                <resutlNegCnt>10782542</resutlNegCnt>
                <seq>577</seq>
                <stateDt>20210719</stateDt>
                <stateTime>00:00</stateTime>
                <updateDt>null</updateDt>
            </item>
        </items>
        <numOfRows>10</numOfRows>
        <pageNo>1</pageNo>
        <totalCount>10</totalCount>
    </body>
</response>
  ''';

  CovidStatisticsRepository() {
    _dio = Dio(
      BaseOptions(
        baseUrl: "http://openapi.data.go.kr",
        queryParameters: {
          'ServiceKey':
              'hGboGBB9IaBFmUfEh+I6Hbxl0aKY5gj+9U3/+PvUI+VIqgvtimuJEt2pReeoxM/vIjN0SjCk7d1ebss5SOLH/w==',
//          'startCreateDt':'20210727',
//          'endCreateDt':'20210727',
        },
      ),
    );
  }

  Future<List<Covid19StatisticsModel>> fetchCovidStatistics({String? sDate, String? eDate}) async {
    var query = Map<String, String>();
    if (sDate != null) {
      query.putIfAbsent('startCreateDt', () => sDate);
    }
    if (eDate != null) {
      query.putIfAbsent('endCreateDt', () => eDate);
    }

//    var response = await _dio.get('/openapi/service/rest/Covid19/getCovid19InfStateJson',
//      queryParameters: query,
//    );

//    _dio.options.headers['content-Type'] = 'text/plain; charset=UTF-8';
//    _dio.options.headers['Access-Control-Allow-Origin'] = '*';
//    _dio.options.headers['Access-Control-Allow-Methods'] = 'GET , POST';
//    _dio.options.headers['Access-Control-Allow-Headers'] = 'Access-Control-Allow-Origin, Accept';
//    print(response);

    final document = XmlDocument.parse(xmlTmp); // xmlTmp
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
