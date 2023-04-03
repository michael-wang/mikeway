<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

While develop with dart/Flutter, I developed certain ways of doing things. I collect them in this package and publish it for anyone who may need it.

## Features

- Enhancement for dart:convert package.


## Getting started

Adding package to `pubspec.yaml`:
```yaml
dependencies:
    mikeway ^0.0.1
```

Import the package in the source file and you're up to go:
```dart
import 'package:mikeway/mikeway.dart';
```

## Usage

Say you have a `Person` class to encode and decode:

```dart
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
}
```

Here is how you encode from Person to String, and decode from String to Person object:

```dart
print(jsonEncode(Person('mike', 20), indenx: '  '));
// {
//   "name": "mike",
//   "age": 20
// }

final user = jsonDecode('{"name": "mike", "age": 20}', Person.fromJson);
print(user.runtimeType);
// Person
print(user.toJson());
// {name: mike, age: 20}
```
