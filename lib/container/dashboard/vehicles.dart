import 'package:fleet_management/modal/vehicle.dart';
import 'package:flutter/material.dart';
import '../../Bloc/userListBloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Bloc/authBloc.dart';
import './addVehicle.dart';
import '../../Bloc/vehicle/vehicleEvent.dart';
import '../../Bloc/vehicle/vehicleState.dart';
import '../../Bloc/vehicle/vehicleBloc.dart';


class Vehicles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

    final userListBloc = BlocProvider.of<VehicleBloc>(context);
          final authBloc = BlocProvider.of<AuthBloc>(context);
   

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
     body: Container(
          padding: EdgeInsets.symmetric(vertical: 16),
          alignment: Alignment.center,
          


          // BlocBuilder invokes the builder when new state is emitted.
          child: BlocBuilder<VehicleBloc, VehicleState>(
            builder: (BuildContext context, VehicleState state) {
              if (state is VehicleInitial) {
                return buildInitialInput();
              } else if (state is VehicleLoading) {
                return buildLoading();
              } else if (state is VehicleLoaded) {
                return buildColumnWithData(state.vehicle,context);
              }
            },
          ),
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
                //  userListBloc.add(CounterEvent.increment);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              heroTag: "btn2",
              child: Icon(Icons.remove),
              onPressed: () {
              //  userListBloc.add(CounterEvent.decrement);
              },
            ),
          ),
        ],
      ),
    );
  }
}


 Widget buildInitialInput() {
    return Center(
      child: CityInputField(),
    );
  }
  

  Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Column buildColumnWithData(Vehicle weather,context) {
     TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
              final addVehicle = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {

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
    return Column(
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        addVehicle,
        Text(
          weather.vehicleName,
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          // Display the temperature with 1 decimal place
          weather.vehicleType,
          style: TextStyle(fontSize: 80),
        ),
  
      ],
    );
  }

class CityInputField extends StatefulWidget {
  const CityInputField({
    Key key,
  }) : super(key: key);

  @override
  _CityInputFieldState createState() => _CityInputFieldState();
}

class _CityInputFieldState extends State<CityInputField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: TextField(
        onSubmitted: submitCityName,
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
  
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          suffixIcon: Icon(Icons.search),
        ),
      ),
    );
  }

  void submitCityName(String cityName) {
    final vehicleName= "Audi"; 
       final vehicleType= "Xuv"; 
    // Get the Bloc using the BlocProvider
    final weatherBloc = BlocProvider.of<VehicleBloc>(context);
    // Initiate getting the weather
    weatherBloc.add(GetVehicle(vehicleName,vehicleType));
  }
}
