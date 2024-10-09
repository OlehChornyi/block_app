import 'package:bloc/bloc.dart';
// import 'comments_event.dart';
// import 'comments_state.dart';
import 'package:block_app/data/backend_service.dart'; 
import 'package:equatable/equatable.dart';
import 'package:block_app/models/comments_model.dart';

part 'comments_event.dart';
part 'comments_state.dart';


class CommentBloc extends Bloc<CommentEvent, CommentState> {
  final BackendService backendService;

  CommentBloc({required this.backendService}) : super(CommentInitial()) {
    on<FetchComments>(_onFetchComments);
  }

  void _onFetchComments(FetchComments event, Emitter<CommentState> emit) async {
    emit(CommentLoading());
    try {
      final comments = await backendService.fetchComments();
      emit(CommentLoaded(comments));
    } catch (e) {
      emit(CommentError(e.toString()));
    }
  }
}
