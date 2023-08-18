import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import 'constants.dart';

class Services {
  //showing  toast messages
  void showSnack(String msg, Color color, IconData icon, BuildContext context) {
    FToast().init(context).showToast(
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: color,
                border:
                    Border.all(color: Theme.of(context).dividerColor, width: 1),
                borderRadius: BorderRadius.circular(4)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  icon,
                  color: Colors.white,
                  size: 18,
                ),
                const SizedBox(
                  width: 12,
                ),
                Text(
                  msg,
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontWeight: FontWeight.normal, color: Colors.white),
                ),
              ],
            ),
          ),
          gravity: ToastGravity.TOP_RIGHT,
          toastDuration: const Duration(seconds: 2),
        );
  }

  //getting token

  Future<void> isTokenGotten(
      String username, String password, BuildContext context) async {
    String url = token;

    Map<String, dynamic> data = {'username': username, 'password': password};
    Map<String, String>  headers = {
    'Content-Type': 'application/json',
    'Vary': "Accept",
    };

    var res = await http.post(
      Uri.parse(url),
      body: data,
      headers: headers
    );
    if (res.statusCode == 200) {
      var jsonRes = json.decode(res.body);
      print('JSON Body: $jsonRes');
    } else {
      showSnack('Please check your internet connection..!', Colors.red,
          Icons.warning_amber_rounded, context);
      throw Exception(e);
    }
  }
}
