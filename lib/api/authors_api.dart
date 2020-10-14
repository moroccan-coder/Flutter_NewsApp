import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/models/author.dart';
import 'package:news_app/utilities/api_utilities.dart';

class AuthorsAPI {


  Future<List<Author>> fetchAllAuthors() async{
    String url = base_api + all_authors_api;
    var response = await http.get(url);

    List<Author> authors = List<Author>();
    if(response.statusCode == 200)
      {
        var jsonData = jsonDecode(response.body);
        var data = jsonData['data'];

        for(var item in data)
          {
            Author author = new Author(item['id'].toString(), item['name'].toString(), item['email'].toString(), item['avatar'].toString());
            authors.add(author);

          }

        for(var author in authors)
          {
            print(author.email);
          }
      }

    return authors;

  }
}
