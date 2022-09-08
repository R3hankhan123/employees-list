import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:myq/model/employees.dart';

class Fetch {
  Future<List<Employees>> fetchEmployees() async {
    List<Employees>? employees;
    final response =
        await http.get(Uri.parse('http://192.168.0.160/demo/disp.php'));
    if (response.statusCode == 200) {
      return employees = (json.decode(response.body) as List)
          .map<Employees>((json) => Employees.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load employees from API');
    }
  }
}
