// ignore_for_file: prefer_const_constructors_in_immutables, library_private_types_in_public_api, use_key_in_widget_constructors, unnecessary_null_comparison, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:shopping_app/Utils/typedef.dart';
import 'package:shopping_app/launguage/launguages.dart';

///Provides a customizable [DropdownButton] for all languages
class LanguagePickerDropdown extends StatefulWidget {
  LanguagePickerDropdown({
     this.itemBuilder,
     this.initialValue,
     this.onValuePicked,
     this.languagesList,
  });

  ///This function will be called to build the child of DropdownMenuItem
  ///If it is not provided, default one will be used which displays
  ///flag image, isoCode and phoneCode in a row.
  ///Check _buildDefaultMenuItem method for details.
  final ItemBuilder itemBuilder;

  ///It should be one of the ISO ALPHA-2 Code that is provided
  ///in languagesList map of languages.dart file.
  final String initialValue;

  ///This function will be called whenever a Language item is selected.
  final ValueChanged<Language> onValuePicked;

  /// List of languages available in this picker.
  final List<Language> languagesList;

  @override
  _LanguagePickerDropdownState createState() => _LanguagePickerDropdownState();
}

class _LanguagePickerDropdownState extends State<LanguagePickerDropdown> {
  List<Language> _languages;
  Language _selectedLanguage;

  @override
  void initState() {
    super.initState();
    _languages = widget.languagesList;
    if (widget.initialValue != null) {
      try {
        _selectedLanguage = _languages
            .where((language) => language.isoCode == widget.initialValue)
            .toList()[0];
      } catch (error) {
        error.toString();
      }
    } else {
      _selectedLanguage = _languages[0];
    }
  }

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<Language>> items = _languages
        .map((language) => DropdownMenuItem<Language>(
            value: language,
            child: widget.itemBuilder != null
                ? widget.itemBuilder(language)
                : _buildDefaultMenuItem(language)))
        .toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text("Language",
            style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.w700)),
      ),
      body: Center(
        child: Column(
          children: [
            DropdownButtonHideUnderline(
              child: Expanded(
                child: DropdownButton<Language>(
                  iconSize: 50,
                  focusColor: Colors.black,
                  iconEnabledColor: Colors.black,
                  onChanged: (value) {
                    setState(() {
                      _selectedLanguage = value;
                      widget.onValuePicked(value);
                    });
                  },
                  isDense: true,
                  items: items,
                  value: _selectedLanguage,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDefaultMenuItem(Language language) {
    return Row(
      children: [
        SizedBox(width: 8.0),
        Text("${language.name} (${language.isoCode})"),
      ],
    );
  }
}



