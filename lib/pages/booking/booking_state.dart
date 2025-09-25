import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookingState {
  String? address;
  int? slotId;
  List<Map<String, dynamic>> items;
  BookingState({this.address, this.slotId, List<Map<String,dynamic>>? items})
      : items = items ?? [];
  BookingState copyWith({String? address, int? slotId, List<Map<String,dynamic>>? items}) =>
      BookingState(address: address ?? this.address, slotId: slotId ?? this.slotId, items: items ?? this.items);
}

final bookingProvider = StateNotifierProvider<BookingNotifier, BookingState>((ref) => BookingNotifier());

class BookingNotifier extends StateNotifier<BookingState> {
  BookingNotifier(): super(BookingState(items: []));

  void setAddress(String a) => state = state.copyWith(address: a);
  void setSlot(int id) => state = state.copyWith(slotId: id);
  void setItems(List<Map<String,dynamic>> items) => state = state.copyWith(items: items);
  void addItem(Map<String,dynamic> item) {
    final list = [...state.items, item];
    state = state.copyWith(items: list);
  }
  void removeItem(int index) {
    final list = [...state.items]..removeAt(index);
    state = state.copyWith(items: list);
  }
  void clear() => state = BookingState(items: []);
}
