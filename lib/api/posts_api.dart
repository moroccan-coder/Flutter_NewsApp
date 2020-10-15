import 'dart:convert';

import 'package:news_app/models/post.dart';
import 'package:news_app/utilities/api_utilities.dart';
import 'package:http/http.dart' as http;

class PostsAPI {
  Future<List<Post>> fetchWhatsNew() async {
    String url = base_api + whats_new_api;

    List<Post> posts = new List<Post>();

    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    var data = jsonData['data'];

    for (var item in data) {
      Post post = new Post(
        id: item['id'],
        title: item['title'].toString(),
        content: item['content'].toString(),
        dateWritten: item['date_written'].toString(),
        categoryId: item['category_id'],
        featuredImage: item['featured_image'].toString(),
        userId: item['user_id'],
        voteDown: item['vote_down'],
        votersDown: (item['voters_down'] ==null) ? List<int>(): jsonDecode(item['voters_down']) ,
        votersUp: (item['voters_up'] == null) ? List<int>():  jsonDecode(item['voters_up']),
        voteUp: item['vote_up'],
      );

      posts.add(post);


    }

    return posts;
  }
}
