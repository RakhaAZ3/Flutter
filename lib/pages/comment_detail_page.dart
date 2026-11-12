import 'package:flutter/material.dart';

import '../models/comment.dart';

class CommentDetailPage extends StatelessWidget {
  final Comment comment;

  const CommentDetailPage({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Comment #${comment.id}')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              comment.name,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 12),
            Text(comment.body),
            const SizedBox(height: 24),
            Text(
              'Ditulis oleh user #${comment.postId}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}