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

Future<(String?, dynamic)> postRequest(
    String url, Map<String, dynamic> body) async {
  try {
    http.Response response =
        await http.post(Uri.parse(url), body: jsonEncode(body), headers: {
      'Content-Type': 'application/json',
    });
    if (response.statusCode == 200) {
      return (null, jsonDecode(response.body));
    }
    return (jsonDecode(response.body)['error'] as String, null);
  } catch (e) {
    return (e.toString(), null);
  }
}

Future<(String?, dynamic)> updateRequest(
    String url, Map<String, dynamic> body) async {
  try {
    http.Response response =
        await http.put(Uri.parse(url), body: jsonEncode(body), headers: {
      'Content-Type': 'application/json',
    });
    if (response.statusCode == 200) {
      return (null, jsonDecode(response.body));
    }
    return (jsonDecode(response.body)['error'] as String, null);
  } catch (e) {
    return (e.toString(), null);
  }
}

Future<(String?, dynamic)> deleteRequest(
    String url, Map<String, dynamic> body) async {
  try {
    http.Response response =
        await http.delete(Uri.parse(url), body: jsonEncode(body), headers: {
      'Content-Type': 'application/json',
    });
    if (response.statusCode == 200) {
      return (null, jsonDecode(response.body));
    }
    return (jsonDecode(response.body)['error'] as String, null);
  } catch (e) {
    return (e.toString(), null);
  }
}
