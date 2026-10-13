import 'package:flutter/material.dart';
import 'package:belajar_flutter/list & grid/detailScreen.dart';

class ArticleListScreen extends StatelessWidget {
  const ArticleListScreen({super.key});

  final List<Map<String, String>> articles = const [
    {
      'title': 'Flutter Dasar',
      'description': 'Belajar Dasar Flutter',
      'image': 'https://picsum.photos/200/300?1',
    },
    {
      'title': 'State Management',
      'description': 'Get X,Provider, Bloc, Riverpod',
      'image': 'https://picsum.photos/200/300?2',
    },
    {
      'title': 'Flutter Dasar',
      'description': 'Belajar Dasar Flutter',
      'image': 'https://picsum.photos/200/300?3',
    },
    {
      'title': 'State Management',
      'description': 'Get X,Provider, Bloc, Riverpod',
      'image': 'https://picsum.photos/200/300?4',
    },
    {
      'title': 'Flutter Dasar',
      'description': 'Belajar Dasar Flutter',
      'image': 'https://picsum.photos/200/300?5',
    },
    {
      'title': 'State Management',
      'description': 'Get X,Provider, Bloc, Riverpod',
      'image': 'https://picsum.photos/200/300?6',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) {
        final article = articles[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ArticleDetailScreen(data: article),
                ),
                );
          },
          child: Container(
            margin: const EdgeInsets.all(10),
            height: 120,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: const [
                BoxShadow(color: Colors.black12, blurRadius: 6),
              ],
            ),
          child: Row(
            children: [
              Container(
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(article['image']!),
                  fit: BoxFit.cover
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        article['title']!,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      const SizedBox(height: 5,),
                      Text(
                        article['description']!,
                        style: const TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                  ),
                  ),
            ],
          ),
          ),
        );
      },
    );
  }
}