import 'package:flutter/material.dart';
import 'package:flutter_surfing_app_challenge/models/user.dart';

class UserService {
  User user1 = User(
    name: 'Michael Scott',
    image: 'assets/images/user01.jpg',
    color: Colors.redAccent,
    from: 'London, United Kingdom"',
  );

  User user2 = User(
    name: 'Emma Smith',
    image: 'assets/images/user02.jpg',
    color: Colors.lightBlue,
    from: 'Berlin, Germany',
  );

  User user3 = User(
    name: 'Pete Korando',
    image: 'assets/images/user03.jpg',
    color: Colors.lightGreen,
    from: 'Paris, France',
  );

  User user4 = User(
    name: 'Joseph Serio',
    image: 'assets/images/user04.jpg',
    color: Colors.pink,
    from: 'Madrid, Spain',
  );

  User user5 = User(
    name: 'Stacie Miner',
    image: 'assets/images/user05.jpg',
    color: Colors.deepOrangeAccent,
    from: 'London, United Kingdom',
  );

  User user6 = User(
    name: 'Carmela Delgado',
    image: 'assets/images/user06.jpg',
    color: Colors.deepPurpleAccent,
    from: 'London, United Kingdom',
  );

  // Users
  List<User> getUsers() {
    return [
      user1,
      user2,
      user3,
      user4,
      user5,
      user6,
    ];
  }
}