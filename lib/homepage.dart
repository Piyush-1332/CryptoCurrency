import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  final List currencies;
  HomePage(this.currencies);
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  List currencies;
  final List<MaterialColor> _colors = [Colors.blue, Colors.indigo, Colors.red];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: Text('CryptoCurrency'),
      ),
      body: _cryptoWidget(),
    );
  }

  Widget _cryptoWidget() {
    return new Container(
      child: Column(
        children: <Widget>[
              new Flexible(
          child: new ListView.builder(
            itemCount: widget.currencies.length,
            itemBuilder: (BuildContext context, int index) {
              final Map currency = widget.currencies[index];
              final MaterialColor color = _colors[index % _colors.length];
              return _getListitemUI(currency, color);
            },
          ),
        ),]
      ),
    );
  }

  ListTile _getListitemUI(Map currency, MaterialColor color) {
    return new ListTile(
      isThreeLine: true,
      subtitle: _getSubtitleText(
          currency['price_usd'], currency['percent_change_1h']),
      leading: new CircleAvatar(
        backgroundColor: color,
        child: new Text(currency['name'][0]),
      ),
      title: new Text(currency['name'],
          style: new TextStyle(fontWeight: FontWeight.bold)),
    );
  }

  Widget _getSubtitleText(String priceUSD, String percentageChange) {
    TextSpan priceTextWidget = new TextSpan(
        text: "\$$priceUSD\n", style: new TextStyle(color: Colors.black));
    String percentChangeText = "1 hour : $percentageChange%";
    TextSpan percentChangeTextWidget;

    if (double.parse(percentageChange) > 0) {
      percentChangeTextWidget = new TextSpan(
          text: percentChangeText, style: new TextStyle(color: Colors.green));
    } else {
      percentChangeTextWidget = new TextSpan(
          text: percentChangeText, style: new TextStyle(color: Colors.red));
    }
    return new RichText(
      text: new TextSpan(
        children: [
          priceTextWidget,percentChangeTextWidget
        ]
      ),
    );
  }
}

