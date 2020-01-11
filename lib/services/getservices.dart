import 'package:http/http.dart' as http;
import 'package:mediumexample/model/bear_model.dart';
import 'dart:convert';

class GetService{
Future<List<BearModel>> fetchservice() async {
  final String url = "https://api.punkapi.com/v2/beers";
  final response = await http.get(url);
  if (response.statusCode == 200) {
    Iterable list = (json.decode(response.body));
    List<BearModel> postmodel = list.map((i) => BearModel.fromJson(i)).toList();
    print(postmodel);

    return postmodel;
  }else{
    throw Exception("cannot be retirved");
  }
}
}