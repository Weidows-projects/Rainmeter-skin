--[[
Name = CalcWave.lua
Author = Ñ©ÔÂ»¨
Vertion = 1.0
License = CC BY - NC - SA 4.0
Information = 
]]

function Initialize()
	local Flag=(tonumber(SKIN:GetVariable('CustomizeSkinWidth'))==0)
	if Flag then
		local Width=SKIN:GetVariable('WorkAreaWidth')
		SKIN:Bang('!SetVariable','SkinWidth',Width)
		SKIN:Bang('!Update')
	end
end

function Draw()
	local FilePath=SELF:GetOption('VariableFile')
	local Flag=SKIN:GetVariable('CustomizeSkinWidth')
	local SkinWidth=tonumber(SKIN:GetVariable('SkinWidth'))
	local BarWidth=tonumber(SKIN:GetVariable('BarWidth'))
	local BarGap=tonumber(SKIN:GetVariable('BarGap'))
	local BarAlpha=tonumber(SKIN:GetVariable('BarAlpha'))
	if BarAlpha>255 then BarAlpha=255
	elseif BarAlpha<0 then BarAlpha=50 end
	SkinWidth= SkinWidth>BarWidth and SkinWidth or BarWidth
	BarGap= BarGap>=0 and BarGap or 3
	local BarCount=math.floor((SkinWidth+BarGap)/(BarWidth+BarGap))
	
	SKIN:Bang('!SetVariable','SkinWidth',SkinWidth)
	SKIN:Bang('!SetVariable','BarGap',BarGap)
	SKIN:Bang('!SetVariable','BarCount',BarCount)
	SKIN:Bang('!SetVariable','BarAlpha',BarAlpha)
	SKIN:Bang('!Update')
	
	SKIN:Bang('!WriteKeyValue','Variables','SkinWidth','#SkinWidth#',FilePath)
	SKIN:Bang('!WriteKeyValue','Variables','BarAlpha','#BarAlpha#',FilePath)
	SKIN:Bang('!WriteKeyValue','Variables','BarWidth','#BarWidth#',FilePath)
	SKIN:Bang('!WriteKeyValue','Variables','BarGap','#BarGap#',FilePath)
	SKIN:Bang('!WriteKeyValue','Variables','BarFlip','#BarFlip#',FilePath)
	SKIN:Bang('!WriteKeyValue','Variables','BarCount','#BarCount#',FilePath)
	SKIN:Bang('!WriteKeyValue','Variables','CustomizeSkinWidth','#CustomizeSkinWidth#',FilePath)
	
	SKIN:Bang('!CommandMeasure','mFactoryBand','Factory()')
	SKIN:Bang('!CommandMeasure','mFactoryBar','Factory()')
end

