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
    
    ' ############## Start of Loop ###################
       
    ' Inialize variables note: VBA can infer the data type from the value being assigned
    rowStart = 2
    rowEnd = 3013
    totalVolume = 0
    
    ' Activate the 2018 worksheet
    Worksheets("2018").Activate
    
    ' Create a test for loop
    For i = rowStart To rowEnd
            
        ' Conditional: increase totalVolume if ticker is "DQ"
        ' using the Cells() method
        
        If Cells(i, 1).Value = "DQ" Then
        
              totalVolume = totalVolume + Cells(i, 8).Value ' adding the value for a cell in the Volume column
        
        End If
        
     
    Next i
    
    ' ############## End of Loop ###################
    
    ' Set value "Total Daily Volume" in DQ_Analysis
    ' Set active worksheet as DQ_Analysis
    Worksheets("DQ_Analysis").Activate
    
        ' Set Years as 2018
        Cells(4, 1).Value = "2018"
        Cells(4, 2).Value = totalVolume
    
    MsgBox (totalVolume)


End Sub
