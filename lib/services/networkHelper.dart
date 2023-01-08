import 'package:http/http.dart' as http;
import 'dart:convert';
class NetworkHelper {
  String url;
  NetworkHelper({this.url});
  void getData()async{
    var response = await http.get(Uri.parse(url));
    if (response.statusCode==200) {
      var data=jsonDecode(response.body);
      double temp=data['main']['temp'];
      int conditionNumber=data['weather'][0]['id'];
      String cityName=data['name'];
      print(temp);
      print(conditionNumber);
      print(cityName);
      
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }

  }
}
