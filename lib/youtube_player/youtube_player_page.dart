import 'package:flutter/material.dart';
import 'package:hmb_video/models/youtube_video_model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePlayerPage extends StatefulWidget {
  final YoutubeVideo videoToPlay;

  const YoutubePlayerPage({
    super.key,
    required this.videoToPlay,
  });

  @override
  State<YoutubePlayerPage> createState() => _YoutubePlayerPageState();
}

class _YoutubePlayerPageState extends State<YoutubePlayerPage> {
  late YoutubePlayerController controller;

  @override
  void initState() {
    controller = YoutubePlayerController(
      initialVideoId: widget.videoToPlay.videoId!,
      flags: const YoutubePlayerFlags(autoPlay: true),
    );
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.videoToPlay.title ?? 'Reprodutor de vídeo'),
      ),
      body: YoutubePlayer(
        controller: controller,
        showVideoProgressIndicator: true,
        progressColors: const ProgressBarColors(
          playedColor: Colors.red,
          handleColor: Colors.purple,
          bufferedColor: Colors.amber,
        ),
        bottomActions: [
          CurrentPosition(),
          ProgressBar(isExpanded: true),
          RemainingDuration(),
          const PlaybackSpeedButton(),
        ],
      ),
    );
  }
}
