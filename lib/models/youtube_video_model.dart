class YoutubeVideo {
  final String? title;
  final String videoUrl;
  final String? videoId;

  YoutubeVideo({
    this.title,
    required this.videoUrl,
    this.videoId,
  });

  YoutubeVideo copyWith({
    String? title,
    String? videoUrl,
    String? videoId,
  }) {
    return YoutubeVideo(
      title: title ?? this.title,
      videoUrl: videoUrl ?? this.videoUrl,
      videoId: videoId ?? this.videoId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'videoUrl': videoUrl,
      'videoId': videoId,
    };
  }

  factory YoutubeVideo.fromMap(Map<String, dynamic> map) {
    return YoutubeVideo(
      title: map['title'] != null ? map['title'] as String : null,
      videoUrl: map['videoUrl'] as String,
      videoId: map['videoId'] != null ? map['videoId'] as String : null,
    );
  }

  @override
  String toString() => 'YoutubeVideo(title: $title, videoUrl: $videoUrl, videoId: $videoId)';
}
