import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_easy_english/models/userscore_model.dart';
import 'package:flutter_app_easy_english/utility/style.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartPage extends StatefulWidget {
  @override
  _ChartPageState createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {
  double screenWidth, screenHeight;
  DateTime time ;
  List<ScoreData> listChart = [];
  var date = [0, 0, 0, 0, 0, 0, 0];
  var summary = [0, 0, 0, 0, 0, 0, 0];
  var day, month, year;
  int i = 0;

  @override
  void initState() {
    time = DateTime.now();
    super.initState();
    findData();
  }

  findData() async {
    await Firebase.initializeApp().then((value) async {
      await FirebaseAuth.instance.authStateChanges().listen((event) async {
        var targetDay = time.day - 6,
            targetMonth = time.month,
            targetYear = time.year;
        print('targetDay :' + targetDay.toString());
        await FirebaseFirestore.instance
            .collection('scores')
            .where('uid', isEqualTo: event.uid)
            .orderBy('time', descending: true)
            .snapshots()
            .listen((event) {
          for (var snapshots in event.docs) {
            Map<String, dynamic> map = snapshots.data();
            UserScoreModel model = UserScoreModel.fromMap(map);
            i++;
            setState(() {
              day = model.time.toDate().day;
              month = model.time.toDate().month;
              year = model.time.toDate().year;
            });
            if ((date[0] == 0 || date[0] == day) &&
                month == targetMonth &&
                year == targetYear) {
              setState(() {
                date[0] = day;
                summary[0] += model.score;
              });
            } else if ((date[1] == 0 || date[1] == day) &&
                month == targetMonth &&
                year == targetYear) {
              setState(() {
                date[1] = day;
                summary[1] += model.score;
              });
            } else if ((date[2] == 0 || date[2] == day) &&
                month == targetMonth &&
                year == targetYear) {
              setState(() {
                date[2] = day;
                summary[2] += model.score;
              });
            } else if ((date[3] == 0 || date[3] == day) &&
                month == targetMonth &&
                year == targetYear) {
              setState(() {
                date[3] = day;
                summary[3] += model.score;
              });
            } else if ((date[4] == 0 || date[4] == day) &&
                month == targetMonth &&
                year == targetYear) {
              setState(() {
                date[4] = day;
                summary[4] += model.score;
              });
            } else if ((date[5] == 0 || date[5] == day) &&
                month == targetMonth &&
                year == targetYear) {
              setState(() {
                date[5] = day;
                summary[5] += model.score;
              });
            } else if ((date[6] == 0 || date[6] == day) &&
                month == targetMonth &&
                year == targetYear) {
              setState(() {
                date[6] = day;
                summary[6] += model.score;
              });
            }
            if(event.docs.length == i){
              setState(() {
                listChart.add(ScoreData(
                    (targetDay+0).toString() + "." + month.toString(), date.contains((targetDay+0)) ? summary[6] : 0 ));
                listChart.add(ScoreData(
                    (targetDay+1).toString() + "." + month.toString(),date.contains((targetDay+1)) ? summary[5] : 0 ));
                listChart.add(ScoreData(
                    (targetDay+2).toString() + "." + month.toString(),date.contains((targetDay+2)) ? summary[4] : 0 ));
                listChart.add(ScoreData(
                    (targetDay+3).toString() + "." + month.toString(),date.contains((targetDay+3)) ? summary[3] : 0 ));
                listChart.add(ScoreData(
                    (targetDay+4).toString() + "." + month.toString(),date.contains((targetDay+4)) ? summary[2] : 0 ));
                listChart.add(ScoreData(
                    (targetDay+5).toString() + "." + month.toString(),date.contains((targetDay+5)) ? summary[1] : 0 ));
                listChart.add(ScoreData(
                    (targetDay+6).toString()  + "." + month.toString(),date.contains((targetDay+6)) ? summary[0] : 0 ));
              });
            }
          }
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: MyStyle().titleAppbar('กราฟคะแนน'),
      ),
      body: Container(
        height: screenHeight,
        child: SfCartesianChart(
          zoomPanBehavior: ZoomPanBehavior(
            enableDoubleTapZooming: true,
            enablePinching: true,
            enableMouseWheelZooming: true,
            enablePanning: true,
            enableSelectionZooming: true,
          ),
          title: ChartTitle(
            text: "ตารางคะแนน",
            textStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: screenHeight * screenWidth * 0.000065,
              fontFamily: "Sukhumvit",
            ),
          ),
          primaryXAxis: CategoryAxis(
            title: AxisTitle(
              text: "คะแนนที่ทำได้ วัน/เดือน",
              textStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: screenHeight * screenWidth * 0.000065,
                fontFamily: "Sukhumvit",
              ),
            ),
          ),
          primaryYAxis: NumericAxis(
            title: AxisTitle(
              text: "ระดับคะแนน",
              textStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: screenHeight * screenWidth * 0.000065,
                fontFamily: "Sukhumvit",
              ),
            ),
          ),
          series: <ChartSeries>[
            FastLineSeries<ScoreData, String>(

              width: 5,
              dataSource: listChart,
              xValueMapper: (ScoreData score, _) => score.x,
              yValueMapper: (ScoreData score, _) => score.y,
              dataLabelSettings: DataLabelSettings(
                textStyle: TextStyle(
                  fontSize: screenHeight * screenWidth * 0.00005,
                ),
                isVisible: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ScoreData {
  String x;
  int y;
  ScoreData(this.x, this.y);
}
