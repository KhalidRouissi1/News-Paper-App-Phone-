abstract class NewsState {}

class NewsIntialState extends NewsState {}

class NewsBottomNavState extends NewsState {}

class NewGetBusinessSuccessState extends NewsState {}

class NewGetBusinessErrorState extends NewsState {
  final String error;
  NewGetBusinessErrorState(this.error);
}
