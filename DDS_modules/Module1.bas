
Sub GoCMD()
    datan = 1
    filen = Time
    diy = Day(Date)
    mo = Month(Date)
    yr = Year(Date)
    hr = Hour(Time)
    mn = Minute(Time)
    sc = Second(Time)
    fl$ = Right(Str(yr), 4) + Right(Str(100 + mo), 2) + Right(Str(100 + diy), 2) + Right(Str(100 + hr), 2) + Right(Str(100 + mn), 2) + Right(Str(100 + sc), 2)
    dstx = &H2
    detx = &H3
    dstxc$ = Chr$(dstx)
    detxc$ = Chr$(detx)
    Dim Pno As Integer
    Dim chanel(3)
    Range("h2").Select
    Selection.Activate
    Pno = ActiveCell(1, 1).Offset.Value
    Range("a2").Select
    Selection.Activate
    chanel(1) = ActiveCell(1, 1).Offset.Value
    Range("c2").Select
    Selection.Activate
    chanel(2) = ActiveCell(1, 1).Offset.Value
    Range("e2").Select
    Selection.Activate
    chanel(3) = ActiveCell(1, 1).Offset.Value

     Range("I1").Select
     ActiveCell.FormulaR1C1 = " "
     ec.COMn = Pno
    If GetCommState(ecH(Cn).Handle, fDCB) = False Then
     e$ = "ポート" + Str(Pno) + " は接続がありません"
     Range("I1").Select
     ActiveCell.FormulaR1C1 = e$
 '         With Selection.Font
 '        .Color = -16776961
 '        .TintAndShade = 0
 '        .Bold = True
  '   End With
     Range("A1").Select
    
     GoTo 300
    End If
'    Range("a3").Select
'    Selection.Activate
'    ActiveCell(1, 1).Offset.Value = "　"
'    ActiveCell(1, 3).Offset.Value = "　"
'    ActiveCell(1, 5).Offset.Value = "　"
    ec.COMn = Pno
    ec.Setting = "9600,N,8,1"
'    ec.Delimiter = ec.DELIMs.Cr
'    ec.ReadIntervalTimeout = 1&
For l = 1 To 3
    If i = 1 Then Range("a2").Select Else If i = 2 Then Range("c2").Select Else Range("e2").Select
    Selection.Activate
n = 0
f$ = ""
d$ = "C" + Chr(32 + l) + Str(chanel(l)) + Chr(13)
For j = 1 To Len(d$)
    ec.Ascii = Mid(d$, j, 1)
'    e$ = e$ + ec.Ascii
'    Range("a3").Select
'    Selection.Activate
'    e$ = e$ + ec.Ascii
'    ActiveCell(1, 1 + (l - 1) * 2).Offset.Value = e$
'If j >= Len(d$) - 4 Then m = 100 Else m = 50
If j >= Len(d$) - 4 Then m = 5 Else m = 2
k = 1
'    Range("a3").Select
'    Selection.Activate
1000
'f$ = ec.Ascii
'    e$ = e$ + f$
'    ActiveCell(1, 1 + (l - 1) * 2).Offset.Value = e$
'    ActiveCell(1, 1 + (l - 1) * 2).Offset.Value = "計算中"
'If Len(f$) < 1 Then GoTo 10030
' For o = 1 To Len(f$)
'    If Mid(f$, o, 1) = Chr(13) Then n = n + 1
'    ActiveCell(2, 1 + (l - 1) * 2).Offset.Value = n
'Next
'10030
'    If Len(f$) >= 1 Then k = 999
    k = k + 1
    If k < m Then GoTo 1000
Next j

'For j = 1 To 200
For j = 1 To 2
'    f$ = ec.Ascii
'    e$ = e$ + f$
'    ActiveCell(1, 1 + (l - 1) * 2).Offset.Value = e$
'    ActiveCell(1, 1 + (l - 1) * 2).Offset.Value = "送信中"
'If Len(f$) < 1 Then GoTo 10020
' For o = 1 To Len(f$)
'    If Mid(f$, o, 1) = Chr(13) Then n = n + 1
'    ActiveCell(2, 1 + (l - 1) * 2).Offset.Value = n
'Next
'10020
'    If Len(f$) >= 1 Then j = 399
Next j
'If Len(e$) >= 27 And n >= 8 Then GoTo 10010
'For k = 1 To 500
For k = 1 To 5
'Range("a3").Select
'    Selection.Activate
'    f$ = ec.Ascii
'    e$ = e$ + f$
'    ActiveCell(1, 1 + (l - 1) * 2).Offset.Value = e$
'    If Len(f$) >= 1 Then k = 199
'    ActiveCell(1, 1 + (l - 1) * 2).Offset.Value = "設定中"
Next k
'    ActiveCell(1, 1 + (l - 1) * 2).Offset.Value = "　"

10010 e$ = ""
Next l
300
'ActiveSheet.Shapes("Group 7").Select
'   Selection.ShapeRange.Fill.ForeColor.SchemeColor = 22
    Range("A1").Select
    Selection.Activate
'    ActiveCell(5, 9).Offset.Value = "　"
'    If datamax < 1000 Then b$ = Right(Str(datmax + 1000), 3) Else b$ = "1000"
'    ActiveSheet.Shapes.AddChart.Select
 '   ActiveChart.ChartType = xlLine
  '  ActiveChart.ClearToMatchStyle
   ' ActiveChart.ChartStyle = 2
    'ActiveChart.ClearToMatchStyle
'    ActiveChart.SetSourceData Source:=Range("B1:B" + b$)

End Sub


Sub ScanCMD()
    datan = 1
    filen = Time
    diy = Day(Date)
    mo = Month(Date)
    yr = Year(Date)
    hr = Hour(Time)
    mn = Minute(Time)
    sc = Second(Time)
    fl$ = Right(Str(yr), 4) + Right(Str(100 + mo), 2) + Right(Str(100 + diy), 2) + Right(Str(100 + hr), 2) + Right(Str(100 + mn), 2) + Right(Str(100 + sc), 2)
    dstx = &H2
    detx = &H3
    dstxc$ = Chr$(dstx)
    detxc$ = Chr$(detx)
    Dim Pno As Integer
    Dim chanel(10)
    Range("h2").Select
    Selection.Activate
    Pno = ActiveCell(1, 1).Offset.Value
    Range("a2").Select
    Selection.Activate
    chanel(1) = ActiveCell(1, 1).Offset.Value
    chanel(8) = chanel(1)
    Range("c2").Select
    Selection.Activate
    chanel(2) = ActiveCell(1, 1).Offset.Value
    chanel(9) = chanel(2)
    Range("e2").Select
    Selection.Activate
    chanel(3) = ActiveCell(1, 1).Offset.Value
    chanel(10) = chanel(3)
    Range("a5").Select
    Selection.Activate
    chanel(5) = ActiveCell(1, 1).Offset.Value
    Range("c5").Select
    Selection.Activate
    chanel(4) = ActiveCell(1, 1).Offset.Value
    Range("e5").Select
    Selection.Activate
    chanel(6) = ActiveCell(1, 1).Offset.Value
     If chanel(4) = 0 Or chanel(5) = 0 Then GoTo 300
     If chanel(5) < chanel(1) Then If chanel(4) > 0 Then chanel(4) = -chanel(4) Else If chanel(4) > 0 Then chanel(4) = -chanel(4)
     Range("I1").Select
     ActiveCell.FormulaR1C1 = " "
     ec.COMn = Pno
    If GetCommState(ecH(Cn).Handle, fDCB) = False Then
     e$ = "ポート" + Str(Pno) + " は接続がありません"
     Range("I1").Select
     ActiveCell.FormulaR1C1 = e$
          With Selection.Font
         .Color = -16776961
         .TintAndShade = 0
         .Bold = True
     End With
     Range("A1").Select
    
     GoTo 300
    End If
    ec.COMn = Pno
    ec.Setting = "9600,N,8,1"
'    ec.Delimiter = ec.DELIMs.Cr
'    ec.ReadIntervalTimeout = 1&
For p = chanel(1) To chanel(5) Step chanel(4)

For l = 1 To 3
    If i = 1 Then Range("a2").Select Else If i = 2 Then Range("c2").Select Else Range("e2").Select
    Selection.Activate
n = 0
f$ = ""
d$ = "C" + Chr(32 + l) + Str(chanel(l)) + Chr(13)
For j = 1 To Len(d$)
    ec.Ascii = Mid(d$, j, 1)
If j >= Len(d$) - 4 Then m = 5 Else m = 2
k = 1
1000
    k = k + 1
    If k < m Then GoTo 1000
Next j

For j = 1 To 2
Next j
For k = 1 To 5
Next k

10010 e$ = ""
Next l
   If chanel(6) > 0 Then Sleep (chanel(6))
    Range("a2").Select
    Selection.Activate
   For k = 1 To 3
    chanel(k) = chanel(k) + chanel(4)
    ActiveCell(1, 1 + (k - 1) * 2).Offset.Value = chanel(k)
   Next k
Next p
   For k = 1 To 3
    ActiveCell(1, 1 + (k - 1) * 2).Offset.Value = chanel(k + 7)
   Next k

300
    Range("A1").Select
    Selection.Activate

End Sub
Sub Preset1CMD()
    datan = 1
    filen = Time
    diy = Day(Date)
    mo = Month(Date)
    yr = Year(Date)
    hr = Hour(Time)
    mn = Minute(Time)
    sc = Second(Time)
    fl$ = Right(Str(yr), 4) + Right(Str(100 + mo), 2) + Right(Str(100 + diy), 2) + Right(Str(100 + hr), 2) + Right(Str(100 + mn), 2) + Right(Str(100 + sc), 2)
    dstx = &H2
    detx = &H3
    dstxc$ = Chr$(dstx)
    detxc$ = Chr$(detx)
    Dim Pno As Integer
    Dim chanel(10)
    Range("a7").Select
    Selection.Activate
    chanel(1) = ActiveCell(1, 1).Offset.Value
    chanel(8) = chanel(1)
    chanel(2) = ActiveCell(2, 1).Offset.Value
    chanel(9) = chanel(2)
    chanel(3) = ActiveCell(3, 1).Offset.Value
    chanel(10) = chanel(3)
    chanel(4) = ActiveCell(4, 1).Offset.Value
    chanel(5) = ActiveCell(5, 1).Offset.Value
    chanel(6) = ActiveCell(6, 1).Offset.Value
    Range("a2").Select
    Selection.Activate
   For k = 1 To 3
    ActiveCell(1, 1 + (k - 1) * 2).Offset.Value = chanel(k)
   Next k
   For k = 4 To 6
    ActiveCell(4, 1 + (k - 4) * 2).Offset.Value = chanel(k)
   Next k


    Range("A1").Select
    Selection.Activate

End Sub

Sub Preset2CMD()
    datan = 1
    filen = Time
    diy = Day(Date)
    mo = Month(Date)
    yr = Year(Date)
    hr = Hour(Time)
    mn = Minute(Time)
    sc = Second(Time)
    fl$ = Right(Str(yr), 4) + Right(Str(100 + mo), 2) + Right(Str(100 + diy), 2) + Right(Str(100 + hr), 2) + Right(Str(100 + mn), 2) + Right(Str(100 + sc), 2)
    dstx = &H2
    detx = &H3
    dstxc$ = Chr$(dstx)
    detxc$ = Chr$(detx)
    Dim Pno As Integer
    Dim chanel(10)
    Range("c7").Select
    Selection.Activate
    chanel(1) = ActiveCell(1, 1).Offset.Value
    chanel(8) = chanel(1)
    chanel(2) = ActiveCell(2, 1).Offset.Value
    chanel(9) = chanel(2)
    chanel(3) = ActiveCell(3, 1).Offset.Value
    chanel(10) = chanel(3)
    chanel(4) = ActiveCell(4, 1).Offset.Value
    chanel(5) = ActiveCell(5, 1).Offset.Value
    chanel(6) = ActiveCell(6, 1).Offset.Value
    Range("a2").Select
    Selection.Activate
   For k = 1 To 3
    ActiveCell(1, 1 + (k - 1) * 2).Offset.Value = chanel(k)
   Next k
   For k = 4 To 6
    ActiveCell(4, 1 + (k - 4) * 2).Offset.Value = chanel(k)
   Next k


    Range("A1").Select
    Selection.Activate

End Sub
Sub Preset3CMD()
    datan = 1
    filen = Time
    diy = Day(Date)
    mo = Month(Date)
    yr = Year(Date)
    hr = Hour(Time)
    mn = Minute(Time)
    sc = Second(Time)
    fl$ = Right(Str(yr), 4) + Right(Str(100 + mo), 2) + Right(Str(100 + diy), 2) + Right(Str(100 + hr), 2) + Right(Str(100 + mn), 2) + Right(Str(100 + sc), 2)
    dstx = &H2
    detx = &H3
    dstxc$ = Chr$(dstx)
    detxc$ = Chr$(detx)
    Dim Pno As Integer
    Dim chanel(10)
    Range("e7").Select
    Selection.Activate
    chanel(1) = ActiveCell(1, 1).Offset.Value
    chanel(8) = chanel(1)
    chanel(2) = ActiveCell(2, 1).Offset.Value
    chanel(9) = chanel(2)
    chanel(3) = ActiveCell(3, 1).Offset.Value
    chanel(10) = chanel(3)
    chanel(4) = ActiveCell(4, 1).Offset.Value
    chanel(5) = ActiveCell(5, 1).Offset.Value
    chanel(6) = ActiveCell(6, 1).Offset.Value
    Range("a2").Select
    Selection.Activate
   For k = 1 To 3
    ActiveCell(1, 1 + (k - 1) * 2).Offset.Value = chanel(k)
   Next k
   For k = 4 To 6
    ActiveCell(4, 1 + (k - 4) * 2).Offset.Value = chanel(k)
   Next k


    Range("A1").Select
    Selection.Activate

End Sub



