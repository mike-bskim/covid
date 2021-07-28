import 'package:flutter/material.dart';
import 'package:flutter_covid/src/canvas/arrow_clip_path.dart';
import 'package:flutter_covid/src/controller/covid_statistics_controller.dart';
import 'package:get/get.dart';

class App extends GetView<CovidStatisticsController> {
  App({Key? key}) : super(key: key);

//  var headerTopZone = 0.0;

  @override
  Widget build(BuildContext context) {
    var headerTopZone =
        Get.mediaQuery.padding.top + AppBar().preferredSize.height;

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
          Positioned(
            top: headerTopZone + 10,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xff3D4840), // 0xff1A421F 0xff195f68
                ),
                child: Text(
                  '07.24 00:00 기준',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Positioned(
              top: headerTopZone + 80,
              right: 40,
              child: Column(
                children: [
                  Text('확진자',
                      style: TextStyle(color: Colors.red, fontSize: 18)),
                  SizedBox(height: 5,),
                  Row(
                    children: [
                      ClipPath(
                        clipper: ArrowClipPath(),
                        child: Container(
                          height: 20,
                          width: 20,
                          color: Color(0xffcf5f51),
                        ),
                      ),
                      Text('1,629',
                          style: TextStyle(
                              color: Color(0xffcf5f51),
                              fontSize: 50,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Text('187,362',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                ],
              ))
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
