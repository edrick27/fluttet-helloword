import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Person {
  String id;
  String name;
  String hours_week;
  String hours_day;
  Person({this.id, this.name, this.hours_week, this.hours_day});
}

int _selectedIndex = 0;
final List<Person> persons = [
  new Person(id: "1", name: "Pedro Perez", hours_week: "40", hours_day: "8"),
  new Person(id: "1", name: "Juan Cascante", hours_week: "34", hours_day: "3"),
  new Person(
      id: "1", name: "Carlos limosner", hours_week: "32", hours_day: "5"),
  new Person(id: "1", name: "Ricard Lopez", hours_week: "45", hours_day: "8"),
];

const TextStyle optionStyle =
    TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

class HomePage extends StatefulWidget {
  static String tag = 'home-page';

  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _modalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            child: new Wrap(
              children: <Widget>[
                new ListTile(
                    leading: new Icon(Icons.music_note),
                    title: new Text('Music'),
                    onTap: () => {}),
                new TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter a search term'
                  ),
                )
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Image.asset('assets/images/logo.png',
            width: 190, height: 30, fit: BoxFit.cover),
      ),
      body: ListView.builder(
        itemCount: persons.length,
        itemBuilder: (context, position) {
          return new GestureDetector(
              child: Card(
                child: Container(
                    child: Column(children: [
                  Text("Nombre: " + persons[position].name),
                  Text("Horas semanales: " + persons[position].hours_week),
                  Text("Horas de hoy: " + persons[position].hours_day)
                ])),
              ),
              onTap: () {
                _modalBottomSheet(context);
              });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.conciergeBell),
            title: Text('Solicitudes'),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.calendarAlt),
            title: Text('School'),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.comment),
            title: Text('School'),
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue[800],
        unselectedItemColor: Colors.grey[350],
        onTap: _onItemTapped,
      ),
    );
  }
}
