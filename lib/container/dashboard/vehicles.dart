import 'package:flutter/material.dart';
import '../../Bloc/userListBloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Bloc/authBloc.dart';
import './addVehicle.dart';

class Vehicles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

    final userListBloc = BlocProvider.of<UserListBloc>(context);
          final authBloc = BlocProvider.of<AuthBloc>(context);
             final addVehicle = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          authBloc.add(AuthEvent.login);
          Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddVehicle()),
                  );
        },
        child: Text("Add Vehicle",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

      final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          authBloc.add(AuthEvent.logout);
          // Navigator.push(
          //           context,
          //           MaterialPageRoute(builder: (context) => UserList()),
          //         );
        },
        child: Text("Logout",
            textAlign: TextAlign.center
      ),
    ));
    //  BlocSupervisor.delegate = UserListBlocDelegate();

    return Scaffold(
      appBar: AppBar(
        title: Text('Vehicle'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.contacts),
            tooltip: 'Show Snackbar',
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => UserList()),
              // );
              // scaffoldKey.currentState.showSnackBar(snackBar);
            },
          ),
        ],
      ),
      body:  BlocBuilder<UserListBloc, CounterState>(
            builder: (BuildContext context, CounterState state) {
              if (state is CounterState) {
                  return 
                  SingleChildScrollView(
      child: Center(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child:
                  
                  Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                addVehicle,
              
                        loginButon
              ])
                  
          ))));    
                  
                  
              
              } else if (state is CounterState) {
                         return Center(
            child: Text(
             '${state.value}',
              style: TextStyle(fontSize: 24.0),
            ),
          );
              } else if (state is CounterState) {
                         return Center(
            child: Text(
             '${state.value}',
              style: TextStyle(fontSize: 24.0),
            ),
          );
              }
            },
          ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              heroTag: "btn1",
              child: Icon(Icons.add),
              onPressed: () {
                 userListBloc.add(CounterEvent.increment);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              heroTag: "btn2",
              child: Icon(Icons.remove),
              onPressed: () {
               userListBloc.add(CounterEvent.decrement);
              },
            ),
          ),
        ],
      ),
    );
  }
}


