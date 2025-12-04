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
     MsgBox ("run :c:\MinGW\bin\gcc -c kernel.c -o kernel.o -nostdlib ")
     MsgBox ("run :c:\MinGW\bin\as boot.S -o boot.o")
     MsgBox ("run :c:\MinGW\bin\ld -T link.ld boot.o kernel.o -o kernels.o")
     MsgBox ("run :c:\MinGW\bin\objcopy kernels.o kernel.c32")
     MsgBox ("run :c:\MinGW\bin\qemu-86_64 -kernel kernel.c32 ")
End Sub
