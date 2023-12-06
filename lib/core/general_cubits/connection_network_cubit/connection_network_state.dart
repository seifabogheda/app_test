part of 'connection_network_cubit.dart';

abstract class ConnectionNetworkState extends Equatable {
  final bool isConnected;
  const ConnectionNetworkState(this.isConnected);
}

class ConnectionNetworkInitial extends ConnectionNetworkState {
  const ConnectionNetworkInitial() : super(true);

  @override
  List<Object> get props => [isConnected];
}

class ConnectionNetworkUpdated extends ConnectionNetworkState {
  const ConnectionNetworkUpdated(bool isConnected) : super(isConnected);

  @override
  List<Object> get props => [isConnected];
}