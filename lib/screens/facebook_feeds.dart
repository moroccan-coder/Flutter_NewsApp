import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:news_app/api/posts_api.dart';
import 'package:news_app/models/post.dart';
import 'package:news_app/shared_ui/navigation_drawer.dart';
import 'package:news_app/utilities/data_utilitis.dart';

class FacebookFeeds extends StatefulWidget {




  @override
  _FacebookFeedsState createState() => _FacebookFeedsState();
}

class _FacebookFeedsState extends State<FacebookFeeds> {
  PostsAPI postsAPI = new PostsAPI();
  TextStyle _hashTagsStyle = TextStyle(
    color: Colors.orange.shade400,
  );

  TextStyle _buttonStyle = TextStyle(color: Colors.blue.shade300);

  List<int> ids = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ids = [0,3];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Facebook Feeds"),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      drawer: NavigationDrawer(),
      body: FutureBuilder(
        future: postsAPI.fetchPostsByCategory("5"),
         builder: (context,AsyncSnapshot snapshot) {

          switch(snapshot.connectionState)
          {
            case ConnectionState.none:
             return error(snapshot.error);

              break;

            case ConnectionState.active :
              return loading();
              break;
            case ConnectionState.waiting :
              return loading();
              break;

            case ConnectionState.done :

              if(snapshot.hasData)
                {

                  List<Post> posts = snapshot.data;

                return ListView.builder(
                    itemCount: posts.length,
                    padding: EdgeInsets.all(8.0),
                    itemBuilder: (context, index) {
                      return Card(
                        margin: EdgeInsets.only(bottom: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _drawHeader(index,posts[index]),
                            _drawTitle(posts[index]),
                            _drawHashTags(),
                            _drawBody(posts[index]),
                            _drawFooter(),
                          ],
                        ),
                      );
                    },
                  );
                }
              else{
                 return Text("No Data");
              }

              break;
          }


           return Container(width: 0,);
         },
      ),
    );
  }

  _drawHeader(int index, Post post) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/images/placeholder_bg.png"),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Yassine El haitar",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  post.dateWritten,
                  style: TextStyle(color: Colors.grey.shade600),
                ),
              ],
            ),
          ],
        ),
        Row(
          children: [
            IconButton(
              icon: Icon(
                Icons.favorite,
                color:(ids.contains(index)) ? Colors.red: Colors.grey.shade400,
              ),
              onPressed: () {

                setState(() {
                  if(ids.contains(index))
                    {
                      ids.remove(index);
                    }else{
                    ids.add(index);
                  }
                });
              },
            ),
            Transform.translate(
                offset: Offset(-12, 0),
                child: Text(
                  "12",
                  style: TextStyle(color: Colors.grey.shade400),
                ))
          ],
        ),
      ],
    );
  }

  _drawTitle(Post post) {
    return Padding(
      padding: EdgeInsets.only(bottom: 4, left: 16, right: 16, top: 16),
      child: Text(
        post.title,
        style: TextStyle(color: Colors.grey.shade900),
      ),
    );
  }

  _drawHashTags() {
    return Container(
      child: Wrap(
        children: [
          FlatButton(
              child: Text("#Computer", style: _hashTagsStyle),
              onPressed: () {}),
          FlatButton(
              child: Text("#AI", style: _hashTagsStyle), onPressed: () {}),
          FlatButton(
              child: Text("#Technology", style: _hashTagsStyle),
              onPressed: () {}),
        ],
      ),
    );
  }

  _drawBody(Post post) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.32,
      child: Image(
        image: NetworkImage(post.featuredImage),
        fit: BoxFit.cover,
      ),
    );
  }

  _drawFooter() {
    return Wrap(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FlatButton(
              child: Text(
                "2 COMMENTS",
                style: _buttonStyle,
              ),
              onPressed: () {},
            ),
            Row(
              children: [
                FlatButton(
                  child: Text(
                    "SHARE",
                    style: _buttonStyle,
                  ),
                  onPressed: () {},
                ),
                FlatButton(
                  child: Text(
                    "OPEN",
                    style: _buttonStyle,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
