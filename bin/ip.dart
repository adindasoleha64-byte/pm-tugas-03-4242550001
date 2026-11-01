import 'dart:io';

void main() {
  print(bobot('b'));
  try {
    print(bobot('Z'));
  } on FormatException catch (e) {
    print('Peringatan: ${e.message}');

    print(validasiSks('6'));
    try {
      print(validasiSks('9'));
    } on FormatException catch (e) {
      print('Peringatan: ${e.message}');
    }
  }
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
