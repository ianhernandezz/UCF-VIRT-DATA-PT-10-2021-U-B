' Sub DQ_Analysis()

'     ' Activate the DQ_Analaysis worksheet
'     Worksheets("DQ_Analysis").Activate
    
'     ' Select cells within the DQ_Analysis worksheet using the Range() method
'     Range("A1").Value = "DAQO (Ticker: DQ)" 'add text as shown
    
'     ' Add header row to output table using the Cells() method
'     Cells(3, 1).Value = "Year"
'     Cells(3, 2).Value = "Total Daily Volume"
'     Cells(3, 3).Value = "Return"
    
'     ' ### Get DQ's yearly return for 2018 ###
'     ' Activate the 2018 worksheet
'     Worksheets("2018").Activate
    
'     ' set iniial totalVolume as zero
'     totalVolume = 0
    
'     ' Creat a variable startingPrice and endingPrice
'     Dim startingPrice As Double
'     Dim endingPrice As Double
    
'     ' Use rowEnd = Cells(Rows.Count, "A").End(xlUp).Row instead of hard coding the last row of the data worksheet
'     ' https://stackoverflow.com/questions/18088729/row-count-where-data-exists
'     rowEnd = Cells(Rows.Count, "A").End(xlUp).Row
        
'     ' ### Start of Loop ###
    
'     ' loop over all rows
'     For i = 2 To rowEnd ' start on i = 2 to account for the header row
    
'         ' Use Conditionals to determine when the sticker symbol changes or remains the same
        
'         ' If ticker remains the same (ticker is "DQ") increase totalVolume
'         If Cells(i, 1).Value = "DQ" Then
        
'             ' increase totalVolume by value of column eight of the current row
'             totalVolume = totalVolume + Cells(i, 8).Value
        
'         End If
        
'         ' Start of "DQ" -- Previous row is "DQ" And currrent row is not "DQ"
        
'         If Cells(i - 1, 1).Value <> "DQ" And Cells(i, 1) = "DQ" Then
        
'             ' Set starting price as value in sixth column
'             startingPrice = Cells(i, 6).Value
            
'         End If
               
'         ' If the next cell is not the same("DQ") And the current cell ("DQ") set the ending price
        
'         If Cells(i + 1).Value <> "DQ" And Cells(i, 1).Value = "DQ" Then
            
'             ' Set ending price as value in sixth column
'             endingPrice = Cells(i, 6).Value
        
           
        
'         End If
        
     
'     Next i
    
'     ' ############## End of Loop ###################
    
'     ' Set active worksheet as DQ_Analysis (the output worksheet)
'     Worksheets("DQ_Analysis").Activate
    
'         ' Record findings in DQ_Analysis Output Table
    
'         ' Set Years as 2018
'         Cells(4, 1).Value = "2018"
        
'         ' Record total volume for the year
'         Cells(4, 2).Value = totalVolume
        
'         ' Record the Return
'         Cells(4, 3).Value = (endingPrice / startingPrice) - 1
    
'     ' MsgBox (totalVolume)
    
'     ' ### Formating ###
'     ' Autoscale width of Columns in Output Table
'     Columns("A:C").EntireColumn.AutoFit


' End Sub


Sub AllStocksAnalysis()
   '1) Format the output sheet on All Stocks Analysis worksheet
   Worksheets("All_Stocks_Analysis").Activate
   Range("A1").Value = "All Stocks (2018)"
   'Create a header row
   Cells(3, 1).Value = "Ticker"
   Cells(3, 2).Value = "Total Daily Volume"
   Cells(3, 3).Value = "Return"

   '2) Initialize array of all tickers
   Dim tickers(11) As String
   tickers(0) = "AY"
   tickers(1) = "CSIQ"
   tickers(2) = "DQ"
   tickers(3) = "ENPH"
   tickers(4) = "FSLR"
   tickers(5) = "HASI"
   tickers(6) = "JKS"
   tickers(7) = "RUN"
   tickers(8) = "SEDG"
   tickers(9) = "SPWR"
   tickers(10) = "TERP"
   tickers(11) = "VSLR"
   '3a) Initialize variables for starting price and ending price
   Dim startingPrice As Single
   Dim endingPrice As Single
   '3b) Activate data worksheet
   Worksheets("2018").Activate
   '3c) Get the number of rows to loop over
   RowCount = Cells(Rows.Count, "A").End(xlUp).Row

   '4) Loop through tickers
   For i = 0 To 11
       ticker = tickers(i)
       totalVolume = 0
       '5) loop through rows in the data
       Worksheets("2018").Activate
       For j = 2 To RowCount
           '5a) Get total volume for current ticker
           If Cells(j, 1).Value = ticker Then

               totalVolume = totalVolume + Cells(j, 8).Value

           End If
           '5b) get starting price for current ticker
           If Cells(j - 1, 1).Value <> ticker And Cells(j, 1).Value = ticker Then

               startingPrice = Cells(j, 6).Value

           End If

           '5c) get ending price for current ticker
           If Cells(j + 1, 1).Value <> ticker And Cells(j, 1).Value = ticker Then

               endingPrice = Cells(j, 6).Value

           End If
       Next j
       '6) Output data for current ticker
       Worksheets("All_Stocks_Analysis").Activate
       Cells(4 + i, 1).Value = ticker
       Cells(4 + i, 2).Value = totalVolume
       Cells(4 + i, 3).Value = endingPrice / startingPrice - 1

   Next i
   
   ' Formating
    Columns("B:B").Select
    Selection.NumberFormat = "#,##0"
    
    Columns("C:C").Select
    Selection.NumberFormat = "0.00%"
    
    Columns("A:D").EntireColumn.AutoFit

