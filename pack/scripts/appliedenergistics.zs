// Applied Energistics 2: main network blocks take aluminium plates and an MV circuit; AE2 processors stay the core.
// GTNH-only blocks (Advanced Inscriber, Crystal Growth Chamber, wireless connectors, Storage Reshuffle) ship without recipes; they get one here.
val circuit = <ore:circuitAdvanced>;
val hvCircuit = <ore:circuitElite>;
val al = <ore:plateAluminium>;
val steel = <ore:plateSteel>;
val stainless = <ore:plateStainlessSteel>;
val wrench = <ore:craftingToolWrench>;
val glass = <ore:blockGlass>;
val fluix = <ore:crystalFluix>;
val material = <appliedenergistics2:item.ItemMultiMaterial>;
val logic = material.definition.makeStack(22);
val calc = material.definition.makeStack(23);
val eng = material.definition.makeStack(24);
val wireless = material.definition.makeStack(41);
val formation = material.definition.makeStack(43);
val annihilation = material.definition.makeStack(44);
val pureFluix = material.definition.makeStack(12);
val part = <appliedenergistics2:item.ItemMultiPart>;
val cable = part.definition.makeStack(16);
val terminal = part.definition.makeStack(380);
val interfacePart = part.definition.makeStack(440);
val p2p = part.definition.makeStack(460);
val quartzGlass = <appliedenergistics2:tile.BlockQuartzGlass>;
val skyStone = <appliedenergistics2:tile.BlockSkyStone:1>;

val controller = <appliedenergistics2:tile.BlockController>;
recipes.remove(controller);
recipes.addShaped(controller, [[skyStone, pureFluix, skyStone], [circuit, eng, circuit], [skyStone, pureFluix, skyStone]]);

val drive = <appliedenergistics2:tile.BlockDrive>;
recipes.remove(drive);
recipes.addShaped(drive, [[al, eng, al], [cable, circuit, cable], [al, eng, al]]);

val meChest = <appliedenergistics2:tile.BlockChest>;
recipes.remove(meChest);
recipes.addShaped(meChest, [[glass, terminal, glass], [cable, circuit, cable], [al, fluix, al]]);

val interfaceBlock = <appliedenergistics2:tile.BlockInterface>;
recipes.remove(interfaceBlock);
recipes.addShaped(interfaceBlock, [[al, glass, al], [annihilation, circuit, formation], [al, glass, al]]);
recipes.addShapeless(interfaceBlock, [interfacePart]);

val assembler = <appliedenergistics2:tile.BlockMolecularAssembler>;
recipes.remove(assembler);
recipes.addShaped(assembler, [[al, circuit, al], [annihilation, <ore:craftingTableWood>, formation], [al, quartzGlass, al]]);

val craftingUnit = <appliedenergistics2:tile.BlockCraftingUnit>;
recipes.remove(craftingUnit);
recipes.addShaped(craftingUnit, [[al, calc, al], [cable, logic, cable], [al, circuit, al]]);

recipes.remove(p2p);
recipes.addShaped(p2p, [[null, circuit, null], [al, eng, al], [fluix, fluix, fluix]]);

// The inscriber is needed for the first processors, so it stays at steel and a wrench
val inscriber = <appliedenergistics2:tile.BlockInscriber>;
recipes.remove(inscriber);
recipes.addShaped(inscriber, [[steel, <minecraft:sticky_piston>, steel], [fluix, wrench, steel], [steel, <minecraft:sticky_piston>, steel]]);

recipes.addShaped(<appliedenergistics2:tile.BlockAdvancedInscriber>, [[stainless, hvCircuit, stainless], [inscriber, eng, inscriber], [stainless, hvCircuit, stainless]]);
recipes.addShaped(<appliedenergistics2:tile.BlockCrystalGrowthChamber>, [
    [al, circuit, al],
    [<appliedenergistics2:tile.BlockQuartzGrowthAccelerator>, <appliedenergistics2:tile.BlockFluix>, <appliedenergistics2:tile.BlockQuartzGrowthAccelerator>],
    [al, circuit, al]]);
val connector = <appliedenergistics2:tile.BlockWirelessConnector>;
recipes.addShaped(connector, [[al, wireless, al], [<ore:pearlFluix>, circuit, <ore:pearlFluix>], [al, calc, al]]);
recipes.addShaped(<appliedenergistics2:tile.BlockWirelessHub>, [[stainless, wireless, stainless], [connector, hvCircuit, connector], [stainless, eng, stainless]]);
recipes.addShaped(<appliedenergistics2:item.ToolWirelessKit>, [[null, wireless, null], [al, circuit, al], [null, al, null]]);
recipes.addShaped(<appliedenergistics2:tile.BlockStorageReshuffle>, [[al, eng, al], [cable, circuit, cable], [al, logic, al]]);
