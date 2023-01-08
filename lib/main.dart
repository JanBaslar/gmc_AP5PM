import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gmc/config.dart';
import 'package:gmc/generator/font_generator.dart';
import 'package:gmc/generator/image_generator.dart';
import 'package:gmc/generator/quote_generator.dart';
import 'package:gmc/generator/text_generator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    currentTheme.addListener(() {
      setState(() {});
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Generátor motivačních citátů',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        fontFamily: GoogleFonts.robotoCondensed().fontFamily,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        fontFamily: GoogleFonts.robotoCondensed().fontFamily,
      ),
      themeMode: currentTheme.currentTheme(),
      home: const HomePage(title: 'Generátor motivačních citátů'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _quote = generateQuote();
  Image _image = getRandomLocalImage();
  TextStyle _font = getRandomFont(38);
  String _generatingText = getRandomText();
  bool _isGenerating = true;
  bool _isLiked = false;

  int _selectedIndex = 0;

  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  List<String> _favorites = <String>[];

  @override
  void initState() {
    favoriteQuotes.loadQuotes().then((quotes) => _favorites = quotes);
    _generate();
    super.initState();
    removeSplashAfter(2);
  }

  void removeSplashAfter(int seconds) async {
    await Future.delayed(Duration(seconds: seconds));
    FlutterNativeSplash.remove();
  }

  void _generate() {
    setState(() {
      _isGenerating = true;
      _quote = "";
    });
    getRandomImage().then((i) => _image = i).then((_) => setState(() {
          _quote = generateQuote();
          _font = getRandomFont(36);
          _isLiked = false;
          _isGenerating = false;
          _generatingText = getRandomText();
        }));
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildListItem(
      String item, int itemIndex, Animation<double> animation) {
    return SizeTransition(
      sizeFactor: animation,
      child: Card(
        child: ListTile(
          leading: const Icon(Icons.format_quote_sharp),
          title: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              item,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          trailing: IconButton(
              icon: const Icon(Icons.star_sharp),
              onPressed: () {
                _deleteFavoriteQuote(itemIndex);
              }),
        ),
      ),
    );
  }

  void _likeOrDislikeQuote(bool like) {
    String item = _quote;
    int index = 0;
    if (like) {
      setState(() => _isLiked = true);
      _favorites.insert(index, item);
      _listKey.currentState?.insertItem(index);
      favoriteQuotes.updateQuotes(_favorites);
    } else {
      setState(() => _isLiked = false);
      String removedItem = _favorites.removeAt(index);
      builder(context, animation) {
        return _buildListItem(removedItem, index, animation);
      }

      _listKey.currentState?.removeItem(index, builder);
      favoriteQuotes.updateQuotes(_favorites);
    }
  }

  void _deleteFavoriteQuote(int index) {
    if (_isLiked && index == 0) {
      _isLiked = false;
    }
    String removedItem = _favorites.removeAt(index);
    builder(context, animation) {
      return _buildListItem(removedItem, _favorites.length, animation);
    }

    _listKey.currentState?.removeItem(index, builder);
    favoriteQuotes.updateQuotes(_favorites);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SettingsPage()),
                );
              },
              child: const Icon(Icons.settings_sharp),
            ),
          ),
        ],
      ),
      body: _selectedIndex == 0
          ? Stack(
              alignment: Alignment.center,
              children: <Widget>[
                _image,
                Container(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 30),
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                          Color.fromRGBO(0, 0, 0, 0.4),
                          Color.fromRGBO(0, 0, 0, 0.6)
                        ],
                        begin: FractionalOffset(0, 0),
                        end: FractionalOffset(0, 1),
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        _quote,
                        style: _font,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                AnimatedOpacity(
                  opacity: _isGenerating ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 750),
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            Colors.deepPurple,
                            Colors.teal,
                          ],
                          begin: FractionalOffset(0, 0),
                          end: FractionalOffset(1, 1),
                          stops: [0.0, 1.0],
                          tileMode: TileMode.decal),
                    ),
                  ),
                ),
                if (_isGenerating) ...[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const SpinKitFadingCube(
                        color: Colors.white,
                        size: 50.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
                        child: Text(
                          _generatingText,
                          style: const TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  )
                ],
                if (!_isGenerating) ...[
                  Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: StarButton(
                          isStarred: _isLiked,
                          iconDisabledColor: Colors.white24,
                          iconColor: Colors.orange,
                          valueChanged: (isStarred) {
                            _likeOrDislikeQuote(isStarred);
                          },
                        ),
                      ))
                ]
              ],
            )
          // Favorites Page
          : Padding(
              padding: const EdgeInsets.all(10),
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  if (_favorites.isEmpty) ...[
                    const Center(
                        child: Text('Zde se zobrazí tvé oblíbené citáty'))
                  ] else ...[
                    AnimatedList(
                      key: _listKey,
                      initialItemCount: _favorites.length,
                      itemBuilder: (context, index, animation) {
                        return _buildListItem(
                            _favorites[index], index, animation);
                      },
                    ),
                  ]
                ],
              ),
            ),
      floatingActionButton: (!_isGenerating && _selectedIndex == 0)
          ? FloatingActionButton(
              onPressed: _generate,
              child: const Icon(Icons.refresh_sharp),
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.format_quote_sharp),
            label: 'Generátor',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_sharp),
            label: 'Oblíbené',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _isDark = currentTheme.isDark();
  bool _filterControversial = settings.getFilterControversial();

  @override
  void initState() {
    setState(() {
      _isDark = currentTheme.isDark();
      _filterControversial = settings.getFilterControversial();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nastavení'),
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: const Text('Vzhled'),
            tiles: <SettingsTile>[
              SettingsTile.switchTile(
                onToggle: (value) {
                  currentTheme.switchTheme();
                  setState(() {
                    _isDark = value;
                  });
                },
                initialValue: _isDark,
                leading: const Icon(Icons.dark_mode_sharp),
                title: const Text('Tmavý motiv'),
              ),
            ],
          ),
          SettingsSection(
            title: const Text('Generování'),
            tiles: <SettingsTile>[
              SettingsTile(
                onPressed: (BuildContext context) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ModeSettingsPage()),
                  );
                },
                leading: const Icon(Icons.auto_awesome_sharp),
                title: const Text('Mód generování'),
                value: const Text('Nastavuje positivitu generovaných citátů'),
              ),
              SettingsTile.switchTile(
                onToggle: (value) {
                  settings.switchFilterControversial();
                  setState(() {
                    _filterControversial = value;
                  });
                },
                initialValue: _filterControversial,
                leading: const Icon(Icons.block_sharp),
                title: const Text('Filtrovat kontroverzní citáty'),
                description: const Text('Cenzuruje kontroverzní citáty'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ModeSettingsPage extends StatefulWidget {
  const ModeSettingsPage({super.key});

  @override
  State<ModeSettingsPage> createState() => _ModeSettingsPageState();
}

class _ModeSettingsPageState extends State<ModeSettingsPage> {
  String _selected = settings.getModeValue();

  @override
  void initState() {
    _selected = settings.getModeValue();
    super.initState();
  }

  void setMode(String mode) {
    settings.changeModeSettings(mode);
    setState(() {
      _selected = mode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mód generování'),
      ),
      body: Column(
        children: [
          RadioListTile(
            title: const Text("Smíšený", style: TextStyle(fontSize: 18)),
            subtitle: const Text("Generuje pozitivní i negativní citáty"),
            value: "mixed",
            groupValue: _selected,
            onChanged: (value) {
              setMode(value!);
            },
          ),
          RadioListTile(
            title: const Text("Pozitivní", style: TextStyle(fontSize: 18)),
            subtitle: const Text("Generuje převážně pozitivní citáty"),
            value: "positive",
            groupValue: _selected,
            onChanged: (value) {
              setMode(value!);
            },
          ),
          RadioListTile(
            title: const Text("Negativní", style: TextStyle(fontSize: 18)),
            subtitle: const Text("Generuje převážně negativní citáty"),
            value: "negative",
            groupValue: _selected,
            onChanged: (value) {
              setMode(value!);
            },
          )
        ],
      ),
    );
  }
}
