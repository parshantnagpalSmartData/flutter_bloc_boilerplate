import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:bloc/bloc.dart';
class UserListBloc extends HydratedBloc<CounterEvent, CounterState> {
  // Use previously cached initialState if it's available
  @override
  CounterState get initialState {
    return super.initialState ?? CounterState(0);
  }

  // Called when trying to read cached state from storage.
  // Be sure to handle any exceptions that can occur and return null
  // to indicate that there is no cached data.
  @override
  CounterState fromJson(Map<String, dynamic> source) {
    try {
      return CounterState(source['value'] as int);
    } catch (_) {
      return null;
    }
  }

  // Called on each state change (transition)
  // If it returns null, then no cache updates will occur.
  // Otherwise, the returned value will be cached.
  @override
  Map<String, int> toJson(CounterState state) {
    try {
      return { 'value': state.value };
    } catch (_) {
      return null;
    }
  }

  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    switch (event) {
      case CounterEvent.decrement:
        yield CounterState(state.value - 1);
        break;
      case CounterEvent.increment:
        yield CounterState(state.value + 1);
        break;
    }
  }
}

enum CounterEvent { increment, decrement }

class CounterState {
  int value;

  CounterState(this.value);
}

class UserListBlocDelegate extends HydratedBlocDelegate {
    UserListBlocDelegate(HydratedStorage storage) : super(storage);
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }
   @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print(event);
  }

    @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    print('Error on sinking \n $error, $stacktrace');
  }
}