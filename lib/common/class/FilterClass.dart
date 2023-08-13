import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterEvent {}

class FilterState {
  final List<Map<String, dynamic>> filteredItems;
  
  FilterState(this.filteredItems);
}

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  FilterBloc() : super(FilterState([]));

  @override
  Stream<FilterState> mapEventToState(FilterEvent event) async* {
    if (event is FilterEvent) {
      // Perform filtering logic here
      List<Map<String, dynamic>> filteredItems = []; // Replace with actual filtering
      
      yield FilterState(filteredItems);
    }
  }
}

class FilterClass {
  final FilterBloc _filterBloc = FilterBloc();

  Stream<FilterState> get filteredItemsStream => _filterBloc.stream;

  void dispose() {
    _filterBloc.close();
  }
}
