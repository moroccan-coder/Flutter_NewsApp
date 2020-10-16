import 'package:flutter/material.dart';
import 'package:news_app/api/posts_api.dart';
import 'package:news_app/models/post.dart';
import 'package:news_app/screens/single_post.dart';
import 'package:news_app/utilities/data_utilitis.dart';

class Popular extends StatefulWidget {
  @override
  _PopularState createState() => _PopularState();
}

class _PopularState extends State<Popular> {

  PostsAPI postsAPI = new PostsAPI();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: postsAPI.fetchPostsByCategory("12"),
      builder: (context,AsyncSnapshot snapshot) {

        switch(snapshot.connectionState)
            {
          case ConnectionState.none:
            return connectionError();
            break
                ;
          case ConnectionState.active:
            return loading();
            break;

          case ConnectionState.waiting:
            return loading();
            break;

          case ConnectionState.done :

            if(snapshot.hasData)
              {
                if(snapshot.hasError)
                  {
                   return error(snapshot.error);
                  }
                else{

                  List<Post> posts = snapshot.data;


                  return ListView.builder(
                    itemCount: posts.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: _drawSingleRow(posts[index]),
                      );
                    },
                  );
                }
              }
            else{
              return noData();
            }
            break;
        }



        return Container(width: 0,height: 0,);
      },
    );
  }

  Widget _drawSingleRow(Post post) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: (){
          Navigator.push(context,MaterialPageRoute(builder: (context) {
            return SinglePost(post);
          },));
        },
        child: Row(
          children: [
            SizedBox(
              height: 90,
              width: 90,
              child: Image(
                image: NetworkImage(post.featuredImage),
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: 18,
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    post.title,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('yassine el haitar'),
                      Row(
                        children: [
                          Icon(
                            Icons.timer,
                            size: 16,
                          ),
                          Text(
                            parseDateHuman(post.dateWritten),
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }


}
