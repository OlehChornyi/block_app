import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:block_app/bloc/comments_block.dart';
import 'package:block_app/data/backend_service.dart';

class CommentScreen extends StatelessWidget {
  const CommentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          CommentBloc(backendService: BackendService())..add(FetchComments()),
      child: Scaffold(
        appBar: AppBar(title: const Text('Comments')),
        body: BlocBuilder<CommentBloc, CommentState>(
          builder: (context, state) {
            if (state is CommentLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is CommentLoaded) {
              return ListView.builder(
                itemCount: state.comments.length,
                itemBuilder: (context, index) {
                  final comment = state.comments[index];
                  return ListTile(
                    title: Text(comment.email),
                    subtitle: Text(comment.body),
                  );
                },
              );
            } else if (state is CommentError) {
              return Center(
                  child: Text('Failed to load comments: ${state.message}'));
            } else {
              return const Center(child: Text('No comments found.'));
            }
          },
        ),
      ),
    );
  }
}
