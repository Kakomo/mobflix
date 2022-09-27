
import 'package:url_launcher/url_launcher.dart';

class UrlLauncher{

  Future<void> openLink(String _url) async{
    Uri youtubeURL = Uri.parse(_url);
    if(!await launchUrl(youtubeURL)){
      throw 'Não pude ler o URL: $_url';
    }
    print('Abrindo link do Youtube: $youtubeURL');
  }
}