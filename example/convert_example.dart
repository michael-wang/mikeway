import 'package:mikeway/mikeway.dart';

class Person implements JsonEncodable {
  final String name;
  final int age;

  Person(this.name, this.age);

  @override
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'age': age,
    };
  }

  factory Person.fromJson(Map<String, dynamic> map) {
    return Person(map['name'], map['age']);
  }

  @override
  String toString() {
    return '{"name": "mike", "age": 20}';
  }
}

void main() {
  print(jsonEncode(Person('mike', 20), indent: '  '));

  final user = jsonDecode('{"name":"mike", "age": 20}', Person.fromJson);
  print('${user.runtimeType} ${user.toJson()}');
}
