import 'package:flutter/material.dart';
import 'package:flutter_surfing_app_challenge/models/post.dart';
import 'package:flutter_surfing_app_challenge/models/user.dart';
import 'package:flutter_surfing_app_challenge/services/post_service.dart';
import 'package:flutter_surfing_app_challenge/services/user_service.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final UserService userService = UserService();
  final PostService postService = PostService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(children: [
          buildHeaderWidget(),
          buildStoriesListWidget(),
        Expanded(
          child: buildPostListWidget(),
        ),
        ],),
      ),
    );
  }

  Widget buildHeaderWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Icon(
            Icons.menu,
            color: Colors.black,
            size: 30,
          ),
          Text(
          'Surfers',
            style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            ),
          ),
          Icon(
            Icons.search,
            color: Colors.black,
            size: 30,
          ),
      ],),
    );
  }

  Widget buildStoriesListWidget() {
    List<User> users = userService.getUsers();

    return SizedBox(
      height: 80.0,
      child: ListView.builder(
          itemCount: users.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) =>
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 60.0,
                  width: 60.0,
                  decoration: BoxDecoration(
                    color: users[index].color,
                    image: DecorationImage(
                      image: AssetImage(users[index].image),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: const BorderRadius.all( Radius.circular(60.0)),
                    border: Border.all(
                      color: users[index].color,
                      width: 4.0,
                    ),
                  ),
                ),
              )
      ),
    );
  }

  Widget buildPostListWidget() {
    List<Post> posts = postService.getPosts();

    return ListView.builder(
    itemCount: posts.length,
    itemBuilder: (context, index) => Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 12.0, vertical: 12.0),
      child: Stack(
        children: [
          SizedBox(
            height: 240.0,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(144.0),
                topLeft: Radius.circular(16.0),
                bottomLeft: Radius.circular(16.0),
                bottomRight: Radius.circular(16.0),
              ),
              child: Image.asset(
                posts[index].image,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Container(
              height: 140.0,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Colors.black54, Colors.transparent]),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16.0),
                  bottomRight: Radius.circular(16.0),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 240.0,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 12.0, vertical: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 48.0,
                        width: 48.0,
                        decoration: BoxDecoration(
                          color: posts[index].user.color,
                          image: DecorationImage(
                            image: AssetImage(posts[index].user.image),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: const BorderRadius.all( Radius.circular(60.0)),
                          border: Border.all(
                            color: posts[index].user.color,
                            width: 2.0,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            posts[index].user.name,
                            style: const TextStyle(
                              color: Color(0xFF3E3E3E),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            posts[index].time,
                            style: const TextStyle(
                              color: Color(0xFF7B7F83),
                              fontSize: 11.0,
                              fontWeight: FontWeight.bold,),
                          )
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 12.0, top: 12.0),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.favorite,
                          color: Colors.black,
                          size: 30,
                        ),
                        Text(
                          " ${posts[index].likes}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                        left: 12.0, top: 10.0),
                    child:  Icon(
                      Icons.bookmark,
                      color: Colors.black,
                      size: 30,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          // TODO: Navigate to the post details.
                        },
                        child: Container(
                          height: 44.0,
                          width: 44.0,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.play_arrow,
                              color: Colors.black,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              posts[index].title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              softWrap: false,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              posts[index].user.from,
                              style: const TextStyle(
                                letterSpacing: 2.0,
                                color: Color(0xFFC5C5C5),
                                fontWeight: FontWeight.bold,
                                fontSize: 11.0,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ),
    );
  }
}