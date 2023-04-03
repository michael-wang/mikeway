import 'dart:convert';

abstract class JsonEncodable<T> {
  Map<String, dynamic> toJson();
}

String jsonEncode(
  JsonEncodable object, {
  String indent = '',
  Object? Function(Object? nonEncodable)? toEncodable,
}) {
  if (indent.isNotEmpty) {
    final encoder = JsonEncoder.withIndent(indent, toEncodable);
    return encoder.convert(object);
  }
  return json.encode(object, toEncodable: toEncodable);
}

typedef FromJson<T> = T Function(Map<String, dynamic> map);

T jsonDecode<T>(
  String source,
  FromJson<T> fromJson, {
  Object? Function(Object? key, Object? value)? reviver,
}) {
  final map = json.decode(source, reviver: reviver);
  return fromJson(map);
}
