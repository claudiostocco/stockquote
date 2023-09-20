import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class MonitoredTickers {
  MonitoredTickers({
    required this.ticker,
    required this.ceilingPrice,
  });

  final String ticker;
  final double ceilingPrice;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'ticker': ticker,
      'ceilingPrice': ceilingPrice,
    };
  }

  factory MonitoredTickers.fromMap(Map<String, dynamic> map) {
    return MonitoredTickers(
      ticker: map['ticker'] as String,
      ceilingPrice:
          map['ceilingPrice'] != null ? map['ceilingPrice'] as double : 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory MonitoredTickers.fromJson(String source) =>
      MonitoredTickers.fromMap(json.decode(source) as Map<String, dynamic>);

  static List<MonitoredTickers> list(String source) {
    var jsonDecoded = json.decode(source);
    if (jsonDecoded is List) {
      return jsonDecoded
          .map<MonitoredTickers>((e) => MonitoredTickers.fromMap(e))
          .toList();
    }
    return [];
  }
}
