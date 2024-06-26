import 'package:flutter/cupertino.dart';
import '../models/album.dart';
import '../screens/album_details.dart';

class AlbumPreview extends StatelessWidget {
  final Album album;

  const AlbumPreview({super.key, required this.album});

  @override
  Widget build(BuildContext context) {
    return CupertinoListTile(
      title: Text(album.title),
      leading: album.image.isNotEmpty
          ? Image.asset('assets/${album.image}')
          : const Icon(CupertinoIcons.photo),
      onTap: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => AlbumDetails(album: album),
          ),
        );
      },
    );
  }
}
