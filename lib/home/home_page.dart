import 'package:flutter/material.dart';
import 'package:hmb_video/models/youtube_video_model.dart';
import 'package:hmb_video/youtube_player/youtube_player_page.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<YoutubeVideo> videos;

  @override
  void initState() {
    videos = [
      YoutubeVideo(title: 'Comandos Inúteis do Terminal Linux', videoUrl: 'https://youtu.be/3SKodyb8np4'),
      YoutubeVideo(title: 'Como contornar uma possível censura do Telegram', videoUrl: 'https://youtu.be/W82ViUxUly8'),
      YoutubeVideo(title: 'Flutter Tutorial: Integrating YouTube Videos with YouTube Player Flutter Package', videoUrl: 'https://www.youtube.com/watch?v=hP25aVmxkP8'),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HMB Vídeo'),
      ),
      body: ListView.builder(
        itemCount: videos.length,
        itemBuilder: (context, index) {
          return ListTile(
            dense: true,
            title: Text(videos[index].title ?? 'Sem título'),
            subtitle: Text(videos[index].videoUrl),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
            onTap: () {
              YoutubeVideo video = videos[index];

              if (videos[index].videoId == null) {
                // caso videoId não seja passado, obtem o videoId a partir da URL
                video = video.copyWith(videoId: YoutubePlayer.convertUrlToId(video.videoUrl));
              }

              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => YoutubePlayerPage(videoToPlay: video),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
