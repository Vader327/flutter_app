import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Stateful App Example",
      home: FavouriteCity()));
}

class FavouriteCity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FavouriteCityState();
  }
}

class _FavouriteCityState extends State<FavouriteCity> {
  String cityName = "";
  var _currencies = ['Rupees', 'Dollars', 'Pounds', 'Other'];
  var _currentSelectedItem = "Rupees";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stateful App"),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            TextField(
              onChanged: (String userInput) {
                setState(() {
                  cityName = userInput;
                });
              },
            ),
            DropdownButton<String>(
              items: _currencies.map((String dropDownStringItem) {
                return DropdownMenuItem<String>(
                    value: dropDownStringItem, child: Text(dropDownStringItem));
              }).toList(),
              onChanged: (String selectedItem) {
                _onDropDownItemSelected(selectedItem);
              },
              value: _currentSelectedItem,
            ),
            Padding(
                child: Text(
                  "City Name: $cityName",
                  style: TextStyle(fontSize: 20.0),
                ),
                padding: EdgeInsets.all(30.0))
          ],
        ),
      ),
    );
  }

  void _onDropDownItemSelected(String newValue){
    setState(() {
      this._currentSelectedItem = newValue;
    });
  }
}
