import 'dart:io';

String baca(String label) {
  stdout.write('$label : ');
  return (stdin.readLineSync() ?? '').trim();
}

void main() {
  final List<({String nama, int sks, String huruf, int bobot})> data = [];

  print('Masukkan data mata kuliah. Kosongkan nama untuk selesai.');
  while (true) {
    final String nama = baca('Nama MK');
    if (nama.isEmpty) break;

    try {
      final int sks = validasiSks(baca('SKS'));
      final String huruf = baca('Nilai').toUpperCase();
      data.add((nama: nama, sks: sks, huruf: huruf, bobot: bobot(huruf)));
    } on FormatException catch (e) {
      print('Data diabaikan: ${e.message}');
    }
  }

  print('Data diterima: ${data.length}');
}

int bobot(String huruf) {
  return switch (huruf.trim().toUpperCase()) {
    'A' => 4,
    'B' => 3,
    'C' => 2,
    'D' => 1,
    'E' => 0,
    _ => throw FormatException('Nilai "$huruf" tidak valid, gunakan A-E.'),
  };
}

int validasiSks(String teks) {
  final int? sks = int.tryParse(teks.trim());

  if (sks == null) {
    throw FormatException('SKS harus berupa angka 1-6, bukan "$teks".');
  }
  if (sks < 1 || sks > 6) {
    throw FormatException('SKS harus berupa angka 1-6');
  }
  return sks;
}
