# DEVLOG & PROJECT TRACKER: Sir, I Want My Forest Back!

## 1. KONTEKS GAME (GDD SUMMARY)
*   **Judul Game:** Sir, I Want My Forest Back!
*   **Genre:** 2D Top-Down Survival, Horror, Environmental
*   **Platform:** Desktop (PC)
*   **Target Audience:** Umur 15+, penyuka game horror
*   **Tim Pengembang:** GddWoi?! (Fahmi, Perkasa, Wildan, Rafi, Damar)
*   **Role Developer (Kamu):** Engine Setup, Core Logic/Math, Movement Dasar.

### A. High Concept & USP
*   **Ringkasan:** Pemain adalah penjaga hutan yang harus menebang kebun sawit ilegal dan menanam kembali hutan sebelum malam menelan kewarasannya. Hantu penghuni hutan yang kehilangan rumah akan mengganggu.
*   **USP:**
	1. Horor bertema lingkungan (reboisasi, bukan sekadar membunuh hantu).
	2. "Kewarasan" sebagai timer atmosferik.
	3. Hantu mitologi lokal (Kuntilanak, Pocong, Genderuwo, dll).
	4. Manajemen resource (Energi, Stamina, Kenyang, Kewarasan) dengan *trade-off*.

### B. Mekanik & Kesepakatan Desain (Hasil Interview)
*   **Movement:** 8 Arah.
*   **Atribut:**
	*   **Energi:** Bahan bakar untuk bekerja (Tebang/Tanam).
	*   **Stamina:** Khusus untuk sprint/berlari.
	*   **Kenyang:** Regenerasi Energi. Naik instan saat makan.
	*   **Kewarasan:** Turun perlahan, memicu Game Over jika 0.
*   **Interaksi (Nebang/Tanam):** Tahan tombol `E` sambil **berdiri diam**. Progress bar berjalan. Jika lepas tombol/energi habis, progress bar berhenti di tempat (bisa dilanjutkan).
*   **Sistem Senter (2 Mode):**
	*   *Mode 1:* Mengikuti arah gerak (tanpa penalti).
	*   *Mode 2:* Mengikuti kursor mouse (tahan Klik Kanan), dikenakan penalti kecepatan (speed x0.5) agar tidak *kiting*.
*   **Area Terang:** Menggunakan *Trigger Area* (Area2D). Kewarasan berhenti turun jika berada di dalam area ini.
*   **Inventory:** 3 Slot (Senter, Makanan, Benih). Ganti slot pakai angka `1, 2, 3`.
*   **Hantu:** Ada yang mundur langsung, ada yang butuh disenteri dalam durasi tertentu. Wajib ada *warning* (audio/visual) sebelum menyerang.
*   **Mini Event:** Menggunakan sistem QTE (klik/tahan tombol saat ada indikator).

### C. Scope Pengerjaan Saat Ini
*   **FOKUS: LEVEL 1 (Vertical Slice)**.
*   Target: 5 Tebang, 5 Tanam. Hantu lemah, kewarasan turun lambat, banyak lampu.

---

## 2. ROADMAP & TASK LIST (Role: Developer)

### SPRINT 1: Fondasi & Setup Awal
- [X] Install Godot 4 & buat Project baru.
- [X] Setup Input Map di Project Settings (`move_up/down/left/right`, `sprint`, `interact`, `aim_flashlight`, `slot_1/2/3`).
- [X] Bikin Scene `Player` (`CharacterBody2D` + `Sprite2D` + `CollisionShape2D` + `PointLight2D`).
- [X] Bikin Scene `Pohon Sawit` (`StaticBody2D` + `Area2D` untuk deteksi player).
- **Catatan Progress/Masalah Sprint 1:**
  *(Sukses bikin scene, belum ada kodingan, senter masih bentuk lingkaran)*

### SPRINT 2: Pergerakan (Movement) & Senter
- [ ] Koding Movement 8 arah (`Input.get_vector`).
- [ ] Koding Sprint (Mengurangi Stamina).
- [ ] Koding Senter Mode 1 (Ikut arah gerak).
- [ ] Koding Senter Mode 2 (Ikut Mouse + Penalti Speed).
- **Catatan Progress/Masalah Sprint 2:**
  *(Tulis di sini jika ada error atau yang perlu diubah)*

### SPRINT 3: Sistem Atribut & Rumus (Core Logic)
- [ ] Bikin Script `PlayerStats.gd` (Energi, Stamina, Kenyang, Kewarasan).
- [ ] Implementasi Rumus Regen Energi: `10 * ((kenyang - 20) / 80)`.
- [ ] Logika Penalti Kenyang = 0 (Regen berhenti, Kewarasan turun x1.5).
- [ ] Koding Night Cycle (Timer Fase 1, 2, 3).
- **Catatan Progress/Masalah Sprint 3:**
  *(Tulis di sini jika ada error atau yang perlu diubah)*

### SPRINT 4: Sistem Interaksi (Nebang & Nanam)
- [ ] Deteksi jika player di dekat pohon/lahan (munculkan UI Prompt).
- [ ] Logika Tahan `E`: Kunci movement, jalankan Progress Bar (Tebang 8 dtk, Tanam 4 dtk).
- [ ] Logika Berhenti: Jika lepas `E` / Energi habis, Progress Bar pause.
- [ ] Logika Selesai: Hapus pohon / Tambah target di UI.
- **Catatan Progress/Masalah Sprint 4:**
  *(Tulis di sini jika ada error atau yang perlu diubah)*

### SPRINT 5: UI / HUD Sederhana
- [ ] Setup `CanvasLayer` untuk UI.
- [ ] Bikin 4 Bar (Energi, Stamina, Kewarasan, Kenyang).
- [ ] Bikin Text Target ("Tebang: 0/5", "Tanam: 0/5").
- [ ] Bikin indikator Fase Malam.
- **Catatan Progress/Masalah Sprint 5:**
  *(Tulis di sini jika ada error atau yang perlu diubah)*

### SPRINT 6: Area Terang & Hantu Dasar (Kuntilanak)
- [ ] Bikin `Area2D` di bawah lampu/pondok (Zona Aman).
- [ ] Bikin AI Kuntilanak (Patroli bolak-balik).
- [ ] Logika Deteksi Senter (Hantu mundur jika kena light/Area2D senter).
- **Catatan Progress/Masalah Sprint 6:**
  *(Tulis di sini jika ada error atau yang perlu diubah)*

---

## 3. PERTANYAAN TERBUKA (TANYAKAN KE KELOMPOK)
1. **Animasi Game Over:** Mau pakai animasi apa? Atau langsung *cut* ke layar Game Over?
2. **Mini Event Boss (Penunggu Hutan - Level 3):** Mekaniknya mau seperti apa? Apakah seperti QTE beruntun (God of War style)? Atau kejar-kejaran sambil menghindari rintangan? *(Karena ini masih level 1, bisa ditunda dulu, tapi wajib ditanyakan).*
