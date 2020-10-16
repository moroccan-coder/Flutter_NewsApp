

//Loading ProgressBar TopStories Item

import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

Widget loading() {
  return Container(
    padding: EdgeInsets.all(40),
    child: Center(
      child: CircularProgressIndicator(),
    ),
  );
}

Widget connectionError() {
  return Container(
    padding: EdgeInsets.all(16),
    child: Text("Connection Error!!!"),
  );
}

Widget error(var error) {
  return Container(
    padding: EdgeInsets.all(16),
    child: Text(error.toString()),
  );
}

Widget noData() {
  return Container(
    padding: EdgeInsets.all(16),
    child: Text("No Data Available!"),
  );
}


String parseDateHuman(String dateTime) {
  DateTime time = DateTime.parse(dateTime);

  return timeago.format(time);
}