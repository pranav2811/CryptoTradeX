import 'package:http/http.dart' as http;

class CoinAPI {
  final String apiKey = '734EF8C1-6545-4252-B501-FA0C6D041165';

  Future<dynamic> fetchData(String endpoint) async {
    final url = Uri.parse('https://rest.coinapi.io/v1/$endpoint');

    final response = await http.get(
      url,
      headers: {'X-CoinAPI-Key': apiKey},
    );

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
