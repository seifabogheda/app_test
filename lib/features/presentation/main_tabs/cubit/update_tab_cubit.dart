import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'update_tab_state.dart';

class UpdateTabCubit extends Cubit<UpdateTabState> {
  UpdateTabCubit() : super(const UpdateTabInitial());


  updateTabIndex(int tabIndex){
    emit(UpdateTabChanged(tabIndex: tabIndex,changed: !state.changed));
  }
}
