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
     MsgBox ("emul startup")
     On Error Resume Next
     Shell "c:\MinGW\bin\gcc -c kernel.c -o kernel.o -nostdlib"
     Shell "c:\MinGW\bin\as boot.S -o boot.o"
     Shell "c:\MinGW\bin\ld -T link.ld boot.o kernel.o -o kernels.elf"
     Shell "c:\MinGW\bin\objcopy kernels.o kernel.c32"
     Shell "c:\MinGW\bin\qemu-x86_64 -kernel kernel.elf"
End Sub
