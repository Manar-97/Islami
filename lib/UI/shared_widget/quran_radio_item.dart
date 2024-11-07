import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../model/radio_Item.dart';
import '../providers/my_provider.dart';

class QuranRadioItem extends StatefulWidget {
  final List<Radios> radioItem;
  final AudioPlayer audioPlayer;
  final int initialIndex;
  const QuranRadioItem(
      {super.key,
      required this.radioItem,
      required this.audioPlayer,
      required this.initialIndex});

  @override
  State<QuranRadioItem> createState() => _QuranRadioItemState();
}

class _QuranRadioItemState extends State<QuranRadioItem> {
  late MyProvider myProvider;
  bool isClicked = false;
  late int currentTrackIndex;

  @override
  void initState() {
    super.initState();
    currentTrackIndex = widget.initialIndex;
  }

  Radios get currentTrack => widget.radioItem[currentTrackIndex];

  @override
  Widget build(BuildContext context) {
    myProvider = Provider.of(context);
    return Column(
      children: [
        Center(
          child: Text(
            currentTrack.name ?? '',
            style: Theme.of(context)
                .textTheme
                .labelLarge
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: _previousTrack,
              icon: Icon(
                Icons.skip_previous,
                size: 40,
                color: Theme.of(context).colorScheme.background,
              ),
            ),
            IconButton(
              onPressed: _togglePlayPause,
              icon: Icon(
                !isClicked ? Icons.play_arrow : Icons.pause,
                size: 80,
                color: Theme.of(context).colorScheme.background,
              ),
            ),
            IconButton(
                onPressed: _nextTrack,
                icon: Icon(
                  Icons.skip_next,
                  size: 40,
                  color: Theme.of(context).colorScheme.background,
                )),
          ],
        ),
      ],
    );
  }

  void _togglePlayPause() async {
    if (isClicked) {
      await widget.audioPlayer.pause();
    } else {
      await widget.audioPlayer.play(UrlSource(currentTrack.url ?? ''));
    }
    setState(() {
      isClicked = !isClicked;
    });
  }

  void _nextTrack() {
    setState(() {
      currentTrackIndex = (currentTrackIndex + 1) % widget.radioItem.length;
      isClicked = true; // Reset play state
    });
    _togglePlayPause(); // Play new track
  }

  void _previousTrack() {
    setState(() {
      currentTrackIndex = (currentTrackIndex - 1 + widget.radioItem.length) %
          widget.radioItem.length;
      isClicked = true; // Reset play state
    });
    _togglePlayPause(); // Play new track
  }
}
