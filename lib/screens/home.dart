import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:myapp/screens/details.dart';

class Person {
  String id;
  String name;
  String avatar;
  String hoursweek;
  String hoursday;
  Person({this.id, this.name, this.avatar, this.hoursweek, this.hoursday});
}

int _selectedIndex = 0;
final List<Person> persons = [
  new Person(
      id: "1",
      name: "Pedro Perez",
      avatar: "https://picsum.photos/id/4/350/350",
      hoursweek: "40",
      hoursday: "8"),
  new Person(
      id: "1",
      name: "Juan Cascante",
      avatar: "https://picsum.photos/id/5/350/350",
      hoursweek: "34",
      hoursday: "3"),
  new Person(
      id: "1",
      name: "Carlos limosner",
      avatar: "https://picsum.photos/id/6/350/350",
      hoursweek: "32",
      hoursday: "5"),
  new Person(
      id: "1",
      name: "Ricard Lopez",
      avatar: "https://picsum.photos/id/7/350/350",
      hoursweek: "45",
      hoursday: "8"),
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
            height: 480.0,
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: Icon(Icons.save),
                    title: Text('Pedro Perez'),
                    onTap: () => {}),
                Padding(
                    padding: const EdgeInsets.only(
                      left: 40,
                      top: 0,
                      right: 40,
                      bottom: 0,
                    ),
                    child: TextField(
                      autofocus: true,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Digite las horas de hoy.'),
                    ))
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
      body: Column(children: <Widget>[
        Container(
          height: 70,
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  
                },
                // controller: editingController,
                decoration: InputDecoration(
                        labelText: "Search",
                        hintText: "Search",
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25.0))
                        )
                    ),
              ),
            ),
        ),
        Container(
            height: 300,
            child: ListView.builder(
              itemCount: persons.length,
              itemBuilder: (context, position) {
                return new GestureDetector(
                    child: Card(
                      child: Slidable(
                          actionPane: SlidableDrawerActionPane(),
                          actionExtentRatio: 0.25,
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.indigoAccent,
                              backgroundImage: NetworkImage(
                                '${persons[position].avatar.toString()}',
                              ),
                              foregroundColor: Colors.white,
                              radius: 25.0,
                            ),
                            title: Text(
                                'Nombre: ${persons[position].name.toString()}'),
                            subtitle: Text(
                                'Horas: ${persons[position].hoursday.toString()}'),
                          ),
                          actions: <Widget>[
                            IconSlideAction(
                              caption: 'Detalles',
                              color: Colors.blue,
                              icon: Icons.description,
                              onTap: () => {
                                // print('This will be logged to the console in the browser.')
                                Navigator.of(context).pushNamed(DetailsPage.tag)
                              },
                            ),
                            IconSlideAction(
                              caption: 'más',
                              color: Colors.indigo,
                              icon: Icons.more_horiz,
                              onTap: () => {},
                            )
                          ]),
                    ),
                    onTap: () {
                      _modalBottomSheet(context);
                    });
              },
            ))
      ]),
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
