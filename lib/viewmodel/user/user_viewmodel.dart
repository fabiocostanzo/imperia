import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:imperia/model/user_model.dart';

class UserViewmodel {
  
  UserAuth parseUser(String responseBody) {
    final parsed =
        (jsonDecode(responseBody)).cast<Map<String, dynamic>>();

    return parsed.map<UserAuth>((json) => UserAuth.fromJson(json));
  }

  // TODO: Add Firebase firestore package to fetch single user. 
  Future<UserAuth> fetchUser(http.Client client) async {
    final response = await client
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

    // Synchronously run parsePhotos in the main isolate.
    return parseUser(response.body);
  }
}

