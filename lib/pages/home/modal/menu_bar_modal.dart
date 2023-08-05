import 'package:flutter/material.dart';

class MenuBarModal extends StatelessWidget {
  const MenuBarModal({Key? key}) : super(key: key);

  void _showMenuForm(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Add the action for 'Create a space' button here
                  Navigator.pop(context); // Close the bottom sheet after action
                },
                child: Text('Create a space'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Add the action for 'Donate/Buy me a coffee' button here
                  Navigator.pop(context); // Close the bottom sheet after action
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
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
