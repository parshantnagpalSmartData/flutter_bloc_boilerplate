import 'package:flutter/material.dart';
import '../../Bloc/userListBloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userListBloc = BlocProvider.of<UserListBloc>(context);
    //  BlocSupervisor.delegate = UserListBlocDelegate();

    return Scaffold(
      appBar: AppBar(
        title: Text('Counter1'),
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
