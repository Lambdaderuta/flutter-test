import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:lipsum/lipsum.dart' as lipsum;

class Photo {
  final String id;
  final String url;
  final String lorem = lipsum.createParagraph();

  Photo({this.id, this.url});

  Future<List<Photo>> fetchPhotos() async {
    var response =
        await http.get('https://picsum.photos/v2/list?page=1&limit=10');

    if (response.statusCode == 200) {
      return List<Photo>.from(
          jsonDecode(response.body).map((i) => Photo.fromJson(i)));
    } else {
      throw Exception('Failed to load photos');
    }
  }

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      id: json['id'],
      url: json['download_url'],
    );
  }
}


