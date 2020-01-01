local copas = require("copas")
local http = require("socket.http")
local ltn12 = require("ltn12")


function makeRequest(url, data)

	copas.addthread(function()
    
   		-- print("Thread 1 Added")
    	local response = {}
		http.request({
		    method = "POST",
		    url = url,
		    headers = {
		            ["Content-Type"] = "application/x-www-form-urlencoded",
		            ["Content-Length"] = string.len(data)
		        },
		    source = ltn12.source.string(data),
		    sink = ltn12.sink.table(response)
		    })
		print(table.concat(response))
	end)
end


function SendSMS( username, password, from, to, text )
	local data =  "username="..username.."&password="..password.."&from="..from.."&to="..to.."&text="..text
	makeRequest("https://rest.payamak-panel.com/api/SendSMS/SendSMS", data)
end

function SendByBaseNumber( username, password, text, to, bodyId )
	local data =  "username="..username.."&password="..password.."&text="..text.."&to="..to.."&bodyId="..bodyId
	makeRequest("https://rest.payamak-panel.com/api/SendSMS/BaseServiceNumber", data)
end

function GetDeliveries2( username, password, recId )
	local data =  "UserName="..username.."&PassWord="..password.."&recId="..recId
	makeRequest("https://rest.payamak-panel.com/api/SendSMS/GetDeliveries2", data)
end

function GetMessages( username, password, location, from, index, count )
	local data =  "UserName="..username.."&PassWord="..password.."&Location="..location.."&From="..from.."&Index="..index.."&Count="..count
	makeRequest("https://rest.payamak-panel.com/api/SendSMS/GetMessages", data)
end

function GetCredit( username, password )
	local data =  "UserName="..username.."&PassWord="..password
	makeRequest("https://rest.payamak-panel.com/api/SendSMS/GetCredit", data)
end

function GetBasePrice( username, password )
	local data =  "UserName="..username.."&PassWord="..password
	makeRequest("https://rest.payamak-panel.com/api/SendSMS/GetBasePrice", data)
end

function GetUserNumbers( username, password )
	local data =  "UserName="..username.."&PassWord="..password
	makeRequest("https://rest.payamak-panel.com/api/SendSMS/GetUserNumbers", data)
end



local username = "username"
local password = "password"
local from = "5000..."
local to = "09123456789"
local text = "Lua Rest Test"
SendSMS(username, password, from, to, text)