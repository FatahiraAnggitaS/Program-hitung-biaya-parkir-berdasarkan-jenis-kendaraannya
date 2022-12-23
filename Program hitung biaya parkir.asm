.model small
.code
org 100h
start:
         jmp mulai
lanjut       db 13,10,'lanjut Tekan y untuk lanjut : $'

masukkan  db 13,10,'Silahkan Masukkan No/Kode kendaraan yang Anda pilih: $'
      

daftar db 13,10,'+-----------------------------+'
       db 13,10,'|       NAMA KENDARAAN        |'
       db 13,10,'+-----------------------------+'
       db 13,10,'|NO| NAMA    | HARGA          |'
       db 13,10,'+-----------------------------+'
       db 13,10,'|1 | MOTOR   | RP.3.000       |'
       db 13,10,'+-----------------------------+'
       db 13,10,'|2 | MOBIL   | RP.5.000       |'
       db 13,10,'+-----------------------------+','$'




    mulai:        
     mov ah,09h
	 mov dx,offset daftar
	 int 21h
	 mov ah,09h
	 mov dx,offset lanjut
	 int 21h
	 mov ah,01h
	 int 21h
	 cmp al,'y'
	 jmp proses
	 jne error_msg



error_msg:
        mov ah,09h
        mov dx,offset error_msg
        int 21h
        int 20h

proses:
        mov ah,09h
        mov dx,offset masukkan
        int 21h

        mov ah,01
        int 21h
        mov bh,al
       
       
        cmp al,'1'
        je hasil1

        
        cmp al,'2'
        je hasil2

        
hasil1:
	mov ah,09h
	lea dx,teks1
	int 21h
	int 20h

hasil2:
	mov ah,09h
	lea dx,teks2
	int 21h
	int 20h


       
;================================================================

teks1  db 13,10,' '
       db 13,10,'Kendaraan Anda adalah motor'
       db 13,10,'Total Harga Yang Harus Anda Bayar : RP.3.000'
       db 13,10,'Terima Kasih $'

teks2  db 13,10,' '
       db 13,10,'Kendaraan Anda adalah mobil'
       db 13,10,'Total Harga Yang Harus Anda Bayar : RP.5.000'
       db 13,10,'Terima Kasih $'
