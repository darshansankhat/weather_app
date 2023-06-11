import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/Weather/Model/Wether_model.dart';

class Weather_api {

  static Weather_api weather_api = Weather_api();

  Future<WetherModel> api_Data() async {
    String link =
        "https://api.openweathermap.org/data/2.5/weather?q=surat&appid=6c294f8c84d20aa17ed1181c560f1c4d";
    var response = await http.get(Uri.parse(link));

    var json = jsonDecode(response.body);

    WetherModel w1 = WetherModel.fromJson(json);

    return w1;
  }
}
