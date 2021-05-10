import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CallAppBarComponent extends StatefulWidget {
  @override
  _CallAppBarComponentState createState() => _CallAppBarComponentState();
}

class _CallAppBarComponentState extends State<CallAppBarComponent> {
  late String phoneNumber;

  late String zaloAccount;

  late String facebookAccount;

  @override
  Widget build(BuildContext context) {
    phoneNumber = AppLocalizations.of(context)!.phoneNumber;
    zaloAccount = AppLocalizations.of(context)!.zaloAccount;
    facebookAccount = AppLocalizations.of(context)!.facebookAccount;
    return Align(
      alignment: Alignment.bottomRight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            backgroundColor: Colors.red,
            heroTag: "phoneCall",
            onPressed: _makingPhoneCall,
            child: Icon(Icons.phone),
          ),
          SizedBox(
            height: 20,
          ),
          FloatingActionButton(
            backgroundColor: Colors.green,
            heroTag: "zaloCall",
            onPressed: _makingZaloCall,
            child: Container(
              child: Image(
                image: AssetImage(
                  'assets/images/zl.png',
                ),
                fit: BoxFit.cover,
              ),
              height: 44,
              width: 44,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          FloatingActionButton(
            backgroundColor: Colors.blue,
            heroTag: "messengerCall",
            onPressed: _makingMessegerCall,
            child: Container(
              child: Image(
                image: AssetImage(
                  'assets/images/fb.png',
                ),
                fit: BoxFit.cover,
              ),
              height: 44,
              width: 44,
            ),
          )
        ],
      ),
    );
  }

  void _makingPhoneCall() async {
    var url = 'tel:' + this.phoneNumber;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _makingMessegerCall() async {
    var url = 'https://m.me/' + this.facebookAccount;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _makingZaloCall() async {
    var url = 'https://zalo.me/' + this.zaloAccount;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
