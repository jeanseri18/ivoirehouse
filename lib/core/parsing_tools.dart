import 'package:intl/intl.dart';

class ParsingTools {
  static double parseDouble(inValue, {double defaultValue = 0.00}) {
    try {
      if (inValue == null || inValue == 0) return defaultValue;
      if (inValue is double) return inValue;
      if (inValue is int) return inValue.toDouble();
      if (inValue is String) return double.parse(inValue);
      return defaultValue;
    } catch (e) {
      return defaultValue;
    }
  }

  static int parseInt(dynamic inValue, {int defaultValue = 0}) {
    try {
      if (inValue == null || inValue == 0) return defaultValue;
      if (inValue is int) return inValue;
      if (inValue is String) return int.parse(inValue);
      return defaultValue;
    } catch (e) {
      return defaultValue;
    }
  }

  static String parseString(dynamic inValue, {String defaultValue = ''}) {
    try {
      if (inValue == null || inValue == 0) return defaultValue;
      if (inValue is int) return '$inValue';
      if (inValue is String) return inValue;
      return defaultValue;
    } catch (e) {
      return defaultValue;
    }
  }

  static DateTime? parseDateTime(dynamic inValue,
      {dateFormat = 'yyyy-MM-dd HH:mm:ss'}) {
    if (inValue != null) {
      var format = DateFormat(dateFormat);
      try {
        return format.parse(inValue);
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  static bool parseBool(dynamic inValue, {bool defaultValue = false}) {
    if (inValue != null) {
      if (inValue is bool) {
        return inValue;
      }
      if (inValue is int) {
        return inValue == 1 ? true : false;
      }
      if (inValue is String) {
        if (inValue == 'true') return true;
        if (inValue == 'false') return false;
        if (inValue == '0') return false;
        if (inValue == '1') return true;
      }
    }
    return defaultValue;
  }

  static List<E> parseArray<E>(
      dynamic inValue, E Function(Map<String, dynamic> j) fromJson) {
    if (inValue != null) {
      if (inValue is List) {
        var list = <E>[];
        for (var val in inValue) {
          list.add(fromJson(val));
        }
        return list;
      }
    }
    return [];
  }

  static T? parseModel<T>(
      dynamic value, T Function(Map<String, dynamic> j) fromJson) {
    if (value != null && value is Map<String, dynamic>) {
      return fromJson(value);
    }
    return null;
  }

  static T? parseMap<T>(Map<String, dynamic> node, String path) {
    var pathNodes = path.split('.');
    var first = pathNodes[0];
    if (pathNodes.length == 1) {
      if (node[first] is Map<String, dynamic> && T is Map<String, dynamic>) {
        return node[first];
      }
      if (node[first] is List<dynamic> && T is List<dynamic>) {
        return node[first];
      }
      if (node[first] is T) {
        return node[first];
      }
      return null;
    }

    pathNodes.removeAt(0);
    if (node[first] is Map<String, dynamic>) {
      return parseMap(node[first], pathNodes.join('.'));
    }
    return null;
  }
}
