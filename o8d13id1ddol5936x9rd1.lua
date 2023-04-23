local ByteCode = {
	Bytes = {};
};

function ByteCode:GetByte(Text)
	for Idx = 1, #Text do
		ByteCode.Bytes[Idx] = string.byte(Text, Idx); 
	end;
end;

function ByteCode:Convert()
	local Text = "";
	for Idx = 1, #ByteCode.Bytes do
		Text = Text .. "\\" .. ByteCode.Bytes[Idx];
	end;
	return Text;
end;

function ByteCode:Obfuscate(Text)
	ByteCode:GetByte(Text);
	return "loadstring('" .. ByteCode:Convert() .. "')();";
end;

return ByteCode;
