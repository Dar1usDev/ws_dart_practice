import 'package:flutter/material.dart';

/// Тут должны были быть рецепты
class CookingPage extends StatefulWidget {
  const CookingPage({Key? key}) : super(key: key);

  @override
  State<CookingPage> createState() => _CookingPageState();
}

class _CookingPageState extends State<CookingPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Не успел но хотя бы bottomNavigationBar глянул('),
    );
  }
}
