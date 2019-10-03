import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:myapp/database/model/person.dart';
import 'package:myapp/screens/details.dart';

class PersonList extends StatelessWidget {
  List<Person> persons;

  PersonList(
    List<Person> this.persons, 
    { Key key }
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: persons == null ? 0 : persons.length,
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
                                'Nombre: ${persons[position].firstName.toString()}'),
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
    );
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

}
