-- Cargando el archivo principal del juego que contiene la definición de la tabla ISHotbarAttachDefinition
require 'Hotbar/ISHotbarAttachDefinition'

-- Accediendo a la tabla ISHotbarAttachDefinition
local ISHotbarAttachDefinition = ISHotbarAttachDefinition

-- Accediendo a la subtabla Back
local Back = ISHotbarAttachDefinition[5]

-- Accediendo a la subtabla attachments dentro de la tabla Back
local attachments = Back.attachments

-- Agregando un par clave-valor a la subtabla attachments
attachments.YCNBigBlade = "YCN Blade On Back"
attachments.YCOBigBlade = "YCO Blade On Back"

-- Accediendo a la subtabla replacements dentro de la tabla ISHotbarAttachDefinition
local replacements = ISHotbarAttachDefinition.replacements

-- Accediendo a la subtabla BackReplacement dentro de la tabla replacements
local BackReplacement = replacements[1]

-- Accediendo a la subtabla replacement dentro de la tabla BackReplacement
local replacement = BackReplacement.replacement

-- Agregando un par clave-valor a la subtabla replacement
replacement.YCNBigBlade = "YCN Big Blade On Back with Bag"
replacement.YCOBigBlade = "YCO Big Blade On Back with Bag"

-- Accediendo a la subtabla SmallBeltLeft
local SmallBeltLeft = ISHotbarAttachDefinition[1]

--Accediendo a la subtabla attachments dentro de la tabla SmallBeltLeft
local attachments = SmallBeltLeft.attachments

-- Agregando un par clave-valor a la subtabla attachments
attachments.YCSageo = "YCSageo Left"
attachments.YCSageoU = "YCSageoU Left Upside"

-- Accediendo a la subtabla SmallBeltRight
local SmallBeltRight = ISHotbarAttachDefinition[2]

--Accediendo a la subtabla attachments dentro de la tabla SmallBeltRight
local attachments = SmallBeltRight.attachments

-- Agregando un par clave-valor a la subtabla attachments
attachments.YCSageo = "YCSageo Right"
attachments.YCSageoU = "YCSageoU Right Upside"
