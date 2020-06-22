var usage = "Usage: cscript //NoLogo wget.js <url> <filename>";

if (WScript.Arguments.Count() < 2) {
    WScript.Echo(usage);
	WScript.Quit(0);
}

var WinHttpReq = new ActiveXObject("WinHttp.WinHttpRequest.5.1");
WinHttpReq.Open("GET", WScript.Arguments(0), /*async=*/false);
WinHttpReq.Send();
BinStream = new ActiveXObject("ADODB.Stream");
BinStream.Type = 1;
BinStream.Open();
BinStream.Write(WinHttpReq.ResponseBody);
BinStream.SaveToFile(WScript.Arguments(1));
