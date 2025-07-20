import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:travel_flutter/pages/home/home_view_state.dart';

part 'home_view_model.g.dart';

@riverpod
class HomeViewModel extends _$HomeViewModel {
  @override
  HomeViewModelState build() => const HomeViewModelState();

  void logout() {
    state = state.copyWith(isAuthenticated: false, token: null);
  }
}
