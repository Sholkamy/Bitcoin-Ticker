import 'coin_data.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const openCoinDataURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = 'A5413560-E686-46B1-ABD9-21CCB5C83E6D';

class NetworkHelper {
  NetworkHelper({this.selectedCurrency});
  String selectedCurrency;
  Future getCoinData() async {
    List<double> cryptocurrencyPrice = [];
    for (String cryptoCurrency in cryptoList) {
      http.Response response = await http.get(Uri.parse(
          '$openCoinDataURL/$cryptoCurrency/$selectedCurrency?apikey=$apiKey'));
      if (response.statusCode == 200) {
        cryptocurrencyPrice.add(jsonDecode(response.body)['rate']);
      } else
        print(response.statusCode);
    }
    return cryptocurrencyPrice;
  }
}
