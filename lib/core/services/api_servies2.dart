
import 'package:dio/dio.dart';
import 'package:insights_news_2_11/core/constant/appconstantes.dart';
import 'package:insights_news_2_11/features/home/data/newsmodel/newsmodel.dart';

class ApiServies{

//get byCategory

 static Future<Newsmodel?> getNewsByCategory(String category) async {
   try {
     var response = await Dio().get('${AppConstants.baseUrl}country=us&category=$category&apikey=${AppConstants.apiKey}');

     if(response.statusCode==200){
      Newsmodel news= Newsmodel.fromJson(response.data);

      return news;
     }
      
    } catch (e) {
      print(e.toString());
      
    }
    return null;

   }

   

}
