import 'package:flutter/cupertino.dart';
import '../models/album.dart';
import '../services/album_service.dart';
import '../widgets/album_preview.dart';

class AlbumsMaster extends StatefulWidget {
  const AlbumsMaster({super.key});

  @override
  AlbumsMasterState createState() => AlbumsMasterState();
}

class AlbumsMasterState extends State<AlbumsMaster> {
  late Future<List<Album>> _albumsFuture;

  @override
  void initState() {
    super.initState();
    _albumsFuture = AlbumService.fetchAlbums();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Albums'),
      ),
      child: FutureBuilder<List<Album>>(
        future: _albumsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CupertinoActivityIndicator());
          } else if (snapshot.hasError) {
            print(snapshot.error);
            return const Center(child: Text('Error loading albums'));
          } else {
            final albums = snapshot.data!;
            return ListView.builder(
              itemCount: albums.length,
              itemBuilder: (context, index) {
                return AlbumPreview(album: albums[index]);
              },
            );
          }
        },
      ),
    );
  }
}
