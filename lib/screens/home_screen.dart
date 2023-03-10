import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connectivity/blocs/internet_bloc/internet_bloc.dart';
import 'package:internet_connectivity/blocs/internet_bloc/internet_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Internet Connectivity App"),
      ),
      body: SafeArea(
        child: Center(
            child:

                // bloc builder screen pe UI banane ke kaam aata hai
                // ek chij hoti hai BlocListener ye dekhta rahta hai aur background tasks ko karne ke kaam aata hai
                // lekin screen pe kuch nahi karta ....isse ham state change hone par routing ya snackbar show karana ye sb kar skte hai

                // ab ek chij aur hoti hai jo dono ka mixture hoti hai ....BlocConsumer
                // isme dono chij aati hai block Builder aur Bloc Listener dono ka mixture hai ye...

                //     BlocBuilder<InternetBloc, InternetState>(builder: (context, state) {
                //   if (state is InternetGainedState) {
                //     return const Text("Internet Connected");
                //   } else if (state is InternetLostState) {
                //     return  const Text("Internet Not Connected");
                //   } else {
                //     return const Text("Loading...");
                //   }
                // })

                BlocConsumer<InternetBloc, InternetState>(

                  // listener bas snackbar trigger karne ke kaam aayega

          listener: (context, state) {
            if (state is InternetGainedState) {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Internt Chal Raha hai")));}

              else if(state is InternetLostState){
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Nahi chal raha londe"))
                );
              }
            },
          
          builder: (context, state) {
            if (state is InternetGainedState) {
              return const Text("Internet Connected");
            } else if (state is InternetLostState) {
              return const Text("Internet Not Connected");
            } else {
              return const Text("Loading...");
            }
          },
        )),
      ),
    );
  }
}
