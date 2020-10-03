import 'package:flutter/material.dart';

class PageModel {
  String _image;
  IconData _icon;
  String _title;
  String _description;

  PageModel(this._icon, this._image, this._title, this._description);

  String get description => _description;

  String get title => _title;

  IconData get icon => _icon;

  String get image => _image;
}
