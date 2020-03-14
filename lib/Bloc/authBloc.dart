import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:bloc/bloc.dart';
class AuthBloc extends HydratedBloc<AuthEvent, AuthState> {
  // Use previously cached initialState if it's available
  @override
  AuthState get initialState {
    return super.initialState ?? AuthState(false);
  }

  // Called when trying to read cached state from storage.
  // Be sure to handle any exceptions that can occur and return null
  // to indicate that there is no cached data.
  @override
  AuthState fromJson(Map<String, dynamic> source) {
    try {
      return AuthState(source['isLogined'] as bool);
    } catch (_) {
      return null;
    }
  }

  // Called on each state change (transition)
  // If it returns null, then no cache updates will occur.
  // Otherwise, the returned value will be cached.
  @override
  Map<String, bool> toJson(AuthState state) {
    try {
      return { 'isLogined': state.isLogined };
    } catch (_) {
      return null;
    }
  }

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    switch (event) {
      case AuthEvent.login:
        print("loginnnnnnnnnnn");
        yield AuthState(true);
        break;
      case AuthEvent.logout:
        yield AuthState(false);
        break;
    }
  }
}

enum AuthEvent { login, logout }

class AuthState {
  bool isLogined;

  AuthState(this.isLogined);
}

class AuthBlocDelegate extends HydratedBlocDelegate {
    AuthBlocDelegate(HydratedStorage storage) : super(storage);
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