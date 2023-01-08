.MODEL SMALL
.CODE

ORG 100h

JMP Mulai

;Variabel
nama    DB 0dh, 0ah, 0dh, 0ah, "Masukan Nama : ", '$'
id      DB 0dh, 0ah, "Masukan ID Anda : ", '$'
psn1    DB "PROGRAM NOMOR ANTREAN SEDERHANA", 0dh, 0ah, "----------------------------", '$' 
psn2    DB 0dh, 0dh, 0dh, 0ah, 0dh, 0ah, "Selamat Datang Di Toko Dewi Skincare....", '$' 
psn3    DB 0dh, 0dh, 0dh, 0ah, 0dh, 0ah, "Produk Yang Ingin Anda Beli ", 0dh, 0ah 
        DB "=========================", 0dh, 0ah
        DB "RUMAH SAKIT PELITA BANGSA", 0dh, 0ah
        DB "=========================", 0dh, 0ah
        DB "=   1. RAWAT JALAN      =", 0dh, 0ah
        DB "=   2. LAYANAN OPNAME   =", 0dh, 0ah
        DB "=   3. KONSULTASI       =", 0dh, 0ah
        DB "=   4. LAYANAN FARMASI  =", 0dh, 0ah
        DB "=========================", 0dh, 0ah
        DB 0dh, 0ah, "lAYANAN YANG ANDA PILIH ", '$'

psn4    DB 0dh, 0ah, "LAYANAN ANDA TERKONFIRMASI...", '$'
psn5    DB 0dh, 0dh, 0dh, 0ah, 0dh, 0ah, "========================= PENDAFTARAN SELESAI =====================", 0dh, 0ah
        DB "Silahkan Mengantri pada nomor loket yang tertera", 0dh, 0ah, "Membawa Bukti Pendaftaran", '$'

psn6    DB 0dh, 0dh, 0dh, 0ah, 0dh, 0ah, "Ingin Mendaftar Layanan Lain ? (Y, N)", '$'
psn7    DB 0dh, 0dh, 0dh, 0ah, 0dh, 0ah, "Terimakasih Telah Menggunkan Aplikasi Ini..", '$'
error   DB 0dh, 0ah, "Masukan Kode Dengan Benar", '$'
msg1    DB 0dh, 0ah, 0dh, 0ah, "====== RAWAT JALAN ======", 0dh, 0ah, "PENDAFTARAN YANG DIPILIH", 0dh, 0ah, "TIDAK DAPAT DIBATALKAN" , '$'
msg2    DB 0dh, 0ah, 0dh, 0ah, "====== LAYANAN OPNAME ======", 0dh, 0ah, "PENDAFTARAN YANG DIPILIH", 0dh, 0ah, " TIDAK DAPAT DIBATALKAN" , '$'
msg3    DB 0dh, 0ah, 0dh, 0ah, "====== KONSUKTASI ======", 0dh, 0ah, "PENDAFTARAN YANG DIPILIH", 0dh, 0ah, " TIDAK DAPAT DIBATALKAN" , '$'
msg4    DB 0dh, 0ah, 0dh, 0ah, "====== LAYANAN FARMASI ======", 0dh, 0ah, "PENDAFTARAN YANG DIPILIH", 0dh, 0ah, " TIDAK DAPAT DIBATALKAN" , '$'
msg5    DB 0dh, 0ah, 0dh, 0ah, "Ketik 'E' Untuk Mencetak Bukti dan Keluar dari program.... ", '$'

tampung_nama DB 30, ?, 30 dup(?)
tampung_id DB 30, ?, 30 dup(?)
        
        
Mulai:
    MOV ah, 09
    LEA dx, psn1
    INT 21h
    
    MOV ah, 09
    LEA dx, nama
    INT 21h
    
    MOV ah, 0ah
    LEA dx, tampung_nama
    INT 21h
    PUSH dx
    
    MOV ah, 09
    LEA dx, id
    INT 21h
    
    MOV ah, 0ah
    LEA dx, tampung_id
    INT 21h
    PUSH dx
    
    MOV ah, 09
    LEA dx, psn2
    INT 21h
    
Mulai2:
    MOV ah, 09
    LEA dx, psn3
    INT 21h
    
Proses:
    MOV ah, 01
    INT 21h
    
    CMP al, '1'
    JE layanan_1
    
    CMP al, '2'
    JE layanan_2
    
    CMP al, '3'
    JE layanan_3
    
    CMP al, '4'
    JE layanan_4
    
    JNE psn_error
    
Proses2:
    MOV ah, 09
    LEA dx, psn6
    INT 21h
    MOV ah, 01
    INT 21h
    
    CMP al, 'Y'
    JE daftar_lagi
    
    CMP al, 'y'
    JE daftar_lagi
    
    CMP al, 'N'
    JE daftar_selesai
    
    CMP al, 'n'
    JE daftar_selesai
    
    JNE psn_error2

layanan_1:
     MOV ah, 09
     LEA dx, psn4
     INT 21h
     
     MOV ah, 09
     LEA dx, msg1
     INT 21h   
     
     JMP Proses2
     
layanan_2:
     MOV ah, 09
     LEA dx, psn4
     INT 21h
     
     MOV ah, 09
     LEA dx, msg2
     INT 21h   
     
     JMP Proses2

layanan_3:
     MOV ah, 09
     LEA dx, psn4
     INT 21h
     
     MOV ah, 09
     LEA dx, msg3
     INT 21h   
     
     JMP Proses2 
     
layanan_4:
     MOV ah, 09
     LEA dx, psn4
     INT 21h
     
     MOV ah, 09
     LEA dx, msg4
     INT 21h   
     
     JMP Proses2

daftar_lagi:
    JMP Mulai2

daftar_selesai:
    MOV ah, 09
    LEA dx, psn5
    INT 21h
    JMP Konfirmasi

psn_error:
    MOV ah, 09
    LEA dx, error
    INT 21h
    
    JMP Mulai2

psn_error2:
    MOV ah, 09
    LEA dx, error
    INT 21h
    
    JMP Proses2

Konfirmasi:
    MOV ah, 09
    LEA dx, msg5
    INT 21h
    MOV ah, 01
    INT 21h
    
    CMP al, 'E'
    JE Exit
    
    CMP al, 'e'
    JE Exit
    
    JNE psn_error
    
 

JMP Exit

Exit:
    MOV ah, 09
    LEA dx, psn7
    INT 21h 
    
    INT 20h
     
RET