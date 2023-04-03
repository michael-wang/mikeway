import 'package:equatable/equatable.dart';
import 'package:mikeway/mikeway.dart';
import 'package:test/test.dart';

class Person extends Equatable implements JsonEncodable {
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
  List<Object?> get props => [name, age];
}

main() {
  group('jsonEncode', () {
    test('Happy case', () {
      final user = Person('mike', 20);
      expect(jsonEncode(user), '{"name":"mike","age":20}');
    });

    test('Test with indent', () {
      final user = Person('mike', 20);
      expect(
        jsonEncode(user, indent: '  '),
        '''
{
  "name": "mike",
  "age": 20
}''',
      );
    });
  });

  group('jsonDecode', () {
    test('Happy case', () {
      final expected = Person('mike', 20);
      print('expected: $expected');
      final got = jsonDecode('{"name":"mike","age":20}', Person.fromJson);
      print('got: $got');
      expect(expected, got);
    });
  });
}
