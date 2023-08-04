import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  late BannerAd _bannerAd;
  bool _isLoaded = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initBannerAd();
  }

  _initBannerAd() {
    _bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: BannerAd.testAdUnitId,
      listener: BannerAdListener(
          onAdLoaded: ((ad) {
            setState(() {
              _isLoaded = true;
            });
          }),
          onAdFailedToLoad: ((ad, error) {})),
      request: AdRequest(),
    );
    _bannerAd.load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 30,
            ),
            Center(
                child: Container(
              width: 320,
              height: 200,
              padding: const EdgeInsets.all(10.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: const Color.fromARGB(255, 253, 253, 253),
                elevation: 10,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Spacer(),
                    const ListTile(
                      leading: Icon(Icons.album, size: 60),
                      title:
                          Text('Sonu Nigam', style: TextStyle(fontSize: 30.0)),
                      subtitle: Text('Best of Sonu Nigam Music.',
                          style: TextStyle(fontSize: 18.0)),
                    ),
                    ButtonBar(
                      children: <Widget>[
                        TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            foregroundColor:
                                const Color.fromARGB(255, 255, 255, 255),
                            backgroundColor:
                                const Color.fromARGB(255, 1, 75, 29),
                            // Background Color
                          ),
                          child: const Text(
                            'Ok ',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            foregroundColor:
                                const Color.fromARGB(255, 255, 255, 255),
                            backgroundColor:
                                const Color.fromARGB(255, 122, 3, 3),
                            // Background Color
                          ),
                          child: const Text(
                            'Exit ',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )),
            const SizedBox(
              height: 69,
            ),
            Container(
              width: 100,
              height: 100,
              child: ClipOval(
                child: Image.network(
                  "https://example.com/your-avatar.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _isLoaded
          ? Container(
              height: _bannerAd.size.height.toDouble(),
              width: _bannerAd.size.width.toDouble(),
              child: AdWidget(ad: _bannerAd),
            )
          : const SizedBox(),
    );
  }
}
