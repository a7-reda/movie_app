import 'package:url_launcher/url_launcher.dart';
import 'package:movies_app/Resources/texts.dart';

openVideo(String videoKey) async {
  final url = Uri.parse(AppTexts.youtubeUrl + videoKey);
  if (!await launchUrl(
    url,
    mode: LaunchMode.externalApplication,
  )) {
    await launchUrl(url, mode: LaunchMode.inAppWebView);
  }
}
