import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WorkTime {
  String day;
  String hour;
  WorkTime({this.day, this.hour});
}

final List<WorkTime> WorkTimes = [
  new WorkTime(day: "Lunes", hour: "8 horas"),
  new WorkTime(day: "martes", hour: "7 horas"),
  new WorkTime(day: "miércoles", hour: "5 horas"),
  new WorkTime(day: "jueves", hour: "4 horas"),
  new WorkTime(day: "viernes", hour: "6 horas"),
  new WorkTime(day: "sábado", hour: "8 horas"),
  new WorkTime(day: "domingo", hour: "7 horas"),
];

class DetailsPage extends StatefulWidget {
  static String tag = 'details-page';

  DetailsPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: true,
            title: Text('Pedro Perez'),
            leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context, false)
            )
        ),
        body: Column(
          children: <Widget>[
            Container(
                width: MediaQuery.of(context).size.width * 0.90,
                margin: EdgeInsets.only(left: 20, top: 20),
                child: Card(
                    child: Container(
                        padding: new EdgeInsets.only(top: 20),
                        height: 100,
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text("Puesto: recolector de campo."),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text("Total de horas semanales: 45"),
                            ),
                          ],
                        )
                    )
                )
            ),
            Container(
              margin: EdgeInsets.only(left: 20, top: 20),
                height: 50,
                child: Row(
                  children: <Widget>[
                        Padding(
                              padding: const EdgeInsets.fromLTRB(20, 8.0,0,0),
                              child: Text('Día'),
                        ),
                        Padding(
                              padding: const EdgeInsets.fromLTRB(20, 8.0,0,0),
                              child: Text('Horas'),
                        )
                  ]
                )
            ),
            Container(
                margin: EdgeInsets.only(left: 20, top: 20),
                height: 300,
                child: ListView.builder(
                  itemCount: WorkTimes.length,
                  itemBuilder: (context, position) {
                    return Row(
                      children: <Widget>[
                        Padding(
                              padding: const EdgeInsets.fromLTRB(20, 8.0,0,0),
                              child: Text('${WorkTimes[position].day.toString()}'),
                        ),
                        Padding(
                              padding: const EdgeInsets.fromLTRB(40, 8.0,0,0),
                              child: Text('${WorkTimes[position].hour.toString()}'),
                        ),
                      ]
                    );
                  },
                )
            )
          ],
        )
    );
  }
}
