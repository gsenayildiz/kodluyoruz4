import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final String name;
  final String? gender;
  final bool isAdult;
  final bool smokes;
  final int cigarettesPerDay;

  const ResultPage({
    super.key,
    required this.name,
    required this.gender,
    required this.isAdult,
    required this.smokes,
    required this.cigarettesPerDay,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sonuçlar"),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Ad Soyad: $name", style: const TextStyle(fontSize: 18)),
                const SizedBox(height: 10),
                Text(
                  "Cinsiyet: ${gender ?? "Belirtilmedi"}",
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 10),
                Text(
                  "Reşit mi?: ${isAdult ? "Evet" : "Hayır"}",
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 10),
                Text(
                  "Sigara Kullanıyor mu?: ${smokes ? "Evet" : "Hayır"}",
                  style: const TextStyle(fontSize: 18),
                ),
                if (smokes) ...[
                  const SizedBox(height: 10),
                  Text(
                    "Günde: $cigarettesPerDay sigara",
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
