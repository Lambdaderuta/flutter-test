import 'package:flutter/material.dart';
import 'package:flutter_app/models/photo.dart';

class PhotoView extends StatelessWidget {
  final Photo photo;
  PhotoView({this.photo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.network(photo.url),
            Text(photo.lorem),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Go back!'),
            ),
          ],
        ),
      ),
    );
  }
}
