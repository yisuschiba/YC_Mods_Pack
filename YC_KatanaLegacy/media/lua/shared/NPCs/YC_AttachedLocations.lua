local group = AttachedLocations.getGroup("Human")
group:getOrCreateLocation("YCN Big Blade On Back with Bag"):setAttachmentName("YCN_big_blade_back_bag")
group:getOrCreateLocation("YCN Blade On Back"):setAttachmentName("YCN_blade_back")
group:getOrCreateLocation("YCO Big Blade On Back with Bag"):setAttachmentName("YCO_big_blade_back_bag")
group:getOrCreateLocation("YCO Blade On Back"):setAttachmentName("YCO_blade_back")
group:getOrCreateLocation("YCSageo Right"):setAttachmentName("YCSageo_right")
group:getOrCreateLocation("YCSageo Left"):setAttachmentName("YCSageo_left")
group:getOrCreateLocation("YCSageoU Right Upside"):setAttachmentName("YCSageoU_right_upside")
group:getOrCreateLocation("YCSageoU Left Upside"):setAttachmentName("YCSageoU_left_upside")

if getDebug() then
	group:getOrCreateLocation("OnBack"):setAttachmentName("back")
end
