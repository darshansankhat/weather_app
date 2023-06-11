import 'package:flutter/cupertino.dart';
import 'package:weather_app/Weather/Api_helpar/Api_data.dart';
import 'package:weather_app/Weather/Model/Wether_model.dart';

class WetherProvider extends ChangeNotifier
{

  WetherModel w1=WetherModel();

  String city="Surat";

  void changeCity(String value)
  {
    city = value;

    notifyListeners();
  }

    List cityList=[
      "Surat",
      "Ahmedabad",
      "Rajkot",
      "Amreli",
      "Gandhi nagar",
    ];

  void apiDataParsing()
  async {
    w1 = await Weather_api.weather_api.api_Data();
    notifyListeners();
  }
}