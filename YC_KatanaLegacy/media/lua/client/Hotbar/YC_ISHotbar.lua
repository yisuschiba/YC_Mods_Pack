

function ISHotbar.doMenuFromInventory(playerNum, item, context)
	local self = getPlayerHotbar(playerNum);
	if self == nil then return end
	if self:isInHotbar(item) and item:getAttachmentType() and item:getAttachedSlot() ~= -1 then
		local slot = self.availableSlot[item:getAttachedSlot()]
		local slotName = getTextOrNull("IGUI_HotbarAttachment_" .. slot.slotType) or slot.name;
		context:addOptionOnTop(getText("ContextMenu_RemoveFromHotbar", self.attachedItems[item:getAttachedSlot()]:getDisplayName(), slotName), self, ISHotbar.removeItem, self.attachedItems[item:getAttachedSlot()], true);
	end
	if item:getAttachmentType() and not self:isInHotbar(item) and not item:isBroken() and self.replacements[item:getAttachmentType()] ~= "null" then
		local subOption = context:addOptionOnTop(getText("ContextMenu_Attach"), nil);
		local subMenuAttach = context:getNew(context);
		context:addSubMenu(subOption, subMenuAttach);
		
		local found = false;
		for slotIndex, slot in pairs(self.availableSlot) do
			local slotDef = slot.def;
			for i, v in pairs(slotDef.attachments) do
				if item:getAttachmentType() == i then
					local doIt = true;
					local name = getTextOrNull("IGUI_HotbarAttachment_" .. slot.slotType) or slot.name;
					if self.replacements and self.replacements[item:getAttachmentType()] then
						slot = self.replacements[item:getAttachmentType()];
						if slot == "null" then
							doIt = false;
						end
					end
					if doIt then
						local option = subMenuAttach:addOption(name, self, ISHotbar.attachItem, item, v, slotIndex, slotDef, true);
						if self.attachedItems[slotIndex] then
							local tooltip = ISWorldObjectContextMenu.addToolTip();
							tooltip.description = tooltip.description .. getText("Tooltip_ReplaceWornItems") .. " <LINE> <INDENT:20> "
							tooltip.description = tooltip.description .. self.attachedItems[slotIndex]:getDisplayName()
							option.toolTip = tooltip
						end 
						found = true;
					end
				end
			end
		end
		-- didn't found anything to it, gonna add the possibilities as a tooltip
		if not found then
			subOption.notAvailable = true;
			local tooltip = ISWorldObjectContextMenu.addToolTip();
			local text = getText("Tooltip_CanBeAttached") .. " <LINE> <INDENT:20> ";
			for i,v in pairs(ISHotbarAttachDefinition) do
				if v.attachments then
					for type,atch in pairs(v.attachments) do
						if type == item:getAttachmentType() then
							text = text .. getText("IGUI_HotbarAttachment_" .. v.type) .. " <LINE> "
						end
					end
				end
			end
			subOption.subOption = nil;
			tooltip.description = text;
			subOption.toolTip = tooltip;
		end
	end
end




-- Set the variable depending on where the item is (to trigger either back, holster or belt anim..)
function ISHotbar:setAttachAnim(item, slot)
	if slot then
		self.chr:SetVariable("AttachAnim", slot.animset);
		return;
	end
	for i,slot in pairs(self.availableSlot) do
		if slot.def.type == item:getAttachedSlotType() then
			self.chr:SetVariable("AttachAnim", slot.def.animset);
			break;
		end
	end
end

-- remove an item from the hotbar
function ISHotbar:removeItem(item, doAnim)
	if doAnim then
		self:setAttachAnim(item);
		ISTimedActionQueue.add(ISDetachItemHotbar:new(self.chr, item));
	else
		self.chr:removeAttachedItem(item);
		item:setAttachedSlot(-1);
		item:setAttachedSlotType(nil);
		item:setAttachedToModel(nil);
		
		self:reloadIcons();
	end
end

function ISHotbar:isItemAttached(item)
	for i, attached in pairs(self.attachedItems) do
		if attached == item then
			return true;
		end
	end
	return false;
end


function ISHotbar:attachItem (item, slot, slotIndex, slotDef, doAnim)
	if doAnim then
		if self.replacements and self.replacements[attachmentType] and isBack(slot) then
			slot = self.replacements[attachmentType];
		end
		self:setAttachAnim(item, slotDef);
		ISInventoryPaneContextMenu.transferIfNeeded(self.chr, item)
		if self.attachedItems[slotIndex] then
			ISTimedActionQueue.add(ISDetachItemHotbar:new(self.chr, self.attachedItems[slotIndex]));
		end
		ISTimedActionQueue.add(ISAttachItemHotbar:new(self.chr, item, slot, slotIndex, slotDef));
	else
		if self.replacements and self.replacements[attachmentType] and isBack(slot) then
			slot = self.replacements[attachmentType];
			if slot == "null" then
				self:removeItem(item, false);
				return;
			end
		end
		self.chr:setAttachedItem(slot, item);
		item:setAttachedSlot(slotIndex);
		item:setAttachedSlotType(slotDef.type);
		item:setAttachedToModel(slot);
		
		self:reloadIcons();
	end
end

function ISHotbar:reloadIcons()
	self.attachedItems = {};
	for i=0, self.chr:getInventory():getItems():size()-1 do
		local item = self.chr:getInventory():getItems():get(i);
		if item:getAttachedSlot() > -1 then
			self.attachedItems[item:getAttachedSlot()] = item;
		end
	end
end

function isBack(slot)
	if not slot then return false end
	return string.find(slot," Back");
end

