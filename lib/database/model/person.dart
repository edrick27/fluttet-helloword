class Person {
  int id;
  String _firstName;
  String _lastName;
  int _hoursday;
  String _avatar;

  Person(this._firstName, this._lastName,this._hoursday,this._avatar);

  Person.map(dynamic obj) {
    this._firstName = obj["firstname"];
    this._lastName = obj["lastname"];
  }

  String get firstName => _firstName;

  String get lastName => _lastName;

  int get hoursday => _hoursday;

  String get avatar => _avatar;


  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();

    map["firstname"] = _firstName;
    map["lastname"] = _lastName;

    return map;
  }

  void setPersonId(int id) {
    this.id = id;
  }
}