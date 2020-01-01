local copas = require("copas")
local http = require("socket.http")
local ltn12 = require("ltn12")


local _sendURL = "https://api.payamak-panel.com/post/send.asmx"
local _receiveURL = "http://api.payamak-panel.com/post/receive.asmx"
local _usersURL = "http://api.payamak-panel.com/post/Users.asmx"
local _contactsURL = "http://api.payamak-panel.com/post/contacts.asmx"
local _actionsURL = "http://api.payamak-panel.com/post/actions.asmx"
local _scheduleURL = "http://api.payamak-panel.com/post/Schedule.asmx"
local _voiceURL = "http://api.payamak-panel.com/post/Voice.asmx"

function makeRequest(url, data)

    copas.addthread(function()
    
        -- print("Thread 1 Added")
        local response = {}
        http.request({
            method = "POST",
            url = url,
            headers = {
                    ["Content-Type"] = "text/xml; charset=utf-8",
                    ["Content-Length"] = string.len(data)
                },
            source = ltn12.source.string(data),
            sink = ltn12.sink.table(response)
            })
        print(table.concat(response))
    end)
end



function SendSimpleSMS2(username, password, to, from, msg, flash) 
    local _method = "SendSimpleSMS2"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>" .. username .. "</username><password>" .. password .. "</password><to>" .. to .. "</to><from>" .. from .. "</from><text>" .. msg .. "</text><isflash>" .. tostring(flash) .. "</isflash></".. _method .."></soap:Body></soap:Envelope>"

    makeRequest(_sendURL, data)
end


function SendSimpleSMS(username, password, to, from, msg, flash) 

    local _to = "<string>" .. table.concat(to, "</string><string>") .. "</string>"

    local _method = "SendSimpleSMS"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>" .. username .. "</username><password>" .. password .. "</passwtable.concatord><to>" .. _to .. "</to><from>" .. from .. "</from><text>" .. msg .. "</text><isflash>" .. tostring(flash) .. "</isflash></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_sendURL, data)
end
function SendSms(username, password, to, from, msg, flash, udh, recid) 
    
    local _to = "<string>" .. table.concat(to, "</string><string>") .. "</string>"
    local _recid = "<long>" .. table.concat(recid , "</long><long>") .. "</long>"

    local _method = "SendSms"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>" .. username .. "</username><password>" .. password .. "</password><to>" .. _to .. "</to><from>" .. from .. "</from><text>" .. msg .. "</text><isflash>" .. tostring(flash) .. "</isflash><udh>" .. udh .. "</udh><recId>" .. _recid .. "</recId></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_sendURL, data)
end
function SendWithDomain(username, password, to, from, msg, flash, domain) 
   
    local _method = "SendWithDomain"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>" .. username .. "</username><password>" .. password .. "</password><to>" .. to .. "</to><from>" .. from .. "</from><text>" .. msg .. "</text><isflash>" .. tostring(flash) .. "</isflash><domainName>" .. domain .. "</domainName></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_sendURL, data)
end

function SendByBaseNumber(username, password, text, to, bodyId) 

    local _text = "<string>" .. table.concat(text, "</string><string>") .. "</string>"

    local _method = "SendByBaseNumber"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>" .. username .. "</username><password>" .. password .. "</passwtable.concatord><text>" .. _text .. "</text><to>" .. to .. "</to><bodyId>" .. tostring(bodyId) .. "</bodyId></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_sendURL, data)
end

function SendByBaseNumber2(username, password, text, to, bodyId) 

    local _method = "SendByBaseNumber2"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>" .. username .. "</username><password>" .. password .. "</passwtable.concatord><text>" .. text .. "</text><to>" .. to .. "</to><bodyId>" .. tostring(bodyId) .. "</bodyId></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_sendURL, data)
end

function getMessages(username, password, location, from, index, count) 

    local _method = "getMessages"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>" .. username .. "</username><password>" .. password .. "</password><location>" .. tostring(location) .. "</location><from>" .. from .. "</from><index>" .. tostring(index) .. "</index><count>" .. tostring(count) .. "</count></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_sendURL, data)
end
function GetSmsPrice(username, password, irancellCount, mtnCount, from, text) 

    local _method = "GetSmsPrice"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>" .. username .. "</username><password>" .. password .. "</password><irancellCount>" .. tostring(irancellCount) .. "</irancellCount><mtnCount>" .. tostring(mtnCount) .. "</mtnCount><from>".. from .."</from><text>".. text .."</text></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_sendURL, data)
end
function GetMultiDelivery2(username, password, recId) 

    local _method = "GetMultiDelivery2"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><recId>" .. recId .. "</recId></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_sendURL, data)
end
function GetMultiDelivery(username, password, recId) 

    local _method = "GetMultiDelivery"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><recId>" .. recId .. "</recId></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_sendURL, data)
end
function GetInboxCount(username, password, isRead) 

    local _method = "GetInboxCount"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>" .. username .. "</username><password>" .. password .. "</password><isRead>" .. tostring(isRead) .. "</isRead></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_sendURL, data)
end
function GetDelivery2(username, password, recId) 

    local _method = "GetDelivery2"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><recId>" .. recId .. "</recId></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_sendURL, data)
end
function GetDelivery(username, password, recId) 

    local _method = "GetDelivery"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><recId>" .. recId .. "</recId></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_sendURL, data)
end
function GetDeliveries3(username, password, recIds) 

    local _recids = "<string>" .. table.concat(recIds, "</string><string>") .. "</string>"

    local _method = "GetDeliveries3"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>" .. username .. "</username><password>" .. password .. "</password><recId>" .. _recids .. "</recId></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_sendURL, data)
end
function GetDeliveries2(username, password, recId) 

    local _method = "GetDeliveries2"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><recId>" .. recId .. "</recId></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_sendURL, data)
end
function GetDeliveries(username, password, recIds) 

    _recids = "<long>" .. table.concat(recIds, "</long><long>") .. "</long>"

    local _method = "GetDeliveries"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>" .. username .. "</username><password>" .. password .. "</password><recId>" .. _recids .. "</recId></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_sendURL, data)
end
function GetCredit(username, password) 

    local _method = "GetCredit"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>" .. username .. "</username><password>" .. password .. "</password></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_sendURL, data)
end



-- Receive API Operations
function RemoveMessages2(username, password, location, msgIds) 

    local _method = "RemoveMessages2"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>" .. username .. "</username><password>" .. password .. "</password><location>" .. tostring(location) .. "</location><msgIds>" .. msgIds .. "</msgIds></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_receiveURL, data)
end
-- use Received or Sent or Removed or Deleted for location in the next method
function RemoveMessages(username, password, location, msgIds) 

    local _method = "RemoveMessages"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>" .. username .. "</username><password>" .. password .. "</password><location>" .. location .. "</location><msgIds>" .. msgIds .. "</msgIds></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_receiveURL, data)
end
function GetUsersMessagesByDate(username, password, location, from, index, count, dateFrom, dateTo) 

    local _method = "GetUsersMessagesByDate"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>" .. username .. "</username><password>" .. password .. "</password><location>" .. tostring(location) .. "</location><from>" .. from .. "</from><index>" .. tostring(index) .. "</index><count>" .. tostring(count) .."</count><dateFrom>" .. dateFrom .. "</dateFrom><dateTo>" .. dateTo .. "</dateTo></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_receiveURL, data)
end
function GetOutBoxCount(username, password) 

    local _method = "GetOutBoxCount"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>" .. username .. "</username><password>" .. password .. "</password></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_receiveURL, data)
end
function GetMessagesWithChangeIsRead(username, password, location, from, index, count, isRead, changeIsRead) 

   local _method = "GetMessagesWithChangeIsRead"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>" .. username .. "</username><password>" .. password .. "</password><location>" .. tostring(location) .. "</location><from>" .. from .. "</from><index>" .. tostring(index) .. "</index><count>" .. tostring(count) .."</count><isRead>" .. tostring(isRead) .. "</isRead><changeIsRead>" .. tostring(changeIsRead) .. "</changeIsRead></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_receiveURL, data)
end
function GetMessagesReceptions(username, password, msgId, fromRows) 

    local _method = "GetMessagesReceptions"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>" .. username .. "</username><password>" .. password .. "</password><msgId>" .. tostring(msgId) .. "</msgId><fromRows>" .. tostring(fromRows) .. "</fromRows></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_receiveURL, data)
end
function GetMessagesFilterByDate(username, password, location, from, index, count, dateFrom, dateTo, isRead) 

    local _method = "GetMessagesFilterByDate"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>" .. username .. "</username><password>" .. password .. "</password><location>" .. tostring(location) .. "</location><from>" .. from .. "</from><index>" .. tostring(index) .. "</index><count>" .. tostring(count) .. "</count><dateFrom>" .. dateFrom .. "</dateFrom><dateTo>" .. dateTo .. "</dateTo><isRead>" .. tostring(isRead) .. "</isRead></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_receiveURL, data)
end
function GetMessagesByDate(username, password, location, from, index, count, dateFrom, dateTo) 

    local _method = "GetMessagesByDate"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>" .. username .. "</username><password>" .. password .. "</password><location>" .. tostring(location) .. "</location><from>" .. from .. "</from><index>" .. tostring(index) .. "</index><count>" .. tostring(count) .. "</count><dateFrom>" .. dateFrom .. "</dateFrom><dateTo>" .. dateTo .. "</dateTo></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_receiveURL, data)
end
function GetMessagesAfterIDJson(username, password, location, from, count, msgId) 

    local _method = "GetMessagesAfterIDJson"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>" .. username .. "</username><password>" .. password .. "</password><location>" .. tostring(location) .. "</location><from>" .. from .. "</from><count>" .. tostring(count) .. "</count><msgId>" .. tostring(msgId) .. "</msgId></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_receiveURL, data)
end
function GetMessagesAfterID(username, password, location, from, count, msgId) 

    local _method = "GetMessagesAfterID"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>" .. username .. "</username><password>" .. password .. "</password><location>" .. tostring(location) .. "</location><from>" .. from .. "</from><count>" .. tostring(count) .. "</count><msgId>" .. tostring(msgId) .. "</msgId></".. _method .."></soap:Body></soap:Envelope>"
    makeRequest(_receiveURL, data)
end
function GetMessages(username, password, location, from, index, count) 

    local _method = "GetMessages"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>" .. username .. "</username><password>" .. password .. "</password><location>" .. tostring(location) .."</location><from>" .. from .. "</from><index>" .. tostring(index) .. "</index><count>" .. tostring(count) .. "</count></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_receiveURL, data)
end
function GetMessageStr(username, password, location, from, index, count) 

    local _method = "GetMessageStr"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>" .. username .. "</username><password>" .. password .. "</password><location>" .. tostring(location) .."</location><from>" .. from .. "</from><index>" .. tostring(index) .. "</index><count>" .. tostring(count) .. "</count></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_receiveURL, data)
end
function ChangeMessageIsRead(username, password, msgIds) 

    local _method = "ChangeMessageIsRead"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>" .. username .. "</username><password>" .. password .. "</password><msgIds>" .. msgIds .. "</msgIds></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_receiveURL, data)
end

-- Users API Operations
function AddPayment(username, password, name, family, bankName, code, amount, cardNumber) 

    local _method = "AddPayment"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>" .. username .. "</username><password>" .. password .. "</password><name>"..name.."</name><family>"..family.."</family><bankName>"..bankName.."</bankName><code>"..code.."</code><amount>" .. tostring(amount).."</amount><cardNumber>" .. cardNumber .. "</cardNumber></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_usersURL, data)

end
function AddUser(username, password, productId, descriptions, mobileNumber, emailAddress, nationalCode, name, family, corporation, phone, fax, address, postalCode, certificateNumber) 

    local _method = "AddUser"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>" .. username .. "</username><password>" .. password .. "</password><productId>" .. tostring(productId) .. "</productId><descriptions>"..descriptions.."</descriptions><mobileNumber>"..mobileNumber.."</mobileNumber><emailAddress>"..emailAddress.."</emailAddress><nationalCode>"..nationalCode.."</nationalCode><name>"..name.."</name><family>"..family.."</family><corporation>"..corporation.."</corporation><phone>"..phone.."</phone><fax>"..fax.."</fax><address>"..address.."</address><postalCode>"..postalCode.."</postalCode><certificateNumber>"..certificateNumber.."</certificateNumber></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_usersURL, data)
end
function AddUserComplete(username, password, productId, descriptions, mobileNumber, emailAddress, nationalCode, name, family, corporation, phone, fax, address, postalCode, certificateNumber, country, province, city, howFindUs, commercialCode, saleId, recommanderId) 

    local _method = "AddUserComplete"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>" .. username .. "</username><password>" .. password .. "</password><productId>" .. tostring(productId) .. "</productId><descriptions>"..descriptions.."</descriptions><mobileNumber>"..mobileNumber.."</mobileNumber><emailAddress>"..emailAddress.."</emailAddress><nationalCode>"..nationalCode.."</nationalCode><name>"..name.."</name><family>"..family.."</family><corporation>"..corporation.."</corporation><phone>"..phone.."</phone><fax>"..fax.."</fax><address>"..address.."</address><postalCode>"..postalCode.."</postalCode><certificateNumber>"..certificateNumber.."</certificateNumber><country>"..tostring(country).."</country><province>".. tostring(province).."</province><city>"..tostring(city).."</city><howFindUs>"..howFindUs.."</howFindUs><commercialCode>"..commercialCode.."</commercialCode><saleId>"..saleId.."</saleId><recommanderId>"..recommanderId.."</recommanderId></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_usersURL, data)
end
function AddUserWithLocation(username, password, productId, descriptions, mobileNumber, emailAddress, nationalCode, name, family, corporation, phone, fax, address, postalCode, certificateNumber, country, province, city) 

    local _method = "AddUserWithLocation"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>" .. username .. "</username><password>" .. password .. "</password><productId>" .. tostring(productId) .. "</productId><descriptions>"..descriptions.."</descriptions><mobileNumber>"..mobileNumber.."</mobileNumber><emailAddress>"..emailAddress.."</emailAddress><nationalCode>"..nationalCode.."</nationalCode><name>"..name.."</name><family>"..family.."</family><corporation>"..corporation.."</corporation><phone>"..phone.."</phone><fax>"..fax.."</fax><address>"..address.."</address><postalCode>"..postalCode.."</postalCode><certificateNumber>"..certificateNumber.."</certificateNumber><country>"..tostring(country).."</country><province>"..tostring(province).."</province><city>"..tostring(city).."</city></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_usersURL, data)
end
function AddUserWithMobileNumber(username, password, productId, mobileNumber, firstName, lastName, email) 

    local _method = "AddUserWithMobileNumber"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>" .. username .. "</username><password>" .. password .. "</password><productId>"..tostring(productId).."</productId><mobileNumber>"..mobileNumber.."</mobileNumber><firstName>"..firstName.."</firstName><lastName>"..lastName.."</lastName><email>"..email.."</email></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_usersURL, data)
end
function AddUserWithUserNameAndPass(username, password, targetUserName, targetUserPassword, productId, descriptions, mobileNumber, emailAddress, nationalCode, name, family, corporation, phone, fax, address, postalCode, certificateNumber) 

    local _method = "AddUserWithUserNameAndPass"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>" .. username .. "</username><password>" .. password .. "</password><targetUserName>"..targetUserName.."</targetUserName><targetUserPassword>"..targetUserPassword.."</targetUserPassword><productId>"..tostring(productId).."</productId><descriptions>"..descriptions.."</descriptions><mobileNumber>"..mobileNumber.."</mobileNumber><emailAddress>"..emailAddress.."</emailAddress><nationalCode>"..nationalCode.."</nationalCode><name>"..name.."</name><family>"..family.."</family><corporation>"..corporation.."</corporation><phone>"..phone.."</phone><fax>"..fax.."</fax><address>"..address.."</address><postalCode>"..postalCode.."</postalCode><certificateNumber>"..certificateNumber.."</certificateNumber></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_usersURL, data)
end
function AuthenticateUser(username, password) 

    local _method = "AuthenticateUser"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>" .. username .. "</username><password>" .. password .. "</password></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_usersURL, data)
end
function ChangeUserCredit(username, password, amount, description, targetUsername, GetTax) 

    local _method = "ChangeUserCredit"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>" .. username .. "</username><password>" .. password .. "</password><amount>" .. tostring(amount) .. "</amount><description>"..description.."</description><targetUsername>"..targetUsername.."</targetUsername><GetTax>".. tostring(GetTax).."</GetTax></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_usersURL, data)
end
function ChangeUserCredit2(username, password, amount, description, targetUsername, GetTax) 

    local _method = "ChangeUserCredit2"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>" .. username .. "</username><password>" .. password .. "</password><amount>" .. amount .. "</amount><description>"..description.."</description><targetUsername>"..targetUsername.."</targetUsername><GetTax>".. tostring(GetTax).."</GetTax></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_usersURL, data)
end
function ChangeUserCreditBySeccondPass(username, password, ausername, seccondPassword, amount, description, targetUsername, GetTax) 

    local _method = "ChangeUserCreditBySeccondPass"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>"..ausername.."</username><seccondPassword>"..seccondPassword.."</seccondPassword><amount>"..tostring(amount).."</amount><description>"..description.."</description><targetUsername>"..targetUsername.."</targetUsername><GetTax>"..tostring(GetTax).."</GetTax></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_usersURL, data)
end

function DeductUserCredit(username, password, ausername, apassword, amount, description) 

    local _method = "DeductUserCredit"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>"..ausername.."</username><password>"..apassword.."</password><amount>"..tostring(amount).."</amount><description>"..description.."</description></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_usersURL, data)
end

function ForgotPassword(username, password, mobileNumber, emailAddress, targetUsername) 

    local _method = "ForgotPassword"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>" .. username .. "</username><password>" .. password .. "</password><mobileNumber>"..mobileNumber.."</mobileNumber><emailAddress>"..emailAddress.."</emailAddress><targetUsername>"..targetUsername.."</targetUsername></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_usersURL, data)
end
function GetCities(username, password, provinceId) 

    local _method = "GetCities"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>" .. username .. "</username><password>" .. password .. "</password><provinceId>" .. tostring(provinceId) .. "</provinceId></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_usersURL, data)
end
function GetEnExpireDate(username, password) 

   local _method = "GetEnExpireDate"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>" .. username .. "</username><password>" .. password .. "</password></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_usersURL, data)
end
function GetExpireDate(username, password) 

    local _method = "GetExpireDate"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>" .. username .. "</username><password>" .. password .. "</password></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_usersURL, data)
end
function GetProvinces(username, password) 

    local _method = "GetProvinces"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>" .. username .. "</username><password>" .. password .. "</password></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_usersURL, data)
end
function GetUserBasePrice(username, password, targetUsername) 

    local _method = "GetUserBasePrice"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>" .. username .. "</username><password>" .. password .. "</password><targetUsername>" .. targetUsername .. "</targetUsername></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_usersURL, data)
end
function GetUserByUserID(username, password, pass, userId) 

    local _method = "GetUserByUserID"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>" .. username .. "</username><password>" .. password .. "</password><pass>"..pass.."</pass><userId>"..tostring(userId).."</userId></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_usersURL, data)
end
function GetUserCredit(username, password, targetUsername) 

    local _method = "GetUserCredit"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>" .. username .. "</username><password>" .. password .. "</password><targetUsername>"..targetUsername.."</targetUsername></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_usersURL, data)
end
function GetUserCreditBySecondPass(username, password, secondPassword, targetUsername) 

    local _method = "GetUserCreditBySecondPass"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>" .. username .. "</username><secondPassword>"..secondPassword.."</secondPassword><targetUsername>"..targetUsername.."</targetUsername></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_usersURL, data)
end
function GetUserDetails(username, password, targetUsername) 
    local _method = "GetUserDetails"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>" .. username .. "</username><password>" .. password .. "</password><targetUsername>"..targetUsername.."</targetUsername></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_usersURL, data)
end
function GetUserIsExist(username, password, targetUsername) 

    local _method = "GetUserIsExist"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>" .. username .. "</username><password>" .. password .. "</password><targetUsername>"..targetUsername.."</targetUsername></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_usersURL, data)
end
function GetUserNumbers(username, password) 

    local _method = "GetUserNumbers"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>" .. username .. "</username><password>" .. password .. "</password></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_usersURL, data)
end
function GetUserTransactions(username, password, targetUsername, creditType, dateFrom,  dateTo, keyword) 

    local _method = "GetUserTransactions"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>" .. username .. "</username><password>" .. password .. "</password><targetUsername>"..targetUsername.."</targetUsername><creditType>"..creditType.."</creditType><dateFrom>"..dateFrom.."</dateFrom><dateTo>"..dateTo.."</dateTo><keyword>"..keyword.."</keyword></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_usersURL, data)
end
function GetUserWallet(username, password) 

    local _method = "GetUserWallet"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>" .. username .. "</username><password>" .. password .. "</password></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_usersURL, data)
end
function GetUserWalletTransaction(username, password, dateFrom, dateTo, count, startIndex, payType, PayLoc) 

    local _method = "GetUserWalletTransaction"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>" .. username .. "</username><password>" .. password .. "</password><dateFrom>" .. dateFrom .. "</dateFrom><dateTo>" .. dateTo .. "</dateTo><count>" .. tostring(count) .. "</count><startIndex>" .. tostring(startIndex) .. "</startIndex><payType>" .. payType .. "</payType><payLoc>" .. PayLoc .. "</payLoc></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_usersURL, data)
end
function GetUsers(username, password) 

    local _method = "GetUsers"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>" .. username .. "</username><password>" .. password .. "</password></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_usersURL, data)
end
function HasFilter(username, password, text) 

    local _method = "HasFilter"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>" .. username .. "</username><password>" .. password .. "</password><text>" .. text .. "</text></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_usersURL, data)
end
function RemoveUser(username, password, targetUsername) 

    local _method = "RemoveUser"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>" .. username .. "</username><password>" .. password .. "</password><targetUsername>" ..targetUsername .. "</targetUsername></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_usersURL, data)
end
function RevivalUser(username, password, targetUsername) 

    local _method = "RevivalUser"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>" .. username .. "</username><password>" .. password .. "</password><targetUserName>" .. targetUsername .. "</targetUserName></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_usersURL, data)
end

-- Contact API Operations
function AddContact(username, password, groupIds, firstname, lastname, nickname, corporation, mobilenumber, phone, fax, birthdate, email, gender, province, city, address, postalCode, additionaldate, additionaltext, descriptions) 

    local _method = "AddContact"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>" .. username .. "</username><password>" .. password .. "</password><groupIds>" .. groupIds .. "</groupIds><firstname>" .. firstname .. "</firstname><lastname>" .. lastname .. "</lastname><nickname>" .. nickname .. "</nickname><corporation>" .. corporation .. "</corporation><mobilenumber>" .. mobilenumber .. "</mobilenumber><phone>" .. phone .. "</phone><fax>" .. fax .. "</fax><birthdate>" .. birthdate .. "</birthdate><email>" .. email .. "</email><gender>" .. tostring(gender) .. "</gender><province>" .. tostring(province) .. "</province><city>" .. tostring(city) .. "</city><address>" .. address .. "</address><postalCode>" .. postalCode .. "</postalCode><additionaldate>" .. additionaldate .. "</additionaldate><additionaltext>" .. additionaltext .. "</additionaltext><descriptions>" .. descriptions .. "</descriptions></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_contactsURL, data)

end
function AddContactEvents(username, password, contactId, eventName, eventType, eventDate) 

    local _method = "AddContactEvents"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>" .. username .. "</username><password>" .. password .. "</password><contactId>" .. tostring(contactId) .. "</contactId><eventName>" .. eventName .. "</eventName><eventDate>" .. eventDate .. "</eventDate><eventType>" .. tostring(eventType) .. "</eventType></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_contactsURL, data)
end
function AddGroup(username, password, groupName, Descriptions, showToChilds) 

    local _method = "AddGroup"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>" .. username .. "</username><password>" .. password .. "</password><groupName>" .. groupName .. "</groupName><Descriptions>" .. Descriptions .. "</Descriptions><showToChilds>" .. tostring(showToChilds) .. "</showToChilds></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_contactsURL, data)
end
function ChangeContact(username, password, contactId, mobilenumber, firstname, lastname, nickname, corporation, phone, fax, email, gender, province, city, address, postalCode, additionaltext, descriptions, contactStatus) 

    local _method = "ChangeContact"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>" .. username .. "</username><password>" .. password .. "</password><contactId>" .. tostring(contactId) .. "</contactId><mobilenumber>" .. mobilenumber .. "</mobilenumber><firstname>" .. firstname .. "</firstname><lastName>" .. lastname .. "</lastname><nickname>" .. nickname .. "</nickname><corporation>" .. corporation .. "</corporation><phone>" .. phone .. "</phone><fax>" .. fax .. "</fax><email>" .. email .. "</email><gender>" .. tostring(gender) .. "</gender><province>" .. tostring(province) .. "</province><city>" .. tostring(city) .. "</city><address>" .. address .. "</address><postalCode>" .. postalCode .. "</postalCode><additionaltext>" .. additionaltext .. "</additionaltext><descriptions>" .. descriptions .. "</descriptions><contactStatus>" .. tostring(contactStatus) .. "</contactStatus></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_contactsURL, data)
end
function ChangeGroup(username, password, groupId, groupName, Descriptions, showToChilds, groupStatus) 

    local _method = "ChangeGroup"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>" .. username .. "</username><password>" .. password .. "</password><groupId>" .. tostring(groupId) .. "</groupId><groupName>" .. groupName .. "</groupName><Descriptions>" .. Descriptions .. "</Descriptions><showToChilds>" .. tostring(showToChilds) .. "</showToChilds><groupStatus>" .. tostring(groupStatus) .. "</groupStatus></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_contactsURL, data)
end
function CheckMobileExistInContact(username, password, mobileNumber) 

    local _method = "CheckMobileExistInContact"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>" .. username .. "</username><password>" .. password .. "</password><mobileNumber>" .. mobileNumber .. "</mobileNumber></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_contactsURL, data)
end
function GetContactEvents(username, password, contactId) 

    local _method = "GetContactEvents"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>" .. username .. "</username><password>" .. password .. "</password><contactId>" .. tostring(contactId) .. "</contactId></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_contactsURL, data)
end
function GetContacts(username, password, groupId, keyword, from, count) 

    local _method = "GetContacts"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>" .. username .. "</username><password>" .. password .. "</password><groupId>" .. tostring(groupId) .. "</groupId><keyword>" .. keyword .. "</keyword><from>" .. tostring(from) .. "</from><count>" .. tostring(count) .. "</count></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_contactsURL, data)
end
function GetContactsByID(username, password, contactId, status) 

    local _method = "GetContactsByID"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>" .. username .. "</username><password>" .. password .. "</password><contactId>" .. tostring(contactId) .. "</contactId><status>" .. tostring(status) .. "</status></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_contactsURL, data)
end
function GetGroups(username, password) 

    local _method = "GetGroups"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>" .. username .. "</username><password>" .. password .. "</password></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_contactsURL, data)
end
function MergeGroups(username, password, originGroupId, destinationGroupId, deleteOriginGroup) 

    local _method = "MergeGroups"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>" .. username .. "</username><password>" .. password .. "</password><originGroupId>" .. tostring(originGroupId) .. "</originGroupId><destinationGroupId>" .. tostring(destinationGroupId) .. "</destinationGroupId><deleteOriginGroup>" .. tostring(deleteOriginGroup) .. "</deleteOriginGroup></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_contactsURL, data)
end
function RemoveContact(username, password, mobilenumber) 

    local _method = "RemoveContact"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>" .. username .. "</username><password>" .. password .. "</password><mobilenumber>" .. mobilenumber .. "</mobilenumber></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_contactsURL, data)
end
function RemoveContactByContactID(username, password, contactId) 

    local _method = "RemoveContactByContactID"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>" .. username .. "</username><password>" .. password .. "</password><contactId>" .. tostring(contactId) .. "</contactId></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_contactsURL, data)
end
function RemoveGroup(username, password, groupId) 

    local _method = "RemoveGroup"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>" .. username .. "</username><password>" .. password .. "</password><groupId>" .. tostring(groupId) .. "</groupId></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_contactsURL, data)
end



-- ACtions API Operations
function AddBranch(username, password, branchName, owner) 

    local _method = "AddBranch"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>" .. username .. "</username><password>" .. password .. "</password><branchName>" .. branchName .. "</branchName><owner>" .. tostring(owner) .. "</owner></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_actionsURL, data)

end
function AddBulk(username, password, from, branch, bulkType, title, message, rangeFrom, rangeTo, DateToSend, requestCount, rowFrom) 

    local _method = "AddBulk"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>" .. username .. "</username><password>" .. password .. "</password><from>" .. from .. "</from><branch>" ..tostring(branch) .. "</branch><bulkType>" .. tostring(bulkType) .. "</bulkType><title>" .. title .. "</title><message>" .. message .. "</message><rangeFrom>" .. rangeFrom .. "</rangeFrom><rangeTo>" .. rangeTo .. "</rangeTo><DateToSend>" .. DateToSend .. "</DateToSend><requestCount>" .. tostring(requestCount) .. "</requestCount><rowFrom>" .. tostring(rowFrom) .. "</rowFrom></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_actionsURL, data)
end
function AddBulk2(username, password, from, branch, bulkType, title, message, rangeFrom, rangeTo, DateToSend, requestCount, rowFrom) 

    local _method = "AddBulk2"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>" .. username .. "</username><password>" .. password .. "</password><from>" .. from .. "</from><branch>" ..tostring(branch) .. "</branch><bulkType>" .. tostring(bulkType) .. "</bulkType><title>" .. title .. "</title><message>" .. message .. "</message><rangeFrom>" .. rangeFrom .. "</rangeFrom><rangeTo>" .. rangeTo .. "</rangeTo><DateToSend>" .. DateToSend .. "</DateToSend><requestCount>" .. tostring(requestCount) .. "</requestCount><rowFrom>" .. tostring(rowFrom) .. "</rowFrom></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_actionsURL, data)
end
function AddNewBulk(username, password, from, branch, bulkType, title, message, rangeFrom, rangeTo, DateToSend, requestCount, rowFrom) 

    local _method = "AddNewBulk"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>" .. username .. "</username><password>" .. password .. "</password><from>" .. from .. "</from><branch>" ..tostring(branch) .. "</branch><bulkType>" .. tostring(bulkType) .. "</bulkType><title>" .. title .. "</title><message>" .. message .. "</message><rangeFrom>" .. rangeFrom .. "</rangeFrom><rangeTo>" .. rangeTo .. "</rangeTo><DateToSend>" .. DateToSend .. "</DateToSend><requestCount>" .. tostring(requestCount) .. "</requestCount><rowFrom>" .. tostring(rowFrom) .. "</rowFrom></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_actionsURL, data)
end
function AddNumber(username, password, branchId, mobileNumbers) 

    local _mobileNumbers = "<string>" .. table.concat(mobileNumbers, "</string><string>") .. "</string>"

    local _method = "AddNumber"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>" .. username .. "</username><password>" .. password .. "</password><branchId>" .. tostring(branchId) .. "</branchId><mobileNumbers>" .. _mobileNumbers .. "</mobileNumbers></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_actionsURL, data)
end
function GetBranchs(username, password, owner) 

    local _method = "GetBranchs"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>" .. username .. "</username><password>" .. password .. "</password><owner>" .. tostring(owner) .. "</owner></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_actionsURL, data)
end
function GetBulk(username, password) 

    local _method = "GetBulk"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>" .. username .. "</username><password>" .. password .. "</password></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_actionsURL, data)
end
function GetBulkCount(username, password, branch, rangeFrom, rangeTo) 

    local _method = "GetBulkCount"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>" .. username .. "</username><password>" .. password .. "</password><branch>" .. tostring(branch) .. "</branch><rangeFrom>" .. rangeFrom .. "</rangeFrom><rangeTo>" .. rangeTo .. "</rangeTo></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_actionsURL, data)
end
function GetBulkReceptions(username, password, bulkId, fromRows) 

    local _method = "GetBulkReceptions"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>" .. username .. "</username><password>" .. password .. "</password><bulkId>" .. tostring(bulkId) .. "</bulkId><fromRows>" .. tostring(fromRows) .. "</fromRows></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_actionsURL, data)
end
function GetBulkStatus(username, password, bulkId, sent, failed, status) 

    local _method = "GetBulkStatus"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>" .. username .. "</username><password>" .. password .. "</password><bulkId>" .. tostring(bulkId) .. "</bulkId><sent>" .. tostring(sent) .. "</sent><failed>" .. tostring(failed) .. "</failed><status>" .. tostring(status) .. "</status></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_actionsURL, data)
end
-- duplicate method
-- function GetMessagesReceptions(username, password, msgId int64, fromRows) 

--     local _method = "GetMessagesReceptions"
--      local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>" .. username .. "</username><password>" .. password .. "</password><msgId>" .. tostring(msgId) .. "</msgId><fromRows>" .. tostring(fromRows) .. "</fromRows></".. _method .."></soap:Body></soap:Envelope>"
 
--     makeRequest(_actionsURL, data)
-- end
function GetMobileCount(username, password, branch, rangeFrom, rangeTo) 

    local _method = "GetMobileCount"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>" .. username .. "</username><password>" .. password .. "</password><branch>".. tostring(branch) .. "</branch><rangeFrom>" .. rangeFrom .. "</rangeFrom><rangeTo>" .. rangeTo .. "</rangeTo></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_actionsURL, data)
end
function GetSendBulk(username, password) 

    local _method = "GetSendBulk"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>" .. username .. "</username><password>" .. password .. "</password></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_actionsURL, data)
end
function GetTodaySent(username, password) 

    local _method = "GetTodaySent"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>" .. username .. "</username><password>" .. password .. "</password></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_actionsURL, data)
end
function GetTotalSent(username, password) 

    local _method = "GetTotalSent"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>" .. username .. "</username><password>" .. password .. "</password></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_actionsURL, data)
end
function RemoveBranch(username, password, branchId) 

    local _method = "RemoveBranch"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>" .. username .. "</username><password>" .. password .. "</password><branchId>" .. tostring(branchId) .. "</branchId></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_actionsURL, data)
end

function RemoveBulk(username, password, bulkId) 

    local _method = "RemoveBulk"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>" .. username .. "</username><password>" .. password .. "</password><bulkId>" .. tostring(bulkId) .. "</bulkId></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_actionsURL, data)
end
function SendMultipleSMS(username, password, to, from, text, isflash, udh, recId, status) 

    local _to = "<string>" .. table.concat(to, "</string><string>") .. "</string>"
    local _text = "<string>" .. table.concat(text, "</string><string>") .. "</string>"
    local _recId = "<long>" .. table.concat(recId, "</long><long>") .. "</long>"

    local _method = "SendMultipleSMS"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>" .. username .. "</username><password>" .. password .. "</password><to>" .. _to .. "</to><from>" .. from .. "</from><text>" .. _text .. "</text><isflash>" .. tostring(isflash) .. "</isflash><udh>" .. udh .. "</udh><recId>" .. _recId .. "</recId><status>" .. status .. "</status></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_actionsURL, data)
end
function SendMultipleSMS2(username, password, to, from, text, isflash, udh, recId, status) 

    local _to = "<string>" .. table.concat(to, "</string><string>") .. "</string>"
    local _text = "<string>" .. table.concat(text, "</string><string>") .. "</string>"
    local _from = "<string>" .. table.concat(from, "</string><string>") .. "</string>"
    local _recId = "<long>" .. table.concat(recId, "</long><long>") .. "</long>"
 

    local _method = "SendMultipleSMS2"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>" .. username .. "</username><password>" .. password .. "</password><to>" .. _to .. "</to><from>" .. _from .. "</from><text>" .. _text .. "</text><isflash>" .. tostring(isflash) .. "</isflash><udh>" .. udh .. "</udh><recId>" .. _recId .. "</recId><status>" .. status .. "</status></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_actionsURL, data)
end
function UpdateBulkDelivery(username, password, bulkId) 

    local _method = "UpdateBulkDelivery"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>" .. username .. "</username><password>" .. password .. "</password><bulkId>" .. tostring(bulkId) .. "</bulkId></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_actionsURL, data)
end



-- Schedule API Operations
function AddMultipleSchedule(username, password, to, from, text, isflash, scheduleDateTime, period) 

    local _to = "<string>" .. table.concat(to, "</string><string>") .. "</string>"
    local _text = "<string>" .. table.concat(text, "</string><string>") .. "</string>"
    local _schDates = "<string>" .. table.concat(scheduleDateTime, "</string><string>") .. "</string>"

    local _method = "AddMultipleSchedule"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>" .. username .. "</username><password>" .. password .. "</password><to>".._to.."</to><from>" .. from .. "</from><text>" .. _text .. "</text><isflash>" .. tostring(isflash) .. "</isflash><scheduleDateTime>" .. _schDates .. "</scheduleDateTime><period>" .. period .. "</period></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_scheduleURL, data)
end
function AddNewUsance(username, password, to, from, text, isflash, scheduleStartDateTime, countrepeat, scheduleEndDateTime, periodType) 

    local _method = "AddNewUsance"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>" .. username .. "</username><password>" .. password .. "</password><to>" .. to .. "</to><from>" .. from .. "</from><text>" .. text .. "</text><isflash>" .. tostring(isflash) .. "</isflash><scheduleStartDateTime>" ..scheduleStartDateTime .. "</scheduleStartDateTime><countrepeat>" .. tostring(countrepeat) .. "</countrepeat><periodType>" .. periodType .. "</periodType></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_scheduleURL, data)
end
function AddSchedule(username, password, to, from, text, isflash, scheduleDateTime, period) 

    local _method = "AddSchedule"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>" .. username .. "</username><password>" .. password .. "</password><to>" .. to .. "</to><from>" .. from .. "</from><text>" .. text .. "</text><isflash>" .. tostring(isflash) .. "</isflash><scheduleDateTime>" .. scheduleDateTime .. "</scheduleDateTime><period>" .. period .. "</period></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_scheduleURL, data)
end
function AddUsance(username, password, to, from, text, isflash, scheduleStartDateTime, repeatAfterDays, scheduleEndDateTime) 

    local _method = "AddUsance"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>" .. username .. "</username><password>" .. password .. "</password><to>" .. to .. "</to><from>" .. from .. "</from><text>" .. text .. "</text><isflash>" .. tostring(isflash) .. "</isflash><scheduleStartDateTime>" .. scheduleStartDateTime .. "</scheduleStartDateTime><repeatAfterDays>" .. tostring(repeatAfterDays) .. "</repeatAfterDays><scheduleEndDateTime>" .. scheduleEndDateTime .. "</scheduleEndDateTime></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_scheduleURL, data)
end
function GetScheduleStatus(username, password, scheduleId) 

    local _method = "GetScheduleStatus"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>" .. username .. "</username><password>" .. password .. "</password><scheduleId>" .. tostring(scheduleId) .. "</scheduleId></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_scheduleURL, data)
end
function RemoveSchedule(username, password, scheduleId) 

    local _method = "RemoveSchedule"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>" .. username .. "</username><password>" .. password .. "</password><scheduleId>" .. tostring(scheduleId) .. "</scheduleId></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_scheduleURL, data)
end
function RemoveScheduleList(username, password, scheduleIdList) 

    local _list = "<int>" .. table.concat(scheduleIdList, "</int><int>") .. "</int>"
    local _method = "RemoveScheduleList"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>" .. username .. "</username><password>" .. password .. "</password><scheduleIdList>" .. _list .. "</scheduleIdList></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_scheduleURL, data)
end

-- Voice API Operations
function GetSendSMSWithSpeechTextStatus(username, password, recId) 

    local _method = "GetSendSMSWithSpeechTextStatus"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>" .. username .. "</username><password>" .. password .. "</password><recId>" .. tostring(recId) .. "</recId></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_voiceURL, data)
end

function SendBulkSpeechText(username, password, title, body, receivers, DateToSend, repeatCount) 

    local _method = "SendBulkSpeechText"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>" .. username .. "</username><password>" .. password .. "</password><title>" .. title .. "</title><body>" .. body .. "</body><receivers>" .. receivers .. "</receivers><DateToSend>" .. DateToSend .. "</DateToSend><repeatCount>" .. tostring(repeatCount) .. "</repeatCount></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_voiceURL, data)
end

function SendBulkVoiceSMS(username, password, title, voiceFileId, receivers, DateToSend, repeatCount) 

    local _method = "SendBulkVoiceSMS"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>" .. username .. "</username><password>" .. password .. "</password><title>" .. title .. "</title><voiceFileId>" .. tostring(voiceFileId) .. "</voiceFileId><receivers>" .. receivers .. "</receivers><DateToSend>" .. DateToSend .. "</DateToSend><repeatCount>" .. tostring(repeatCount) .. "</repeatCount></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_voiceURL, data)
end

function SendSMSWithSpeechText(username, password, smsBody, speechBody, from, to) 

    local _method = "SendSMSWithSpeechText"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>" .. username .. "</username><password>" .. password .. "</password><smsBody>" .. smsBody .. "</smsBody><speechBody>" .. speechBody .. "</speechBody><from>" .. from .. "</from><to>" .. to .. "</to></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_voiceURL, data)
end

function SendSMSWithSpeechTextBySchduleDate(username, password, smsBody, speechBody, from, to, scheduleDate) 

    local _method = "SendSMSWithSpeechTextBySchduleDate"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>" .. username .. "</username><password>" .. password .. "</password><smsBody>" .. smsBody .. "</smsBody><speechBody>" .. speechBody .. "</speechBody><from>" .. from .. "</from><to>" .. to .. "</to><scheduleDate>" .. scheduleDate .. "</scheduleDate></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_voiceURL, data)
end

function UploadVoiceFile(username, password, title, base64StringFile) 

    local _method = "UploadVoiceFile"
    local data = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><" .. _method .. " xmlns=\"http://tempuri.org/\"><username>" .. username .. "</username><password>" .. password .. "</password><title>" .. title .. "</title><base64StringFile>" .. base64StringFile .. "</base64StringFile></".. _method .."></soap:Body></soap:Envelope>"
 
    makeRequest(_voiceURL, data)
end




local username = "username"
local password = "password"
local from = "5000..."
local to = "09123456789"
local text = "Lua Soap Test"
SendSimpleSMS2(username, password, from, to, text, false)