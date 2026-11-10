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

- EU → RF の変換機（LV / MV / HV）
- GT4 素材の追加：Ironwood、Steeleaf、Knightmetal、Fiery、Netherite、Dark Steel、Electrotine

## 進め方

1. 素材を足す必要がないもの（Iron Chests、Storage Drawers、Railcraft、ProjectRed、Thaumcraft のワンドキャップ）から MineTweaker で書く
2. 回路を要求するもの（AE2、OpenComputers、EnderIO、EMT）
3. fork で素材を足してから、Twilight Forest・Dark Steel・Botania の装飾
