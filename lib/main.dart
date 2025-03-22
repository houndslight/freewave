import 'package:flutter/material.dart';

void main() {
  runApp(MusicApp());
}

class MusicApp extends StatelessWidget {
  const MusicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music App',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.black,
        colorScheme: ColorScheme.dark(
          primary: Colors.white,
          secondary: Colors.purple.shade800,
        ),
        fontFamily: 'PlanetKosmos', // Set as default font
      ),
      home: MusicHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MusicHomePage extends StatelessWidget {
  const MusicHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Top navigation bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Logo/compass icon
                  InkWell(
                    onTap: () => print('Logo tapped'),
                    child: Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black, width: 2),
                      ),
                      child: const Icon(Icons.explore, color: Colors.black, size: 18),
                    ),
                  ),
                  
                  // Middle navigation buttons - smaller and centered
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildNavButton(context, 'songs'),
                        const SizedBox(width: 6),
                        _buildNavButton(context, 'artists'),
                        const SizedBox(width: 6),
                        _buildNavButton(context, 'albums'),
                      ],
                    ),
                  ),
                  
                  // Right side buttons
                  Row(
                    children: [
                      _buildIconButton(context, Icons.pause),
                      const SizedBox(width: 6),
                      _buildIconButton(context, Icons.headphones),
                    ],
                  ),
                ],
              ),
            ),
            
            // Jump back in title
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Text(
                "jump back in",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'PlanetKosmos',
                  letterSpacing: 1.2,
                  color: Colors.black,
                ),
              ),
            ),
            
            // Album grid
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildAlbumTile(context, 'album 1', 'placeholder 1', true),
                  _buildAlbumTile(context, 'album 2', 'placeholder 2', false),
                  _buildAlbumTile(context, 'album', 'placeholder', false),
                ],
              ),
            ),
            
            // Recently imported tracks title
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Text(
                "recently imported tracks",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'PlanetKosmos',
                  letterSpacing: 1.2,
                  color: Colors.black,
                ),
              ),
            ),
            
            // Track list
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  _buildTrackItem(context, 'artist name', 'track name 1'),
                  const SizedBox(height: 12),
                  _buildTrackItem(context, 'artist name', 'track name 2'),
                  const SizedBox(height: 12),
                  _buildTrackItem(context, 'artist name', 'track name 3'),
                ],
              ),
            ),
            
            // More button
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 16, top: 8),
                child: TextButton(
                  onPressed: () => print('More tapped'),
                  child: const Text(
                    'more >',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'PlanetKosmos',
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
            
            const Spacer(),
            
            // Now playing bar
            Padding(
              padding: const EdgeInsets.all(16),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MusicPlayerScreen(
                        songTitle: 'song title',
                        artistName: 'placeholder',
                        albumName: 'album',
                      ),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.play_arrow, color: Colors.white),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Text(
                              'song title',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'PlanetKosmos',
                              ),
                            ),
                            Text(
                              'placeholder - album',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                                fontFamily: 'PlanetKosmos',
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Icon(Icons.music_note, color: Colors.white),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildNavButton(BuildContext context, String text) {
    return InkWell(
      onTap: () => print('$text tapped'),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: 'PlanetKosmos',
            fontSize: 12,
          ),
        ),
      ),
    );
  }
  
  Widget _buildIconButton(BuildContext context, IconData icon) {
    return InkWell(
      onTap: () => print('Icon tapped'),
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: Colors.white, size: 18),
      ),
    );
  }
  
  Widget _buildAlbumTile(BuildContext context, String title, String subtitle, bool isLarge) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MusicPlayerScreen(
              songTitle: title,
              artistName: subtitle,
              albumName: title,
            ),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: isLarge ? 120 : 100,
            height: isLarge ? 120 : 100,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(Icons.music_note, color: Colors.white, size: isLarge ? 50 : 40),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'PlanetKosmos',
              color: Colors.black,
            ),
          ),
          Text(
            subtitle,
            style: const TextStyle(
              fontFamily: 'PlanetKosmos',
              fontSize: 12,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildTrackItem(BuildContext context, String artist, String track) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MusicPlayerScreen(
              songTitle: track,
              artistName: artist,
              albumName: 'Unknown Album',
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                '$artist - $track',
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'PlanetKosmos',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MusicPlayerScreen extends StatefulWidget {
  final String songTitle;
  final String artistName;
  final String albumName;

  const MusicPlayerScreen({
    Key? key, 
    required this.songTitle, 
    required this.artistName, 
    required this.albumName
  }) : super(key: key);

  @override
  State<MusicPlayerScreen> createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen> {
  double _currentSliderValue = 20;
  double _currentVolumeValue = 70;
  bool _isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Top bar with back button, time and status icons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.black),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      const Text(
                        '10:02',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.signal_cellular_alt),
                      const SizedBox(width: 8),
                      const Icon(Icons.wifi),
                      const SizedBox(width: 8),
                      Container(
                        width: 40,
                        height: 20,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              width: 25,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Like button, song info, and menu button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Icons.favorite_border,
                    size: 32,
                  ),
                  Column(
                    children: [
                      Text(
                        '${widget.artistName} - ${widget.songTitle}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          letterSpacing: 1.2,
                        ),
                      ),
                      Text(
                        widget.albumName,
                        style: const TextStyle(
                          fontSize: 16,
                          fontStyle: FontStyle.italic,
                          letterSpacing: 1.0,
                        ),
                      ),
                    ],
                  ),
                  const Icon(
                    Icons.arrow_drop_down,
                    size: 32,
                  ),
                ],
              ),
            ),

            // Album art / music note
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.music_note,
                      size: 180,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),

            // Volume slider (vertical)
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  const Expanded(flex: 4, child: SizedBox()),
                  Expanded(
                    flex: 1,
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          trackHeight: 2.0,
                          thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8.0),
                          overlayShape: const RoundSliderOverlayShape(overlayRadius: 16.0),
                          activeTrackColor: Colors.black,
                          inactiveTrackColor: Colors.grey,
                          thumbColor: Colors.black,
                        ),
                        child: Slider(
                          value: _currentVolumeValue,
                          min: 0,
                          max: 100,
                          onChanged: (double value) {
                            setState(() {
                              _currentVolumeValue = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Playback controls
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: const Icon(Icons.fast_rewind, size: 48),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(
                      _isPlaying ? Icons.pause : Icons.play_arrow,
                      size: 64,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPlaying = !_isPlaying;
                      });
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.fast_forward, size: 48),
                    onPressed: () {},
                  ),
                ],
              ),
            ),

            // Time indicators and progress slider
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('00:24'),
                      Text('03:45'),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      trackHeight: 4.0,
                      thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8.0),
                      overlayShape: const RoundSliderOverlayShape(overlayRadius: 16.0),
                      activeTrackColor: Colors.black,
                      inactiveTrackColor: Colors.grey.shade300,
                      thumbColor: Colors.black,
                    ),
                    child: Slider(
                      value: _currentSliderValue,
                      min: 0,
                      max: 100,
                      onChanged: (double value) {
                        setState(() {
                          _currentSliderValue = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),

            // Bottom buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'settings',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'shuffle',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'loop',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'request',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Home indicator
            Container(
              margin: const EdgeInsets.only(bottom: 8.0),
              width: 120,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
