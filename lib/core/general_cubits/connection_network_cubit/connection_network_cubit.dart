import 'dart:async';
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'connection_network_state.dart';

class ConnectionNetworkCubit extends Cubit<ConnectionNetworkState> {
  ConnectionNetworkCubit() : super(const ConnectionNetworkInitial());
  StreamSubscription<ConnectivityResult> ? _subscription;
  void checkConnection() {
    _subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.wifi ||
          result == ConnectivityResult.mobile) {
        log("done ${result.index}");
        emit(const ConnectionNetworkUpdated(true));
      } else {
        log("error ${result.index}");

        emit(const ConnectionNetworkUpdated(false));
      }
    });
  }

  @override
  Future<void> close() {
    _subscription!.cancel();
    return super.close();
  }
}
