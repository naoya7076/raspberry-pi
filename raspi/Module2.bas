Attribute VB_Name = "Module2"
Sub Macro1()
Attribute Macro1.VB_ProcData.VB_Invoke_Func = " \n14"
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
Attribute Macro2.VB_ProcData.VB_Invoke_Func = " \n14"
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
