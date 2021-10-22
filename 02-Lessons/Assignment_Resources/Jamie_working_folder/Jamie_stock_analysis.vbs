' Start of Jamie's Stock Analysis using Excel and VBA

Sub MacroCheck()

    ' Declare Variables
    Dim testMessage As String
    
    testMessage = "Hello Class"
    
    MsgBox (testMessage)


End Sub

Sub DQ_Analysis()

    ' Activate the DQ_Analaysis worksheet
    Worksheets("DQ_Analysis").Activate
    
    ' Select cells within the DQ_Analysis worksheet using the Range() method
    Range("A1").Value = "DAQO (Ticker: DQ)" 'add text as shown
    
    ' Add header row using the Cells() method
    Cells(3, 1).Value = "Year"
    Cells(3, 2).Value = "Total Daily Volume"
    Cells(3, 3).Value = "Return"
    
    
    
    ' Autoscale width of Columns A - C
    Columns("A:C").EntireColumn.AutoFit



End Sub