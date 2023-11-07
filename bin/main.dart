/*
* Taylor Ramirez-Rodriguez
* Hybrid App 6
* 2023-November-6th
*
*/

import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;

/// *
/// Loki was here.
/// He's my dog, and he's sleeping on my lap while I do this.
/// *

void main() {
  var random = Random();
  int results = random.nextInt(5) + 8;
  getRandomRandos(results);
}

Future<void> getRandomRandos(int results) async {
  print('Showing $results random users:\n');
  final String apiUrl =
      'https://random-data-api.com/api/users/random_user?size=$results';

  try {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> users = jsonDecode(response.body);

      for (var user in users) {
        String userInfo =
            'UID: ${user['id']}, Name: ${user['first_name']} ${user['last_name']}';
        print(userInfo);
      }
    } else {
      print(
          'Oh no mate! Something went wrong. Status code: ${response.statusCode}');
    }
  } catch (e) {
    print('Error. Aaaaaaahhhhh: $e');
  }

  print('\nBy Tay.');
}
