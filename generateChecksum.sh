#!/bin/bash

# Periksa apakah folder 2023 ada
if [ ! -d "2024" ]; then
  echo "Folder 2023 tidak ditemukan."
  exit 1
fi

# Buat file checksum.txt
touch checksum.txt

# Loop melalui semua file ZIP di folder 2023
for file in 2024/*.zip; do
  # Hitung SHA1 checksum dan tambahkan ke file checksum.txt
  sha1sum "$file" >> checksum.txt
done

echo "Proses selesai. Hasil checksum disimpan di checksum.txt"
