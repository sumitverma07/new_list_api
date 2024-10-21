import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:new_list_api/model/album.dart';

Future<List<Album>> fetchAlbum() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body) as List;
    @override
    String toString() {
      return 'Rank{id: $id, rank: $rank, name: $name, country: $country, rating: $rating, points: $points}';
    }
  }
}
