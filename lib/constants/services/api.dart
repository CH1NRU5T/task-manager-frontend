import 'dart:convert';

import 'package:http/http.dart' as http;

Future<(String?, dynamic)> getRequest(String url) async {
  try {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return (null, jsonDecode(response.body));
    }
    return (jsonDecode(response.body)['error'] as String, null);
  } catch (e) {
    return (e.toString(), null);
  }
}
