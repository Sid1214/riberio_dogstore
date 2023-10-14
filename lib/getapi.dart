import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:riberio_dogstore/data_model.dart';

Future<List<Data>?> fetchData() async {
  var url = Uri.parse('https://api.thedogapi.com/v1/breeds?limit=50&page=0');
  var response = await http.get(url);

  if (response.statusCode == 200) {
    // var data = json.decode(response.body);
    // print(data);
    final List body = json.decode(response.body);
    return body.map((e) => Data.fromJson(e)).toList();
    // Process the data as needed
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
  return null;
}
