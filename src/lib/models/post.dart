import 'package:flutter_surfing_app_challenge/models/user.dart';

class Post {
  final User user;
  final String title;
  final String image;
  final String time;
  final String likes;

  Post({
    required this.user,
    required this.title,
    required this.image,
    required this.time,
    required this.likes,
  });
}