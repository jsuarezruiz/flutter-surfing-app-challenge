import 'package:flutter/material.dart';
import 'package:flutter_surfing_app_challenge/models/post.dart';
import 'package:flutter_surfing_app_challenge/models/user.dart';

class PostService {
  List<Post> getPosts() {
    return [
      Post(
        title: 'Probably considered the forefather of pro surfing',
        time: '4 hours ago',
        likes: '1.2k',
        user: User(
          name: 'Michael Scott',
          image: 'assets/images/user01.jpg',
          color: Colors.redAccent,
          from: 'London, United Kingdom"',
      ),
        image: 'assets/images/post01.jpg',),
      Post(
        title: 'One of the most inspirational people in the public eye',
        time: '5 hours ago', likes: '225',
        user: User(
          name: 'Emma Smith',
          image: 'assets/images/user02.jpg',
          color: Colors.lightBlue,
          from: 'Berlin, Germany',
      ),
        image: 'assets/images/post02.jpg',),
      Post(
        title: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
        time: '6 hours ago', likes: '225',
        user: User(
          name: 'Pete Korando',
          image: 'assets/images/user03.jpg',
          color: Colors.lightGreen,
          from: 'Paris, France',
        ),
        image: 'assets/images/post03.jpg',),
    ];
  }
}