set ws=WScript.CreateObject("WScript.Shell") 
ws.Run "java -DPLANTUML_LIMIT_SIZE=8192 -DPLANTUML_JAVASCRIPT_UNSECURE=true -jar C:\vim_tools\plantuml.jar -picoweb:8000 /start",0 
