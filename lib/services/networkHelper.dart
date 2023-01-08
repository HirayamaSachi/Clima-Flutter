import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  String url;
  var data;
  NetworkHelper({this.url});
  void getData() async {
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      data = jsonDecode(response.body);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
