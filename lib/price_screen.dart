import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'coin_card.dart';
import 'coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';
  int? btcValue;
  int? ethValue;
  int? ltcValue;

  DropdownButton<String> androidDropdown() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String currency in currenciesList) {
      var newItem = DropdownMenuItem(
        child: Text(
          currency,
          style: TextStyle(fontSize: 20.0),
        ),
        value: currency,
      );
      dropdownItems.add(newItem);
    }

    return DropdownButton<String>(
      dropdownColor: Colors.blueGrey,
      menuMaxHeight: 500.0,
      value: selectedCurrency,
      items: dropdownItems,
      onChanged: (value) {
        setState(() async {
          selectedCurrency = value!;
          getData();
        });
      },
    );
  }

  CupertinoPicker iOSPicker() {
    List<Text> pickerItems = [];
    for (String currency in currenciesList) {
      pickerItems.add(Text(currency));
    }

    return CupertinoPicker(
      backgroundColor: Colors.cyan,
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        print(selectedIndex);
      },
      children: pickerItems,
    );
  }

  //TODO: Create a method here called getData() to get the coin data from coin_data.dart
  void getData() async {
    btcValue = await CoinData().getValue('BTC', selectedCurrency);
    ethValue = await CoinData().getValue('ETH', selectedCurrency);
    ltcValue = await CoinData().getValue('LTC', selectedCurrency);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    //TODO: Call getData() when the screen loads up.
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('🤑 Coin Ticker')),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Colors.lightBlue,
          Colors.lightBlueAccent,
          Colors.cyan,
          Colors.cyanAccent
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CoinCard('BTC', selectedCurrency, btcValue),
                  CoinCard('ETH', selectedCurrency, ethValue),
                  CoinCard('LTC', selectedCurrency, ltcValue)
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10.0),
              color: Colors.transparent,
              child: Platform.isIOS ? iOSPicker() : androidDropdown(),
            ),
          ],
        ),
      ),
    );
  }
}
