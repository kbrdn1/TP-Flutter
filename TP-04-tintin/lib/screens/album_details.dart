import 'package:flutter/cupertino.dart';
import '../models/album.dart';

class AlbumDetails extends StatelessWidget {
  final Album album;

  const AlbumDetails({super.key, required this.album});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(album.title),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 100),
              album.image.isNotEmpty
                  ? Image.asset('assets/${album.image}')
                  : const Icon(CupertinoIcons.photo, size: 100),
              const SizedBox(height: 16),
              Text(album.title,
                  style: CupertinoTheme.of(context)
                      .textTheme
                      .navLargeTitleTextStyle),
              const SizedBox(height: 8),
              Text('Number: ${album.numero}',
                  style: CupertinoTheme.of(context).textTheme.textStyle),
              const SizedBox(height: 8),
              Text('Year: ${album.year}',
                  style: CupertinoTheme.of(context).textTheme.textStyle),
              const SizedBox(height: 8),
              if (album.yearInColor != null)
                Text('Year in Color: ${album.yearInColor}',
                    style: CupertinoTheme.of(context).textTheme.textStyle),
              const SizedBox(height: 32),
              Text(album.resume,
                  style: CupertinoTheme.of(context).textTheme.textStyle),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
