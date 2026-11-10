# GT 化レシピの計画

`docs/design.md` の「他 Mod の金属部品・機械・道具を GT 流の部品から作る」を具体化したもの。魔術の研究・Infusion の手順は対象外。

## 使える部品

GT4 にモーターやポンプはない。使うのは次の部品と回路。

| 種類 | 鉱石辞書 | 作り方（GT4） |
|---|---|---|
| 板 | `plate<素材>` | ハンマー × インゴット 2、または Plate Bender |
| 棒 | `stick<素材>` | ヤスリ × インゴット、または Lathe |
| ボルト・ネジ・リング | `bolt` `screw` `ring<素材>` | 棒から加工 |
| 厚板 | `plateDense<素材>` | Plate Bender |

| 電圧帯 | 回路 | 代表的な素材 |
|---|---|---|
| LV | `circuitBasic` | 鉄・青銅・鋼鉄（序盤） |
| MV | `circuitAdvanced` | 鋼鉄・アルミニウム |
| HV | `circuitElite` | ステンレス・チタン |
| EV | `circuitMaster` | タングステン鋼 |

## GT4 が自動で済ませるもの（config のまま）

- バニラの道具・防具・バケツ・ホッパーなど：インゴット → 板 + ハンマー・ヤスリ（`recipereplacements`）
- IC2 の機械：鋼鉄の機械ブロックを要求（`harderrecipes`）
- 同じ形の他 Mod の道具も、素材が GT4 に登録されていれば同じ置き換えを受ける

## MineTweaker で書くもの

| Mod | 対象 | 電圧帯 | 置き換え |
|---|---|---|---|
| Iron Chests | 鉄・金・ダイヤ…のチェスト | LV〜 | インゴット → 板 |
| Storage Drawers | 金属の引き出し・アップグレード | LV | インゴット → 板 |
| EnderIO | 導管（アイテム・液体・ME） | LV〜MV | 導管の芯に GT の板とボルト、ME 導管は MV 回路 |
| EnderIO | Travel Anchor、Dark Steel | MV | Dark Steel を GT の Blast Furnace で作る合金にする（fork） |
| AE2 | コントローラー、ドライブ、各インターフェース | MV〜HV | 回路と板を要求 |
| OpenComputers | CPU・メモリ・カードの Tier 1/2/3 | MV/HV/EV | 各 Tier に対応する回路 |
| ComputerCraft | コンピューター・周辺機器 | LV | 済：Turtle は鋼板と回路 |
| Railcraft | レール、蒸気ボイラー、コークス炉以外の機械 | LV〜 | インゴット → 板・棒 |
| BuildCraft | パイプ（金属）、ポンプ、採掘機 | LV〜MV | ギアを GT の板・リングに置き換え |
| ProjectRed | ワイヤー、ゲート | LV | 赤石合金の線を GT4 の `circuitRedAlloy` 系に |
| Thaumcraft | ワンドキャップ（鉄・金・Thaumium）、Golem の核の金属部分 | LV〜MV | インゴット → 板・リング |
| Electro-Magic Tools | 電動ゴーグル・電動ワンド | MV〜HV | 回路と板 |
| Twilight Forest | 独自金属の道具・防具 | — | fork で素材登録後に GT4 の置き換えが効く |
| Botania | 装飾ブロック | LV | GT の機械（Assembler など）で作れるようにする |

## fork で作るもの

fork の版は `v417.58`（`pack/mods/gregtechmod-v417.58.jar`）。

### EU → RF 変換機

| ID（`gregtech_addon:machine`） | 名前 | 入力電圧 | RF 出力（最大） | レシピ |
|---|---|---|---|---|
| 118 | LV EU to RF Converter | 32 EU | 128 RF/回 | 鉄板 4・銅線 2・LV 回路 2・機械ブロック・赤石の粉 |
| 119 | MV EU to RF Converter | 128 EU | 512 RF/回 | 鋼板 4・金線 2・MV 回路 2・Advanced Machine Casing・LV 変換機 |
| 120 | HV EU to RF Converter | 512 EU | 2048 RF/回 | ステンレス板 4・鉄線（HV）2・HV 回路 2・Highly Advanced Machine Casing・MV 変換機 |

- 1 EU = 4 RF。前面（レンチで向きを変える）から RF を出し、残り 5 面で EU を受ける。前面以外では RF をつながない
- 毎 tick、前面の RF 受け手（`IEnergyReceiver`）に押し出す。RF 側から引き出す（`extractEnergy`）こともできる。1 回に変換するのは電圧 1 パケット分まで
- 電圧を超える EU が入ると GT4 のほかの機械と同じく爆発する。トランス・バッテリーのアップグレードは受け付けない。内部の EU バッファは電圧 × 64
- 見た目は GT4 の Charger Box と同じテクスチャの流用（LV は普通の機械、MV は Advanced、HV は Highly Advanced の外装。前面は各電圧の出力面）
- RF API は CoFH Core の `cofh.api.energy`。fork のビルドは元から `libs/CoFHCore-...-dev.jar` を compile 依存にしているので、jar には入れていない（実行時はパックの CoFH Core を使う）

### 素材

部品は GT4 が素材の ID と種類から自動で作り、色は RGB で付ける（テクスチャの追加はなし）。インゴットは元の Mod のものを使い、GT4 はインゴットを作らない。

| 素材（GT4 名） | 鉱石辞書の元 | GT4 の部品 | 加工 |
|---|---|---|---|
| IronWood（既存、338） | TF `ingotIronwood` を GT4 が `ingotIronWood` でも登録 | 粉・ナゲット・板・棒・ボルト・ネジ・リング・弾・歯車 | TF のまま |
| SteelLeaf（既存、339） | TF `ingotSteeleaf` → `ingotSteelLeaf` | 粉・ナゲット・板・棒・ボルト・ネジ・リング・弾（歯車なし） | TF のまま |
| FieryBlood（既存、ID なし → 346。表示名は Fiery） | TF `ingotFiery` → `ingotFieryBlood` | SteelLeaf と同じ | TF のまま |
| Knightmetal（新規、347） | TF `ingotKnightmetal` | SteelLeaf と同じ | TF のまま（`oreKnightmetal` は GT4 の鉱石処理から外す） |
| Netherite（新規、348） | Et Futurum `ingotNetherite` | SteelLeaf と同じ | Et Futurum のまま（`oreNetherite` が来ても GT4 の鉱石処理はしない） |
| DarkSteel（新規、349） | EnderIO `ingotDarkSteel` | SteelLeaf と同じ | Blast Furnace：鋼インゴット + 黒曜石の粉 → Dark Steel（1000K、120 EU/t、400 tick） |
| Electrotine（既存、819） | ProjectRed `dustElectrotine`（GT4 は粉を作らない） | 板・小さい粉・極小の粉 | Chemical Reactor：赤石の粉 4 + Electrum の粉 1 → Electrotine の粉 4（30 EU/t、400 tick） |

- 板はハンマー（インゴット 2）・Plate Bender、棒はヤスリ・Lathe で、GT4 の通常の金属と同じ
- 道具・防具の置き換え（`recipereplacements`）が効いたもの：IronWood・SteelLeaf・FieryBlood・Knightmetal の TF の道具と防具、EnderIO の Dark Steel の道具と防具。板とハンマーを要求するようになった。Netherite の装備は鍛冶台での強化なので対象外
- EnderIO の Dark Steel を Alloy Smelter で作る仮のレシピ（`pack/scripts/enderio.zs`）は消した

## 進め方

1. 素材を足す必要がないもの（Iron Chests、Storage Drawers、Railcraft、ProjectRed、Thaumcraft のワンドキャップ）から MineTweaker で書く
2. 回路を要求するもの（AE2、OpenComputers、EnderIO、EMT）
3. fork で素材を足してから、Twilight Forest・Dark Steel・Botania の装飾

## 実装状況（2026-11-11）

スクリプトは Mod ごとに `pack/scripts/<mod>.zs`。工具は鉱石辞書名（`craftingToolHardHammer` など）をそのまま材料に置く。

| Mod | 内容 | 工具 |
|---|---|---|
| Railcraft | 鉄・鋼・Aluminium〜Neutronium の液体タンク（壁・ゲージ・バルブ、各 8 個）、Electric Shunting Wire。どれも GTNH の core mod 任せでレシピがなかった | 壁にハンマー。金床にハンマー、信号箱にドライバー |
| Thaumcraft | 鉄キャップ（作業台レシピ）にハンマー。Arcane のキャップは工具なし | ハンマー |
| Forestry | 銅・スズ・青銅ギア（板 4 + リング）、Sturdy Casing、電動の機械（Bottler・Carpenter・Centrifuge・Fermenter・Squeezer・Still・Fabricator・Electrical Engine・Generator）に LV 回路。Raintank と各エンジンは板。Multifarm（建材 11 種それぞれ。Gearbox・Control に LV 回路、Hatch・Valve は付け替え時に NBT の見た目を引き継ぐ）、Alveary の Swarmer・Fan・Heater・Hygroregulator・Sieve を板に（Fan・Heater に LV 回路） | レンチ |
| BuildCraft | 鉄・金・ダイヤのギア、鉄エンジン、Pump・Mining Well に LV 回路、Flood Gate、鉄・金のアイテムパイプ（全 17 色）を板に | レンチ |
| HarvestCraft | Pot・Skillet・Saucepan・Cutting Board・Presser・Oven を板に（鉄・銅・鋼・青銅のどれでも） | Presser にハンマー |
| 小物 | ForgeMultipart の鉄ノコ、Carpenter's ハンマー・ノミ（`smalltools.zs`）、Et Futurum のランタン・鎖・鉄トラップドア・鍛冶台・石切台・溶鉱炉 | ヤスリ・ハンマー |
| AE2 | Controller・Drive・ME Chest・Interface・Molecular Assembler・Crafting Unit・ME P2P に MV 回路とアルミ板。Inscriber は鋼板 + レンチ（最初のプロセッサーに要るので MV にしない）。GTNH 専用ブロック（Advanced Inscriber・Crystal Growth Chamber・Wireless Connector/Hub・Wireless Kit・Storage Reshuffle）はレシピがなかったので追加 | レンチ |
| OpenComputers | CPU・メモリ・HDD・GPU・APU・データカード・無線/インターネットカード・ケース・画面・サーバーに Tier 1/2/3 = MV/HV/EV 回路。OC のマイクロチップは残す | なし |
| EnderIO | 合金 8 種・End Steel・Endergy 合金 7 種と Fused Quartz 4 種を GT4 の Alloy Smelter に追加（EnderIO 側の機械を外したので作れなかった。3 材料のレシピは 3 つ目を省き、Pink Slime はスライムボールで代用）。アイテム・液体・電力・Endergy（12 種）の導管にボルト、ME 導管と Travel Anchor に MV 回路 | なし |
| Advanced Solar Panels | Advanced = HV、Hybrid・Ultimate = EV 回路、Molecular Transformer = HV。ソーラーヘルメットも同じ割り当て（元の形のまま） | なし |
| GraviSuite | Gravi Chestplate・Vajra・Ultimate Lappack に EV 回路とタングステン鋼板、Advanced Jetpack・Nano Chestplate・GraviTool・Advanced Drill・Advanced Chainsaw に HV 回路、Advanced Lappack に HV 回路とステンレス板 | なし |
| Electro-Magic Tools | Iron Omnitool・Diamond Chainsaw に MV 回路（Omnitool は鋼板も）。Solar Goggles of Revealing は作業台レシピを追加（Hybrid Solar Panel + EV 回路） | なし |
| Thaumic Energistics | Essentia セルのケースと直接レシピに MV 回路 | なし |
| Botania | 装飾ブロックの元を Assembler（16 EU/t）で作る：石 8 + 花びら → Livingrock 8、原木 8 + 花びら → Livingwood 8、Livingwood 8 + エンダーパール → Dreamwood 8、ガラス 4 + ラピス → Managlass 4、Managlass 4 + グロウストーンダスト → Alfglass 4、Livingrock 8 / Dreamwood Planks 8 + Alfglass → Shimmerrock / Shimmerwood Planks 8、ネザークォーツ 4 + ラピス / グロウストーンダスト → Mana / Elven Quartz 4。レンガ・ハーフブロック・階段・塀・板ガラス・Pavement・クォーツブロック・花びらブロック・Glimmering Flower・Custom Brick（Hellish Brick など）は Botania の作業台レシピのまま（`removals.zs` の削除対象から外した） | なし |

GT4 の機械レシピは fork の CraftTweaker 連携で足せる（`mods.gregtechmod.recipe.RecipeMaps.getRecipeMap("ALLOY_SMELTING").factory()...buildAndRegister()`）。`mt reload` では取り消されない。

### 見送ったもの

- Iron Chests・Storage Drawers・ComputerCraft の既存レシピ：3×3 が埋まっていて工具を置く枠がない
- Forestry の Moistener・Rainmaker（電気を使わない）、Alveary 本体と Stabiliser（金属を使わない）
- EMT の Arcane/Infusion レシピ（魔術の手順は本家のまま）
- IC2 の AdvRecipe は材料の電気製品の充電量を完成品に引き継ぐが、MineTweaker のレシピは引き継がない（GraviSuite・ASP のヘルメット・EMT の道具は空の状態で出てくる）
- Railcraft のレール類は重くしない

### 入手手段がないアイテムの監査

全レシピ（作業台・Thaumcraft・Forestry・IC2・GT4・Railcraft・AE2・Blood Magic の機械）を書き出して、どこからも作れないアイテムを洗い出した。直したもの以外は次のとおり。

- 想定どおり：流体・バケツ、ドロップ・ワールド生成、儀式・Vat・祭壇など書き出していない仕組みで作るもの、クリエイティブ専用、無効化した機械（EnderIO の SAG Mill・Alloy Smelter、ProjectRed Expansion）、Forestry のカプセル類（Bottler の動的レシピ）、BuildCraft のチップセット（Assembly Table）
- Storage Drawers の Forestry・BoP 木材の引き出し：Chisel 連携が有効なときは作業台レシピを作らず、Chisel で通常の引き出しから変換する仕様
- EMT の GT5 連携でしかレシピが作られないもの：Solar Goggles of Revealing は作業台レシピを足した。Maintenance Focus は GT5 のメンテナンスハッチ用で GT4 では使い道がないので NEI から隠した。Compressed Solar はブロック自体が登録されていない
- 残している欠落：AE2 の Super ME Replenisher・Colorizer（用途未確認）、OpenComputers の Access Point・Switch（Relay に置き換え済みの旧ブロック）
