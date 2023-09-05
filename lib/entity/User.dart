class User
{
  late String id;
  late String _name;
  late String _password;
  late String _mail;
  late String _parents_mobile;
  late String _address;
  late String _branch;
  late int _year;
  late int _hostel_name;
  late int room_no;

  User(this.id, this._name, this._password, this._mail, this._parents_mobile,
      this._address, this._branch, this._year, this._hostel_name, this.room_no);

  int get hostel_name => _hostel_name;

  set hostel_name(int value) {
    _hostel_name = value;
  }

  int get year => _year;

  set year(int value) {
    _year = value;
  }

  String get branch => _branch;

  set branch(String value) {
    _branch = value;
  }

  String get address => _address;

  set address(String value) {
    _address = value;
  }

  String get parents_mobile => _parents_mobile;

  set parents_mobile(String value) {
    _parents_mobile = value;
  }

  String get mail => _mail;

  set mail(String value) {
    _mail = value;
  }

  String get password => _password;

  set password(String value) {
    _password = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }




}