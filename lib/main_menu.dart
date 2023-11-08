import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasty_creations/selected_food_page.dart';

import 'bookmarked.dart';

class MainMenu extends StatefulWidget {
  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  List<String> foodName = [
    'Pesto',
    'Lasagna',
    'Carbonara',
    'Spaghetti',
    'Fettucine',
  ];

  List<String> time = [
    '10 mins',
    '1 hr 15 mins',
    '30 mins',
    '2 hrs 15 mins',
    '15 mins',
  ];

  List<String> images = [
    'assets/foods/pesto.jpg',
    'assets/foods/lasagna.jpg',
    'assets/foods/carbonara.jpg',
    'assets/foods/spag.jpg',
    'assets/foods/fettucine.jpg',
  ];

  List<bool> isBookmarkedList = [false, false, false, false, false];

  Set<int> bookmarkedIndices = {};

  Future<void> loadBookmarks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String bookmarkedIndicesStr = prefs.getString('bookmarkedIndices') ?? '';
    List<String> bookmarkedIndicesList = bookmarkedIndicesStr.split(',');
    setState(() {
      bookmarkedIndices = bookmarkedIndicesList.map((str) => int.parse(str)).toSet();
    });
  }

  @override
  void initState() {
    super.initState();
    loadBookmarks();
  }

  void toggleBookmark(int index) async {
    setState(() {
      if (bookmarkedIndices.contains(index)) {
        bookmarkedIndices.remove(index);
      } else {
        bookmarkedIndices.add(index);
      }
    });

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String bookmarkedIndicesStr = bookmarkedIndices.join(',');
    await prefs.setString('bookmarkedIndices', bookmarkedIndicesStr);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Main Menu',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),

      //content
      body: Stack(
        children: [
          Container(
            color: Colors.white,
          ),

          // header
          Positioned.fill(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 60, top: 10, left: 20, right: 20),
              child: Container(
                padding: EdgeInsets.only(bottom: 40),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'What would you like\nto cook?',
                                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                              ),
                              SizedBox(height: 0),
                              /*
                              TextField(
                                decoration: InputDecoration(
                                  hintText: 'Search...',
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color: Colors.black26,
                                  ),
                                  filled: true,
                                  fillColor: Color(0xffececec),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10.0),
                                    ),
                                    borderSide: BorderSide(
                                      color: Colors.black12,
                                    ),
                                  ),
                                ),
                              )

                               */

                            ],
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 25),

                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Featured Recipes',
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                              ),
                              SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ],
                    ),

                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: foodName.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => SelectedFood(
                                  foodName: foodName[index],
                                  time: time[index],
                                  image: images[index],
                                ),
                              ),
                            );
                          },
                          child: IntrinsicHeight(
                            child: Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(
                                          color: Colors.grey,
                                          width: 1.0,
                                        ),
                                      ),
                                      child: Card(
                                        elevation: 10,
                                        color: Color(0xfff5f5f5),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  children: [
                                                    Expanded(
                                                      child: Row(
                                                        children: [
                                                          Expanded(
                                                            child: Padding(
                                                              padding: const EdgeInsets.fromLTRB(3.0, 8.0, 10.0, 8.0),
                                                              child: Container(
                                                                alignment: Alignment.topLeft,
                                                                child: Padding(
                                                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                                                  child: Text(
                                                                    foodName[index],
                                                                    style: TextStyle(
                                                                      fontSize: 18,
                                                                      fontWeight: FontWeight.w400,
                                                                      color: Colors.black,
                                                                    ),
                                                                    textAlign: TextAlign.left,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding: const EdgeInsets.fromLTRB(3.0, 10.0, 0.0, 8.0),
                                                            child: Container(
                                                              alignment: Alignment.topRight,
                                                              child: Container(
                                                                decoration: BoxDecoration(
                                                                  color: Color(0xFF81C279),
                                                                  borderRadius: BorderRadius.circular(30.0),
                                                                ),
                                                                child: Padding(
                                                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                                                  child: Row(
                                                                    children: [
                                                                      Icon(
                                                                        Icons.timer_outlined,
                                                                        color: Colors.white,
                                                                        size: 17,
                                                                      ),
                                                                      SizedBox(width: 5),
                                                                      Text(
                                                                        time[index],
                                                                        style: TextStyle(
                                                                          fontSize: 14,
                                                                          fontWeight: FontWeight.w400,
                                                                          color: Colors.white,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),

                                                          Container(
                                                            alignment: Alignment.topRight,
                                                            child: IconButton(
                                                              icon: Icon(
                                                                bookmarkedIndices.contains(index)
                                                                    ? Icons.bookmark
                                                                    : Icons.bookmark_border,
                                                                color: bookmarkedIndices.contains(index)
                                                                    ? Colors.green
                                                                    : Color(0xff81C279),
                                                              ),
                                                              onPressed: () {
                                                                toggleBookmark(index);
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(height: 5),
                                                    Padding(
                                                      padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 8),
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(10.0),
                                                        ),
                                                        child: Container(
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(15.0),
                                                            border: Border.all(
                                                              color: Colors.black26,
                                                              width: 3.0,
                                                            ),
                                                          ),
                                                          child: ClipRRect(
                                                            borderRadius: BorderRadius.circular(10.0),
                                                            child: Image.asset(
                                                              images[index],
                                                              height: 80,
                                                              width: 350,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Bottom Navigation Bar
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 65,
              decoration: BoxDecoration(
                color: Color(0xff62B34C),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: Icon(Icons.house_sharp),
                    color: Colors.white,
                    onPressed: () {
                      // already in home
                    },
                  ),
                  /*
                  IconButton(
                    icon: Icon(Icons.search),
                    color: Colors.white,
                    onPressed: () {

                    },
                  ),
                  */
                  IconButton(
                    icon: Icon(Icons.bookmark),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => BookmarkedRecipes(),
                        ),
                      );
                    },
                  ),

                  /*
                  IconButton(
                    icon: Icon(Icons.settings),
                    color: Colors.white,
                    onPressed: () {

                    },
                  ),

                   */
                ],
              ),
            ),
          ),
        ],
      ),

    );
  }
}