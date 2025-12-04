VERSION 5.00
Begin {C62A69F0-16DC-11CE-9E98-00AA00574A4F} UserForm1 
   Caption         =   "enula"
   ClientHeight    =   3036
   ClientLeft      =   108
   ClientTop       =   456
   ClientWidth     =   4584
   OleObjectBlob   =   "UserForm1.frx":0000
   StartUpPosition =   1  'CenterOwner
End
Attribute VB_Name = "UserForm1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False



Private Sub CommandButton1_Click()
ChDir "c:\mingw\bin"
Shell ".\gcc.exe -nostdlib -c kernel.c -o .\kernel.o "
Shell ".\as.exe boot.S -o .\boot.o"
Shell "c:\nasm\nasm.exe mysys.S -o .\k.bin "
Shell ".\ld.exe -T link.ld boot.o kernel.o -o .\ke.exe -nostdlib"
Shell ".\objcopy.exe -O elf32-i386 ke.exe .\kernel.elf"
Shell ".\objcopy.exe -O binary .\kernel.elf .\kernel.c32"
Shell "c:\windows\system32\cmd.exe /c 'copy /b k.bin+kernel.c32 kernel.bin '"
Shell ".\qemu-system-x86_64.exe -kernel .\kernel.bin"
End Sub
