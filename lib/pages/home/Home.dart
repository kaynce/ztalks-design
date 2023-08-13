import 'package:flutter/material.dart';
import 'package:ztalks/pages/home/FilterLanguage.dart';
import 'package:ztalks/pages/home/Space.dart';
import 'package:ztalks/pages/home/modal/menu_bar_modal.dart';
import 'package:ztalks/api/data.dart';

//Use bloc for filtering not StreamController said chatgpt
//typedef ShowMenuCallback = void Function(BuildContext context);
//typedef ShowMenuModalCallback = void Function(BuildContext context);

class Home extends StatefulWidget {
  //final VoidCallback showMenuFormCallback;
  final String title;
  //final ShowMenuModalCallback? showMenuModalCallback;

  //const Home(
  //{super.key, required this.title, required this.showMenuModalCallback});
  const Home({super.key, required this.title});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Data data = Data();
  List<String> _uniqueLanguages = [];
  List<Map<String, dynamic>> _displayedItems = [];

  late ScrollController _scrollController;
  var languageClick = 'All';

  void changeLanguage(language) {
    setState(() {
      languageClick = language;
    });
  }

  @override
  void initState() {
    super.initState();

    //Get the data from other file
    //data.getSortedItems();

    //Displayed only 5 container
    _displayedItems = List.from(data.getSortedItems().take(10));

    //Filter unique languages for buttons
    filterUniqueLanguages();

    _scrollController = ScrollController();

    //Not working
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // Load more items when scrolled to the bottom
        loadMoreItems();
      }
    });
  }

  void searchQuery(String filter) {
    setState(() {
      _displayedItems = data
          .getSortedItems()
          .where((item) =>
              item['topic']!.toLowerCase().contains(filter.toLowerCase()) ||
              item['language']!.toLowerCase().contains(filter.toLowerCase()) ||
              item['Proficiency']!.toLowerCase().contains(filter.toLowerCase()))
          .toList();
    });
  }

  void filterItems(String filter) {
    setState(() {
      if (filter.isEmpty) {
        reachMaxItems = false;
        _displayedItems = List.from(data.getSortedItems().take(10));
      } else {
        _displayedItems = data
            .getSortedItems()
            //.take(10)
            .where((item) =>
                item['language']!
                    .toLowerCase()
                    .contains(filter.toLowerCase()) ||
                item['Proficiency']!
                    .toLowerCase()
                    .contains(filter.toLowerCase()))
            .toList();
      }

      if (filter.isEmpty) {
        changeLanguage('All');
      } else {
        changeLanguage(filter);
      }
    });
  }

  var reachMaxItems = false;

  void loadMoreItems() {
    setState(() {
      final int currentLength = _displayedItems.length;
      final int nextIndex = currentLength + 10;

      if (nextIndex <= data.getSortedItems().length) {
        reachMaxItems = false;
        _displayedItems
            .addAll(data.getSortedItems().getRange(currentLength, nextIndex));
      } else {
        reachMaxItems = true;
      }
    });
  }

  void filterUniqueLanguages() {
    Set<String> languagesSet = {};

    for (var item in data.getSortedItems()) {
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
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Search for a space/topic...',
                    prefixIcon: Icon(Icons.search),
                  ),
                  onSubmitted: (String input) {
                    //List<String> searchWords = input.split(',');
                    searchQuery(input);
                  },
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

                        Container(
                          padding: EdgeInsets.only(left: 5, right: 5),
                          child: ElevatedButton(
                            onPressed: () => filterItems(''),
                            child: Text('All'),
                          ),
                        ),
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
                          Text('Explore Spaces' + ' - ' + '$languageClick'),
                        ],
                      ),
                      ListView.builder(
                        controller: _scrollController,
                        shrinkWrap: true,
                        //physics: NeverScrollableScrollPhysics(),
                        itemCount: _displayedItems.length,
                        itemBuilder: (context, index) {
                          final item = _displayedItems[index];
                          final userId = item['strUserId']!;
                          final speakerImagePath = data
                              .getAllZtalkers()
                              .firstWhere(
                                  (ztalker) => ztalker['strUserId'] == userId,
                                  orElse: () =>
                                      {'strImagePath': ''})['strImagePath'];

                          //Audience id
                          final audienceIds = _displayedItems[index]
                              ['audienceId'] as List<String>;
                          final audienceImagePaths = <String>[];

                          for (final userId in audienceIds) {
                            final ztalker = data.getAllZtalkers().firstWhere(
                                (ztalker) => ztalker['strUserId'] == userId,
                                orElse: () => {'strImagePath': ''});

                            final audienceImagePath =
                                ztalker['strImagePath'] ?? '';
                            audienceImagePaths.add(audienceImagePath);
                          }

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
                                                backgroundImage: AssetImage(
                                                    'assets/img/ztalkers/$speakerImagePath'),
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
                                                      ['topic']!),
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
                                          for (var path in audienceImagePaths)
                                            Container(
                                              padding: EdgeInsets.only(
                                                  left: 5, right: 5),
                                              child: CircleAvatar(
                                                backgroundImage: AssetImage(
                                                    'assets/img/ztalkers/$path'),
                                                backgroundColor:
                                                    Colors.lightBlue,
                                                radius: 20,
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      if (reachMaxItems == false)
                        Container(
                          padding: EdgeInsets.only(left: 5, right: 5),
                          child: ElevatedButton(
                            onPressed: () => loadMoreItems(),
                            child: Text('Load more'),
                          ),
                        ),
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
          showModalBottomSheet(
              context: context,
              builder: (context) => MenuBarModal() // Call your modal here
              );
          print('Step call');
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
