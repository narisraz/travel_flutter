class HomeViewModelState {
  final bool isAuthenticated;
  final String? token;

  const HomeViewModelState({this.isAuthenticated = false, this.token});

  HomeViewModelState copyWith({bool? isAuthenticated, String? token}) {
    return HomeViewModelState(
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      token: token ?? this.token,
    );
  }
}
