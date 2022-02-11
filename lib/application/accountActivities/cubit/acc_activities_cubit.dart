import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'acc_activities_state.dart';

class AccActivitiesCubit extends Cubit<AccActivitiesState> {
  AccActivitiesCubit() : super(AccActivitiesInitial());
}
