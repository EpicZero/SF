---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Bergi.
--- DateTime: 02.01.2020 15:39
---
---
do
	function InitTrig_Entire()
		gg_trg_EntireGui = CreateTrigger()
		TriggerRegisterEnterRectSimple(gg_trg_EntireGui, GetPlayableMapRect())
		TriggerAddAction(gg_trg_EntireGui, function()
			--события для всех юнитов внов появившихся на карте
			local u=GetTriggerUnit()
			local h=GetHandleId(u)
			local data=HandleData[GetHandleId(u)]
			if (data==nil) then data = {} HandleData[GetHandleId(u)] = data end
			data.over=0
			--print(GetUnitName(u).." is entering")
			if IsUnitInGroup(u,SingleTarget)==false and GetUnitAbilityLevel(u,FourCC('Aloc'))==0 then
				IssuePointOrder(u,"attack",gex(ownplayer),gey(ownplayer))
				anydata[h]=0
				GroupAddUnit(Allunits,u)
			else
				--print(GetUnitName(target).." является отдельной целью атаки")--юнит имеет отдельную цель
			end
		end)
	end
end