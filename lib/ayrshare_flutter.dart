import 'dart:convert';
import 'package:http/http.dart' as http;

const baseUrl = "app.ayrshare.com";

Map preProcess(Map data) {
  data['source'] = 'pub.dev';
  return data;
}

Future<String> post({required String apiKey, required Map body}) async {
  var url = Uri.https(baseUrl, '/api/post');
  var response = await http.post(
    url,
    headers: {
      'Authorization': 'Bearer $apiKey',
      'Content-type': 'application/json'
    },
    body: json.encode(preProcess(body)),
  );
  return response.body;
}

Future<String> delete({required String apiKey, required Map body}) async {
  var url = Uri.https('app.ayrshare.com', '/api/post');
  var response = await http.delete(
    url,
    headers: {
      'Authorization': 'Bearer $apiKey',
      'Content-type': 'application/json'
    },
    body: json.encode(preProcess(body)),
  );
  return response.body;
}

Future<String> history({required String apiKey, required Map body}) async {
  Map<String, dynamic>? bodyMap = body.cast<String, dynamic>();
  var url = Uri.https('app.ayrshare.com', '/api/history', bodyMap);
  var response = await http.get(
    url,
    headers: {
      'Authorization': 'Bearer $apiKey',
      'Content-type': 'application/json'
    },
  );
  return response.body;
}

Future<String> historyId({required String apiKey, required String id}) async {
  var url = Uri.https('app.ayrshare.com', '/api/history/$id');
  var response = await http.get(
    url,
    headers: {
      'Authorization': 'Bearer $apiKey',
      'Content-type': 'application/json'
    },
  );
  return response.body;
}

Future<String> historyPlatform(
    {required String apiKey,
      required String platform,
      required Map body}) async {
  Map<String, dynamic>? bodyMap = body.cast<String, dynamic>();
  var url =
  Uri.https('app.ayrshare.com', '/api/history/$platform', bodyMap);
  var response = await http.get(
    url,
    headers: {
      'Authorization': 'Bearer $apiKey',
      'Content-type': 'application/json'
    },
  );
  return response.body;
}

Future<String> mediaUpload(
    {required String apiKey,
      required String contentType,
      required Map body}) async {
  var url = Uri.https(baseUrl, '/api/media/upload');
  var response = await http.post(
    url,
    headers: {
      'Authorization': 'Bearer $apiKey',
      'Content-type': contentType,
    },
    body: json.encode(preProcess(body)),
  );
  return response.body;
}

Future<String> mediaUploadUrl(
    {required String apiKey, required Map body}) async {
  Map<String, dynamic>? bodyMap = body.cast<String, dynamic>();
  var url =
  Uri.https('app.ayrshare.com', '/api/media/uploadUrl', bodyMap);
  var response = await http.get(
    url,
    headers: {
      'Authorization': 'Bearer $apiKey',
    },
  );
  return response.body;
}

Future<String> media({required String apiKey}) async {
  var url = Uri.https('app.ayrshare.com', '/api/media');
  var response = await http.get(
    url,
    headers: {
      'Authorization': 'Bearer $apiKey',
    },
  );
  return response.body;
}

Future<String> user({required String apiKey, required Map body}) async {
  Map<String, dynamic>? bodyMap = body.cast<String, dynamic>();
  var url = Uri.https('app.ayrshare.com', '/api/user', bodyMap);
  var response = await http.get(
    url,
    headers: {
      'Authorization': 'Bearer $apiKey',
    },
  );
  return response.body;
}

Future<String> analyticsPost(
    {required String apiKey, required Map body}) async {
  var url = Uri.https(baseUrl, '/api/analytics/post');
  var response = await http.post(
    url,
    headers: {
      'Authorization': 'Bearer $apiKey',
      'Content-type': 'application/json'
    },
    body: json.encode(preProcess(body)),
  );
  return response.body;
}

Future<String> analyticsLinks(
    {required String apiKey, required Map body}) async {
  Map<String, dynamic>? bodyMap = body.cast<String, dynamic>();
  var url =
  Uri.https('app.ayrshare.com', '/api/analytics/links', bodyMap);
  var response = await http.get(
    url,
    headers: {
      'Authorization': 'Bearer $apiKey',
    },
  );
  return response.body;
}

Future<String> analyticsSocial(
    {required String apiKey, required Map body}) async {
  var url = Uri.https(baseUrl, '/api/analytics/social');
  var response = await http.post(
    url,
    headers: {
      'Authorization': 'Bearer $apiKey',
      'Content-type': 'application/json'
    },
    body: json.encode(preProcess(body)),
  );
  return response.body;
}

Future<String> postComment({required String apiKey, required Map body}) async {
  var url = Uri.https(baseUrl, '/api/comments');
  var response = await http.post(
    url,
    headers: {
      'Authorization': 'Bearer $apiKey',
      'Content-type': 'application/json'
    },
    body: json.encode(preProcess(body)),
  );
  return response.body;
}

Future<String> getComments({required String apiKey, required Map body}) async {
  var url = Uri.https('app.ayrshare.com', '/api/comments/${body['id']}');
  var response = await http.get(
    url,
    headers: {
      'Authorization': 'Bearer $apiKey',
    },
  );
  return response.body;
}

Future<String> setAutoSchedule(
    {required String apiKey, required Map body}) async {
  var url = Uri.https(baseUrl, '/api/auto-schedule/set');
  var response = await http.post(
    url,
    headers: {
      'Authorization': 'Bearer $apiKey',
      'Content-type': 'application/json'
    },
    body: json.encode(preProcess(body)),
  );
  return response.body;
}

Future<String> deleteAutoSchedule(
    {required String apiKey, required Map body}) async {
  var url = Uri.https('app.ayrshare.com', '/api/auto-schedule/delete');
  var response = await http.delete(
    url,
    headers: {
      'Authorization': 'Bearer $apiKey',
      'Content-type': 'application/json'
    },
    body: json.encode(preProcess(body)),
  );
  return response.body;
}

Future<String> listAutoSchedule({required String apiKey}) async {
  var url = Uri.https('app.ayrshare.com', '/api/auto-schedule/list');
  var response = await http.get(
    url,
    headers: {
      'Authorization': 'Bearer $apiKey',
    },
  );
  return response.body;
}

Future<String> addFeed({required String apiKey, required Map body}) async {
  var url = Uri.https(baseUrl, '/api/feed');
  var response = await http.post(
    url,
    headers: {
      'Authorization': 'Bearer $apiKey',
      'Content-type': 'application/json'
    },
    body: json.encode(preProcess(body)),
  );
  return response.body;
}

Future<String> getFeeds({required String apiKey}) async {
  var url = Uri.https('app.ayrshare.com', '/api/feed');
  var response = await http.get(
    url,
    headers: {
      'Authorization': 'Bearer $apiKey',
    },
  );
  return response.body;
}

Future<String> deleteFeed({required String apiKey, required Map body}) async {
  var url = Uri.https('app.ayrshare.com', '/api/feed');
  var response = await http.delete(
    url,
    headers: {
      'Authorization': 'Bearer $apiKey',
      'Content-type': 'application/json'
    },
    body: json.encode(preProcess(body)),
  );
  return response.body;
}

///Business Plan Features

Future<String> createProfile(
    {required String apiKey, required Map body}) async {
  var url = Uri.https(baseUrl, '/api/profiles/profile');
  var response = await http.post(
    url,
    headers: {
      'Authorization': 'Bearer $apiKey',
      'Content-type': 'application/json'
    },
    body: json.encode(preProcess(body)),
  );
  return response.body;
}

Future<String> deleteProfile(
    {required String apiKey, required Map body}) async {
  var url = Uri.https('app.ayrshare.com', '/api/profiles/profile');
  var response = await http.delete(
    url,
    headers: {
      'Authorization': 'Bearer $apiKey',
      'Content-type': 'application/json'
    },
    body: json.encode(preProcess(body)),
  );
  return response.body;
}

Future<String> updateProfile(
    {required String apiKey, required Map body}) async {
  var url = Uri.https(baseUrl, '/api/profiles/profile');
  var response = await http.put(
    url,
    headers: {
      'Authorization': 'Bearer $apiKey',
      'Content-type': 'application/json'
    },
    body: json.encode(preProcess(body)),
  );
  return response.body;
}

Future<String> getProfiles({required String apiKey, required Map body}) async {
  Map<String, dynamic>? bodyMap = body.cast<String, dynamic>();
  var url = Uri.https('app.ayrshare.com', '/api/profiles', bodyMap);
  var response = await http.get(
    url,
    headers: {
      'Authorization': 'Bearer $apiKey',
    },
  );
  return response.body;
}

Future<String> unlinkSocial({required String apiKey, required Map body}) async {
  var url = Uri.https('app.ayrshare.com', '/api/profiles/social');
  var response = await http.delete(
    url,
    headers: {
      'Authorization': 'Bearer $apiKey',
      'Content-type': 'application/json'
    },
    body: json.encode(preProcess(body)),
  );
  return response.body;
}

Future<String> generateJWT({required String apiKey, required Map body}) async {
  var url = Uri.https(baseUrl, '/api/profiles/generateJWT');
  var response = await http.post(
    url,
    headers: {
      'Authorization': 'Bearer $apiKey',
      'Content-type': 'application/json'
    },
    body: json.encode(preProcess(body)),
  );
  return response.body;
}

Future<String> registerWebhook(
    {required String apiKey, required Map body}) async {
  var url = Uri.https(baseUrl, '/api/hook/webhook');
  var response = await http.post(
    url,
    headers: {
      'Authorization': 'Bearer $apiKey',
      'Content-type': 'application/json'
    },
    body: json.encode(preProcess(body)),
  );
  return response.body;
}

Future<String> unregisterWebhook(
    {required String apiKey, required Map body}) async {
  var url = Uri.https('app.ayrshare.com', '/api/hook/webhook');
  var response = await http.delete(
    url,
    headers: {
      'Authorization': 'Bearer $apiKey',
      'Content-type': 'application/json'
    },
    body: json.encode(preProcess(body)),
  );
  return response.body;
}

Future<String> getWebhooks({required String apiKey}) async {
  var url = Uri.https('app.ayrshare.com', '/api/hook/webhook');
  var response = await http.get(
    url,
    headers: {
      'Authorization': 'Bearer $apiKey',
    },
  );
  return response.body;
}
