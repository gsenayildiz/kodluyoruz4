import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: KisilikAnketi(), debugShowCheckedModeBanner: false));
}

class KisilikAnketi extends StatefulWidget {
  @override
  _KisilikAnketiState createState() => _KisilikAnketiState();
}

class _KisilikAnketiState extends State<KisilikAnketi> {
  final TextEditingController _adSoyadController = TextEditingController();
  String? _cinsiyet;
  bool _resitMi = false;
  bool _sigaraKullaniyorMu = false;
  double _sigaraSayisi = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Center(child: Text("Kişilik Anketi")),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Ad Soyad
              TextField(
                controller: _adSoyadController,
                decoration: InputDecoration(
                  labelText: "Adınız ve soyadınız",
                  border: UnderlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),

              // Cinsiyet Dropdown
              DropdownButtonFormField<String>(
                value: _cinsiyet,
                decoration: InputDecoration(
                  labelText: "Cinsiyetinizi Seçiniz",
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
                items: ["Kadın", "Erkek", "Diğer"]
                    .map(
                      (cins) =>
                          DropdownMenuItem(value: cins, child: Text(cins)),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _cinsiyet = value;
                  });
                },
              ),
              SizedBox(height: 20),

              // Reşit misiniz? Checkbox
              Row(
                children: [
                  Expanded(child: Text("Reşit misiniz?")),
                  Checkbox(
                    value: _resitMi,
                    onChanged: (val) {
                      setState(() {
                        _resitMi = val!;
                      });
                    },
                    activeColor: Colors.orange,
                  ),
                ],
              ),
              SizedBox(height: 10),

              // Sigara Switch
              Row(
                children: [
                  Expanded(child: Text("Sigara kullanıyor musunuz?")),
                  Switch(
                    value: _sigaraKullaniyorMu,
                    onChanged: (val) {
                      setState(() {
                        _sigaraKullaniyorMu = val;
                      });
                    },
                    activeColor: Colors.green,
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Slider
              Text("Günde kaç tane sigara kullanıyorsunuz?"),
              Slider(
                value: _sigaraSayisi,
                min: 0,
                max: 40,
                divisions: 40,
                label: _sigaraSayisi.round().toString(),
                activeColor: Colors.orange,
                onChanged: (val) {
                  setState(() {
                    _sigaraSayisi = val;
                  });
                },
              ),
              SizedBox(height: 30),

              // Gönder Butonu
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: EdgeInsets.symmetric(vertical: 15),
                  ),
                  onPressed: () {
                    String mesaj =
                        "Ad Soyad: ${_adSoyadController.text}\nCinsiyet: $_cinsiyet\nReşit mi: $_resitMi\nSigara Kullanıyor mu: $_sigaraKullaniyorMu\nGünde Sigara: ${_sigaraSayisi.round()}";
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(mesaj)));
                  },
                  child: Text(
                    "Bilgileri gönder",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
