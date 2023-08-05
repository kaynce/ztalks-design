import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.title});

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
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
                        ElevatedButton(
                            onPressed: () {}, child: Text('English')),
                        SizedBox(width: 10),
                        ElevatedButton(
                            onPressed: () {}, child: Text('Filipino')),
                        SizedBox(width: 10),
                        ElevatedButton(
                            onPressed: () {}, child: Text('Indonesian')),
                        SizedBox(width: 10),
                        ElevatedButton(
                            onPressed: () {}, child: Text('Vietamese')),
                        SizedBox(width: 10),
                        ElevatedButton(onPressed: () {}, child: Text('Thai')),
                        SizedBox(width: 10),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text('Explore Spaces'),
                        ],
                      ),
                      Wrap(
                        children: [
                          for (int i = 0; i < 10; i++)
                            Container(
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
                                                      'assets/img/1.jpg'),
                                                  backgroundColor:
                                                      Colors.lightBlue,
                                                  radius: 20,
                                                ),
                                                SizedBox(width: 10),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                        'English for the better future'),
                                                    Text(
                                                        'English - Proficient'),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {},
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
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Row(
                                          children: [
                                            CircleAvatar(
                                              backgroundImage: AssetImage(
                                                  'assets/img/2.jpg'),
                                              backgroundColor: Colors.lightBlue,
                                              radius: 20,
                                            ),
                                            SizedBox(width: 5),
                                            CircleAvatar(
                                              backgroundImage: AssetImage(
                                                  'assets/img/3.jpg'),
                                              backgroundColor: Colors.lightBlue,
                                              radius: 20,
                                            ),
                                            SizedBox(width: 5),
                                            CircleAvatar(
                                              backgroundImage: AssetImage(
                                                  'assets/img/4.jpg'),
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
                            ),
                           
                        ],
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
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
