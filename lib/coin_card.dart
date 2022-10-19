import 'package:flutter/material.dart';

class CoinCard extends StatefulWidget {
  String? criptoCoin;
  String? currencyCoin;
  int? value;
  CoinCard(this.criptoCoin, this.currencyCoin, this.value);
  @override
  State<CoinCard> createState() => _CoinCardState();
}

class _CoinCardState extends State<CoinCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.transparent,
        elevation: 1.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
            padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
            child: widget.value != null
                ? Text(
                    //TODO: Update the Text Widget with the live bitcoin data here.
                    '1 ${widget.criptoCoin} = ${widget.value} ${widget.currencyCoin}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  )
                : Text("Loading.....")));
  }
}
