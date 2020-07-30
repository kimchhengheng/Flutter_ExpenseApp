


class Transaction  {
  static int _id=0;


  String _title;
  double _amount;
  DateTime _date;



  Transaction(title, amount) {
    _id++;
    this._title = title;
    this._amount = amount;
    this._date =DateTime.now();
  }

  static int get id => _id;

  String get title => _title;

  double get amount => _amount;

  DateTime get date => _date;
}
