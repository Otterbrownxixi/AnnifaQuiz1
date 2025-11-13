import 'package:flutter/material.dart';

class Quiz1Page extends StatelessWidget {
  const Quiz1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Produk'),
        backgroundColor: Colors.blue.shade100,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 kolom
            crossAxisSpacing: 10.0, // Jarak antar kolom
            mainAxisSpacing: 10.0, // Jarak antar baris
            childAspectRatio: 0.75, // Menjaga proporsi rapi untuk gambar
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return _ProductCard(
              imagePath: product['imagePath']!,
              name: product['name']!,
              price: product['price']!,
            );
          },
        ),
      ),
    );
  }
}

class _ProductCard extends StatefulWidget {
  final String imagePath;
  final String name;
  final String price;

  const _ProductCard({
    required this.imagePath,
    required this.name,
    required this.price,
  });

  @override
  State<_ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<_ProductCard> {
  bool _isHovered = false; // Menyimpan status hover

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() {
        _isHovered = true; // Ketika mouse masuk
      }),
      onExit: (_) => setState(() {
        _isHovered = false; // Ketika mouse keluar
      }),
      child: Card(
        elevation: _isHovered ? 10.0 : 5.0, // Efek bayangan berubah saat hover
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: _isHovered
            ? Colors.blue.shade50
            : Colors.white, // Warna berubah saat hover
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Menampilkan gambar produk
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                widget.imagePath,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            // Menampilkan nama produk dengan teks center
            Center(
              child: Text(
                widget.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 4),
            // Menampilkan harga produk dengan teks center
            Center(
              child: Text(
                widget.price,
                style: const TextStyle(color: Colors.green, fontSize: 14),
              ),
            ),

            const SizedBox(height: 6),
            TextButton(
              onPressed: () {
                // Aksi ketika tombol ditekan
                print('TextButton pressed');
              },
              style: TextButton.styleFrom(
                backgroundColor:
                    Colors.transparent, // Warna latar belakang default
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5), // Kelengkungan 20%
                ),
              ),
              child: const Text(
                'Beli Sekarang',
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.bold, // Warna teks default
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final List<Map<String, String>> products = [
  {
    'name': 'Semangka',
    'price': 'Rp 100.000',
    'imagePath': 'assets/images/semangka.png',
  },
  {
    'name': 'Melon',
    'price': 'Rp 150.000',
    'imagePath': 'assets/images/melon.png',
  },
  {
    'name': 'Wortel',
    'price': 'Rp 200.000',
    'imagePath': 'assets/images/wortel.png',
  },
  {
    'name': 'Kentang',
    'price': 'Rp 250.000',
    'imagePath': 'assets/images/kentang.png',
  },
  {
    'name': 'Timun',
    'price': 'Rp 300.000',
    'imagePath': 'assets/images/timun.png',
  },
  {
    'name': 'Paprika',
    'price': 'Rp 100.000',
    'imagePath': 'assets/images/paprika.png',
  },
  {
    'name': 'Selada',
    'price': 'Rp 150.000',
    'imagePath': 'assets/images/selada.png',
  },
  {
    'name': 'Nanas',
    'price': 'Rp 200.000',
    'imagePath': 'assets/images/nanas.png',
  },
  {
    'name': 'Tomat',
    'price': 'Rp 250.000',
    'imagePath': 'assets/images/tomat.png',
  },
  {
    'name': 'Stroberi',
    'price': 'Rp 300.000',
    'imagePath': 'assets/images/stroberi.png',
  },
];
