/// name : ""
/// id : 1
/// selected : false

class Task {
  String? _name;
  int? _id;
  bool _selected=false;

  String? get name => _name;
  int? get id => _id;
  bool get selected => _selected;

  set name(String? value) {
    _name = value;
  }

  Task({
      String? name, 
      int? id, 
      bool selected=false}){
    _name = name;
    _id = id;
    _selected = selected;
}

  Task.fromJson(dynamic json) {
    _name = json["name"];
    _id = json["id"];
    _selected = json["selected"]??false;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["name"] = _name;
    map["id"] = _id;
    map["selected"] = _selected;
    return map;
  }

  set id(int? value) {
    _id = value;
  }

  set selected(bool value) {
    _selected = value;
  }
}