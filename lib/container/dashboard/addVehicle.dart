
import 'package:flutter/material.dart';
import '../dashboard/home.dart';
import '../dashboard/userList.dart';
import '../../Bloc/authBloc.dart';
import '../../Bloc/vehicle/vehicleBloc.dart';
import '../../Bloc/vehicle/vehicleEvent.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AddVehicle extends StatefulWidget {
  AddVehicle({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<AddVehicle> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
       final authBloc = BlocProvider.of<AuthBloc>(context);
         final vehicleBloc = BlocProvider.of<VehicleBloc>(context);
    // Initiate getting the weather

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    final vehicleName = TextField(
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Vehicle Name ",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
      final vehicleType = TextField(
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Vehicle Type ",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

 

    final addVehicleButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
       
          // Navigator.push(
          //           context,
          //           MaterialPageRoute(builder: (context) => UserList()),
          //         );
                      vehicleBloc.add(GetVehicle("Audi","XUV"));
        },
        child: Text("Add Vehicle",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
       appBar: AppBar(
        title: Text('Add Vehicle'),
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
      body: 
       BlocBuilder<AuthBloc, AuthState>(
            builder: (BuildContext context, AuthState state) {
          //             return Center(
          //   child: Text(
          //     '${state.isLogined}',
          //     style: TextStyle(fontSize: 24.0),
          //   ),
          // );

        return  SingleChildScrollView(
      child: Center(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 155.0,
                  child: Image.asset(
                    "assets/images/logo.png",
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 45.0),
                vehicleName,
                SizedBox(height: 25.0),
                vehicleType,
                SizedBox(
                  height: 35.0,
                ),
                addVehicleButon,
                SizedBox(
                  height: 15.0,
                ),
              ],
            ),
          ),
        ),
      ),
        );
       


            }
       )
     
    );
  }
}


  void submitCityName(String cityName) {
    // Get the Bloc using the BlocProvider
  
  }