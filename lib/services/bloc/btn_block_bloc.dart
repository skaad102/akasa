import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'btn_block_event.dart';
part 'btn_block_state.dart';

class BtnBlockBloc extends Bloc<BtnBlockEvent, BtnBlockState> {
  BtnBlockBloc() : super(BtnBlockInitial()) {
    on<BtnBlockEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
