Sub DQ_Analysis()

    ' Activate the DQ_Analaysis worksheet
    Worksheets("DQ_Analysis").Activate
    
    ' Select cells within the DQ_Analysis worksheet using the Range() method
    Range("A1").Value = "DAQO (Ticker: DQ)" 'add text as shown
    
    ' Add header row to output table using the Cells() method
    Cells(3, 1).Value = "Year"
    Cells(3, 2).Value = "Total Daily Volume"
    Cells(3, 3).Value = "Return"
    
    ' ### Get DQ's yearly return for 2018 ###
    ' Activate the 2018 worksheet
    Worksheets("2018").Activate
    
    ' set iniial totalVolume as zero
    totalVolume = 0
    
    ' Creat a variable startingPrice and endingPrice
    Dim startingPrice As Double
    Dim endingPrice As Double
    
    ' Use rowEnd = Cells(Rows.Count, "A").End(xlUp).Row instead of hard coding the last row of the data worksheet
    ' https://stackoverflow.com/questions/18088729/row-count-where-data-exists
    rowEnd = Cells(Rows.Count, "A").End(xlUp).Row
        
    ' ### Start of Loop ###
    
    ' loop over all rows
    For i = 2 To rowEnd ' start on i = 2 to account for the header row
    
        ' Use Conditionals to determine when the sticker symbol changes or remains the same
        
        ' If ticker remains the same (ticker is "DQ") increase totalVolume
        If Cells(i, 1).Value = "DQ" Then
        
            ' increase totalVolume by value of column eight of the current row
            totalVolume = totalVolume + Cells(i, 8).Value
        
        End If
        
        ' Start of "DQ" -- Previous row is "DQ" And currrent row is not "DQ"
        
        If Cells(i - 1, 1).Value <> "DQ" And Cells(i, 1) = "DQ" Then
        
            ' Set starting price as value in sixth column
            startingPrice = Cells(i, 6).Value
            
        End If
               
        ' If the next cell is not the same("DQ") And the current cell ("DQ") set the ending price
        
        If Cells(i + 1).Value <> "DQ" And Cells(i, 1).Value = "DQ" Then
            
            ' Set ending price as value in sixth column
            endingPrice = Cells(i, 6).Value
        
           
        
        End If
        
     
    Next i
    
    ' ############## End of Loop ###################
    
    ' Set active worksheet as DQ_Analysis (the output worksheet)
    Worksheets("DQ_Analysis").Activate
    
        ' Record findings in DQ_Analysis Output Table
    
        ' Set Years as 2018
        Cells(4, 1).Value = "2018"
        
        ' Record total volume for the year
        Cells(4, 2).Value = totalVolume
        
        ' Record the Return
        Cells(4, 3).Value = (endingPrice / startingPrice) - 1
    
    ' MsgBox (totalVolume)
    
    ' ### Formating ###
    ' Autoscale width of Columns in Output Table
    Columns("A:C").EntireColumn.AutoFit


End Sub

