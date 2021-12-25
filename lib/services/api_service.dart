import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> getBill(String billId) async {
  Uri url = Uri(
      scheme: 'https',
      host: 'dev-report-api.sbox.shop',
      path: '/public/get-bill');
  final response = await http.post(url, body: {'bill_id': billId});
  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    return json.decode(response.body);
  }
}
