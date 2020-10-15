import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/models/category.dart';
import 'package:news_app/utilities/api_utilities.dart';




class CategoriesAPI{


  Future<List<Category>> fetchCategories() async{

    String url = base_api + all_categories_api;
     List<Category> categories = List<Category>();

     var response = await http.get(url);

     if(response.statusCode == 200)
       {

         var jsonData = jsonDecode(response.body);
         var data = jsonData['data'];

         for(var item in data)
           {
             Category category = new Category(item['id'].toString(), item['title'].toString());
             categories.add(category);
           }

       }

     return categories;

  }


}
