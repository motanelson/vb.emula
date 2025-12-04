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
Shell "".\gcc.exe -c kernel.c -o .\kernel.o -nostdlib"
Shell ".\as.exe boot.S -o .\boot.o"
Shell ".\ld.exe -T link.ld boot.o kernel.o -o .\kernels.o"
Shell ".\objcopy.exe -O elf32-i386 kernels.o .\kernel.c32"
Shell ".\qemu-system-x86_64.exe -kernel .\kernel.c32"
End Sub
