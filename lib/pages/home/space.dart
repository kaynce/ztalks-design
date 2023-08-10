import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // Add this line

class Space extends StatefulWidget {
  const Space({super.key});

  @override
  State<Space> createState() => _SpaceState();
}

class _SpaceState extends State<Space> {
  var isMicrophoneOn = false;

  void toggleMicrophone(){
    setState(() {
      isMicrophoneOn = !isMicrophoneOn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kay\'s Space'),
      ),
      body: Column(
        children: [
          Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Practice English for the better Future',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                Container(
                    padding: EdgeInsets.all(20),
                    child: Text('Hello, world! Embrace the day with a smile, ' +
                        'for new opportunities await. Let\'s make today ' +
                        'remarkable and spread positivity like wildfire. Good morning!')),
              ],
            ),
          ),
          Container(
            alignment: Alignment.bottomLeft,
              padding: EdgeInsets.only(left: 20),
            child: Text(
              'Speakers',
              style: TextStyle(fontSize: 15),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Stack(
                                      children: [
                                        CircleAvatar(
                                          backgroundImage:
                                              AssetImage('assets/img/1.jpg'),
                                          radius: 30,
                                        ),
                                        Transform.translate(
                                          offset: Offset(37, 37),
                                          child: Container(
                                            height: 30,
                                            width: 30,
                                            decoration: BoxDecoration(
                                              color: Colors.grey[300],
                                              shape: BoxShape.circle,
                                            ),
                                            child: GestureDetector(
                                              onTap: toggleMicrophone,
                                              child: Icon(
                                                isMicrophoneOn ? FontAwesomeIcons.microphone: FontAwesomeIcons.microphoneSlash,
                                                color: Colors.black,
                                                size:
                                                    16, // Use 'size' instead of 'iconSize'
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 5),
                                    Text('Kay'),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Stack(
                                      children: [
                                        CircleAvatar(
                                          backgroundImage:
                                              AssetImage('assets/img/2.jpg'),
                                          radius: 30,
                                        ),
                                        Transform.translate(
                                          offset: Offset(37, 37),
                                          child: Container(
                                            height: 30,
                                            width: 30,
                                            decoration: BoxDecoration(
                                              color: Colors.grey[300],
                                              shape: BoxShape.circle,
                                            ),
                                            child: Icon(
                                              FontAwesomeIcons.microphoneSlash,
                                              color: Colors.black,
                                              size:
                                                  16, // Use 'size' instead of 'iconSize'
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 5),
                                    Text('Nadine'),
                                  ],
                                ),
                              ),
                              
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            alignment: Alignment.bottomLeft,
              padding: EdgeInsets.only(left: 20),
            child: Text(
              'Audience',
              style: TextStyle(fontSize: 15),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Stack(
                                      children: [
                                        CircleAvatar(
                                          backgroundImage:
                                              AssetImage('assets/img/4.jpg'),
                                          radius: 30,
                                        ),
                                        Transform.translate(
                                          offset: Offset(37, 37),
                                          child: Container(
                                            height: 30,
                                            width: 30,
                                            decoration: BoxDecoration(
                                              color: Colors.grey[300],
                                              shape: BoxShape.circle,
                                            ),
                                            child: Icon(
                                              FontAwesomeIcons.microphoneSlash,
                                              color: Colors.black,
                                              size:
                                                  16, // Use 'size' instead of 'iconSize'
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 5),
                                    Text('Kay'),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Stack(
                                      children: [
                                        CircleAvatar(
                                          backgroundImage:
                                              AssetImage('assets/img/1.jpg'),
                                          radius: 30,
                                        ),
                                        Transform.translate(
                                          offset: Offset(37, 37),
                                          child: Container(
                                            height: 30,
                                            width: 30,
                                            decoration: BoxDecoration(
                                              color: Colors.grey[300],
                                              shape: BoxShape.circle,
                                            ),
                                            child: Icon(
                                              FontAwesomeIcons.microphoneSlash,
                                              color: Colors.black,
                                              size:
                                                  16, // Use 'size' instead of 'iconSize'
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 5),
                                    Text('Kay'),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Stack(
                                      children: [
                                        CircleAvatar(
                                          backgroundImage:
                                              AssetImage('assets/img/3.jpg'),
                                          radius: 30,
                                        ),
                                        Transform.translate(
                                          offset: Offset(37, 37),
                                          child: Container(
                                            height: 30,
                                            width: 30,
                                            decoration: BoxDecoration(
                                              color: Colors.grey[300],
                                              shape: BoxShape.circle,
                                            ),
                                            child: Icon(
                                              FontAwesomeIcons.microphoneSlash,
                                              color: Colors.black,
                                              size:
                                                  16, // Use 'size' instead of 'iconSize'
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 5),
                                    Text('Kay'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.comments), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.share), label: ''),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.handPaper), label: ''),
        ],
      ),
    );
  }
}
