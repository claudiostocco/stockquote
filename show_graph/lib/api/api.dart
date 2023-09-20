// https://www.youtube.com/watch?v=XH3vYluxVXs

import 'dart:convert';

import 'package:http/http.dart' as http;

class Api {
  final Map<String, String> _baseHeaders = {'Content-Type': 'application/json'};
  String _authorization = '';

  Future<Api> initInstance() async {
    // var savedAuth = await getPreferences(kAuthKey);
    // if (savedAuth.containsKey('authorization')) {
    //   _authorization = savedAuth['authorization'];
    // }
    return this;
  }

  Api auth() {
    _baseHeaders['authorization'] = 'bearer $_authorization';
    return this;
  }

  Api unAuth() {
    _baseHeaders.remove('authorization');
    return this;
  }

  // Future<http.Response> _authorize() async {
  //   var uri = Uri.parse('http://$_baseUrl/auth');
  //   var body = '{"client_id": "$_clientID", "client_secret": "$_clientSecret"}';
  //   var response = await http.post(uri, headers: _baseHeaders, body: body);
  //   if (response.statusCode == 200) {
  //     try {
  //       var jsonBody = json.decode(response.body);
  //       _authorization = jsonBody['access_token'] ?? '';
  //       // print('_authorization: $_authorization');
  //       savePreferences(kAuthKey, {'authorization': _authorization});
  //     } catch (e) {
  //       log(e.toString());
  //     }
  //   } else {
  //     _authorization = '';
  //   }
  //   return response;
  // }

  Future<http.Response> get(String url, {Map<String, String>? headers}) async {
    var localHeaders = headers ?? {};
    localHeaders.addAll(_baseHeaders);

    var uri = Uri.parse(url);
    try {
      var response = await http.get(uri, headers: localHeaders);
      // if (response.statusCode == 401) {
      //   await _authorize();
      //   return await auth().get(url, headers: headers);
      // }
      return response;
    } catch (e, s) {
      return http.Response(
          json.encode({
            'error': e.toString().trim(),
            'stackTrace': s.toString(),
            'url': '${uri.origin}${uri.path}',
          }),
          503);
    }
  }

  Future<http.Response> post(
    String url, {
    Map<String, String>? headers,
    Object? body,
  }) async {
    var localHeaders = headers ?? {};
    localHeaders.addAll(_baseHeaders);

    var uri = Uri.parse(url);
    try {
      var response = await http.post(uri, headers: localHeaders, body: body);
      // if (response.statusCode == 401 &&
      //     (response.body.contains('token authorization') ||
      //         response.body.contains('Unauthorized'))) {
      //   var resAuth = await _authorize();
      //   if (resAuth.statusCode != 200) {
      //     return resAuth;
      //   }
      //   return await auth().post(url, headers: headers, body: body);
      // }
      return response;
    } catch (e, s) {
      return http.Response(
          json.encode({
            'error': e.toString().trim(),
            'stackTrace': s.toString(),
            'url': '${uri.origin}${uri.path}',
          }),
          503);
    }
  }
}
