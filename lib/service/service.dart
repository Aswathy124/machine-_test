
import 'package:http/http.dart' as http;
import 'package:machinetest/model/model.dart';


class ApiService {
  final String baseUrl = "https://fake-json-api.mock.beeceptor.com/users";

  Future<List<User>> fetchUsers() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      return userFromJson(response.body);
    } else {
      throw Exception('Failed to load users');
    }
  }
}