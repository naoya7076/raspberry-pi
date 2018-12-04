Sub Macro1()
'
' Macro1 Macro
'

'
    ActiveSheet.Shapes.AddChart.Select
    ActiveChart.ChartType = xlLine
    ActiveChart.ClearToMatchStyle
    ActiveChart.ChartStyle = 2
    ActiveChart.ClearToMatchStyle
    ActiveChart.SetSourceData Source:=Range("A2:A13")
End Sub
Sub Macro2()
'
' Macro2 Macro
'
datmax = 200
b$ = Right(Str(datmax + 1000), 3)
    ActiveSheet.Shapes.AddChart.Select
    ActiveChart.ChartType = xlLine
    ActiveChart.ClearToMatchStyle
    ActiveChart.ChartStyle = 2
    ActiveChart.ClearToMatchStyle
    ActiveChart.SetSourceData Source:=Range("B1:B" + b$)

End Sub
