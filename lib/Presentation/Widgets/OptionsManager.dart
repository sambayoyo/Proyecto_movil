import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OptionItem extends StatefulWidget {
  final String title;

  OptionItem({required this.title});

  @override
  _OptionItemState createState() => _OptionItemState();
}

class _OptionItemState extends State<OptionItem> {
  late SharedPreferences _prefs;
  bool _isSelected = false;

  @override
  void initState() {
    super.initState();
    _initPrefs();
  }

  Future<void> _initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      _isSelected = _prefs.getBool(widget.title) ?? false;
    });
  }

  Future<void> _saveOptionState(bool value) async {
    await _prefs.setBool(widget.title, value);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.title),
      trailing: Switch(
        value: _isSelected,
        onChanged: (value) {
          setState(() {
            _isSelected = value;
          });
          _saveOptionState(value);
        },
      ),
    );
  }
}
