import 'package:alisverissa/servis.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class YanMenu extends StatefulWidget {
  final WebViewController controller;

  const YanMenu({Key key, this.controller}) : super(key: key);
  @override
  _YanMenuState createState() => _YanMenuState();
}

class _YanMenuState extends State<YanMenu> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Drawer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(20.0),
                color: Colors.blueGrey.shade50,
                child: Image.network(
                    'https://alisverissa.com/wp-content/uploads/2021/02/Asset-2-2.png'),
              ),
              Expanded(
                child: ListView(
                  children: [
                    ListTile(
                      title: Text('Elektronik'),
                      onTap: () {
                        Navigator.pop(context);
                        Provider.of<Servis>(context, listen: false)
                            .webViewController
                            .loadUrl('https://alisverissa.com/elektronik/');
                      },
                    ),
                    Divider(
                      height: 1.0,
                      color: Colors.blueGrey,
                    ),
                    ListTile(
                      title: Text('Ev Yaşam'),
                      onTap: () {
                        Navigator.pop(context);
                        Provider.of<Servis>(context, listen: false)
                            .webViewController
                            .loadUrl('https://alisverissa.com/ev-yasam/');
                      },
                    ),
                    Divider(
                      height: 1.0,
                      color: Colors.blueGrey,
                    ),
                    ExpansionTile(
                      title: Text('Giyim'),
                      children: [
                        Container(
                          child: ListTile(
                            leading: SizedBox(),
                            title: Text('Giyim & Ayakkabı'),
                            onTap: () {
                              Navigator.pop(context);
                              Provider.of<Servis>(context, listen: false)
                                  .webViewController
                                  .loadUrl('https://alisverissa.com/giyim-ayakkabi/');
                            },
                          ),
                        ),
                        Container(
                          child: ListTile(
                            leading: Image.network(
                              'https://alisverissa.com/wp-content/uploads/2021/03/cropped-dizigiysi.com-logo-280x280.png',
                              height: 25,
                              width: 25,
                            ),
                            title: Text('Kadın'),
                            onTap: () {
                              Navigator.pop(context);
                              Provider.of<Servis>(context, listen: false)
                                  .webViewController
                                  .loadUrl('https://alisverissa.com/kadin-giyim-ayakkabi/');
                            },
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      height: 1.0,
                      color: Colors.blueGrey,
                    ),
                    ListTile(
                      title: Text('Hobi'),
                      onTap: () {
                        Navigator.pop(context);
                        Provider.of<Servis>(context, listen: false)
                            .webViewController
                            .loadUrl('https://alisverissa.com/hobi-eglence/');
                      },
                    ),
                    Divider(
                      height: 1.0,
                      color: Colors.blueGrey,
                    ),
                    ListTile(
                      title: Text('Kişisel Bakım'),
                      onTap: () {
                        Navigator.pop(context);
                        Provider.of<Servis>(context, listen: false)
                            .webViewController
                            .loadUrl('https://alisverissa.com/kisisel-bakim-saglik/');
                      },
                    ),
                    Divider(
                      height: 1.0,
                      color: Colors.blueGrey,
                    ),
                    ListTile(
                      title: Text('Oto Aksesuar'),
                      onTap: () {
                        Navigator.pop(context);
                        Provider.of<Servis>(context, listen: false)
                            .webViewController
                            .loadUrl('https://alisverissa.com/oto-aksesuar/');
                      },
                    ),
                    Divider(
                      height: 1.0,
                      color: Colors.blueGrey,
                    ),
                    ListTile(
                      title: Text('Spor'),
                      onTap: () {
                        Navigator.pop(context);
                        Provider.of<Servis>(context, listen: false)
                            .webViewController
                            .loadUrl('https://alisverissa.com/outdoor-spor/');
                      },
                    ),
                    Divider(
                      height: 1.0,
                      color: Colors.blueGrey,
                    ),
                    ListTile(
                      title: Text('Yapı Market'),
                      onTap: () {
                        Navigator.pop(context);
                        Provider.of<Servis>(context, listen: false)
                            .webViewController
                            .loadUrl('https://alisverissa.com/yapi-market/');
                      },
                    ),
                    Divider(
                      height: 1.0,
                      color: Colors.blueGrey,
                    ),
                    Container(
                      color: HexColor("0088CC"),
                      child: ListTile(
                        leading: Icon(Icons.mail_outline, color: Colors.white),
                        title: Text('İletişim',
                            style: TextStyle(
                              color: Colors.white,
                            )),
                        onTap: () {
                          Navigator.pop(context);
                          Clipboard.setData(new ClipboardData(text: "mailto:info@alisverissa.com"));
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: const Text('Panoya kopyalandı: mailto:info@alisverissa.com'),
                            duration: const Duration(seconds: 2),
                          ));
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
