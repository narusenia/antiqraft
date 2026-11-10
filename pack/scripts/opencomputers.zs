// OpenComputers: tiered parts take GT circuits (Tier 1/2/3 = MV/HV/EV) next to OC's own microchips.
// The circuit takes the place of a redstone, nugget or spare slot so the shapes stay recognisable.
val c1 = <ore:circuitAdvanced>;
val c2 = <ore:circuitElite>;
val c3 = <ore:circuitMaster>;
val oc = <OpenComputers:item>;
val chip1 = oc.definition.makeStack(24);
val chip2 = oc.definition.makeStack(25);
val chip3 = oc.definition.makeStack(26);
val alu = oc.definition.makeStack(27);
val cu = oc.definition.makeStack(28);
val pcb = oc.definition.makeStack(32);
val card = oc.definition.makeStack(33);
val disk = oc.definition.makeStack(19);
val ironNugget = <ore:nuggetIron>;
val goldNugget = <ore:nuggetGold>;
val diamondChip = <ore:chipDiamond>;
val iron = <ore:plateIron>;
val gold = <ore:plateGold>;
val diamond = <ore:gemDiamond>;
val piston = <ore:craftingPiston>;
val obsidian = <ore:obsidian>;
val bars = <minecraft:iron_bars>;

// CPUs: N R N / chip CU chip / N ALU N, redstone -> circuit
val cpus = [oc.definition.makeStack(29), oc.definition.makeStack(42), oc.definition.makeStack(43)] as minetweaker.item.IItemStack[];
val cpuNuggets = [ironNugget, goldNugget, diamondChip] as minetweaker.item.IIngredient[];
val chips = [chip1, chip2, chip3] as minetweaker.item.IItemStack[];
val circuits = [c1, c2, c3] as minetweaker.item.IIngredient[];
for i, cpu in cpus {
    recipes.remove(cpu);
    recipes.addShaped(cpu, [[cpuNuggets[i], circuits[i], cpuNuggets[i]], [chips[i], cu, chips[i]], [cpuNuggets[i], alu, cpuNuggets[i]]]);
}

// Memory: whole tiers (1, 2, 3) swap the nugget for the circuit, half tiers add it under the chips
val rams = [oc.definition.makeStack(1), oc.definition.makeStack(2), oc.definition.makeStack(38)] as minetweaker.item.IItemStack[];
for i, ram in rams {
    recipes.remove(ram);
    recipes.addShaped(ram, [[chips[i], circuits[i], chips[i]], [null, pcb, null]]);
}
val halfRams = [oc.definition.makeStack(50), oc.definition.makeStack(3)] as minetweaker.item.IItemStack[];
for i, ram in halfRams {
    recipes.remove(ram);
    recipes.addShaped(ram, [[chips[i], chips[i + 1], chips[i]], [circuits[i], pcb, null]]);
}
val ram6 = oc.definition.makeStack(39);
recipes.remove(ram6);
recipes.addShaped(ram6, [[chip3, c3, chip3], [chip2, pcb, chip2]]);

// Hard disks: plates instead of ingots, circuit on the top chip
val hdds = [oc.definition.makeStack(5), oc.definition.makeStack(6), oc.definition.makeStack(7)] as minetweaker.item.IItemStack[];
val hddMetals = [<ore:plateSteel>, gold, diamond] as minetweaker.item.IIngredient[];
for i, hdd in hdds {
    recipes.remove(hdd);
    recipes.addShaped(hdd, [[circuits[i], disk, hddMetals[i]], [pcb, disk, piston], [chips[i], disk, hddMetals[i]]]);
}

// Graphics cards: circuit under the chip
val gpus = [oc.definition.makeStack(8), oc.definition.makeStack(9), oc.definition.makeStack(10)] as minetweaker.item.IItemStack[];
val gpuRams = [oc.definition.makeStack(1), oc.definition.makeStack(2), oc.definition.makeStack(38)] as minetweaker.item.IItemStack[];
for i, gpu in gpus {
    recipes.remove(gpu);
    recipes.addShaped(gpu, [[chips[i], alu, gpuRams[i]], [circuits[i], card, null]]);
}

// APUs (tier 2 and 3)
val bus1 = oc.definition.makeStack(70);
val bus2 = oc.definition.makeStack(71);
val apu1 = oc.definition.makeStack(101);
recipes.remove(apu1);
recipes.addShaped(apu1, [[goldNugget, c2, goldNugget], [cpus[1], bus1, gpus[0]], [goldNugget, chip1, goldNugget]]);
val apu2 = oc.definition.makeStack(102);
recipes.remove(apu2);
recipes.addShaped(apu2, [[diamondChip, c3, diamondChip], [cpus[2], bus2, gpus[1]], [diamondChip, chip2, diamondChip]]);

// Data cards
val dataCards = [oc.definition.makeStack(104), oc.definition.makeStack(105), oc.definition.makeStack(106)] as minetweaker.item.IItemStack[];
val dataTops = [[ironNugget, alu, chip2], [goldNugget, cpus[0], chip3], [diamondChip, cpus[1], oc.definition.makeStack(38)]] as minetweaker.item.IIngredient[][];
for i, dataCard in dataCards {
    recipes.remove(dataCard);
    recipes.addShaped(dataCard, [dataTops[i], [circuits[i], card, null]]);
}

// Network cards: wireless tier 1 = MV, wireless tier 2 and internet = HV
val wlan1 = oc.definition.makeStack(113);
recipes.remove(wlan1);
recipes.addShaped(wlan1, [[<ore:torchRedstoneActive>, chip1, <ore:torchRedstoneActive>], [c1, card, null]]);
val wlan2 = oc.definition.makeStack(13);
recipes.remove(wlan2);
recipes.addShaped(wlan2, [[<ore:materialEnderPearl>, chip2, c2], [null, card, null]]);
val internet = oc.definition.makeStack(44);
recipes.remove(internet);
recipes.addShaped(internet, [[oc.definition.makeStack(48), chip2, <ore:torchRedstoneActive>], [c2, card, obsidian]]);

// Cases: plates, one iron bar becomes the circuit
val cases = [<OpenComputers:case1>, <OpenComputers:case2>, <OpenComputers:case3>] as minetweaker.item.IItemStack[];
val caseMetals = [iron, gold, diamond] as minetweaker.item.IIngredient[];
for i, computerCase in cases {
    recipes.remove(computerCase);
    recipes.addShaped(computerCase, [[caseMetals[i], chips[i], caseMetals[i]], [circuits[i], <ore:chest>, bars], [caseMetals[i], pcb, caseMetals[i]]]);
}

// Screens: the chip becomes the circuit
val glass = <ore:blockGlass>;
val redstone = <minecraft:redstone>;
val glowstone = <minecraft:glowstone_dust>;
recipes.remove(<OpenComputers:screen1>);
recipes.addShaped(<OpenComputers:screen1>, [[iron, redstone, iron], [redstone, c1, glass], [iron, redstone, iron]]);
recipes.remove(<OpenComputers:screen2>);
recipes.addShaped(<OpenComputers:screen2>, [[gold, <ore:dyeRed>, gold], [<ore:dyeGreen>, c2, glass], [gold, <ore:dyeBlue>, gold]]);
recipes.remove(<OpenComputers:screen3>);
recipes.addShaped(<OpenComputers:screen3>, [[obsidian, glowstone, obsidian], [glowstone, c3, glass], [obsidian, glowstone, obsidian]]);

// Servers: the left chip becomes the circuit
val servers = [oc.definition.makeStack(45), oc.definition.makeStack(46), oc.definition.makeStack(40)] as minetweaker.item.IItemStack[];
val serverMetals = [iron, gold, diamond] as minetweaker.item.IIngredient[];
val serverRams = [oc.definition.makeStack(50), oc.definition.makeStack(3), ram6] as minetweaker.item.IItemStack[];
val serverBuses = [bus1, bus2, oc.definition.makeStack(72)] as minetweaker.item.IItemStack[];
for i, server in servers {
    recipes.remove(server);
    recipes.addShaped(server, [[serverMetals[i], serverRams[i], serverMetals[i]], [circuits[i], serverBuses[i], chips[i]], [obsidian, pcb, obsidian]]);
}
