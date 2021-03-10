import 'dart:io';
import 'package:alisverissa/servis.dart';
import 'package:alisverissa/splashscreen.dart';
import 'package:alisverissa/yanMenu.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(Provider<Servis>(
    create: (_) => Servis(),
    child: MaterialApp(
      title: 'AlışverisSa',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyPage(),
    ),
  ));
}

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  TextEditingController searchWordController = TextEditingController();
  GlobalKey<ScaffoldState> _scaffold = GlobalKey<ScaffoldState>();

  int selectedIndex = 2;
  int _progress = 0;

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
    internetControl();
  }

  internetControl() async {
    bool netControl = await Servis().internetControl();
    if (netControl == true) {
      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => MyPage()));
    } else {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => Hata()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: YanMenu(),
      key: _scaffold,
      body: SafeArea(
        child: GestureDetector(
          // onHorizontalDragStart: (DragStartDetails dragStartDetails) {
          //   // print(dragStartDetails.globalPosition.dx);
          //   if (dragStartDetails.globalPosition.dx <= 200.0 &&
          //       dragStartDetails.globalPosition.dy <= 550.0) {
          //     // print("Sağ Tarafataki Menü Açılacak.");
          //     _scaffold.currentState.openDrawer();
          //   }
          // },
          onTap: () {},
          child: WebView(
            initialUrl: "https://alisverissa.com/",
            javascriptMode: JavascriptMode.unrestricted,
            onProgress: (int progress) {
              _progress = progress;

              print("WebView is loading (progress : $progress%)");
            },
            onWebViewCreated: (WebViewController webViewCntrl) {
              Provider.of<Servis>(context, listen: false).webViewController = webViewCntrl;
              // _webViewController = webViewCntrl;
            },
          ),
        ),
      ),
      bottomNavigationBar: FFNavigationBar(
        theme: FFNavigationBarTheme(
          barBackgroundColor: Colors.white,
          // selectedItemBorderColor: Colors.blueAccent,
          selectedItemBackgroundColor: HexColor("0088CC"),
          selectedItemIconColor: Colors.white,
          selectedItemLabelColor: Colors.black,
          selectedItemTextStyle: TextStyle(
              // fontSize: 14.0,
              ),
        ),
        selectedIndex: selectedIndex,
        onSelectTab: (index) {
          // 0 Anasayfa https://alisverissa.com/
          // 1 Arama
          // 2 Sepet https://alisverissa.com/cart/
          // 3 Profil https://alisverissa.com/my-account/

          // ! Yenisi
          // 0 Katagoriler
          // 1 Arama
          // 2 Anasayfa
          // 3 Sepet
          // 4 Profil
          if (index == 0) {
            _scaffold.currentState.openDrawer();
          }
          //
          else if (index == 1) {
            String aranacakKelime;

            showDialog<void>(
              context: context,
              barrierDismissible: false, // user must tap button!
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Arama yap'),
                  content: SingleChildScrollView(
                    child: ListBody(
                      children: <Widget>[
                        TextFormField(
                          controller: searchWordController,
                          autocorrect: true,
                          decoration: InputDecoration(
                            hintText: "Ara...",
                            labelText: "Ara",
                            errorStyle: TextStyle(fontSize: 16.0),
                            prefixIcon: Icon(Icons.search),
                          ),
                          validator: (girilenDeger) {
                            if (girilenDeger.isEmpty) {
                              return "Arama kısmı boş geçilemez";
                            }
                            return null;
                          },
                        ),
                        // Text('Would you like to approve of this message?'),
                      ],
                    ),
                  ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        "İptal",
                        style: TextStyle(color: Colors.black54),
                      ),
                    ),
                    TextButton(
                      child: Text(
                        'Ara',
                        style: TextStyle(color: HexColor("0088CC")),
                      ),
                      onPressed: () {
                        aranacakKelime = searchWordController.text;

                        Navigator.of(context).pop();
                        debugPrint(searchWordController.text);
                        Provider.of<Servis>(context, listen: false).webViewController.loadUrl(
                            "https://alisverissa.com/?product_cat=&s=$aranacakKelime&post_type=product&lang=tr");
                      },
                    ),
                  ],
                );
              },
            );
          }
          //
          else if (index == 2) {
            Provider.of<Servis>(context, listen: false)
                .webViewController
                .loadUrl('https://alisverissa.com/');
          }
          //
          else if (index == 3) {
            Provider.of<Servis>(context, listen: false)
                .webViewController
                .loadUrl('https://alisverissa.com/cart/');
          }
          //
          else if (index == 4) {
            Provider.of<Servis>(context, listen: false)
                .webViewController
                .loadUrl('https://alisverissa.com/my-account/');
          }
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          FFNavigationBarItem(
            iconData: Icons.menu,
            label: 'Katagoriler',
          ),
          FFNavigationBarItem(
            iconData: Icons.search,
            label: 'Arama',
          ),
          FFNavigationBarItem(
            iconData: Icons.home,
            label: 'Anasayfa',
          ),
          FFNavigationBarItem(
            iconData: Icons.shopping_basket,
            label: 'Sepet',
          ),
          FFNavigationBarItem(
            iconData: Icons.person,
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}
