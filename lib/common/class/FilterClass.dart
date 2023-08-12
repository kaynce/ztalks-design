import 'dart:async';

class FilterClass{
  final StreamController<List<Map<String, dynamic>>> _filteredItemsController = StreamController<List<Map<String, dynamic>>>();
  Stream<List<Map<String, dynamic>>> get filteredItemsStream => _filteredItemsController.stream;

  void dispose(){
    _filteredItemsController.close();
  }

}