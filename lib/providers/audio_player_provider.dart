import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// State untuk pemutar audio
class AudioPlayerState {
  final AudioPlayer player;
  final PlayerState playerState;
  final Duration duration;
  final Duration position;
  final String? currentSongUrl;
  final bool isPlaying;

  const AudioPlayerState({
    required this.player,
    this.playerState = PlayerState.stopped,
    this.duration = Duration.zero,
    this.position = Duration.zero,
    this.currentSongUrl,
    this.isPlaying = false,
  });

  AudioPlayerState copyWith({
    AudioPlayer? player,
    PlayerState? playerState,
    Duration? duration,
    Duration? position,
    String? currentSongUrl,
    bool? isPlaying,
  }) {
    return AudioPlayerState(
      player: player ?? this.player,
      playerState: playerState ?? this.playerState,
      duration: duration ?? this.duration,
      position: position ?? this.position,
      currentSongUrl: currentSongUrl ?? this.currentSongUrl,
      isPlaying: isPlaying ?? this.isPlaying,
    );
  }
}

// Provider untuk AudioPlayer
final audioPlayerProvider =
    StateNotifierProvider<AudioPlayerNotifier, AudioPlayerState>(
  (ref) => AudioPlayerNotifier(),
);

class AudioPlayerNotifier extends StateNotifier<AudioPlayerState> {
  AudioPlayerNotifier()
      : super(
          AudioPlayerState(
            player: AudioPlayer(),
          ),
        ) {
    _init();
  }

  void _init() {
    // Listen untuk perubahan state
    state.player.onPlayerStateChanged.listen((PlayerState playerState) {
      state = state.copyWith(
        playerState: playerState,
        isPlaying: playerState == PlayerState.playing,
      );
    });

    // Listen untuk perubahan durasi
    state.player.onDurationChanged.listen((Duration duration) {
      state = state.copyWith(duration: duration);
    });

    // Listen untuk perubahan posisi
    state.player.onPositionChanged.listen((Duration position) {
      state = state.copyWith(position: position);
    });

    // Listen untuk ketika lagu selesai
    state.player.onPlayerComplete.listen((_) {
      state = state.copyWith(
        playerState: PlayerState.stopped,
        isPlaying: false,
        position: Duration.zero,
      );
    });
  }

  // Memutar lagu
  Future<void> play(String url) async {
    if (state.currentSongUrl != url) {
      // Lagu baru
      await state.player.stop();
      await state.player.setSourceUrl(url);
      state = state.copyWith(currentSongUrl: url);
    }
    await state.player.resume();
    state = state.copyWith(isPlaying: true);
  }

  // Menjeda lagu
  Future<void> pause() async {
    await state.player.pause();
    state = state.copyWith(isPlaying: false);
  }

  // Menghentikan lagu
  Future<void> stop() async {
    await state.player.stop();
    state = state.copyWith(
      isPlaying: false,
      position: Duration.zero,
    );
  }

  // Seek ke posisi tertentu
  Future<void> seek(Duration position) async {
    await state.player.seek(position);
  }

  //resume
  Future<void> resume() async {
    await state.player.resume();
    state = state.copyWith(isPlaying: true);
  }

  @override
  void dispose() {
    state.player.dispose();
    super.dispose();
  }
}
