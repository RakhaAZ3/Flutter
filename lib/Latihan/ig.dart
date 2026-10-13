import 'package:flutter/material.dart';

class latihan extends StatelessWidget {
  latihan({super.key});

  final List<String> _storyUsernames = [
    'Cerita Anda',
    'Rakha',
    'user1',
    'user2',
    'user3',
    'user4',
    'user5',
    'user6',
    'user7',
    'user8',
  ];

  final List<String> _postUsernames = [
    'Rakha',
    'user1',
    'user2',
    'user3',
    'user4',
    'user5',
    'user6',
    'user7',
    'user8',
    'user9',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Text(
          'Instagram',
          style: TextStyle(
            color: Colors.black,
            fontSize: 27,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.favorite_border, color: Colors.black),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.send_outlined, color: Colors.black),
          ),
          SizedBox(width: 4),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 112,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  children: List.generate(
                    _storyUsernames.length,
                    (index) => SizedBox(
                      width: 78,
                      child: Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Column(
                          children: [
                            Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(2.5),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: index == 0
                                        ? null
                                        : LinearGradient(
                                            colors: [
                                              Color(0xfffeda75),
                                              Color(0xfffa7e1e),
                                              Color(0xffd62976),
                                              Color(0xff962fbf),
                                            ],
                                            begin: Alignment.bottomLeft,
                                            end: Alignment.topRight,
                                          ),
                                    border: index == 0
                                        ? Border.all(
                                            color: Colors.grey.shade300,
                                            width: 1.5,
                                          )
                                        : null,
                                  ),
                                  child: CircleAvatar(
                                    radius: 31,
                                    backgroundColor: Colors.grey.shade200,
                                    backgroundImage: NetworkImage(
                                      'https://picsum.photos/seed/ig-avatar-$index/120/120',
                                    ),
                                    onBackgroundImageError: (_, _) {},
                                  ),
                                ),
                                if (index == 0)
                                  Positioned(
                                    right: 0,
                                    bottom: 0,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xff0095f6),
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Colors.white,
                                          width: 2,
                                        ),
                                      ),
                                      child: Icon(
                                        Icons.add,
                                        size: 17,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Text(
                              _storyUsernames[index],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 11),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Divider(height: 1, color: Color(0xffeeeeee)),
              ...List.generate(
                _postUsernames.length,
                (index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 9,
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 17,
                            backgroundImage: NetworkImage(
                              'https://picsum.photos/seed/ig-avatar-${index + 1}/120/120',
                            ),
                            onBackgroundImageError: (_, _) {},
                          ),
                          SizedBox(width: 9),
                          Expanded(
                            child: Text(
                              _postUsernames[index],
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon:Icon(Icons.more_horiz),
                            iconSize: 22,
                          ),
                        ],
                      ),
                    ),
                    AspectRatio(
                      aspectRatio: 1,
                      child: Image.network(
                        'https://picsum.photos/seed/ig-post-$index/900/900',
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, progress) =>
                            progress == null
                            ? child
                            : Container(
                                color: Color(0xfff2f2f2),
                                alignment: Alignment.center,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Color(0xffc7c7c7),
                                ),
                              ),
                        errorBuilder: (context, error, stackTrace) => Container(
                          color: Color(0xfff2f2f2),
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.image_not_supported_outlined,
                            size: 42,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(8, 2, 8, 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.favorite_border),
                                visualDensity: VisualDensity.compact,
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.mode_comment_outlined),
                                visualDensity: VisualDensity.compact,
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.send_outlined),
                                visualDensity: VisualDensity.compact,
                              ),
                              Spacer(),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.bookmark_border),
                                visualDensity: VisualDensity.compact,
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(5, 4, 5, 0),
                            child: RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                ),
                                children: [
                                  TextSpan(
                                    text: '${_postUsernames[index]} ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Momen kecil, cerita yang berkesan ✨',
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                            child: Text(
                              'Lihat semua komentar',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}