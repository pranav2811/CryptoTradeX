// ignore_for_file: library_private_types_in_public_api

import 'package:cryptotradex/widgets/actions/actions_widget.dart';
import 'package:cryptotradex/widgets/balance_panel/balance_panel.dart';
import 'package:cryptotradex/widgets/chart/chart_home_page.dart';
import 'package:crypto_font_icons/crypto_font_icons.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:unicons/unicons.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double balance = 66032206.10;
  double profit = 35.22;
  double profitPercent = 0.22;

  Future<Map<String, dynamic>> fetchCryptoData(String symbol) async {
    const apiKey = '734EF8C1-6545-4252-B501-FA0C6D041165';
    final endpoint = 'exchangerate/$symbol/USD';
    const baseUrl = 'https://rest.coinapi.io/v1/';
    final url = Uri.parse('$baseUrl$endpoint');

    Future<Map<String, dynamic>> fetchData() async {
      final response = await http.get(
        url,
        headers: {'X-CoinAPI-Key': apiKey},
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load data');
      }
    }

    const Duration refreshInterval = Duration(minutes: 5);
    Timer.periodic(refreshInterval, (timer) async {
      final data = await fetchData();
    });
    return await fetchData();
  }

  Widget buildCryptoChart(
    String symbol,
    IconData icon,
    String cryptoName,
    String cryptoSymbol,
    ThemeData themeData,
  ) {
    return FutureBuilder<Map<String, dynamic>>(
      future: fetchCryptoData(symbol),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final data = snapshot.data;
          final priceUSD = data?['rate'].toString();

          return chartHomePage(
            true,
            icon,
            cryptoName,
            cryptoSymbol,
            'USD',
            const [
              FlSpot(0, 40005.71),
              FlSpot(1, 40875.23),
              FlSpot(2, 40800.59),
              FlSpot(3, 40875.12),
              FlSpot(4, 41875.72),
              FlSpot(5, 40375.49),
              FlSpot(6, 40700.58),
            ],
            themeData,
            priceUSD: double.parse(priceUSD!),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      backgroundColor: themeData.colorScheme.background,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40.0), //appbar size
        child: AppBar(
          bottomOpacity: 0.0,
          elevation: 0.0,
          shadowColor: Colors.transparent,
          backgroundColor: themeData.colorScheme.background,
          leading: SizedBox(
            height: 10.w,
            width: 15.w,
          ),
          automaticallyImplyLeading: false,
          titleSpacing: 0,
          leadingWidth: 15.w,
          title: Image.asset(
            themeData.brightness == Brightness.light
                ? 'assets/images/logo.png'
                : 'assets/images/logo.png',
            height: 5.5.h,
          ),
          centerTitle: true,
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 5.w),
              child: SizedBox(
                height: 3.5.h,
                width: 10.w,
                child: Container(
                  decoration: BoxDecoration(
                    color: themeData.primaryColor.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    UniconsLine.bell,
                    color: themeData.primaryColor,
                    size: 20.sp,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 2.h),
          child: ListView(
            children: [
              balancePanel(balance, profit, profitPercent, themeData),
              actionsWidget(themeData),
              buildCryptoChart(
                  'BTC', CryptoFontIcons.BTC, 'Bitcoin', 'BTC', themeData),
              buildCryptoChart(
                  'ETH', CryptoFontIcons.ETH, 'Ethereum', 'ETH', themeData),
              buildCryptoChart(
                  'DOGE', CryptoFontIcons.DOGE, 'Dogecoin', 'DOGE', themeData),
              buildCryptoChart(
                  'LTC', CryptoFontIcons.LTC, 'Litecoin', 'LTC', themeData),
            ],
          ),
        ),
      ),
    );
  }
}
