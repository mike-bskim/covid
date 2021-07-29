import 'package:flutter_covid/src/util/data_utils.dart';
import 'package:flutter_covid/src/util/xml_util.dart';
import 'package:xml/xml.dart';

class Covid19StatisticsModel {
  double? accDefRate;
  double? accExamCnt;
  double? accExamCompCnt;
  double? careCnt;
  double? clearCnt;
  double calcClearCnt = 0;
  double? deathCnt;
  double calcDeathCnt = 0;
  double? decideCnt;
  double calcDecideCnt = 0;
  double? examCnt;
  double calcExamCnt = 0;
  double? resutlNegCnt;
  double? seq;
  String? createDt;
  DateTime? stateDt;
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

  factory Covid19StatisticsModel.empty() {
    return Covid19StatisticsModel();
  }

  factory Covid19StatisticsModel.fromXml(XmlElement xml) {
    return Covid19StatisticsModel(
      accDefRate: XmlUtils.searchResultForDouble(xml, 'accDefRate'),
      accExamCnt: XmlUtils.searchResultForDouble(xml, 'accDefRate'),
      accExamCompCnt: XmlUtils.searchResultForDouble(xml, 'accExamCompCnt'),
      careCnt: XmlUtils.searchResultForDouble(xml, 'careCnt'),
      clearCnt: XmlUtils.searchResultForDouble(xml, 'clearCnt'),
      deathCnt: XmlUtils.searchResultForDouble(xml, 'deathCnt'),
      decideCnt: XmlUtils.searchResultForDouble(xml, 'decideCnt'),
      examCnt: XmlUtils.searchResultForDouble(xml, 'examCnt'),
      resutlNegCnt: XmlUtils.searchResultForDouble(xml, 'resutlNegCnt'),
      seq: XmlUtils.searchResultForDouble(xml, 'seq'),
      createDt: XmlUtils.searchResultForString(xml, 'createDt'),
      stateDt: XmlUtils.searchResultForString(xml, 'stateDt') != ''
          ? DateTime.parse(XmlUtils.searchResultForString(xml, 'stateDt'))
          : null,
      stateTime: XmlUtils.searchResultForString(xml, 'stateTime'),
      updateDt: XmlUtils.searchResultForString(xml, 'updateDt'),
    );
  }

  void updateCalcAboutYesterday(Covid19StatisticsModel yesterdayData) {
    _updateCalcDecideCnt(yesterdayData.decideCnt!);
    _updateCalcExamCnt(yesterdayData.examCnt!);
    _updateCalcDeathCnt(yesterdayData.deathCnt!);
    _updateCalcClearCnt(yesterdayData.clearCnt!);
  }

  void _updateCalcDecideCnt(double beforeCnt) {
    calcDecideCnt = decideCnt! - beforeCnt;
  }

  void _updateCalcExamCnt(double beforeCnt) {
    calcExamCnt = examCnt! - beforeCnt;
  }

  void _updateCalcDeathCnt(double beforeCnt) {
    calcDeathCnt = deathCnt! - beforeCnt;
  }

  void _updateCalcClearCnt(double beforeCnt) {
    calcClearCnt = clearCnt! - beforeCnt;
  }

  String get standDayString => '${DataUtils.simpleDayFormat(stateDt!)} $stateTime 기준';

}

//class XmlUtils {
//  static String searchResult(XmlElement xml, String key) {
//    return xml.findAllElements(key).map((e) => e.text).isEmpty
//        ? ""
//        : xml.findAllElements(key).map((e) => e.text).first;
//  }
//}
