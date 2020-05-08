
class RegexUtils {

  /// verifies that input text is an email text
  static bool matchesEmail(String text) {
    bool matches = true;
    RegExp exp = new RegExp(r'^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$');
    if (!exp.hasMatch(text)) {
      matches = false;
    }
    return matches;
  }
}