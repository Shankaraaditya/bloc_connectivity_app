import 'package:connectivity/connectivity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connectivity/blocs/internet_bloc/internet_state.dart';
import 'package:internet_connectivity/blocs/internet_bloc/internet_event.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  // ignore: prefer_final_fields
  Connectivity _connectivity = Connectivity(); //   Connectivity ka instace banaye hai status check karne ke liye
                                                // status change hone pe kya hoyega ye ham add kar chuke hai 
                                                // lekin pata to isi se chalega na ki internet hai ki nahi

  InternetBloc() : super(InternetInitialState()) {
    on<InternetGainedEvent>((event, emit) => emit(
        InternetGainedState())); // (event,emit) -->> event ye wala event hai aur emit wo function hai jo hoga
    // internetGainedState emit hoyega

    on<InternetLostEvent>((event, emit) => emit(InternetLostState()));

    _connectivity.onConnectivityChanged.listen((status) {
      if (status == ConnectivityResult.mobile ||
          status == ConnectivityResult.wifi) {
        add(InternetGainedEvent());
        
      } else {
        add(InternetLostEvent());
      }
    });
  }
}
