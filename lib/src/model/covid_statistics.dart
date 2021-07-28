

import 'package:flutter_covid/src/util/xml_util.dart';
import 'package:xml/xml.dart';

class Covid19StatisticsModel {
  String? accDefRate;
  String? accExamCnt;
  String? accExamCompCnt;
  String? careCnt;
  String? clearCnt;
  String? createDt;
  String? deathCnt;
  String? decideCnt;
  String? examCnt;
  String? resutlNegCnt;
  String? seq;
  String? stateDt;
  String? stateTime;
  String? updateDt;

  Covid19StatisticsModel({
    this.accDefRate,
    this.accExamCnt,
    this.accExamCompCnt,
    this.careCnt,
    this.clearCnt,
    this.createDt,
    this.deathCnt,
    this.decideCnt,
    this.examCnt,
    this.resutlNegCnt,
    this.seq,
    this.stateDt,
    this.stateTime,
    this.updateDt,
  });

  factory Covid19StatisticsModel.fromXml(XmlElement xml) {
    return Covid19StatisticsModel(
      accDefRate: XmlUtils.searchResult(xml, 'accDefRate'),
      accExamCnt: XmlUtils.searchResult(xml, 'accDefRate'),
      accExamCompCnt: XmlUtils.searchResult(xml, 'accExamCompCnt'),
      careCnt: XmlUtils.searchResult(xml, 'careCnt'),
      clearCnt: XmlUtils.searchResult(xml, 'clearCnt'),
      createDt: XmlUtils.searchResult(xml, 'createDt'),
      deathCnt: XmlUtils.searchResult(xml, 'deathCnt'),
      decideCnt: XmlUtils.searchResult(xml, 'decideCnt'),
      examCnt: XmlUtils.searchResult(xml, 'examCnt'),
      resutlNegCnt: XmlUtils.searchResult(xml, 'resutlNegCnt'),
      seq: XmlUtils.searchResult(xml, 'seq'),
      stateDt: XmlUtils.searchResult(xml, 'stateDt'),
      stateTime: XmlUtils.searchResult(xml, 'stateTime'),
      updateDt: XmlUtils.searchResult(xml, 'updateDt'),
    );
  }
}

//class XmlUtils {
//  static String searchResult(XmlElement xml, String key) {
//    return xml.findAllElements(key).map((e) => e.text).isEmpty
//        ? ""
//        : xml.findAllElements(key).map((e) => e.text).first;
//  }
//}