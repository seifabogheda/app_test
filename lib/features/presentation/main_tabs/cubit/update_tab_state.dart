part of 'update_tab_cubit.dart';

abstract class UpdateTabState extends Equatable {
  final int tabIndex;
  final bool changed;
  const UpdateTabState({this.tabIndex = 0,this.changed = false});
  @override
  List<Object> get props => [tabIndex];
}

class UpdateTabInitial extends UpdateTabState {
 const UpdateTabInitial():super(tabIndex: 0,changed: false);
 @override
 List<Object> get props => [changed,tabIndex];
}

class UpdateTabChanged extends UpdateTabState {
 const UpdateTabChanged({required int tabIndex, required bool changed}):super(tabIndex: tabIndex ,changed: changed);
 @override
 List<Object> get props => [changed,tabIndex];
}