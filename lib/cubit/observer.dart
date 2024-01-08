import 'package:bloc/bloc.dart';

class CounterCubit extends Cubit<int> {
  //like viewmodel :)
  CounterCubit({this.initialData = 0})
      : super(initialData); //use constructor if want call input data
  // or
  // CounterCubit(super.initialState);

  int initialData;

  int? current;
  int? next;

  void increment() {
    emit(state + 1); //use emit for update state
  }

  void decrement() {
    emit(state - 1); //state is the value
  }

  //don't use yield bcs is bundle

  //Observer : bloc fiture for observation
  @override
  void onChange(Change<int> change) {
    // TODO: implement onChange
    super.onChange(change);
    current = change.currentState;
    next = change.nextState;
    print(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    // TODO: implement onError
    super.onError(error, stackTrace);
    print(error);
  }
}
