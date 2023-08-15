//import 'package:uuid/uuid.dart';

class Data {
  // List<Map<String, dynamic>> getAllItems() {
  //   return _allItems;
  // }

  //Singleton pattern to make sure only one instance is created
  static final Data _instance = Data._internal();
  Data._internal();

  factory Data() {
    return _instance;
  }

  List<Map<String, String>> getAllZtalkers() {
    return _ztalkers;
  }

  List<Map<String, dynamic>> getSortedItems() {
    // Sort _allItems based on your criteria
    //var sortedItems = List<Map<String, dynamic>>.from(_allItems);
    // sortedItems.sort((a, b) {
    //   var languageA = a['language'] ?? '';
    //   var languageB = b['language'] ?? '';

    //   if (languageA == 'English') {
    //     return -2; // "English" comes first
    //   } else if (languageB == 'English') {
    //     return 2; // "English" comes first
    //   } else if (languageA == 'Filipino') {
    //     return -1; // "Filipino" comes second
    //   } else if (languageB == 'Filipino') {
    //     return 1; // "Filipino" comes second
    //   }

    //   return languageB.compareTo(languageA);
    //});
    //return sortedItems;
    var sortedItems = List<Map<String, dynamic>>.from(_allItems);
    sortedItems.sort((a, b) {
      var idA = a['intId'] ??
          0; // Replace 'intId' with the actual key for integer IDs
      var idB = b['intId'] ?? 0;

      return idB.compareTo(idA); // Sort in descending order based on intId
    });

    return sortedItems;
  }

  void createSpace(String strTopic, int intGroupSize, String strLanguage,
      String strLevelProciency) {
    //var newUserId = Uuid().v4(); // Generate a new unique ID

    _allItems.add({
      'intId': _allItems.length,
      'topic': strTopic,
      'language': strLanguage,
      'proficiency': strLevelProciency,
      'strUserId': '00001',
      'groupSize': intGroupSize,
      'audienceId': ['00001', '00002', '00003'],
    });

    print(_allItems.length);
  }

  final List<Map<String, dynamic>> _allItems = [
    {
      'intId': 01,
      'topic': 'English for the better future',
      'language': 'English',
      'proficiency': 'Advanced',
      'strUserId': '00001',
      'groupSize': 2,
      'audienceId': ['00001', '00002', '00003'],
    },
  ];

  final List<Map<String, String>> _ztalkers = [
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
    {'strUserId': '00011', 'strImagePath': 'speaker_11.jpeg'},
    {'strUserId': '00012', 'strImagePath': 'speaker_12.jpeg'},
    {'strUserId': '00013', 'strImagePath': 'speaker_13.jpeg'},
    {'strUserId': '00014', 'strImagePath': 'speaker_14.jpeg'},
    {'strUserId': '00015', 'strImagePath': 'speaker_15.jpeg'},
    {'strUserId': '00016', 'strImagePath': 'speaker_16.jpeg'},
    {'strUserId': '00017', 'strImagePath': 'speaker_17.jpeg'},
    {'strUserId': '00018', 'strImagePath': 'speaker_18.jpeg'},
    {'strUserId': '00018', 'strImagePath': 'speaker_19.jpeg'},
    {'strUserId': '00020', 'strImagePath': 'speaker_20.jpeg'},
  ];
}
