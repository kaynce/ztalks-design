import 'package:flutter/material.dart';

class FilterLanguage extends StatefulWidget {
  const FilterLanguage({Key? key}) : super(key: key);

  @override
  State<FilterLanguage> createState() => _FilterLanguageState();
}

class _FilterLanguageState extends State<FilterLanguage> {
  final List<Map<String, String>> allItems = [
    {'title': 'English for the better future', 'language': 'English', 'Proficiency': 'Intermediate'},
    {'title': 'French for the better future', 'language': 'French', 'Proficiency': 'Beginner'},
  ];

  List<Map<String, String>> displayedItems = [];

  @override
  void initState() {
    super.initState();
    displayedItems = List.from(allItems);
  }

  void filterItems(String filter) {
    setState(() {
      if (filter.isEmpty) {
        displayedItems = List.from(allItems);
      } else {
        displayedItems = allItems
            .where((item) => item['language']!.toLowerCase().contains(filter.toLowerCase()) || item['Proficiency']!.toLowerCase().contains(filter.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filtered ListView Example'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => filterItems('English'),
                child: Text('English'),
              ),
              ElevatedButton(
                onPressed: () => filterItems('French'),
                child: Text('French'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () => filterItems(''),
                child: Text('Clear Filter'),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: displayedItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(displayedItems[index]['title']!),
                  subtitle: Text('Language: ${displayedItems[index]['language']} - Proficiency: ${displayedItems[index]['Proficiency']}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// void main() {
//   runApp(MaterialApp(
//     home: FilterLanguage(),
//   ));
// }
