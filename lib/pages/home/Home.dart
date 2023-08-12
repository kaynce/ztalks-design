import 'package:flutter/material.dart';
import 'package:ztalks/pages/home/FilterLanguage.dart';
import 'package:ztalks/pages/home/Space.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.title});

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _counter = 0;
  final intGroupSizeItems = <int>[1, 2, 3, 4];
  final strLanguageItems = <String>[
    "English",
    "Vietamese",
    "Indonesian",
    "Thai",
    "Burmese",
  ];
  final strLevelProciencyItems = <String>[
    "Beginner",
    "Intermediate",
    "Advanced"
  ];

  int? intGroupSizeSelected;
  String? strLanguageSelected;
  String? strLevelProciencySelected;

  void _showMenuForm(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          final screenWidth = MediaQuery.of(context).size.width;
          final screenHeight = MediaQuery.of(context).size.height;

          return Container(
            width: screenWidth,
            height: screenHeight * 0.3,
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min, //Not working
              children: [
                ElevatedButton(
                  onPressed: () {
                    _showCreateSpaceForm(context);
                  },
                  child: Text('Create a space'),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Donate/Buy me a coffee'),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Back'),
                ),
              ],
            ),
          );
        });
  }

  void _showCreateSpaceForm(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        final screenWidth = MediaQuery.of(context).size.width;
        final screenHeight = MediaQuery.of(context).size.height;

        return Container(
          width: screenWidth,
          height: screenHeight * 0.5,
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Create a Space',
                style: TextStyle(fontSize: 18),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Topic'),
              ),
              SizedBox(height: 5),
              Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.black, width: 2),
                ),
                child: DropdownButton<int>(
                  value: intGroupSizeSelected,
                  isExpanded: true,
                  iconSize: 36,
                  icon: Icon(Icons.arrow_drop_down, color: Colors.black),
                  underline: Container(),
                  style: TextStyle(
                    // Set the style of the selected value
                    color: Colors
                        .black, // Change the color of the selected value text
                    fontSize:
                        14, // Adjust the font size of the selected value text
                  ),
                  items: [
                    DropdownMenuItem<int>(
                      value: null,
                      child: Text('Select Group Size'),
                    ),
                    ...intGroupSizeItems.map(buildMenuItem).toList(),
                  ],
                  onChanged: (intGroupSizeSelected) => setState(() {
                    this.intGroupSizeSelected = intGroupSizeSelected;
                  }),
                ),
              ),
              SizedBox(height: 5),
              Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.black, width: 2),
                ),
                child: DropdownButton<String>(
                  value: strLanguageSelected,
                  isExpanded: true,
                  iconSize: 36,
                  icon: Icon(Icons.arrow_drop_down, color: Colors.black),
                  underline: Container(),
                  //alignment: Alignment.center,
                  style: TextStyle(
                    // Set the style of the selected value
                    color: Colors
                        .black, // Change the color of the selected value text
                    fontSize:
                        14, // Adjust the font size of the selected value text
                  ),
                  items: [
                    DropdownMenuItem<String>(
                      value: null,
                      child: Text('Select Language'),
                    ),
                    ...strLanguageItems.map(buildMenuItem).toList(),
                  ],
                  onChanged: (strLanguageSelected) => setState(() {
                    this.strLanguageSelected = strLanguageSelected;
                  }),
                ),
              ),
              SizedBox(height: 5),
              Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.black, width: 2),
                ),
                child: DropdownButton<String>(
                  value: strLevelProciencySelected,
                  isExpanded: true,
                  iconSize: 36,
                  icon: Icon(Icons.arrow_drop_down, color: Colors.black),
                  underline: Container(),
                  style: TextStyle(
                    // Set the style of the selected value
                    color: Colors
                        .black, // Change the color of the selected value text
                    fontSize:
                        14, // Adjust the font size of the selected value text
                  ),
                  items: [
                    DropdownMenuItem<String>(
                      value: null,
                      child: Text(
                        'Select Level Proficiency',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    ...strLevelProciencyItems.map(buildMenuItem).toList(),
                  ],
                  onChanged: (strLevelProciencyItems) => setState(() {
                    this.strLevelProciencySelected = strLevelProciencySelected;
                  }),
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Cancel',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      //Navigator.pop(context);
                    },
                    child: Text('Create Space'),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  DropdownMenuItem<T> buildMenuItem<T>(T item) => DropdownMenuItem<T>(
        value: item,
        child: Text(
          item.toString(),
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
        ),
      );

  List<String> _displayedLanguages = [];
  List<String> _uniqueLanguages = [];
  List<Map<String, dynamic>> _displayedItems = [];

  final List<Map<String, dynamic>> _allItems = [
    {
      'title': 'English for the better future',
      'language': 'English',
      'Proficiency': 'Advanced',
      'strUserId': '00001',
      'audience': ['00001', '00002', '00003'],
    },
    {
      'title': 'French for the better future',
      'language': 'Indonesian',
      'Proficiency': 'Advanced',
      'strUserId': '00002',
      'audience': ['00001', '00002', '00003'],
    },
    {
      'title': 'French for the better future',
      'language': 'French',
      'Proficiency': 'Upper Beginner',
      'strUserId': '00003',
      'audience': ['00001', '00002', '00003'],
    },
    {
      'title': 'French for the better future',
      'language': 'Vietamese',
      'Proficiency': 'Beginner',
      'strUserId': '00004',
      'audience': ['00001', '00002', '00003'],
    },
    {
      'title': 'French for the better future',
      'language': 'Thai',
      'Proficiency': 'Upper Intermediate',
      'strUserId': '00005',
      'audience': ['00001', '00002', '00003'],
    },
    {
      'title': 'French for the better future',
      'language': 'Malay',
      'Proficiency': 'Advanced',
      'strUserId': '00006',
      'audience': ['00001', '00002', '00003'],
    },
    {
      'title': 'French for the better future',
      'language': 'Filipino',
      'Proficiency': 'Intermediate',
      'strUserId': '00007',
      'audience': ['00001', '00002', '00003'],
    },
    {
      'title': 'French for the better future',
      'language': 'Filipino',
      'Proficiency': 'Beginner',
      'strUserId': '00008',
      'audience': ['00001', '00002', '00003'],
    },
    {
      'title': 'French for the better future',
      'language': 'Filipino',
      'Proficiency': 'Upper Beginner',
      'strUserId': '00009',
      'audience': ['00001', '00002', '00003'],
    },
    {
      'title': 'French for the better future',
      'language': 'Filipino',
      'Proficiency': 'Upper Beginner',
      'strUserId': '00010',
      'audience': ['00001', '00002', '00003'],
    },
  ];
  List<Map<String, String>> ztalkers = [
    {'strUserId': '00001', 'strImagePath': 'speaker_1.jpeg'},
    {'strUserId': '00002', 'strImagePath': 'speaker_2.jpeg'},
    {'strUserId': '00003', 'strImagePath': 'speaker_3.jpeg'},
    {'strUserId': '00004', 'strImagePath': 'speaker_4.jpeg'},
    {'strUserId': '00005', 'strImagePath': 'speaker_5.jpeg'},
    {'strUserId': '00006', 'strImagePath': 'speaker_6.jpeg'},
    {'strUserId': '00007', 'strImagePath': 'speaker_7.jpeg'},
    {'strUserId': '00008', 'strImagePath': 'speaker_8.jpeg'},
    {'strUserId': '00009', 'strImagePath': 'speaker_9.jpeg'},
    {'strUserId': '00010', 'strImagePath': 'speaker_10.jpeg'},
  ];

  @override
  void initState() {
    super.initState();
    _allItems.sort((a, b) {
      var languageA = a['language'] ?? '';
      var languageB = b['language'] ?? '';

      if (languageA == 'English') {
        return -2; // "English" comes first
      } else if (languageB == 'English') {
        return 2; // "English" comes first
      } else if (languageA == 'Filipino') {
        return -1; // "Filipino" comes second
      } else if (languageB == 'Filipino') {
        return 1; // "Filipino" comes second
      }

      return languageB
          .compareTo(languageA); // Sort other languages in descending order
    });
    _displayedItems = List.from(_allItems);
    filterUniqueLanguages();
  }

  void filterItems(String filter) {
    setState(() {
      if (filter.isEmpty) {
        _displayedItems = List.from(_allItems);
      } else {
        _displayedItems = _allItems
            .where((item) =>
                item['language']!
                    .toLowerCase()
                    .contains(filter.toLowerCase()) ||
                item['Proficiency']!
                    .toLowerCase()
                    .contains(filter.toLowerCase()))
            .toList();
      }
    });
  }

  void filterUniqueLanguages() {
    Set<String> languagesSet = {};

    for (var item in _allItems) {
      var language = item['language'];
      languagesSet.add(language ?? '');
    }

    setState(() {
      _uniqueLanguages.addAll(languagesSet.toList());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Search for a space/title...',
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Wrap(
                      children: [
                        // ElevatedButton(
                        //     onPressed: () {
                        //       Navigator.push(
                        //           context,
                        //           MaterialPageRoute(
                        //               builder: (context) => FilterLanguage()));
                        //     },
                        //     child: Text('English')),

                        for (var i = 0; i < _uniqueLanguages.length; i++)
                          Container(
                            padding: EdgeInsets.only(left: 5, right: 5),
                            child: ElevatedButton(
                              onPressed: () => filterItems(_uniqueLanguages[i]),
                              child: Text(_uniqueLanguages[i]),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text('Explore Spaces'),
                        ],
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: _displayedItems.length,
                        itemBuilder: (context, index) {

                          final item = _displayedItems[index];
                          final userId = item['strUserId']!;
                          final imagePath = ztalkers.firstWhere(
                              (ztalker) => ztalker['strUserId'] == userId,
                              orElse: () =>
                                  {'strImagePath': ''})['strImagePath'];

                          return Container(
                            margin: EdgeInsets.only(bottom: 5),
                            height: 130,
                            child: Card(
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Row(
                                            children: [
                                              CircleAvatar(
                                                backgroundImage: AssetImage('assets/img/speakers/$imagePath'),
                                                backgroundColor:
                                                    Colors.lightBlue,
                                                radius: 20,
                                              ),
                                              SizedBox(width: 10),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(_displayedItems[index]
                                                      ['title']!),
                                                  Text(
                                                      '${_displayedItems[index]['language']} - ${_displayedItems[index]['Proficiency']}'),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) => Space(),
                                                ));
                                          },
                                          child: Container(
                                            width: 30,
                                            height: 30,
                                            decoration: BoxDecoration(
                                                color: Colors.green,
                                                shape: BoxShape.circle),
                                            child: Center(
                                              child: Icon(
                                                Icons.phone,
                                                color: Colors.white,
                                                size: 20,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 15),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 20),
                                      child: Row(
                                        children: [
                                          CircleAvatar(
                                            backgroundImage:
                                                AssetImage('assets/img/2.jpg'),
                                            backgroundColor: Colors.lightBlue,
                                            radius: 20,
                                          ),
                                          SizedBox(width: 5),
                                          CircleAvatar(
                                            backgroundImage:
                                                AssetImage('assets/img/3.jpg'),
                                            backgroundColor: Colors.lightBlue,
                                            radius: 20,
                                          ),
                                          SizedBox(width: 5),
                                          CircleAvatar(
                                            backgroundImage:
                                                AssetImage('assets/img/4.jpg'),
                                            backgroundColor: Colors.lightBlue,
                                            radius: 20,
                                          ),
                                          SizedBox(width: 5),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //Call the bottom sheet here
          _showMenuForm(context);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Friends'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Messages'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: 'Notif.'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
