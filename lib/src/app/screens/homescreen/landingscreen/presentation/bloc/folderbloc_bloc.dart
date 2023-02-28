import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'folderbloc_event.dart';
part 'folderbloc_state.dart';

class FolderBloc extends Bloc<FolderblocEvent, FolderblocState> {
  FolderBloc() : super(FolderblocInitial()) {
    on<FolderblocEvent>((event, emit) {
      emit(FolderblocInitial());
    });
    on<FolderLoadingEvent>((event, emit) {
      emit(FolderblocLoadingState());
    });

    on<FolderLoadedEvent>((event, emit) {
      emit(FolderblocLoadedState());
    });
    on<FolderChangeFolderEvent>((event, emit) {
      emit(FolderChangeFolderState());
    });
  }
}
