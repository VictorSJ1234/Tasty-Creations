import 'package:flutter/material.dart';
import 'package:tasty_creations/main_menu.dart';

import 'bookmarked.dart';

class SelectedFood extends StatefulWidget {
  final String foodName;
  final String time;
  final String image;

  SelectedFood({required this.foodName, required this.time, required this.image});

  @override
  _SelectedFoodState createState() => _SelectedFoodState();
}

enum SelectedContentType {
  Ingredients,
  Instructions,
}

class _SelectedFoodState extends State<SelectedFood> {
  SelectedContentType selectedContentType = SelectedContentType.Ingredients;

  Map<String, String> descriptions = {
    'Pesto': 'Pesto pasta is easy to make and full of flavor. It tastes good hot or cold!',
    'Lasagna': 'Lasagna is a classic Italian dish made with layers of pasta, ricotta cheese, mozzarella cheese, ground meat, and tomato sauce. It is baked to perfection.',
    'Carbonara': 'Carbonara is a Roman pasta dish made with eggs, Pecorino Romano cheese, guanciale (or pancetta), and black pepper. It has a creamy and rich flavor.',
    'Spaghetti': 'Spaghetti is a popular Italian pasta dish often served with a variety of sauces. It is a versatile and quick-to-cook pasta.',
    'Fettucine': 'Fettucine Alfredo is a creamy pasta dish made with fettucine pasta, butter, heavy cream, and Parmesan cheese. It\'\s simple yet indulgent.'
  };

  Map<String, List<String>> ingredients = {
    'Pesto': ['1 (16 ounce) package pasta', '2 tablespoons olive oil ', '½ cup chopped onion', '2 ½ tablespoons pesto', 'salt to taste', 'ground black pepper to taste', '2 tablespoons grated Parmesan cheese'],
    'Lasagna': ['½ pound ground pork', '½ pound lean ground beef', '½ cup minced onion', '1 (28 ounce) can crushed tomatoes', '1 (8 ounce) can tomato sauce'],
    'Carbonara': ['Spaghetti', 'Eggs', 'Pecorino Romano cheese', 'Guanciale or pancetta', 'Black pepper'],
    'Spaghetti': ['Spaghetti pasta', 'Your choice of sauce and ingredients'],
    'Fettucine': ['Fettucine pasta', 'Butter', 'Heavy cream', 'Parmesan cheese']
  };

  Map<String, List<String>> instructions = {
    'Pesto': [
      'Boil the pasta in salted water until al dente.',
      'In a pan, heat olive oil and sauté chopped onions until translucent.',
      'Add pesto sauce and mix well. Season with salt and pepper.',
      'Toss cooked pasta in the pesto sauce until well coated.',
      'Serve hot, garnished with grated Parmesan cheese.'
    ],
    'Lasagna': [
      'Cook lasagna noodles according to package instructions.',
      'In a bowl, mix ricotta cheese with mozzarella cheese.',
      'In a separate pan, brown ground meat and add tomato sauce.',
      'Layer lasagna noodles, cheese mixture, and meat sauce in a baking dish.',
      'Repeat layers and finish with a layer of mozzarella cheese on top.',
      'Bake in the oven until cheese is bubbly and golden brown.'
    ],
    'Carbonara': [
      'Cook lasagna noodles according to package instructions.',
      'In a bowl, mix ricotta cheese with mozzarella cheese.',
      'In a separate pan, brown ground meat and add tomato sauce.',
      'Layer lasagna noodles, cheese mixture, and meat sauce in a baking dish.',
      'Repeat layers and finish with a layer of mozzarella cheese on top.',
      'Bake in the oven until cheese is bubbly and golden brown.'
    ],
    'Spaghetti': [
      'Cook lasagna noodles according to package instructions.',
      'In a bowl, mix ricotta cheese with mozzarella cheese.',
      'In a separate pan, brown ground meat and add tomato sauce.',
      'Layer lasagna noodles, cheese mixture, and meat sauce in a baking dish.',
      'Repeat layers and finish with a layer of mozzarella cheese on top.',
      'Bake in the oven until cheese is bubbly and golden brown.'
    ],
    'Fettucine': [
      'Cook lasagna noodles according to package instructions.',
      'In a bowl, mix ricotta cheese with mozzarella cheese.',
      'In a separate pan, brown ground meat and add tomato sauce.',
      'Layer lasagna noodles, cheese mixture, and meat sauce in a baking dish.',
      'Repeat layers and finish with a layer of mozzarella cheese on top.',
      'Bake in the oven until cheese is bubbly and golden brown.'
    ],
  };

  Map<String, String> servings = {
    'Pesto': 'Eight',
    'Lasagna': 'Eight',
    'Carbonara': 'Eight',
    'Spaghetti': 'Four',
    'Fettucine': 'Six'
  };

  @override
  Widget build(BuildContext context) {
    String description = descriptions[widget.foodName] ?? '';
    List<String> instructionList = instructions[widget.foodName] ?? [];
    String serving = servings[widget.foodName] ?? '';
    List<String> ingredientList = ingredients[widget.foodName] ?? [];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          widget.foodName,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      // Content
      body: Stack(
        children: [
          Container(
            color: Colors.white,
          ),

          Positioned.fill(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 60, top: 15, left: 10, right: 10),
              child: Container(
                padding: EdgeInsets.only(bottom: 40),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 22),
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
                                  widget.image,
                                  height: 160,
                                  width: 350,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 60,
                          right: 60,
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  blurRadius: 2.0,
                                  spreadRadius: 1.0,
                                  offset: Offset(0, 4.0),
                                ),
                              ],
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.timer,
                                          color: Color(0xff62B34C),
                                          size: 17,
                                        ),

                                        SizedBox(width: 5,),

                                        Text(
                                          widget.time,
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),

                                Container(
                                  height: 30,
                                  width: 2,
                                  color: Color(0xff62B34C),
                                ),

                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.room_service,
                                          color: Color(0xff62B34C),
                                          size: 17,
                                        ),

                                        SizedBox(width: 5,),


                                        Text(
                                          serving,
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),


                    Column(
                      children: [
                        IntrinsicHeight(
                          child: Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.fromLTRB(15.0, 1.0, 15.0, 15.0),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.stretch,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(20.0, 5.0, 0.0, 0.0),
                                                child: SizedBox(
                                                  child: Text(
                                                    'Description:',
                                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black, fontFamily: 'Outfit'),
                                                    textAlign: TextAlign.justify,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 4),
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 30.0),
                                                child: Text(
                                                  description,
                                                  style: TextStyle(fontSize: 14, color: Colors.black, fontFamily: 'Outfit'),
                                                  textAlign: TextAlign.justify,
                                                ),
                                              ),

                                              Expanded(
                                                child: Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 50),
                                                  child: Center(
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                      children: [
                                                        Expanded(
                                                          child: Container(
                                                            decoration: BoxDecoration(
                                                              color: selectedContentType == SelectedContentType.Ingredients
                                                                  ?  Color(0xff81C279)
                                                                  : Colors.white,
                                                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: Colors.black.withOpacity(0.3),
                                                                  spreadRadius: 2,
                                                                  blurRadius: 5,
                                                                  offset: Offset(0, 3),
                                                                ),
                                                              ],
                                                            ),
                                                            child: TextButton(
                                                              onPressed: () {
                                                                setState(() {
                                                                  selectedContentType = SelectedContentType.Ingredients;
                                                                });
                                                              },
                                                              child: Text(
                                                                'Ingredients',
                                                                style: TextStyle(fontSize: 13.0, color: selectedContentType == SelectedContentType.Ingredients
                                                                    ? Colors.white
                                                                    : Colors.black),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          height: 30.0,
                                                          width: 20.0,
                                                        ),
                                                        Expanded(
                                                          child: Container(
                                                            decoration: BoxDecoration(
                                                              color: selectedContentType == SelectedContentType.Instructions
                                                                  ?  Color(0xff81C279)
                                                                  : Colors.white,
                                                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: Colors.black.withOpacity(0.3),
                                                                  spreadRadius: 2,
                                                                  blurRadius: 5,
                                                                  offset: Offset(0, 3),
                                                                ),
                                                              ],
                                                            ),
                                                            child: TextButton(
                                                              onPressed: () {
                                                                setState(() {
                                                                  selectedContentType = SelectedContentType.Instructions;
                                                                });
                                                              },
                                                              child: Text(
                                                                'Instructions',
                                                                style: TextStyle(fontSize: 13.0, color: selectedContentType == SelectedContentType.Instructions
                                                                    ?  Colors.white
                                                                    : Color(0xff81C279)),
                                                                textAlign: TextAlign.justify,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),

                                              if (selectedContentType == SelectedContentType.Ingredients)
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.fromLTRB(20.0, 30.0, 0.0, 0.0),
                                                      child: Text(
                                                        'Ingredients:',
                                                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black, fontFamily: 'Outfit'),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 15.0),
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.stretch,
                                                        children: ingredientList.map((ingredient) {
                                                          return Container(
                                                            padding: EdgeInsets.only(bottom: 8.0),
                                                            child: Text(
                                                              '• $ingredient',
                                                              style: TextStyle(fontSize: 14, color: Colors.black, fontFamily: 'Outfit'),
                                                              textAlign: TextAlign.justify,
                                                            ),
                                                          );
                                                        }).toList(),
                                                      ),
                                                    ),

                                                  ],
                                                ),

                                              if (selectedContentType == SelectedContentType.Instructions)
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.fromLTRB(20.0, 30.0, 0.0, 0.0),
                                                      child: SizedBox(
                                                        child: Text(
                                                          'Instructions:',
                                                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black, fontFamily: 'Outfit'),
                                                          textAlign: TextAlign.justify,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(height: 4),
                                                    Padding(
                                                      padding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 15.0),
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.stretch,
                                                        children: instructionList.asMap().entries.map((entry) {
                                                          final stepNumber = entry.key + 1;
                                                          final stepText = entry.value;
                                                          return Padding(
                                                            padding: EdgeInsets.only(bottom: 8.0),
                                                            child: RichText(
                                                              text: TextSpan(
                                                                style: TextStyle(fontSize: 14, color: Colors.black, fontFamily: 'Outfit'),
                                                                children: [
                                                                  TextSpan(
                                                                    text: 'Step $stepNumber: '+'\n',
                                                                    style: TextStyle(fontWeight: FontWeight.bold),
                                                                  ),
                                                                  TextSpan(
                                                                    text: stepText,
                                                                  ),
                                                                ],
                                                              ),
                                                              textAlign: TextAlign.justify,
                                                            ),
                                                          );
                                                        }).toList(),
                                                      ),
                                                    ),

                                                  ],
                                                ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 30), // Bottom padding
                      ],
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
