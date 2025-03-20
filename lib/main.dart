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
  const MusicHomePage({super.key});

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
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Logo/compass icon
                  InkWell(
                    onTap: () => print('Logo tapped'),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black, width: 2),
                      ),
                      child: Icon(Icons.explore, color: Colors.black),
                    ),
                  ),
                  
                  // Middle navigation buttons
                  Row(
                    children: [
                      _buildNavButton('songs'),
                      SizedBox(width: 8),
                      _buildNavButton('artists'),
                      SizedBox(width: 8),
                      _buildNavButton('albums'),
                    ],
                  ),
                  
                  // Right side buttons
                  Row(
                    children: [
                      _buildIconButton(Icons.pause),
                      SizedBox(width: 8),
                      _buildIconButton(Icons.headphones),
                    ],
                  ),
                ],
              ),
            ),
            
            // Jump back in title
            Padding(
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
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildAlbumTile('album 1', 'placeholder 1', true),
                  _buildAlbumTile('album 2', 'placeholder 2', false),
                  _buildAlbumTile('album', 'placeholder', false),
                ],
              ),
            ),
            
            // Recently imported tracks title
            Padding(
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
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  _buildTrackItem('artist name', 'track name'),
                  SizedBox(height: 12),
                  _buildTrackItem('artist name', 'track name'),
                  SizedBox(height: 12),
                  _buildTrackItem('artist name', 'track name'),
                ],
              ),
            ),
            
            // More button
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: 16, top: 8),
                child: TextButton(
                  onPressed: () => print('More tapped'),
                  child: Text(
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
            
            Spacer(),
            
            // Now playing bar
            Padding(
              padding: EdgeInsets.all(16),
              child: InkWell(
                onTap: () => print('Now playing tapped'),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.play_arrow, color: Colors.white),
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
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
                      Icon(Icons.music_note, color: Colors.white),
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
  
  Widget _buildNavButton(String text) {
    return InkWell(
      onTap: () => print('$text tapped'),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: 'PlanetKosmos',
          ),
        ),
      ),
    );
  }
  
  Widget _buildIconButton(IconData icon) {
    return InkWell(
      onTap: () => print('Icon tapped'),
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: Colors.white),
      ),
    );
  }
  
  Widget _buildAlbumTile(String title, String subtitle, bool isLarge) {
    return InkWell(
      onTap: () => print('Album $title tapped'),
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
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'PlanetKosmos',
              color: Colors.black,
            ),
          ),
          Text(
            subtitle,
            style: TextStyle(
              fontFamily: 'PlanetKosmos',
              fontSize: 12,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildTrackItem(String artist, String track) {
    return InkWell(
      onTap: () => print('$artist - $track tapped'),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                '$artist - $track',
                style: TextStyle(
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