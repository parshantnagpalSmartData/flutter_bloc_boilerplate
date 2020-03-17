import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'container/auth/login.dart';
import 'container/dashboard/home.dart';
import 'Bloc/vehicle/weatherBloc.dart';
import 'Bloc/counterBloc.dart';
import 'Bloc/userListBloc.dart';
import 'container/dashboard/userList.dart';
import 'Bloc/authBloc.dart';


void main() async {
  // BlocSupervisor.delegate = SimpleBlocDelegate();
  WidgetsFlutterBinding.ensureInitialized();
  BlocSupervisor.delegate = await HydratedBlocDelegate.build();
  runApp(MultiBlocProvider(
      providers: [
        BlocProvider<CounterBloc>(
          create: (BuildContext context) => CounterBloc(),
        ),
        BlocProvider<UserListBloc>(
          create: (BuildContext context) => UserListBloc(),
        ),
         BlocProvider<AuthBloc>(
          create: (BuildContext context) => AuthBloc(),
        ),
        BlocProvider<WeatherBloc>(
            create: (BuildContext context) => WeatherBloc(),
          ),
      ],
      child: MaterialApp(
        // home: Login(),
        home: BlocBuilder<AuthBloc, AuthState>(
            builder: (BuildContext context, AuthState state) {
              print("sfsfdsfjndsgfdgsjgsf");
              print(state.isLogined);
               if (state.isLogined == true) {
                 
                  return UserList();
                 }else{
                    return Login();
                 }
            
            },
          ),
      ),
      
    ));
}
// void main() => runApp(MultiBlocProvider(
//       providers: [
//         BlocProvider<CounterBloc>(
//           create: (BuildContext context) => CounterBloc(),
//         ),
//         // BlocProvider<UserInfoBloc>(
//         //   create: (BuildContext context) => UserInfoBloc(),
//         // ),
//       ],
//       child: MaterialApp(
//         home: Login(),
//       ),
//     ));

// class App extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) => ThemeBloc(),
//       child: BlocBuilder<ThemeBloc, ThemeData>(
//         builder: (_, theme) {
//           return MaterialApp(
//             title: 'Flutter Demo',
//             home: BlocProvider(
//               create: (_) => CounterBloc(),
//               child: Home(),
//               //  child:Login(title: 'Flutter Login'),
//             ),
//             theme: theme,
//           );
//         },
//       ),
//     );
//   }
// }

enum ThemeEvent { toggle }
class ThemeBloc extends Bloc<ThemeEvent, ThemeData> {
  @override
  ThemeData get initialState => ThemeData.light();

  @override
  Stream<ThemeData> mapEventToState(ThemeEvent event) async* {
    switch (event) {
      case ThemeEvent.toggle:
        yield state == ThemeData.dark() ? ThemeData.light() : ThemeData.dark();
        break;
    }
  }
}


