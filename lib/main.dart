import 'package:assignment_test/core/general_cubits/connection_network_cubit/connection_network_cubit.dart';
import 'package:assignment_test/core/resources/api_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/api_service/dio_helper.dart';
import 'features/presentation/main_tabs/main_tab_view.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init(base: ApiNames.baseUrl);
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => ConnectionNetworkCubit(),
      ),

    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConnectionNetworkCubit, ConnectionNetworkState>(
      builder: (context, state) {
        return MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const MainTabsView(),
        );
      },
    );
  }
}


