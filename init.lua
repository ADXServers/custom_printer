AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

local interval = 60

function ENT:Initialize()

	self:SetModel("models/props_lab/reciever01b.mdl")
	

	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)

	self.timer = CurTime()



	local phys = self:GetPhysicsObject()
	if phys:IsValid() then

		phys:Wake()

	end

end


function ENT:Think()
		
	if CurTime() > self.timer + interval then

		self.timer = CurTime()

		self:SetMoneyAmount(self:GetMoneyAmount() + 1200)

	end

end


function ENT:Use(act , call)



	local money = self:GetMoneyAmount()
	self:SetMoneyAmount(0)
	call:addMoney(money)

	if money == 0 then
		print("Printer empty")
	end
end