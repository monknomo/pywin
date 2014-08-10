On Error Resume Next
Err.Clear
' Create an HTTP object
myURL = WScript.Arguments(0)
dim xHttp: Set xHttp = createobject("Microsoft.XMLHTTP")
dim bStrm: Set bStrm = createobject("Adodb.Stream")

' Download the specified URL
xHttp.Open "GET", myURL, False
xHttp.Send
If Err.Number <> 0 Then
    WScript.Echo "Error: " & Err.Number
    WScript.Echo "Error (Hex): " & Hex(Err.Number)
    WScript.Echo "Source: " &  Err.Source
    WScript.Echo "Description: " &  Err.Description
    Err.Clear
End If
intStatus = xHttp.Status

If intStatus = 200 Then
	WScript.Echo " " & intStatus & " A OK " +myURL
	with bStrm
		.type = 1 '//binary
		.open
		.write xHttp.responseBody
		.savetofile "output.txt", 2 '//overwrite
	end with
Else
  WScript.Echo "Error: Received status " & intStatus & " from " +myURL
End If