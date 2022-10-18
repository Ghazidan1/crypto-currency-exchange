//TODO: Add your imports here.
import 'dart:convert';

import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = '7AEB5D4C-5B57-4584-82E1-92700BA8E0CA';

class CoinData {
  Future<int> getValue(String criptoCoin, String currencyCoin) async {
    http.Response response = await http
        .get(Uri.parse("$coinAPIURL/$criptoCoin/$currencyCoin?apikey=$apiKey"));
    var jsonData = jsonDecode(response.body);
    double value = jsonData['rate'];
    return value.toInt();
  }
}
