import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WhatsNew extends StatefulWidget {
  @override
  _WhatsNewState createState() => _WhatsNewState();
}

class _WhatsNewState extends State<WhatsNew> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _drawHeader(),
          _drawTopStories(),
        ],
      ),
    );
  }

  Widget _drawHeader() {
    TextStyle _headerTitle = TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.w500,
    );

    TextStyle _headerDescription = TextStyle(
      color: Colors.white,
      fontSize: 14,
    );

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.26,
      decoration: BoxDecoration(
          image: DecorationImage(
        image: ExactAssetImage('assets/images/placeholder_bg.png'),
        fit: BoxFit.cover,
      )),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 40, right: 40),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              'The standard & Lorem Ipsum passage.',
              style: _headerTitle,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit in a consectetur',
              style: _headerDescription,
              textAlign: TextAlign.center,
            ),
          ]),
        ),
      ),
    );
  }

  Widget _drawTopStories() {
    return Container(
      color: Colors.grey.shade200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16, left: 16),
            child: _drawSectionTitle("Top Stories"),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Card(
              child: Column(
                children: [
                  _drawSingleRow(),
                  _drawDivider(),
                  _drawSingleRow(),
                  _drawDivider(),
                  _drawSingleRow(),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8, left: 8),
                  child: _drawSectionTitle("Recent Updates"),
                ),
                _DrawRecentUpdatesCard(Colors.red),
                _DrawRecentUpdatesCard(Colors.green),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _drawSingleRow() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          SizedBox(
            height: 90,
            width: 90,
            child: Image(
              image: ExactAssetImage('assets/images/placeholder_bg.png'),
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
                  "At vero eos et accusamus et iusto odio",
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
                          '10 min ago',
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
    );
  }

  Widget _drawDivider() {
    return Container(
      height: 1,
      color: Colors.grey.shade300,
    );
  }

  Widget _drawSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.grey.shade800,
          fontSize: 16),
    );
  }

  Widget _DrawRecentUpdatesCard(Color color) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage("assets/images/placeholder_bg.png"),
                fit: BoxFit.cover,
              ),
            ),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.26,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 90,
              padding: EdgeInsets.only(top: 2, bottom: 2),
              child: Text(
                "Sport",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
                textAlign: TextAlign.center,
              ),
              decoration: BoxDecoration(
                  color: color, borderRadius: BorderRadius.circular(4)),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              "De Finibus Bonorum et Malorum",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              children: [
                Icon(
                  Icons.access_time,
                  size: 18,
                ),
                SizedBox(
                  width: 4,
                ),
                Text("16 min"),
              ],
            ),
          )
        ],
      ),
    );
  }
}
