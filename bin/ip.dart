import 'dart:io';

void main() {
  print(bobot('b'));
  try {
    print(bobot('Z'));
  } on FormatException catch (e) {
    print('Peringatan: ${e.message}');
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