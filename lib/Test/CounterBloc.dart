// import 'package:flutter_bloc/flutter_bloc.dart';

// // Sự kiện cho các tương tác với dữ liệu
// abstract class DataEvent {}

// class IncrementEvent extends DataEvent {}

// class DecrementEvent extends DataEvent {}

// // Trạng thái của dữ liệu
// abstract class DataState {}

// class DataLoadedState extends DataState {
//   final int data;
//   DataLoadedState(this.data);
// }

// // Bloc
// class CounterBloc extends Bloc<DataEvent, DataState> {
//   CounterBloc() : super(DataLoadedState(0));

//   @override
//   Stream<DataState> mapEventToState(DataEvent event) async* {
//     if (event is IncrementEvent) {
//       yield DataLoadedState(event + 1);
//     } else if (event is DecrementEvent) {
//       yield DataLoadedState(state.data - 1);
//     }
//   }
// }
