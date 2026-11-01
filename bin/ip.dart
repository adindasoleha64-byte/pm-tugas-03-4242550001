import 'dart:io';

typedef MataKuliah = ({String nama, int sks, String huruf, int bobot});

String baca(String label) {
  stdout.write('$label : ');
  return (stdin.readLineSync() ?? '').trim();
}

void main() {
  final List<MataKuliah> data = [];

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

  if (data.isEmpty) {
    print('Belum ada data yang valid.');
    return;
  }

  final double ip = hitungIp(data);
  print('IP : ${ip.toStringAsFixed(2)}');

  final perluDiperbaiki = data.where((m) => m.bobot < 2).toList();
  print('Perlu diperbaiki: ${perluDiperbaiki.map((m) => m.nama).join(', ')}');

  print('Data diterima: ${data.length}');
}

double hitungIp(List<MataKuliah> data) {
  final int totalSks = data.fold<int>(0, (sum, m) => sum + m.sks);
  final int totalPoin = data.fold<int>(0, (sum, m) => sum + m.bobot * m.sks);
  return totalPoin / totalSks;
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
