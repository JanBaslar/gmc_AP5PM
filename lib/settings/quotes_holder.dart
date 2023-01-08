import 'package:shared_preferences/shared_preferences.dart';

class QuotesHolder {
  List<String> _favoriteQuotes = <String>[];

  QuotesHolder() {
    loadQuotes();
  }

  Future<List<String>> loadQuotes() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('favoriteQuotes')) {
      _favoriteQuotes = prefs.getStringList('favoriteQuotes')!;
    } else {
      prefs.setStringList('favoriteQuotes', _favoriteQuotes);
    }
    return _favoriteQuotes;
  }

  Future<void> updateQuotes(List<String> allQuotes) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('favoriteQuotes', allQuotes);
    _favoriteQuotes = allQuotes;
  }
}
