import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:google_fonts/google_fonts.dart';

main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const AboutMe(),
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ).apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        ),
      ),
    );
  }
}

class AboutMe extends StatelessWidget {
  const AboutMe({Key? key}) : super(key: key);

  final aboutMeText =
      "Extremely motivated and in constant development. Looking for an opportunity on a journey that provides challenges and new learnings.";
  final imageUrl =
      'https://avatars.githubusercontent.com/u/59462246?s=400&u=66feb521bd19367958ed8232a2e4a7aa8571277e&v=4';
  final githubUrl = 'https://github.com/gabriel-venezian';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('About Me'),
          bottom: const TabBar(
            tabs: [
              Tab(
                text: ("Personal"),
              ),
              Tab(
                text: "Professional",
              )
            ],
          ),
        ),
        endDrawer: SafeArea(
          child: Drawer(
            backgroundColor: Colors.blue,
            child: ListView(
              children: [
                UserAccountsDrawerHeader(
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(imageUrl),
                  ),
                  accountName: const Text("Gabriel Venezian"),
                  accountEmail: const Text("gabriel.venezian@hotmail.com"),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.email,
                    color: Colors.white,
                    size: 24,
                  ),
                  title: const Text("Email"),
                  subtitle: const Text('gabriel.venezian'),
                  trailing: const Icon(Icons.arrow_forward,
                      color: Colors.white, size: 24),
                  onTap: () {
                    launchUrlString("mailto:gabriel.venezian@hotmail.com");
                  },
                ),
                ListTile(
                  leading: const Icon(FontAwesomeIcons.linkedinIn,
                      color: Colors.white, size: 24),
                  title: const Text("LinkedIn"),
                  subtitle: const Text('gabriel-venezian'),
                  trailing: const Icon(Icons.arrow_forward,
                      color: Colors.white, size: 24),
                  onTap: () {
                    launchUrlString(
                        "https://www.linkedin.com/in/gabriel-venezian/");
                  },
                ),
                ListTile(
                  leading: const Icon(FontAwesomeIcons.github,
                      color: Colors.white, size: 24),
                  title: const Text("GitHub"),
                  subtitle: const Text('gabriel-venezian'),
                  trailing: const Icon(Icons.arrow_forward,
                      color: Colors.white, size: 24),
                  onTap: () {
                    launchUrlString("https://github.com/gabriel-venezian");
                  },
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            _buildPersonalContent(),
            _buildProfessionalContent(),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => launchUrlString(githubUrl),
          label: const Text('Follow Me'),
          icon: const Icon(Icons.favorite),
        ),
        backgroundColor: Colors.white10,
      ),
    );
  }

  _buildProfessionalContent() {
    return ListView(
      children: [
        Image.network(
          'https://img.freepik.com/vetores-gratis/projeto-inicial-da-equipe_74855-4818.jpg?w=1380&t=st=1667677270~exp=1667677870~hmac=01bf50ff072f3cb67ebd6cb34cafcc2e8004c460b9ce8f46d969fa3c5866f33d',
          height: 200,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Text(
            "Projects",
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Text(
            "A few list of some projects developed by me and with some friends.",
            style: GoogleFonts.poppins(),
          ),
        ),
        ListTile(
          leading: const Icon(
            FontAwesomeIcons.github,
            color: Colors.white,
            size: 28,
          ),
          title: const Text("Pokédex GUI",
              style: TextStyle(fontWeight: FontWeight.w700)),
          subtitle: const Text(
              "Graphical User Interface to get pokémon information using PokéAPI."),
          trailing:
              const Icon(Icons.arrow_forward, color: Colors.white, size: 24),
          onTap: () {
            launchUrlString("https://github.com/gabriel-venezian/pokedex-gui");
          },
        ),
        ListTile(
          leading: const Icon(
            FontAwesomeIcons.github,
            color: Colors.white,
            size: 28,
          ),
          title: const Text("Naruto Quotes",
              style: TextStyle(fontWeight: FontWeight.w700)),
          subtitle: const Text(
              "Generate random Naruto quotes using Flask (Server) and React (Client)."),
          trailing:
              const Icon(Icons.arrow_forward, color: Colors.white, size: 24),
          onTap: () {
            launchUrlString(
                "https://github.com/gabriel-venezian/naruto-quotes");
          },
        ),
        ListTile(
          leading: const Icon(
            FontAwesomeIcons.github,
            color: Colors.white,
            size: 28,
          ),
          title: const Text("Meet Minas",
              style: TextStyle(fontWeight: FontWeight.w700)),
          subtitle: const Text(
              "Landing page simulating a travel agency focused in Minas Gerais."),
          trailing:
              const Icon(Icons.arrow_forward, color: Colors.white, size: 24),
          onTap: () {
            launchUrlString("https://github.com/gabriel-venezian/meet-minas");
          },
        ),
        ListTile(
          leading: const Icon(
            FontAwesomeIcons.github,
            color: Colors.white,
            size: 28,
          ),
          title: const Text("Pokédex API",
              style: TextStyle(fontWeight: FontWeight.w700)),
          subtitle: const Text(
              "Get information about the first pokémon generation using PokéAPI."),
          trailing:
              const Icon(Icons.arrow_forward, color: Colors.white, size: 24),
          onTap: () {
            launchUrlString("https://github.com/gabriel-venezian/pokedex-api");
          },
        ),
        const Padding(padding: EdgeInsets.only(bottom: 10)),
      ],
    );
  }

  _buildPersonalContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.network(
          imageUrl,
          height: 250,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        const Padding(
          padding: EdgeInsets.only(top: 16),
          child: Text(
            'Gabriel Venezian',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [FlutterLogo(), Text(' Flutter Developer')],
        ),
        const Divider(
          indent: 32,
          endIndent: 32,
          height: 24,
          thickness: 3,
          color: Colors.blue,
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            aboutMeText,
            style: const TextStyle(height: 1.5, fontSize: 18),
            textAlign: TextAlign.justify,
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
