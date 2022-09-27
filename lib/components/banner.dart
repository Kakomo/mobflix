import 'package:challenge/model/url_launcher.dart';
import 'package:flutter/material.dart';

class TopBanner extends StatelessWidget {
  const TopBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox(
          width: 400,
          height: 138,
          child: Image.network(
            'https://i.ytimg.com/vi/2t8ycK8D4Rk/maxresdefault.jpg',
            fit: BoxFit.fitWidth,
          ),
        ),
        ElevatedButton(
          onPressed: () {
            UrlLauncher().openLink('https://www.youtube.com/watch?v=94yuIVdoevc');
          },
          child: Text('Assista agora'),
        ),
      ],
    );
  }
}
