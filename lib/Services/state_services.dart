import 'dart:convert';
import 'package:covid_19_mob_app/Services/Utilities/app_url.dart';
import 'package:http/http.dart' as http;
import '../Model/world_states_model.dart';

class StateServices{

  Future<WorldStatesModel> fetchWorldStatesApi()async {
    final response=await http.get(Uri.parse(AppUrl.worldStatesApi));
    if(response.statusCode==200){

      var data =jsonDecode(response.body.toString());
      return WorldStatesModel.fromJson(data);

    }
    else{
        throw(Exception("Error"));
    }
}
  Future<List<dynamic>> fetchCountriesListApi()async {
    var data;
    final response=await http.get(Uri.parse(AppUrl.countriesList));
    if(response.statusCode==200){

     data =jsonDecode(response.body);
      return data;

    }
    else{
          throw(Exception("Error"));
    }
  }

}