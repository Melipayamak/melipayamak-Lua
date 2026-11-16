local SoapBuilder = {}

local function escape(value)
    
    if type(value) == "boolean" then
        value = value and "true" or "false"
    end
    
    value = tostring(value or "")

    value = value:gsub("&", "&amp;")
                 :gsub("<", "&lt;")
                 :gsub(">", "&gt;")
                 :gsub('"', "&quot;")
                 :gsub("'", "&apos;")

    return value
end

local function serialize_parameter(param)
    local name = param.name
    local value = param.value

    if param.array then
        local items = {}

        for _, item in ipairs(value) do
            items[#items + 1] =
                "<" .. param.itemType .. ">" ..
                escape(item) ..
                "</" .. param.itemType .. ">"
        end

        return "<" .. name .. ">" ..
               table.concat(items) ..
               "</" .. name .. ">"
    end

    return "<" .. name .. ">" ..
           escape(value) ..
           "</" .. name .. ">"
end

function SoapBuilder.build(method, params)
    local body = {}

    for _, param in ipairs(params) do
        body[#body + 1] = serialize_parameter(param)
    end

    return [[
<?xml version="1.0" encoding="utf-8"?>
<soap:Envelope
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:xsd="http://www.w3.org/2001/XMLSchema"
    xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
    <soap:Body>
        <]] .. method .. [[ xmlns="http://tempuri.org/">
            ]] .. table.concat(body) .. [[
        </]] .. method .. [[>
    </soap:Body>
</soap:Envelope>
]]
end

return SoapBuilder