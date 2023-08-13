import 'package:flutter/material.dart';
import 'package:ztalks/api/data.dart';
import 'package:ztalks/pages/home/Home.dart';
import 'package:ztalks/pages/home/Space.dart';

class MenuBarModal extends StatefulWidget {
  const MenuBarModal({super.key});

  @override
  State<MenuBarModal> createState() => _MenuBarModalState();
}

class _MenuBarModalState extends State<MenuBarModal> {
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

  String? strTopic;
  late TextEditingController? topicController =
      TextEditingController(); // Controller for the TextField

  int? intGroupSizeSelected;
  String? strLanguageSelected;
  String? strLevelProciencySelected;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  List<BuildContext> openModalContexts =
      []; // To store the contexts of open modals

  @override
  void initState() {
    super.initState();

    // Initialize your dropdown selected values here
    // intGroupSizeSelected = intGroupSizeItems[0]; // Set the default value
    // strLanguageSelected = strLanguageItems[0]; // Set the default value
    // strLevelProciencySelected = strLevelProciencyItems[0]; // Set the default value
  }

  @override
  void dispose() {
    topicController
        ?.dispose(); // Dispose the controller to prevent memory leaks
    super.dispose();
  }

  // Function to close all open modals and the current page
void closePageAndModals() {
  for (var modalContext in openModalContexts) {
    Navigator.of(modalContext).pop();
  }
  openModalContexts.clear();

  // Close the current widget page
  Navigator.of(context).pop();
}

  void _showEmptyFieldsDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text('Empty Fields'),
              content: Text('Please fill in all the required fields.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('OK'),
                )
              ]);
        });
  }

  DropdownMenuItem<T> buildMenuItem<T>(T item) => DropdownMenuItem<T>(
        value: item,
        child: Text(
          item.toString(),
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
        ),
      );

  void _showCreateSpaceForm(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {

        openModalContexts.add(context);

        final screenWidth = MediaQuery.of(context).size.width;
        final screenHeight = MediaQuery.of(context).size.height;

        return Container(
          width: screenWidth,
          height: screenHeight * 0.5,
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Create a Space',
                  style: TextStyle(fontSize: 18),
                ),
                TextField(
                  controller: topicController,
                  decoration: InputDecoration(labelText: 'Topic'),
                ),
                const SizedBox(height: 5),
                Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.black, width: 1),
                    ),
                    child: StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState) {
                        return DropdownButton<int>(
                          value: intGroupSizeSelected,
                          isExpanded: true,
                          iconSize: 36,
                          icon: const Icon(Icons.arrow_drop_down,
                              color: Colors.black),
                          underline: Container(),
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                          items: [
                            const DropdownMenuItem<int>(
                              value: null,
                              child: Text('Select Group Size'),
                            ),
                            ...intGroupSizeItems.map(buildMenuItem).toList(),
                          ],
                          onChanged: (newValue) {
                            print("Selected: $newValue");
                            setState(() {
                              intGroupSizeSelected = newValue;
                            });
                          },
                        );
                      },
                    )),
                SizedBox(height: 5),
                Container(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.black, width: 1),
                  ),
                  child: StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState) {
                    return DropdownButton<String>(
                      value: strLanguageSelected,
                      isExpanded: true,
                      iconSize: 36,
                      icon: const Icon(Icons.arrow_drop_down,
                          color: Colors.black),
                      underline: Container(),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                      items: [
                        const DropdownMenuItem<String>(
                          value: null,
                          child: Text('Select Language'),
                        ),
                        ...strLanguageItems.map(buildMenuItem).toList(),
                      ],
                      onChanged: (newValue) => setState(() {
                        print("Selected: $newValue");
                        strLanguageSelected = newValue;
                      }),
                    );
                  }),
                ),
                SizedBox(height: 5),
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.black, width: 1),
                  ),
                  child: StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState) {
                    return DropdownButton<String>(
                      value: strLevelProciencySelected,
                      isExpanded: true,
                      iconSize: 36,
                      icon: const Icon(Icons.arrow_drop_down,
                          color: Colors.black),
                      underline: Container(),
                      style: const TextStyle(
                        // Set the style of the selected value
                        color: Colors
                            .black, // Change the color of the selected value text
                        fontSize:
                            14, // Adjust the font size of the selected value text
                      ),
                      items: [
                        const DropdownMenuItem<String>(
                          value: null,
                          child: Text(
                            'Select Level Proficiency',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        ...strLevelProciencyItems.map(buildMenuItem).toList(),
                      ],
                      onChanged: (newValue) => setState(() {
                        strLevelProciencySelected = newValue;
                      }),
                    );
                  }),
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
                      ),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        // if (_formKey.currentState!.validate()) {
                        // }
                        if (intGroupSizeSelected == null ||
                            strLanguageSelected == null ||
                            strLevelProciencySelected == null) {
                          _showEmptyFieldsDialog();
                          return;
                        }

                        if (_formKey.currentState!.validate()) {
                          print('Success');

                          Data data = Data();
                          data.createSpace(
                              strTopic ?? '',
                              intGroupSizeSelected ?? 1,
                              strLanguageSelected ?? '',
                              strLevelProciencySelected ?? '');

                          // Clear the form fields and reset the selected values
                          topicController?.clear();
                          intGroupSizeSelected = null;
                          strLanguageSelected = null;
                          strLevelProciencySelected = null;

                          // Refresh the page by triggering a rebuild
                          //setState(() {});
                          closePageAndModals();

                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Space())
                          );
                        }
                      },
                      child: Text('Create Space'),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: screenWidth,
      height: screenHeight * 0.3,
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(
            onPressed: () {
              //Navigator.pop(context);
              _showCreateSpaceForm(context);
            },
            child: Text('Create a space'),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              //Navigator.pop(context);
            },
            child: Text('Donate/Buy me a coffee'),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context); // Close the bottom sheet
            },
            child: Text('Back'),
          ),
        ],
      ),
    );
  }
}
