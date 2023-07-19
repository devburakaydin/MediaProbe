import 'package:beautiful_soup_dart/beautiful_soup.dart';
import 'package:http/http.dart' as http;

class Helper {
  Helper._();

  static Future<String> getArticleData(String url) async {
    String data = "";
    var parse = Uri.parse(url);
    var response = await http.get(parse);
    BeautifulSoup bs = BeautifulSoup(response.body);
    final allHeaderName = bs.findAll(
      'p',
      attrs: {'class': 'css-at9mc1 evys1bk0'},
    );
    for (var element in allHeaderName) {
      data += removeAllHtmlTags(element.innerHtml);
      data += "\n";
    }

    return data;
  }

  static String removeAllHtmlTags(String htmlText) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

    return htmlText.replaceAll(exp, '');
  }
}
