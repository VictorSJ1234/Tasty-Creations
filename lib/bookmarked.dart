import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasty_creations/selected_food_page.dart';
import 'main_menu.dart';

class BookmarkedRecipes extends StatefulWidget {
  @override
  _BookmarkedRecipesState createState() => _BookmarkedRecipesState();
}

class _BookmarkedRecipesState extends State<BookmarkedRecipes> {
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
          'Bookmarked Recipes',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.white,
          ),
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
                                'Bookmarked Recipes',
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                              ),
                              SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ],
                    ),
                    bookmarkedIndices.isEmpty
                        ? Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'You have no bookmarked recipes.',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                    )
                    :ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: bookmarkedIndices.length,
                      itemBuilder: (context, index) {
                        final int originalIndex = bookmarkedIndices.elementAt(index);
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => SelectedFood(
                                  foodName: foodName[originalIndex],
                                  time: time[originalIndex],
                                  image: images[originalIndex],
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
                                                                    foodName[originalIndex],
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
                                                                        time[originalIndex],
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
                                                              images[originalIndex],
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
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => MainMenu(),
                        ),
                      );
                    },
                  ),
                  /*
                  IconButton(
                    icon: Icon(Icons.search),
                    color: Colors.white,
                    onPressed: () {},
                  ),

                   */
                  IconButton(
                    icon: Icon(Icons.bookmark),
                    color: Colors.white,
                    onPressed: () {},
                  ),

                  /*
                  IconButton(
                    icon: Icon(Icons.settings),
                    color: Colors.white,
                    onPressed: () {},
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
