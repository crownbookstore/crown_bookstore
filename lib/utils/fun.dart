import 'package:url_launcher/url_launcher.dart';

void launchSocialApp(String url) async {
  // Compose your deep link with the encoded data
  Uri deepLink = Uri.parse(url);
  await launchUrl(deepLink);
}
