// // lib/screens/home/home_screen.dart
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'dart:math';
// import '../../services/theme_service.dart';
// import '../../models/topic_model.dart';
// import '../learning/learning_screen.dart';
// import '../quiz/quiz_screen.dart';
// import '../progress/progress_screen.dart';
// import '../profile/profile_screen.dart';
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   static final List<Topic> topics = [
//     Topic(
//       id: 'intro',
//       title: 'Introduction to Flutter',
//       description: 'Overview of Flutter framework, its purpose, and where it is used.',
//       codeSnippet: 'void main() => runApp(MyApp());',
//       youtubeId: 'uvSrRBHtio8',
//     ),
//     Topic(
//       id: 'dart',
//       title: 'Dart Basics',
//       description: 'Variables, functions, and control flow in Dart.',
//       codeSnippet: 'void main() {\n  print("Hello Dart");\n}',
//       youtubeId: 'NrO0CJCbYLA',
//     ),
//     Topic(
//       id: 'widgets',
//       title: 'Flutter Widgets',
//       description: 'Stateless and Stateful widgets and widget tree.',
//       codeSnippet: 'class MyWidget extends StatelessWidget {\n  @override\n  Widget build(BuildContext context) {\n    return Text("Hello");\n  }\n}',
//       youtubeId: 'WOvj84xq_fc',
//     ),
//     Topic(
//       id: 'layout',
//       title: 'Layout & UI',
//       description: 'Rows, Columns, Containers and basic layout widgets.',
//       codeSnippet: 'Row(\n  children: const [Text("A"), SizedBox(width: 8), Text("B")],\n)',
//       youtubeId: 'uisLoOmtISk',
//     ),
//     Topic(
//       id: 'navigation',
//       title: 'Navigation',
//       description: 'Moving between screens with Navigator.',
//       codeSnippet: 'Navigator.push(\n  context,\n  MaterialPageRoute(builder: (_) => SecondScreen()),\n);',
//       youtubeId: 'C6nTXjQFVKI',
//     ),
//     Topic(
//       id: 'state',
//       title: 'State Management (Basic)',
//       description: 'Using StatefulWidget and setState for local state.',
//       codeSnippet: 'class Counter extends StatefulWidget {\n  @override\n  State<Counter> createState() => _CounterState();\n}\n\nclass _CounterState extends State<Counter> {\n  int value = 0;\n  @override\n  Widget build(BuildContext context) {\n    return Column(\n      children: [\n        Text("\$value"),\n        ElevatedButton(\n          onPressed: () => setState(() => value++),\n          child: const Text("Increment"),\n        ),\n      ],\n    );\n  }\n}',
//       youtubeId: 'vU9xDLdEZtU',
//     ),
//   ];
//
//   final List<Map<String, String>> motivationalQuotes = [
//     {
//       'quote': 'The expert in anything was once a beginner.',
//       'author': 'Helen Hayes'
//     },
//     {
//       'quote': 'Learning is a treasure that will follow its owner everywhere.',
//       'author': 'Chinese Proverb'
//     },
//     {
//       'quote': 'Education is the passport to the future.',
//       'author': 'Malcolm X'
//     },
//     {
//       'quote': 'The beautiful thing about learning is that no one can take it away from you.',
//       'author': 'B.B. King'
//     },
//     {
//       'quote': 'Live as if you were to die tomorrow. Learn as if you were to live forever.',
//       'author': 'Mahatma Gandhi'
//     },
//     {
//       'quote': 'An investment in knowledge pays the best interest.',
//       'author': 'Benjamin Franklin'
//     },
//     {
//       'quote': 'The capacity to learn is a gift; the ability to learn is a skill; the willingness to learn is a choice.',
//       'author': 'Brian Herbert'
//     },
//     {
//       'quote': 'Study hard what interests you the most in the most undisciplined, irreverent and original manner possible.',
//       'author': 'Richard Feynman'
//     },
//   ];
//
//   late String currentQuote;
//   late String currentAuthor;
//
//   @override
//   void initState() {
//     super.initState();
//     _selectRandomQuote();
//   }
//
//   void _selectRandomQuote() {
//     final random = Random();
//     final selectedQuote = motivationalQuotes[random.nextInt(motivationalQuotes.length)];
//     currentQuote = selectedQuote['quote']!;
//     currentAuthor = selectedQuote['author']!;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final themeService = Provider.of<ThemeService>(context);
//     final isDark = themeService.themeMode == ThemeMode.dark;
//
//     return Scaffold(
//       backgroundColor: isDark ? Colors.grey[900] : Colors.grey[50],
//       appBar: AppBar(
//         elevation: 0,
//         flexibleSpace: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               colors: [Colors.blue[700]!, Colors.blue[500]!],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             ),
//           ),
//         ),
//         title: Row(
//           children: [
//             Container(
//               padding: const EdgeInsets.all(8),
//               decoration: BoxDecoration(
//                 color: Colors.white.withOpacity(0.2),
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Image.asset(
//                 'assets/images/Flutter.png',
//                 height: 40,
//                 width: 40,
//                 errorBuilder: (context, error, stackTrace) => const Icon(
//                   Icons.school,
//                   size: 40,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//             const SizedBox(width: 12),
//             const Expanded(
//               child: Text(
//                 'Flutter Learning',
//                 style: TextStyle(
//                   fontSize: 22,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           ],
//         ),
//         actions: [
//           IconButton(
//             icon: Icon(
//               isDark ? Icons.light_mode : Icons.dark_mode,
//               color: Colors.white,
//             ),
//             onPressed: themeService.toggleTheme,
//           ),
//         ],
//       ),
//       drawer: Drawer(
//         child: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               colors: isDark
//                   ? [Colors.grey[850]!, Colors.grey[900]!]
//                   : [Colors.white, Colors.blue[50]!],
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//             ),
//           ),
//           child: ListView(
//             padding: EdgeInsets.zero,
//             children: [
//               DrawerHeader(
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     colors: [Colors.blue[700]!, Colors.blue[500]!],
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomRight,
//                   ),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Container(
//                       padding: const EdgeInsets.all(12),
//                       decoration: BoxDecoration(
//                         color: Colors.white.withOpacity(0.2),
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: Image.asset(
//                         'assets/images/logo.png',
//                         height: 50,
//                         errorBuilder: (context, error, stackTrace) => const Icon(
//                           Icons.school,
//                           size: 50,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 12),
//                     const Text(
//                       'Flutter Learning App',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     const Text(
//                       'Learn Flutter Step by Step',
//                       style: TextStyle(
//                         color: Colors.white70,
//                         fontSize: 12,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               _buildDrawerItem(
//                 icon: Icons.home,
//                 title: 'Home',
//                 onTap: () => Navigator.pop(context),
//                 isDark: isDark,
//               ),
//               _buildDrawerItem(
//                 icon: Icons.menu_book,
//                 title: 'Learning Modules',
//                 onTap: () {
//                   Navigator.pop(context);
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (_) => LearningScreen(topics: topics)),
//                   );
//                 },
//                 isDark: isDark,
//               ),
//               _buildDrawerItem(
//                 icon: Icons.quiz,
//                 title: 'Quiz',
//                 onTap: () {
//                   Navigator.pop(context);
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (_) => QuizScreen()),
//                   );
//                 },
//                 isDark: isDark,
//               ),
//               _buildDrawerItem(
//                 icon: Icons.trending_up,
//                 title: 'Progress',
//                 onTap: () {
//                   Navigator.pop(context);
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (_) => const ProgressScreen()),
//                   );
//                 },
//                 isDark: isDark,
//               ),
//               _buildDrawerItem(
//                 icon: Icons.person,
//                 title: 'Profile',
//                 onTap: () {
//                   Navigator.pop(context);
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (_) => const ProfileScreen()),
//                   );
//                 },
//                 isDark: isDark,
//               ),
//             ],
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             // Welcome Banner
//             Container(
//               width: double.infinity,
//               margin: const EdgeInsets.all(16),
//               padding: const EdgeInsets.all(24),
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [Colors.purple[600]!, Colors.purple[400]!],
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                 ),
//                 borderRadius: BorderRadius.circular(20),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.purple.withOpacity(0.3),
//                     blurRadius: 15,
//                     offset: const Offset(0, 8),
//                   ),
//                 ],
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     children: [
//                       Container(
//                         padding: const EdgeInsets.all(12),
//                         decoration: BoxDecoration(
//                           color: Colors.white.withOpacity(0.2),
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         child: const Icon(
//                           Icons.waving_hand,
//                           color: Colors.white,
//                           size: 32,
//                         ),
//                       ),
//                       const SizedBox(width: 16),
//                       const Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               'Welcome Back!',
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 24,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             Text(
//                               'Ready to continue learning?',
//                               style: TextStyle(
//                                 color: Colors.white70,
//                                 fontSize: 14,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 16),
//                   Container(
//                     padding: const EdgeInsets.all(16),
//                     decoration: BoxDecoration(
//                       color: Colors.white.withOpacity(0.2),
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     child: const Row(
//                       children: [
//                         Icon(Icons.emoji_events, color: Colors.amber, size: 24),
//                         SizedBox(width: 12),
//                         Expanded(
//                           child: Text(
//                             'Keep up the great work! 🚀',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 16,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//
//             // Section Cards
//             LayoutBuilder(
//               builder: (context, constraints) {
//                 int crossAxisCount = 1;
//                 double childAspectRatio = 3.5;
//
//                 if (constraints.maxWidth > 900) {
//                   crossAxisCount = 4;
//                   childAspectRatio = 1.2;
//                 } else if (constraints.maxWidth > 600) {
//                   crossAxisCount = 2;
//                   childAspectRatio = 1.5;
//                 }
//
//                 return GridView.count(
//                   shrinkWrap: true,
//                   physics: const NeverScrollableScrollPhysics(),
//                   crossAxisCount: crossAxisCount,
//                   childAspectRatio: childAspectRatio,
//                   padding: const EdgeInsets.symmetric(horizontal: 16),
//                   crossAxisSpacing: 16,
//                   mainAxisSpacing: 16,
//                   children: [
//                     _buildSectionCard(
//                       context,
//                       title: 'Learning Modules',
//                       icon: Icons.menu_book,
//                       color: Colors.blue,
//                       onTap: () => Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (_) => LearningScreen(topics: topics)),
//                       ),
//                     ),
//                     _buildSectionCard(
//                       context,
//                       title: 'Quiz Section',
//                       icon: Icons.quiz,
//                       color: Colors.green,
//                       onTap: () => Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (_) => QuizScreen()),
//                       ),
//                     ),
//                     _buildSectionCard(
//                       context,
//                       title: 'Progress',
//                       icon: Icons.trending_up,
//                       color: Colors.orange,
//                       onTap: () => Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (_) => const ProgressScreen()),
//                       ),
//                     ),
//                     _buildSectionCard(
//                       context,
//                       title: 'Profile',
//                       icon: Icons.person,
//                       color: Colors.purple,
//                       onTap: () => Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (_) => const ProfileScreen()),
//                       ),
//                     ),
//                   ],
//                 );
//               },
//             ),
//
//             const SizedBox(height: 24),
//
//             // Motivational Quote Section
//             Container(
//               width: double.infinity,
//               margin: const EdgeInsets.all(16),
//               padding: const EdgeInsets.all(24),
//               decoration: BoxDecoration(
//                 color: isDark ? Colors.grey[800] : Colors.white,
//                 borderRadius: BorderRadius.circular(20),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey.withOpacity(0.2),
//                     blurRadius: 10,
//                     offset: const Offset(0, 5),
//                   ),
//                 ],
//               ),
//               child: Column(
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Container(
//                         padding: const EdgeInsets.all(8),
//                         decoration: BoxDecoration(
//                           color: Colors.amber[100],
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         child: Icon(
//                           Icons.format_quote,
//                           color: Colors.amber[700],
//                           size: 28,
//                         ),
//                       ),
//                       const SizedBox(width: 12),
//                       Text(
//                         'Daily Inspiration',
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                           color: isDark ? Colors.white : Colors.grey[800],
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 20),
//                   Text(
//                     '"$currentQuote"',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontStyle: FontStyle.italic,
//                       height: 1.5,
//                       color: isDark ? Colors.grey[300] : Colors.grey[700],
//                     ),
//                   ),
//                   const SizedBox(height: 16),
//                   Text(
//                     '— $currentAuthor',
//                     style: TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.blue[700],
//                     ),
//                   ),
//                   const SizedBox(height: 16),
//                   ElevatedButton.icon(
//                     onPressed: () {
//                       setState(() {
//                         _selectRandomQuote();
//                       });
//                     },
//                     icon: const Icon(Icons.refresh),
//                     label: const Text('New Quote'),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.amber[600],
//                       foregroundColor: Colors.white,
//                       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//
//             const SizedBox(height: 32),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildDrawerItem({
//     required IconData icon,
//     required String title,
//     required VoidCallback onTap,
//     required bool isDark,
//   }) {
//     return ListTile(
//       leading: Icon(icon, color: Colors.blue[700]),
//       title: Text(
//         title,
//         style: TextStyle(
//           fontWeight: FontWeight.w500,
//           color: isDark ? Colors.white : Colors.grey[800],
//         ),
//       ),
//       onTap: onTap,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12),
//       ),
//       contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
//     );
//   }
//
//   Widget _buildSectionCard(
//       BuildContext context, {
//         required String title,
//         required IconData icon,
//         required Color color,
//         required VoidCallback onTap,
//       }) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [color.withOpacity(0.8), color],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//           borderRadius: BorderRadius.circular(20),
//           boxShadow: [
//             BoxShadow(
//               color: color.withOpacity(0.3),
//               blurRadius: 10,
//               offset: const Offset(0, 5),
//             ),
//           ],
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(20),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 padding: const EdgeInsets.all(16),
//                 decoration: BoxDecoration(
//                   color: Colors.white.withOpacity(0.2),
//                   shape: BoxShape.circle,
//                 ),
//                 child: Icon(
//                   icon,
//                   color: Colors.white,
//                   size: 36,
//                 ),
//               ),
//               const SizedBox(height: 16),
//               Text(
//                 title,
//                 textAlign: TextAlign.center,
//                 style: const TextStyle(
//                   color: Colors.white,
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 8),
//               Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
//                 decoration: BoxDecoration(
//                   color: Colors.white.withOpacity(0.2),
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: const Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Text(
//                       'Explore',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 12,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                     SizedBox(width: 4),
//                     Icon(Icons.arrow_forward, color: Colors.white, size: 12),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


// lib/screens/home/home_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../services/theme_service.dart';
import '../../models/topic_model.dart';
import '../learning/learning_screen.dart';
import '../quiz/quiz_screen.dart';
import '../progress/progress_screen.dart';
import '../profile/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static final List<Topic> topics = [
    Topic(
      id: 'intro',
      title: 'Introduction to Flutter',
      description: 'Overview of Flutter framework, its purpose, and where it is used.',
      codeSnippet: 'void main() => runApp(MyApp());',
      youtubeId: 'uvSrRBHtio8',
    ),
    Topic(
      id: 'dart',
      title: 'Dart Basics',
      description: 'Variables, functions, and control flow in Dart.',
      codeSnippet: 'void main() {\n  print("Hello Dart");\n}',
      youtubeId: 'NrO0CJCbYLA',
    ),
    Topic(
      id: 'widgets',
      title: 'Flutter Widgets',
      description: 'Stateless and Stateful widgets and widget tree.',
      codeSnippet: 'class MyWidget extends StatelessWidget {\n  @override\n  Widget build(BuildContext context) {\n    return Text("Hello");\n  }\n}',
      youtubeId: 'WOvj84xq_fc',
    ),
    Topic(
      id: 'layout',
      title: 'Layout & UI',
      description: 'Rows, Columns, Containers and basic layout widgets.',
      codeSnippet: 'Row(\n  children: const [Text("A"), SizedBox(width: 8), Text("B")],\n)',
      youtubeId: 'uisLoOmtISk',
    ),
    Topic(
      id: 'navigation',
      title: 'Navigation',
      description: 'Moving between screens with Navigator.',
      codeSnippet: 'Navigator.push(\n  context,\n  MaterialPageRoute(builder: (_) => SecondScreen()),\n);',
      youtubeId: 'C6nTXjQFVKI',
    ),
    Topic(
      id: 'state',
      title: 'State Management (Basic)',
      description: 'Using StatefulWidget and setState for local state.',
      codeSnippet: 'class Counter extends StatefulWidget {\n  @override\n  State<Counter> createState() => _CounterState();\n}\n\nclass _CounterState extends State<Counter> {\n  int value = 0;\n  @override\n  Widget build(BuildContext context) {\n    return Column(\n      children: [\n        Text("\$value"),\n        ElevatedButton(\n          onPressed: () => setState(() => value++),\n          child: const Text("Increment"),\n        ),\n      ],\n    );\n  }\n}',
      youtubeId: 'vU9xDLdEZtU',
    ),
  ];

  final List<Map<String, String>> motivationalQuotes = [
    {'quote': 'The expert in anything was once a beginner.', 'author': 'Helen Hayes'},
    {'quote': 'Learning is a treasure that will follow its owner everywhere.', 'author': 'Chinese Proverb'},
    {'quote': 'Education is the passport to the future.', 'author': 'Malcolm X'},
    {'quote': 'The beautiful thing about learning is that no one can take it away from you.', 'author': 'B.B. King'},
    {'quote': 'Live as if you were to die tomorrow. Learn as if you were to live forever.', 'author': 'Mahatma Gandhi'},
    {'quote': 'An investment in knowledge pays the best interest.', 'author': 'Benjamin Franklin'},
    {
      'quote': 'The capacity to learn is a gift; the ability to learn is a skill; the willingness to learn is a choice.',
      'author': 'Brian Herbert'
    },
    {
      'quote': 'Study hard what interests you the most in the most undisciplined, irreverent and original manner possible.',
      'author': 'Richard Feynman'
    },
  ];

  late String currentQuote;
  late String currentAuthor;

  // Weather variables
  String? _temperature;
  String? _weatherDescription;
  String? _weatherIcon;
  bool _isLoadingWeather = true;

  final String _apiKey = 'cc95beb5f905ea64c46addc2b5067705';
  final String _city = 'Islamabad';

  @override
  void initState() {
    super.initState();
    _selectRandomQuote();
    _fetchWeather();
  }

  void _selectRandomQuote() {
    final random = Random();
    final selectedQuote = motivationalQuotes[random.nextInt(motivationalQuotes.length)];
    setState(() {
      currentQuote = selectedQuote['quote']!;
      currentAuthor = selectedQuote['author']!;
    });
  }

  Future<void> _fetchWeather() async {
    try {
      final url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$_city&appid=$_apiKey&units=metric',
      );

      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        setState(() {
          _temperature = data['main']['temp'].toStringAsFixed(1);
          _weatherDescription = data['weather'][0]['description'];
          _weatherIcon = data['weather'][0]['icon'];
          _isLoadingWeather = false;
        });
      } else {
        setState(() {
          _temperature = 'Error';
          _weatherDescription = 'Failed to load';
          _isLoadingWeather = false;
        });
      }
    } catch (e) {
      setState(() {
        _temperature = 'Error';
        _weatherDescription = 'No connection';
        _isLoadingWeather = false;
      });
    }
  }

  String _getWeatherEmoji() {
    if (_weatherIcon == null) return '🌤️';
    final icon = _weatherIcon!;

    // Day icons
    if (icon.contains('d')) {
      if (icon.startsWith('01')) return '☀️';
      if (icon.startsWith('02')) return '🌤️';
      if (icon.startsWith('03') || icon.startsWith('04')) return '☁️';
      if (icon.startsWith('09') || icon.startsWith('10')) return '🌧️';
      if (icon.startsWith('11')) return '⛈️';
      if (icon.startsWith('13')) return '❄️';
      return '🌫️';
    }
    // Night icons
    else {
      if (icon.startsWith('01')) return '🌙';
      if (icon.startsWith('02')) return '🌙☁️';
      return '☁️';
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeService = Provider.of<ThemeService>(context);
    final isDark = themeService.themeMode == ThemeMode.dark;

    return Scaffold(
      backgroundColor: isDark ? Colors.grey[900] : Colors.grey[50],
      appBar: AppBar(
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue[700]!, Colors.blue[500]!],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Image.asset(
                'assets/images/Flutter.png',
                height: 40,
                width: 40,
                errorBuilder: (context, error, stackTrace) => const Icon(
                  Icons.school,
                  size: 40,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(width: 12),
            const Expanded(
              child: Text(
                'Flutter Learning',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        actions: [
          // Weather display
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (_isLoadingWeather)
                  const SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.5,
                      color: Colors.white70,
                    ),
                  )
                else ...[
                  Text(
                    _getWeatherEmoji(),
                    style: const TextStyle(fontSize: 26),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    _temperature != null ? '$_temperature°' : '--°',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
                const SizedBox(width: 12),
              ],
            ),
          ),

          IconButton(
            icon: Icon(
              isDark ? Icons.light_mode : Icons.dark_mode,
              color: Colors.white,
            ),
            onPressed: themeService.toggleTheme,
          ),
        ],
      ),

      // The rest of your original code remains unchanged
      drawer: Drawer(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: isDark
                  ? [Colors.grey[850]!, Colors.grey[900]!]
                  : [Colors.white, Colors.blue[50]!],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blue[700]!, Colors.blue[500]!],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Image.asset(
                        'assets/images/logo.png',
                        height: 50,
                        errorBuilder: (context, error, stackTrace) => const Icon(
                          Icons.school,
                          size: 50,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Flutter Learning App',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      'Learn Flutter Step by Step',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              _buildDrawerItem(
                icon: Icons.home,
                title: 'Home',
                onTap: () => Navigator.pop(context),
                isDark: isDark,
              ),
              _buildDrawerItem(
                icon: Icons.menu_book,
                title: 'Learning Modules',
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => LearningScreen(topics: topics)),
                  );
                },
                isDark: isDark,
              ),
              _buildDrawerItem(
                icon: Icons.quiz,
                title: 'Quiz',
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => QuizScreen()),
                  );
                },
                isDark: isDark,
              ),
              _buildDrawerItem(
                icon: Icons.trending_up,
                title: 'Progress',
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const ProgressScreen()),
                  );
                },
                isDark: isDark,
              ),
              _buildDrawerItem(
                icon: Icons.person,
                title: 'Profile',
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const ProfileScreen()),
                  );
                },
                isDark: isDark,
              ),
            ],
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            // Welcome Banner
            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.purple[600]!, Colors.purple[400]!],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.purple.withOpacity(0.3),
                    blurRadius: 15,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Icons.waving_hand,
                          color: Colors.white,
                          size: 32,
                        ),
                      ),
                      const SizedBox(width: 16),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Welcome Back!',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Ready to continue learning?',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.emoji_events, color: Colors.amber, size: 24),
                        SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            'Keep up the great work! 🚀',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Section Cards
            LayoutBuilder(
              builder: (context, constraints) {
                int crossAxisCount = 1;
                double childAspectRatio = 3.5;

                if (constraints.maxWidth > 900) {
                  crossAxisCount = 4;
                  childAspectRatio = 1.2;
                } else if (constraints.maxWidth > 600) {
                  crossAxisCount = 2;
                  childAspectRatio = 1.5;
                }

                return GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: crossAxisCount,
                  childAspectRatio: childAspectRatio,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  children: [
                    _buildSectionCard(
                      context,
                      title: 'Learning Modules',
                      icon: Icons.menu_book,
                      color: Colors.blue,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => LearningScreen(topics: topics)),
                      ),
                    ),
                    _buildSectionCard(
                      context,
                      title: 'Quiz Section',
                      icon: Icons.quiz,
                      color: Colors.green,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => QuizScreen()),
                      ),
                    ),
                    _buildSectionCard(
                      context,
                      title: 'Progress',
                      icon: Icons.trending_up,
                      color: Colors.orange,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const ProgressScreen()),
                      ),
                    ),
                    _buildSectionCard(
                      context,
                      title: 'Profile',
                      icon: Icons.person,
                      color: Colors.purple,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const ProfileScreen()),
                      ),
                    ),
                  ],
                );
              },
            ),

            const SizedBox(height: 24),

            // Motivational Quote Section
            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: isDark ? Colors.grey[800] : Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.amber[100],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          Icons.format_quote,
                          color: Colors.amber[700],
                          size: 28,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        'Daily Inspiration',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: isDark ? Colors.white : Colors.grey[800],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    '"$currentQuote"',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                      height: 1.5,
                      color: isDark ? Colors.grey[300] : Colors.grey[700],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    '— $currentAuthor',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.blue[700],
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        _selectRandomQuote();
                      });
                    },
                    icon: const Icon(Icons.refresh),
                    label: const Text('New Quote'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber[600],
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    required bool isDark,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue[700]),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          color: isDark ? Colors.white : Colors.grey[800],
        ),
      ),
      onTap: onTap,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
    );
  }

  Widget _buildSectionCard(
      BuildContext context, {
        required String title,
        required IconData icon,
        required Color color,
        required VoidCallback onTap,
      }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(0.8), color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 36,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Explore',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 4),
                    Icon(Icons.arrow_forward, color: Colors.white, size: 12),
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