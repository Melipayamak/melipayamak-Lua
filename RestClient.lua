local RestClient = {}

local http = require("socket.http")
local ltn12 = require("ltn12")

local _baseAddress = "https://rest.payamak-panel.com/api"

function makeRequest(URL, data)
    local response = {}
    http.request({
        method = "POST",
        url = URL,
        headers = {
            ["Content-Type"] = "application/x-www-form-urlencoded",
            ["Content-Length"] = string.len(data)
        },
        source = ltn12.source.string(data),
        sink = ltn12.sink.table(response)
    })
    print(table.concat(response))
end

function TableToQueryString(key, values)
    local result = {}

    for i = 1, #values do
        result[#result + 1] = key .. "=" .. tostring(values[i])
    end

    return table.concat(result, "&")
end

function SendSMS(username, password, from, to, text)
    local data = "username=" .. username .. "&password=" .. password .. "&from=" .. from .. "&to=" .. to .. "&text=" ..
                     text
    makeRequest(_baseAddress .. "/SendSMS/SendSMS", data)
end

function SendByBaseNumber(username, password, text, to, bodyId)
    local data =
        "username=" .. username .. "&password=" .. password .. "&text=" .. text .. "&to=" .. to .. "&bodyId=" .. bodyId
    makeRequest(_baseAddress .. "/SendSMS/BaseServiceNumber", data)
end

function GetDeliveries2(username, password, recId)
    local data = "UserName=" .. username .. "&PassWord=" .. password .. "&recId=" .. recId
    makeRequest(_baseAddress .. "/SendSMS/GetDeliveries2", data)
end

function GetMessages(username, password, location, from, index, count)
    local data = "UserName=" .. username .. "&PassWord=" .. password .. "&Location=" .. location .. "&From=" .. from ..
                     "&Index=" .. index .. "&Count=" .. count
    makeRequest(_baseAddress .. "/SendSMS/GetMessages", data)
end

function GetCredit(username, password)
    local data = "UserName=" .. username .. "&PassWord=" .. password
    makeRequest(_baseAddress .. "/SendSMS/GetCredit", data)
end

function GetBasePrice(username, password)
    local data = "UserName=" .. username .. "&PassWord=" .. password
    makeRequest(_baseAddress .. "/SendSMS/GetBasePrice", data)
end

function GetUserNumbers(username, password)
    local data = "UserName=" .. username .. "&PassWord=" .. password
    makeRequest(_baseAddress .. "/SendSMS/GetUserNumbers", data)
end

-- v2

function SendOTP(username, password, to, from, code)
    local data = "UserName=" .. username .. "&PassWord=" .. password .. "&to=" .. to .. "&from=" .. from .. "&code=" ..
                     code
    makeRequest(_baseAddress .. "/SendSMS/SendOTP", data)
end

function SendMultipleSMS(username, password, to, from, text)
    local data = "UserName=" .. username .. "&PassWord=" .. password .. "&from=" .. from .. "&" ..
                     TableToQueryString("to", to) .. "&" .. TableToQueryString("text", text)
    makeRequest(_baseAddress .. "/SendSMS/SendMultipleSMS", data)
end

function SendSchedule(username, password, text, to, from, scheduleDate, period)
    local data = "UserName=" .. username .. "&PassWord=" .. password .. "$text=" .. text .. "&to=" .. to .. "&from=" ..
                     from .. "&scheduleDate=" .. scheduleDate .. "&period=" .. period
    makeRequest(_baseAddress .. "/SendSMS/SendSchedule", data)
end

function GetSchedule(username, password, scheduleId)
    local data = "UserName=" .. username .. "&PassWord=" .. password .. "&scheduleId=" .. scheduleId
    makeRequest(_baseAddress .. "/SendSMS/GetSchedule", data)
end

function GetDeliveries(username, password, recID)
    local data = "UserName=" .. username .. "&PassWord=" .. password .. "&recID=" .. recID
    makeRequest(_baseAddress .. "/SendSMS/GetDeliveries", data)
end

function GetNewDeliveries(username, password, recID)
    local data = "UserName=" .. username .. "&PassWord=" .. password .. "&" .. TableToQueryString("recID", recID)
    makeRequest(_baseAddress .. "/SendSMS/GetNewDeliveries", data)
end

function GetInboxCount(username, password, isRead)
    local data = "UserName=" .. username .. "&PassWord=" .. password .. "&isRead=" .. isRead
    makeRequest(_baseAddress .. "/SendSMS/GetInboxCount", data)
end

function GetCredit2(username, password)
    local data = "UserName=" .. username .. "&PassWord=" .. password
    makeRequest(_baseAddress .. "/SendSMS/GetCredit2", data)
end

function GetSmsPrice(username, password, irancellCount, mciCount, from, text)
    local data = "UserName=" .. username .. "&PassWord=" .. password .. "&irancellCount=" .. irancellCount ..
                     "&mciCount=" .. mciCount .. "&from=" .. from .. "&text=" .. text
    makeRequest(_baseAddress .. "/SendSMS/GetSmsPrice", data)
end

function BaseServiceNumberSchedule(username, password, text, to, bodyId, scheduleDate)
    local data =
        "UserName=" .. username .. "&PassWord=" .. password .. "&text=" .. text .. "&to=" .. to .. "&bodyId=" .. bodyId ..
            "&scheduleDate=" .. scheduleDate
    makeRequest(_baseAddress .. "/SendSMS/BaseServiceNumberSchedule", data)
end

function SendSmartSms(username, password, to, from, text, fromSupportOne, fromSupportTwo)
    local data = "UserName=" .. username .. "&PassWord=" .. password .. "&to=" .. to .. "&from=" .. from .. "&text=" ..
                     text .. "&fromSupportOne=" .. fromSupportOne .. "&fromSupportTwo=" .. fromSupportTwo
    makeRequest(_baseAddress .. "/SmartSMS/Send", data)
end

function SendMultipleSmartSms(username, password)
    local data = "UserName=" .. username .. "&PassWord=" .. password .. "&" .. TableToQueryString(to) .. "&from=" ..
                     from .. "&" .. TableToQueryString(text) .. "&fromSupportOne=" .. fromSupportOne ..
                     "&fromSupportTwo=" .. fromSupportTwo
    makeRequest(_baseAddress .. "/SmartSMS/SendMultiple", data)
end

function GetDeliveries2SmartSms(username, password, Id)
    local data = "UserName=" .. username .. "&PassWord=" .. password .. "&Id=" .. Id
    makeRequest(_baseAddress .. "/SmartSMS/GetDeliveries2", data)
end

function GetDeliveries(username, password, Ids)
    local data = "UserName=" .. username .. "&PassWord=" .. password .. "&" .. TableToQueryString(Ids)
    makeRequest(_baseAddress .. "/SmartSMS/GetDeliveries", data)
end

function AddBody(username, password, title, body)
    local data = "UserName=" .. username .. "&PassWord=" .. password .. "&title=" .. title .. "&body=" .. body
    makeRequest(_baseAddress .. "/ShareService/AddBody", data)
end

function EditBody(username, password, bodyId, title, body)
    local data = "UserName=" .. username .. "&PassWord=" .. password .. "&bodyId=" .. bodyId .. "&title=" .. title ..
                     "&body=" .. body
    makeRequest(_baseAddress .. "/ShareService/EditBody", data)
end

function DeleteBody(username, password, bodyId)
    local data = "UserName=" .. username .. "&PassWord=" .. password .. "&bodyId=" .. bodyId
    makeRequest(_baseAddress .. "/ShareService/DeleteBody", data)
end

function GetBodies(username, password, keyword, status)
    local data = "UserName=" .. username .. "&PassWord=" .. password .. "&keyword=" .. keyword .. "&status=" .. status
    makeRequest(_baseAddress .. "/ShareService/GetBodies", data)
end

function SendSpeechText(username, password, text, to)
	local data =  "UserName="..username.."&PassWord="..password .."&text="..text.."&to="..to
	makeRequest(_baseAddress.."/Voice/SendSpeechText", data)
end

function SendVoiceOtp(username, password, to, code)
	local data =  "UserName="..username.."&PassWord="..password.."&to="..to.."&code="..code
	makeRequest(_baseAddress.."/Voice/SendVoiceOtp", data)
end

function SendSMSWithSpeechText(username, password, smsBody, speechBody, from, to)
	local data =  "UserName="..username.."&PassWord="..password.."&smsBody="..smsBody.."&speechBody="..speechBody.."&from="..from.."&to="..to
	makeRequest(_baseAddress.."/Voice/SendSMSWithSpeechText", data)
end

function SendSMSWithSpeechTextBySchduleDate(username, password, smsBody, speechBody, from, to, scheduleDate)
	local data =  "UserName="..username.."&PassWord="..password.."&smsBody="..smsBody.."&speechBody="..speechBody.."&from="..from.."&to="..to..
		"&scheduleDate="..scheduleDate
	makeRequest(_baseAddress.."/Voice/SendSMSWithSpeechTextBySchduleDate", data)
end

function GetSendSpeechTextStatus(username, password, recId)
	local data =  "UserName="..username.."&PassWord="..password.."&recId="..recId
	makeRequest(_baseAddress.."/Voice/GetSendSpeechTextStatus", data)
end

function GetSendSpeechTextStatuses(username, password, recIds)
	local data =  "UserName="..username.."&PassWord="..password.."&"..TableToQueryString(recIds)
	makeRequest(_baseAddress.."/Voice/GetSendSpeechTextStatuses", data)
end

function GetSendSMSWithSpeechTextStatus(username, password, recId)
	local data =  "UserName="..username.."&PassWord="..password.."&recId="..recId
	makeRequest(_baseAddress.."/Voice/GetSendSMSWithSpeechTextStatus", data)
end

function SendBulkSpeechText(username, password, title, body, receivers, DateToSend, RepeatCount)
	local data =  "UserName="..username.."&PassWord="..password.."&title="..title.."&body="..body.."&receivers="..receivers..
		"&DateToSend="..DateToSend.."&RepeatCount="..RepeatCount
	makeRequest(_baseAddress.."/Voice/SendBulkSpeechText", data)
end

function SendBulkVoiceSMS(username, password, title, voiceFileId, receivers, DateToSend, repeatCount)
	local data =  "UserName="..username.."&PassWord="..password.."&title="..title.."&receivers="..receivers..
		"&voiceFileId="..voiceFileId.."&DateToSend="..DateToSend.."&repeatCount="..repeatCount
	makeRequest(_baseAddress.."/Voice/SendBulkVoiceSMS", data)
end

function UploadVoiceFile(username, password, title, base64StringFile)
	local data =  "UserName="..username.."&PassWord="..password.."&title="..title.."&base64StringFile="..base64StringFile
	makeRequest(_baseAddress.."/Voice/UploadVoiceFile", data)
end

function func(username, password, title, file)
	local data =  "UserName="..username.."&PassWord="..password.."&title="..title.."&file="..file
	makeRequest(_baseAddress.."/Voice/GetUserNumbers", data)
end


return RestClient

-- local username = "username"
-- local password = "password"
-- local from = "5000..."
-- local to = {"09123456789", "09123456789"}
-- local text = {"Lua test rest", "lua test rest"}
-- SendMultipleSMS(username, password, to, from, text)
