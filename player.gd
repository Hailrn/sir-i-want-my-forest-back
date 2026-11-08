extends CharacterBody2D

# --- KONFIGURASI KECEPATAN ---
@export var walk_speed: float = 150.0
@export var sprint_speed: float = 250.0
@export var aim_penalty_multiplier: float = 0.5 # Penalti kecepatan saat nge-aim pakai mouse

# Referensi ke node Senter (PointLight2D)
@onready var flashlight: PointLight2D = $PointLight2D

func _physics_process(delta: float) -> void:
	# 1. Ambil Input Pergerakan 8 Arah
	# Ini otomatis menangani normalisasi diagonal (biar gak lebih cepat saat serong)
	var input_dir := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	# 2. Cek State (Kondisi)
	# Cek apakah nahan Shift DAN sedang bergerak
	var is_sprinting := Input.is_action_pressed("sprint") and input_dir != Vector2.ZERO
	
	# Cek apakah nahan Klik Kanan Mouse
	var is_aiming := Input.is_action_pressed("aim_flashlight")
	
	# 3. Hitung Kecepatan Akhir
	var current_speed := sprint_speed if is_sprinting else walk_speed
	
	# Kalau sedang aim pakai mouse, kecepatan dipotong (x0.5)
	if is_aiming:
		current_speed *= aim_penalty_multiplier
		
	# 4. Terapkan Movement ke Karakter
	velocity = input_dir * current_speed
	move_and_slide()
	
	# 5. Panggil fungsi Update Senter
	_update_flashlight(input_dir, is_aiming)


func _update_flashlight(input_dir: Vector2, is_aiming: bool) -> void:
	if is_aiming:
		# --- MODE 2: Senter Ikut Mouse ---
		var mouse_pos = get_global_mouse_position()
		# Gunakan look_at agar senter menghadap posisi mouse
		flashlight.look_at(mouse_pos)
	else:
		# --- MODE 1: Senter Ikut Arah Gerak ---
		# Hanya rotasi jika pemain sedang bergerak (biar senter gak aneh pas diem)
		if input_dir != Vector2.ZERO:
			# .angle() mengubah vektor arah (x,y) menjadi derajat rotasi
			flashlight.rotation = input_dir.angle()
