import 'package:challenge/model/url_launcher.dart';
import 'package:challenge/model/video_model.dart';
import 'package:challenge/screens/edit.dart';
import 'package:flutter/material.dart';


class VideoCard extends StatelessWidget {
  const VideoCard({required this.video,Key? key}) : super(key: key);
  final VideoModel video;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 8.0, bottom: 8, left: 16, right: 16),
              child: Text(
                video.category,
                style: TextStyle(color: Colors.white),
              ),
            ),
            color: Color.fromARGB(255, 216, 45, 45),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          InkWell(
            onTap: () {
              UrlLauncher().openLink('https://www.youtube.com/watch?v=${video.url}');
            },
            onLongPress: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (contextTwo) => EditForm(video: video,)),
              );
            },
            child: Card(
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.white24),
                borderRadius: BorderRadius.circular(20),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  'http://i3.ytimg.com/vi/${video.url}/hqdefault.jpg',
                  fit: BoxFit.cover,
                  width: 320,
                  height: 180,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

