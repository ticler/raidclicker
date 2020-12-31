
#SingleInstance, force
#NoEnv
#Warn, All, Outputdebug
SetWorkingDir %A_ScriptDir%
SetBatchLines -1
#MaxThreadsPerHotkey 2
global OMG_version := ""
FileRead, OMG_version, version.txt
SetTitleMatchMode, 3
global OMG_Client:=[]
global OMG_SaveScreenshots := FALSE
global OMG_SendMode := FALSE
global OMG_SendModeType := "Input"
global OMG_SellAllCh12 := TRUE
global OMG_boolSellAllCampaignLoot := TRUE
global OMG_CombatModeAuto := TRUE
global OMG_CombatSpeedX2 := TRUE
global OMG_ReplayDelay := 3
global OMG_ShowOSD := FALSE
global OMG_OSDmsg, OMG_OSDhdr, OMG_OSDxPos:=0, OMG_OSDyPos:=0
global OMG_OSDw := 250
global OMG_OSDh := 50
global ThisWinTitle, ThisWinW, ThisWinH, ThisWinX1, ThisWinY1, ThisWinX2, ThisWinY2
global OMG_EnergyRechargeDelay := FALSE
global OMG_DoLongWait := FALSE
global OMG_MsgBoxTitle := "OMGclick"
global OMG_MinimizeClientWindow := FALSE
global OMG_ClientCount := 1
global OMG_ClientType := "Plarium Play"
global OMG_ClientEXE := "Raid.exe"
global OMG_ClientWidth := 0
global OMG_ClientHeight := 0
global OMG_BlockInput := TRUE
global OMG_CheckBoostEXP2x := TRUE
global OMG_DynamicBattleTime := TRUE
global OMG_StopAtMaxLevel := TRUE
global OMG_boolOverrideMaxLevel := FALSE
global OMG_RoundTimeMin := 0
global OMG_RoundTimeSec := 10
global OMG_RoundTime := (((OMG_RoundTimeMin * 60) + OMG_RoundTimeSec ) * 1000)
global OMG_RestoreEnergy := FALSE
global OMG_EnergyNeededForRound := 8
global OMG_NumRuns := 0
global OMG_SellArtifacts := TRUE
global OMG_SellRank1 := 1
global OMG_SellRank2 := 1
global OMG_SellRank3 := 0
global OMG_SellRank4 := 0
global OMG_SellRank5 := 0
global OMG_SellRank6 := 0
global OMG_Debug := FALSE
global OMG_Experimental := FALSE
global OMG_FirstRun := TRUE
global OMG_ClientPID := []
global OMG_ClientNumRuns := []
global OMG_ClientRunsCompleted := []
global OMG_AllClientRunsComplete := TRUE
global OMG_ConfigFile := "OMGclick.ini"
global OMG_RanksToSell := []
global OMG_TxtLevelUp := "|<Level Up>0xECC765@0.70$94.S000DzzwD000S3zxs001zzzkw003sDzrU003zzz3s00DUzzS000D0007U00w3s1s000w000S007kDU7U003k001w00T0y0S000D0003k01s3s1s000w000D00DUDU7U003k000y00w0y0S000D0001s03k3s1s000w0007k0T0DU7U003k000D01s0y0S000D0000w07U3s1s000w0003s0y0DU7U003zzw07U3k0zzS000Dzzk0S0D03zxs000zzz01w1w0DzrU003zzw03k7U0zzS000D0000D0S03s1s000w0000S3k0DU7U003k0001sD00y0S000D00007Uw03s1s000w0000D7U0DU7U003k0000wS00y0S000D00003ls03s1s000w00007j00DU7U003k0000Tw00y0S000D00000zU03s1s000w00003y00DU7U003k0000Ds00y0TzzkDzzw00T003zxzzzUzzzs01w00Dzzzzy7zzzU07k00zzU"
OMG_TxtLevelUp .= "|<L>0xECC765@0.70$98.UT00000D003k7zzU87k00003k00w1zzz21w00000w00D0Tzzs0T00000D003k7U1z07k00003k00w1s07s1w00000w00D0S00y0T00000D003k7U07k7k00003k00w1s00w1w00000w00D0S00D0T00000D003k7U03k7k00003k00w1s00w1w00000w00D0S00D0T00000D003k7U03k7k00003k00w1s01w1w00000w00D0S00S0T00000D003k7U0TU7k00003k00w1w1zk1w00000w00D0Tzzs0T00000D003k7zzw07k00003k00w1zzs01w00000w00D0S0000T00000D003k7U0007k00003k00w1s0001w00000w00D0S0000T00000D007k7U0007k00003k01s1s0001w00000y00S0S0000T000007k0DU7U0007k00001y07k1s0001w00000Dk7s0S000kTzzw001zzw07U00A7zzz000Dzy01s0031zzzk000zy00y000U"
global OMG_BtnKeep := "|<Keep Button>0xFFFFFF@0.70$51.0000000030M000000M700000031k000000MQ0000003303k3kNsMs1z1z3zXC0QQQQQATk31X1X1ny0MAMAM6Ss7znzn0nXUzwzwM6QA303030n1kM0M0MCM73UXUXVX0MDwDwTwQ3Uz0z3T0000000M0000000300000000M0000000300000000M0000000004"
OMG_BtnKeep .= "|<Keep Button 2>#401@0.80$50.0000000061U0000010k000000EM0000004C0000001307s7sTsFU3333737s0UEUFUNy0M4M486Tk63a3W1aA1zlzkUNVUM0M086EA606021Y30k0k0UN0MC4C4AAM31y1y3y0000000U000000080000000200000001U000000080000000008"
global OMG_BtnStart := "|<Start Battle>0xFCFCFB@0.70$51.00000000000000000000000000Ts0000007bVU00060kAA0000kC1Vk00071k0zVy7Ty707sRszTUy0A337Uk1y1U0Qs603sA03b0k03VUDws600AA33b0kA1lUsQs61kCA63b0k73Vksws70Ts7Xzb0S0y0sDAM3U00000000U"
global OMG_BtnEditTeam := "|<Edit Team Arrows Icon>0xA9DFEB@0.90$24.000k000w3zzy7zzz7zzw7U0k700U70007000700M700s000s000s100s300sDzzszzzsTzzs7U001000U"
global OMG_BtnReplay := "|<Replay Arrow Loop Icon>0xAADFEB@0.90$19.06003k0Dy0Tz0Ty0SC0S43C03j01z00TU0Dk07s03y01r01nk1sw1sTzw3zs0zs03U4"
global OMG_BtnNextStage := "|<Button: Next Stage>0xECDF9E@0.75$29.0000000200106003UD007kT00DkzUTzsTUzzwTlzzwDnzzsTbzz3wDzwDk0TVy00w3s01k7U020A000000E"
global OMG_BtnSell := "|<Sell Artifact>0xFFFFFF@0.70$35.000044Dk00ABzk00MP1k00ky1U01Vw00w33M03y66w0AAAAz0sAMMTVUMkk7XzlVU37zX3U6A067UCQ0ADUMM8MPzkzkkly0T1Vk"
OMG_BtnSell .= "|<Sell Artifact>0xFFFFFF@0.70$35.0000227U00AAzk00MPVk00kq1k01Vg1U033Q01y66Q06CAAS0MAMMTUkMkk7VktVU3bzn303C067k6A0ABUQQ0MNlkQMklz0TVVk"
OMG_BtnSell .= "|<Sell Artifact>0xFFFFFF@0.70$35.3U0066Ts00ABks00MP0k00ky1U01Vg01y33Q07C66S0ACAATUsAMM7Vkskk3XzlVU37033k7A067kAQ0ABksQQMNzUTkks"
OMG_BtnSell .= "|<Sell Artifact DS125>#447@0.80$36.0000000000223s00227w0022A60022M30022M00M22A01y22C033227U61221w61220C7322037z22036022M36022Q33022CC3X223w0y22000000U"
global OMG_BtnRestoreEnergy := "|<40 Gems on Get and Use Button>**50$66.0007k0000000s00S0000000c007U01wDw0i00Q003wSS2Vs7J003AM7wkTxT006AnncM0D0A0CArvsA0s080AgqN6A3k0U0NgaN3a7U600vgaN1qC0Q00ngaN0zA2E01bgaN0T40U01jjaN01y3003DbaN00M200301aN0086003x3qN0084003zbnv004AU001gln00a9U001YM600k30001wDy00E30000s7s00M6000000000AA0000000U"
OMG_BtnRestoreEnergy .= "|<>#1137@0.70$96.00000000000000000000000000k000000000000000k1U60000A0000000k1U60000A0000000k1U60000A0000000k1U6007sz01y6S0zk1U63sDwz03z7z1zk1U67QAAA063733Vk1U6A6M6A00363X0k1U6A0MCA00761X0k1U6C0TyA03z61X0k1U67sTwA07361X0k1U61wM0A06361X0k1kC0CM0A06361X0k0kAA6A4A07761VVk0sQA6DwD03z61Vzk0Ts7w3s701n610wk0Dk3s0000000000000000U"
global OMG_BtnGetNow := "|<Get Now>0xFFFFFF@0.70$87.000000000000000200000000000007y00000Q1k00001ss00603kC00000A3U00k0S1k00003UA00C03sC00000M00TXw0TVkTVUkn007SD03AC7CAC6M01kkk0Mllkslkn00A66037CA36D6MTVUsk0MNnUMlNX0QTz6033iQ32NAM1XU0k0MDnUMPBXUAA06030yA33lwA1VU0k0M7lUsS70sQ666030S6C1ks3z0Tkw0Q1kzUA707U1s3U1041k0UE000000000000004"
global OMG_BtnGetNowCancel := "|<Cancel Get Now>0xFFFFFF@0.70$69.000000000000200000000063y000000000kss000000006C3U00000000lUA000000006Q0Uz3jUTUTUnU0CQTQ7C7C6Q011XVlksksnU00AQ6A2C36Q003XUlU1kMnU0DwQ6A0Dz6Q03VXUlU1k0lUAMAQ6A0A06C1X1XUlktk0kssQSQ6767263y1znUkTUTkk7074840k0s4000000000004"
global OMG_BtnCOnfirm := "|<Button: Confirm Refill>0xFFFFFF@0.70$82.000000000000000000000Q000000T000003n000007z00000QC00000sA00001U0000030M00006000000Q1US0bUy44lD7VU03y7z7wszDzz600MMQA633ksSCM030lUkMAC31kNU0A363VUkkA71a00kAM66330kQ6M030lUMMAA31kNk6A361VUkkA71X0MkAM66330kQ6C3XVlUMMAA31kMTw7y61VUkkA71UzUDkMC63X0kQ600000000000002"
global OMG_ImgTimerDim := "|<Dim White Timer Icon>0x32404E@0.90$15.1w0zsDzXvywTzXzsTz3zs0z07w1vkCT7lzw7z0DUU"
global OMG_ImgResourceAdd := "|<Resource (+)>*89$14.zzzXzszyDzXzszU0M07szyDzXzszyDzzy"
global OMG_TxtInfo := "|<Info Button>*99$34.zzztzyzzy3zlzzsTz7zz7zwTzwTzlm7US360C1k4MMwSA1Xllls6D777kMwQQT1Xlllw6D777kMwQSS1Xlls16D77k7zzzzvs"
global OMG_TxtMaxLevel := "|<Max Level>0x6EEBF7@0.70$73.k20000000000w30000300000S1U0001U0000D1kw800k1k277ksn6E0M3AXAnco0Vs0A12F49qG0ks060ngXCv97sA030zWnyQwW4C01U81kUCQF6BU0k60sM768z4N0TXgACm00C0007kQ01k0000000000000000000000000000000000000000000000000000000000000000000000000zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw"
global OMG_TxtAutoCombatOFF := "|<Auto Combat OFF>0xD8CE9C@0.70$45.0000000070000000s003000D000Q001w003U00RUMQy7s3C33XVlUMkMQQAC6633XXUkksMQQQ67z33XX0lzsMQQQ6A3X3XVVnUAQwACAM1lzVsz0002000U00000004"
global OMG_TxtAutoCombatON := "|<Auto Combat ON>0x71F3FF@0.70$45.0000000070000000s001000D000Q001w003U009UMQy7s3A33XVlUMkMQQA66633XVUkksMQQM67z33XX0lzsMQQQ6A3X3XVUnUAQwACAM1lzVkz00000000U"
global OMG_TxtCombatSpeed1 := "|<Combat Speed 1>0xD8CE9C@0.70$26.00000001s001y001zU00Tsk64CC3U3Xls0sQQ0C3j03UzU0s7k0C1w03UT00s7s0C3y03Vvk0sQQ0CD7U3bUw0s0000U"
global OMG_ImgChampions := "|<Champions>0xF8F8F8@0.70$90.00000000000000070U000000200000DkU000000200000MMU000000000000kMU000000000000k0z1wDzkz23sTUyU0lX4AQElX6AMlWU0VU68MMUX44El0U0UUC88MUX46EFkU0UXi88MUn46EEyk8UW688MUW46EE6kMUW688MUW44EF3RkUXC88MvX7QEFaDUUVy88Mz33sEEw00000000U00000000000000U00000000000000U00000000000000U000000U"
global OMG_TxtLevelUp := "|<Level Up>#1004@0.70$54.w00D0Tzy0w00D0Tzzkw00D0Tzzsw00D0S07ww00D0S01yw00D0S00yw00D0S00Tw00D0S00Dw00D0S00Dw00D0S00Dw00D0S00Dw00D0S00Dw00D0S00Dw00D0S00Tw00D0S00Sw00D0S01yw00D0T0Tww00D0Tzzsw00D0Tzzkw00D0Tzy0w00D0S000w00D0S000w00D0S000w00D0S000w00T0S000w00S0S000y00S0S000T00y0S000TU1w0S000Dk7s0S0007zzk0S0003zzU0S0000zy00y000U"
global OMG_img2xEXP := "|<2x EXP Boost Active>0xCADA67@0.70$29.zzzzzzzzzzzzzzz3k0Dy3007w440Dw0MsDw0lkTs3XUzs701zkC07z0Q0Ty0M7zs0lzzkUXzz1U7zy7UDzzzzzzzzzzzzzzzy"
global OMG_ImgArtifacts := []
OMG_ImgArtifacts["Accuracy"] = "|<Accuracy>0x088EFE@0.70$18.0000+01dU2+E598+0c88I4QISSy4QE80Q+0c5dM2Qk1jU080000U"
OMG_ImgArtifacts["Accuracy"] .= "|<Accuracy>0x088AF7@0.70$18.0000+019U6+E598+0c88IAQISSyAQI+0Q+0c59M2Qk1zU080000U"
OMG_ImgArtifacts["Accuracy"] .= "|<Accuracy>0x088EFF@0.70$18.0000401ZU24E4Yc504+4I+S4TSS+CA+0I5046Zc3SE1zU0A0000U"
OMG_ImgArtifacts["Avenging"] := "|<Set: Avenging 1>0xCE04DE@0.70$15.0E0200E0200E4DVQ3lqs3o0700s0700s0700s0600E4"
OMG_ImgArtifacts["Avenging"] .= "|<Set: Avenging 2>#246@0.70$17.0000E000000020ATWD0w7PU2o03U0700C00Q00s01k01U020000U"
OMG_ImgArtifacts["Avenging"] .= "|<Set: Avenging 3>0xCE04DE@0.70$17.0000E000000020ATWD0w7PU2o03U0700C00Q00s01k01U020000U"
OMG_ImgArtifacts["CritRate"] := "|<Set: CritRate1>#84@0.80$13.U0s0r1llkQkD01k8wZjlvkssamU0k"
OMG_ImgArtifacts["CritRate"] .= "|<Set: CritRate2>0xF76D00@0.70$16.001U1X0A61USS0xk1u03k2LY7jUCQ1ksAYlU1U00U"
OMG_ImgArtifacts["CritDamage"] := "|<Set: CritDamage>#68@0.80$15.2U0w07s1zz7zszz4TtVzA7n0QM3600U"
OMG_ImgArtifacts["Cruel"] := "|<Set: Cruel>#88@0.70$16.200BI0zmDzlzzLzzTzzzzrLbRyRntbD64MkM38"
OMG_ImgArtifacts["Curing"] := "|<Set: Curing>0xD0337E@0.90$15.TDbzyzzzz3zvHsMT31ty730QM1s0600E4"
OMG_ImgArtifacts["Cursed"] := "|<Set: Cursed>#110@0.70$20.0000E3071U0ts0Dy03x00zk0CC0DXk7zq7zzs0w00D001k00M00600002"
OMG_ImgArtifacts["Daze"] := "|<Set: Daze 1>#108@0.70$15.003y0Tk0A0300sSC7nyCTnU0s3rkK01U0A030000U"
OMG_ImgArtifacts["Daze"] .= "|<Set: Daze 2>#79@0.70$15.003w0Tk0Q0700k0A7ngATnU0k1bky01U0M0700y0004"
OMG_ImgArtifacts["Defense"] := "|<Set: Defense>#138@0.80$12.GGKqTyTy84848484AACQDwTyTyzzU"
OMG_ImgArtifacts["Destroy"] := "|<Set: Destroy1>#135@0.70$16.0E01824WQK8kNV9YRi0ztnzz7ztTTDhwS1ss6300U"
OMG_ImgArtifacts["Destroy"].="|<Set: Destroy2>0xC63484@0.70$18.0000E00F08H8A3A478+bEAr0DzC7zw7vwLvsSHkT0sD1U400000U"
OMG_ImgArtifacts["DivineCritRate"] := "|<Set: Divine Crit Rate>#55@0.70$10.DVyjksTzzzH7STjQcS1sU"
OMG_ImgArtifacts["DivineLife"] := "|<Set: Divine Life>#97@0.70$13.1s336QQnmVyEzMSfkFsVQc6c/c2A0s084"
OMG_ImgArtifacts["DivineOffense"] := "|<Set: Divine Offense>#56@0.70$16.NzTzzxzvzzxzzbDiTztzzzzzTbwrPVxs2x01U8"
OMG_ImgArtifacts["DivineSpeed"] := "|<Set: Divine Speed>#77@0.70$14.00U0M0C1zlzQzzDnrtxtyNzXzlzkrU80100U"
OMG_ImgArtifacts["Frenzy"] := "|<Set: Frenzy>#127@0.70$17.000U0900HDtXzy3zsDzs7z0Tz0Tw0Tk0T00w00s01k010000E"
OMG_ImgArtifacts["Frost"] := "|<Set: Frost>#135@0.70$16.000100400w0F474SCtl7t0TU1y1zz74QIFM3U0600E0008"
OMG_ImgArtifacts["Fury"] := "|<Set: Fury>#89@0.70$12.1U3U/aPzvzzzzzTzTyTyFnTzDS3kU"
OMG_ImgArtifacts["Immortal"] := "|<Set: Immortal>#114@0.70$17.22U6j0byVyz5xyjkzTrzzzxrxvjtrDXCTCACMAEk814"
OMG_ImgArtifacts["Immunity"] := "|<Set: Immunity>#162@0.70$13.008EbznztswwSSD81Y0nlttwSwDy1w004"
OMG_ImgArtifacts["Life"] := "|<Set: Life>#97@0.80$15.C33syTzrzzzzzzyTznzwDz0Tk1s060U"
OMG_ImgArtifacts["Lifesteal"] := "|<Set: Lifesteal 1>0xB1053F@0.70$17.A0lzzzzznWb10A30E000000010k61kQ1lk1zU0c2"
OMG_ImgArtifacts["Lifesteal"] .= "|<Set: Lifesteal 2>0xBD0442@0.70$19.0007hR7zylrLEM1U40k10E0000000E10A1U31k1vk0BU0004"
OMG_ImgArtifacts["Offense"] := "|<Set: Offense>0xBD0000@0.70$16.00007U0y03s0TU3w0TU3w1zU3w0DU1y0DM1s0300002"
OMG_ImgArtifacts["Reflex"] := "|<Set: Reflex 1>#47@0.70$13.1y3zmzsjwdyKT3DbDbDrDn7s1s0EE"
OMG_ImgArtifacts["Reflex"] .= "|<Set: Reflex 2>0xD06F34@0.70$15.00010HzlTy4zkPy5jkiy3DlnwQzXDs0y03U004"
OMG_ImgArtifacts["Regeneration"] := "|<Set: Regeneration>#200@0.70$16.1y07w0Tk1z0zzjqTy0zs3zkTzXxzTkTk1z07w0TkU"
OMG_ImgArtifacts["Relentless"] := "|<Set: Relentless>#94@0.60$17.6CCSSRkw/1kTzzjzz7zy1zU3y07w07s0DUU"
OMG_ImgArtifacts["Resistance"] := "|<Set: Resistance>#114@0.70$11.20A03307aQNs7wNs1n3y3w7kDUT4"
OMG_ImgArtifacts["Retaliation"] := "|<Set: Retaliation>#133@0.70$14.3k3y33m0Q00E0A06k381U0k0A060301U0s0U"
OMG_ImgArtifacts["Savage"] := "|<Set: Savage>#97@0.60$13.02030NUNURkAsCsawqQmCvCsCM6Q3A3A140U1"
OMG_ImgArtifacts["Shield"] := "|<Set: Shield>#84@0.60$13.0U1s3XbSSzvTxzyzzbzGzcjcTw7s1g0Q4"
OMG_ImgArtifacts["Speed"] := "|<Set: Speed>#90@0.80$12.040A0AyQ0T0ytw3s7k7k1s1w0w0CU"
OMG_ImgArtifacts["Stalwart"] := "|<Set: Stalwart 1>#71@0.60$11.10TUzXzbzDyTwztgnzjzSjQQsslUW8"
OMG_ImgArtifacts["Stalwart"] .= "|<Set: Stalwart 2>0xB59231@0.70$12.003k7sDwTwTyTyTyFWRiRiQCQCAAA800U"
OMG_ImgArtifacts["Stalwart"] .= "|<Stalwart 3>0xB2912F@0.70$13.001w1z1zkzsTwDy7z28VZkysxSCC771X0F001"
OMG_ImgArtifacts["Stun"] := "|<Set: Stun>#97@0.60$12.7kTskw0CTaTrsnsHumvqsCTwDkU"
OMG_ImgArtifacts["Taunting"] := "|<Set: Taunting>#70@0.60$11.3wDsTVz3w7kTszxzrz1w3kD0Q0k108"
OMG_ImgArtifacts["Toxic"] := "|<Set: Toxic 1>#60@0.60$13.D03kCw7rUTs3y1DUl0tU8k0w0S0D038"
OMG_ImgArtifacts["Toxic"] .= "|<Set: Toxic 2>#83@0.70$15.000M03U3D0Sw0zk1z05w0UkC00n00M07U0w03000U"
OMG_ImgArtifacts["Toxic"] .= "|<Set: Toxic 3>#105@0.70$16.000400w08s1xk1zk0zU1S0A60l03400s01U0C00s002"
global OMG_ImgRanks := []
OMG_ImgRanks[1] := "|<Rank 1a>#136@0.70$21.02000M007000s00DU0zzs3zy07zU0Tk03y00Ts03b00kM0410U"
OMG_ImgRanks[1] .= "|<Rank 1b>0xE0B628@0.70$20.00000E00A003U01s00S03zzUTzk3zk0Ts03y01zU0Ss067030E0008"
OMG_ImgRanks[2] := "|<Rank 2a>0xE7C63C@0.70$27.020E00M60070s00sD00C1s0zbzz3yTzk7tzs0TXy03yTk0Try03atk0sK3041U8U"
OMG_ImgRanks[2] .= "|<Rank 2b>0xE7C63C@0.70$29.00000020E0061U00Q3U00sD003UT03yTzw3yTzk1yTy01yDs03yTk07xzU0CPrU0sK7010M2000008"
OMG_ImgRanks[3] := "|<Rank 3a>#237@0.70$35.020E40041UA00Q30s00sD1s030M3k3yTrzz3yTbzw1yTXzk1yDnz03yTrw07wzjw0CPaQs0k61kk10820m"
OMG_ImgRanks[3] .= "|<Rank 3b>#231@0.70$34.0000000U810060kA00Q70s03kQ7U0A3UT0TrwzzszDtzz1yDnzk1yTXy07xzDs0zrwzU3aQri0A/VMA0U810E000002"
OMG_ImgRanks[4] := "|<Rank 4a>0xE2B92B@0.70$47.020k41U00C1UA3000Q3Us7001sD1kS0030s61y03yTrwzzs1yTnwzzU1zDnyTw01zDnyTk03yTrwzU07xzjvz00QPWwr700k61UA6010E20U42"
OMG_ImgRanks[4] .= "|<Rank 4b>0xE7C63B@0.70$47.00000000040U81000A30M6000s71kC001kS3kw0070kC1w07wzjtzzk7wzDtzz03wzbtzs03wTbszU07wzjtz00DvzTny00QrgtjS01kg/VMQ020k40U8000000008"
OMG_ImgRanks[4] .= "|<Rank 4c>0xDDAE1E@0.70$48.0000000000E40U8000k61UA000sC1kQ001sD2kS000UQ30y00zjtzTzy0TbwzDzw0DvyTrzk07wzbtzU03yzbxzU07yzjxzU07gtjRnU065kg/VU0A10M20k00000000U"
OMG_ImgRanks[4] .= "|<Rank 4d>0xF7E76A@0.70$45.000000000820E40030M60k00M70sC007UsD1s00k41UD03wzbxzzkDnyTXzw0z7tyDz01yTXwzk0DvyTrw01zTnyzk0QnatbC030k60kk0E40U8100000000U"
OMG_ImgRanks[4] .= "|<Rank 4e>0xE3BB2D@0.70$47.00000000010820E0030k61U00C1kQ3U00Q7UwD001kA3UT01zTvyTzw1zDnyTzk0zDtyTz00z7tzDs01zDvyTk03yzrwzU07BvCPrU0Q/2sK700UA1082000000008"
OMG_ImgRanks[4] .= "|<Rank 4f>0xFFFE90@0.70$43.0000000040U810020k40U03UM70s01kS3UQ01UA10S0Tnwzbzz3sz7tzz0yDlwDy0DlwTXy07wzbtz03yTrwzU1nQnask1UA10MA00000004"
OMG_ImgRanks[4] .= "|<Rank 4g>0xE2BB2D@0.70$43.0000000040U810020k61U03UQ70s01kS3kw01kA1UT0Tnyzbzz7xzDvzz1zDnyTz0DnyTbz07wzjtz03yTrwzU1rSvixs1kg/VQQ0k41U8600000002"
OMG_ImgRanks[4] .= "|<Rank 4h>0xF7E76B@0.75$42.00000000820E400M20k600M70sC00w70sC00k41UD0TbwzjzyDlyTXzw7szDlzs1wTXwzU1zTnyTU1zTnyzk3aQrAtk30k60Uk00U4108U"
OMG_ImgRanks[5] := "|<Rank 5a>0xFFFD8C@0.70$51.00000000000E20U400M20k60U030s60kC00w70sC1k060UA10S0TbwzjtzzlyDnwTbzw7sy7lwDy0DXwTbszU1yTnyTbw0DvyTrwzU3aQr4taA0M60k41Uk00U41082000000000U"
OMG_ImgRanks[5] .= "|<Rank 5b>0xF8EB6F@0.70$51.00000000010820E400830M60k03UM70s600Q7Us71s060k41UD0TnyzbxzzkzDlyTXzw3wz7tyDz0DlyTXwzk1zDvyTnw0DtzTnyzk1nQnaxbC0M30kK0kk20E40U81000000000U"
OMG_ImgRanks[5] .= "|<Rank 5c>0xDDAE1F@0.70$52.0000000000U410820030k61UA00Q3Us71k01sS3kg7U0C1UQ30y0TryzbxzzszbtzDXzy0zDvyTnzk1yTnyTby07wzjtzTs0TryzbxzU1rSvaxrC0C5VQ/0sM0UA10M30k000000002"
OMG_ImgRanks[5] .= "|<Rank 5d>0xDDAE1F@0.70$52.0000000000U410830030k61UA00Q3Us71k01sS3kg7U0C1UQ30y0TryzbxzzszbtzDXzz1zDvyTnzk1yTnyTby07wzjtzTs0TryzbxzU3rSvaxrC0C5VQ/2sM0UA10M30k000000002"
OMG_ImgRanks[5] .= "|<Rank 5e>0xE6C337@0.70$52.0000000000U410820030k61UA00Q3Us71k01kS3kw7U0C1UQ30S0TnyzbxzzszbtzDnzz0zDtyTnzk1yDnwTby07wzjtzTs0TryzbxzU1nSnaxrC0C5VQ/0sM0UA10820E000000002"
OMG_ImgRanks[5] .= "|<Rank 5f>0xDFB123@0.70$52.0000000000U410820030k61UA00Q3Us71k01kS3kw7U0C1UA3US0TnyzbxzzszjtzTnzz1zDnyTbzs1yTnwzby07wzjtzTs0TryzbxzU1rSvixry0C5VQPWsM0kA1U830k000000002"
OMG_ImgRanks[5] .= "|<Rank 5g>0xE3BE31@0.80$51.0E01U42s3Us75kC7yDHmS3YwzUz7tyDnzk1yTXwz7w0DvyTrwzU3zTnyzbw0QnatbBnk30kK0kg60E40U810E000000004"
OMG_ImgRanks[6] := "|<Rank 6a>#503@0.70$64.00000000000020E40U81000A30M60kA001kC3UQ70s0071sD3kS3U00s61kA1UT01zDvyTrwzzs3yTbwzDtzz03wzbtzDnzs07szDlyTny00TnyzbxzDs01zTvyTrwzU07BvCPrQrj00sK5kg3VMA020k40U810E00000000002"
OMG_ImgRanks[6] .= "|<Rank 6b>0xFBF27B@0.70$59.00000000000E40U810001U830M20k030s70kC1U0D1kC3UQ7U0M20k41UD0TbwzjtzTzwTXwz7tyDzkTXwz7syDz0DnwTbszDs0TrwzbtzDk0zjtzTnyzk3aQrAta9nU61UA1UM330020E40U8100000000008"
OMG_ImgRanks[6] .= "|<Rank 6c>0xFEFD8B@0.70$60.00000000000810E200400830M20k400Q30s70kC00Q7Us71kC00E60UA10S0TnwzbxzDzy7lyDnwTbzw3sz7kyDlzk1yDXwTbszU1zDtyTnwzU1zDvyTrwzU1nQnatbAlU30M20k41Uk20040U810E0000000000U"
global OMG_Campaign := []
OMG_Campaign.1["ChapterName"] := "Kaerok Castle"
OMG_Campaign.2["ChapterName"] := "Sewers of Arnoc"
OMG_Campaign.3["ChapterName"] := "Catacombs of Narbuk"
OMG_Campaign.4["ChapterName"] := "Durham Forest"
OMG_Campaign.5["ChapterName"] := "Felwin's Gate"
OMG_Campaign.6["ChapterName"] := "Palace of Aravia"
OMG_Campaign.7["ChapterName"] := "Tilshire"
OMG_Campaign.8["ChapterName"] := "Valdemar Strait"
OMG_Campaign.9["ChapterName"] := "The Deadlands"
OMG_Campaign.10["ChapterName"] := "Godfrey's Crossing"
OMG_Campaign.11["ChapterName"] := "Hallowed Halls"
OMG_Campaign.12["ChapterName"] := "Brimstone Path"
OMG_Campaign.1["ChapterNameRef"] := "|<Ch1: Kaerok Castle>#556@0.70$69.0000000000k61k000000060kQ00000000k63U000000060ks00000000k6C0TUDUr3w67nU7C7y7tvklqs0kskssA66QzU07C363Usr7w00tkMkQ77ktk3zDz63UMy770stk0kQ37sksC7C063Usna3Vksk0kA76CkCCD7361lkkq0szsTsk7w67k73n0w60T0kQ"
OMG_Campaign.2["ChapterNameRef"] := "|<Ch2: Sewers of Arnoc>#541@0.70$59.1k000000003k00000000DU00000000P000000000r0rBw1y1y3a1wTwDS7y6A3UksMAACQQ61UlkQsAsMA31XUtk1UsM6360n07zkkA6C1b0DzVUMAQ7C0M3X0kMMCA7k361UkssQT06A31UzUTq0CM630y0S8"
OMG_Campaign.3["ChapterNameRef"] := "|<Ch3: Catacombs of Narbuk>#214@0.70$71.000000k000A1k70001U000M3kC00030000k7UQ00060001UDUs000A00030TVkz1iPsQ667r3Xb3szssAARb76771UlkMNn6C0CA31nUkr6CQ0QM63b1VwACsTskA7C33sMBlllUMCQ67skTb3X0kQMAAtUTC761UskMMv0SQSA3XVlkkq0wTwM7y3zVVw0kSMkAs1n31k"
OMG_Campaign.4["ChapterNameRef"] := "|<Ch4: Durham Forest>#617@0.70$77.000000k000001zU0001U000003zU000300000063U0006000000A3U000A000000M371ViPs7sBwyk7C33szsQsTzzUCQ671VkkskwD0QsAA31U1lUkS0tkMM6303X1Uw1nUkkA63z631s331VUMACCA63kC6330kMsQMA7UMA661UlkskMDXkQQA31XXlUkTy0zsM633zX1Uzk0QkkA63n631k"
OMG_Campaign.5["ChapterNameRef"] := "|<Ch5: Felwin's Gate>#746@0.70$80.0000M000k00k0Dz006000A00A03zk01U00300300k000M000000k0A0006000000A0300T1X3VX3T03wk0TsMksMkzs1ni0676CCCAAC0MPzXUlVbn331U60zssAMNgkkkM1kA0Dz66PAAA60DX03U1VoH331U0yk0s0MD7UkkM01w06063lsAA60kT01klUsC331UC6k0DwMC3UkkM1zg00w61UkAA607W"
OMG_Campaign.6["ChapterNameRef"] := "|<Ch6: Palace of Aravia>#389@0.70$62.00000001U00Q000000M007U000006003s000000000q000000000BkBly63a3w7A3wtlklVnVX0sACQAMMQssA03X7607C6300slVU1n1kk7yCMMDxzwA3XVi677Tz31ksP1XVq0skQC3kMsTUCA77Uw6CDk1n0zsC1Vzw0Qk7a1UMDC"
OMG_Campaign.7["ChapterNameRef"] := "|<Ch7: Tilshire>#697@0.70$75.0066006030007zskk00k0M000zz66006030000A00k00k000001U06006000000A0kkTUrkMPVw1U667C7z33szkA0kkkkksMQ671U666063331kMA0kks0kMMMC31U663s63331zsA0kk7kkMMMC01U660763331k0A0klUskMMM601U66C663330sMA0kkzkkMMM3z1U661s633307Y"
OMG_Campaign.8["ChapterNameRef"] := "|<Ch8: Valdemar Strait>#994@0.70$97.0000301U00000000Q1k01U0k00000000C0s00k0M0000000070M00M0A000000001kQ00A06000000000sC3w63v0y3TDUTUrA63b33zVzVzzsQsTa71VlVVkkskwAACC3XU0slkMsAMA60760lU0QMsAQ6A6303X0Nk7yAQ6Dz631UzlUCs776C37031Ukssk3M73X71XU1UkMsQM1w3VlXUkk0kMAQCA0w1lskssQAMA6CD60C0TwMDw7yA633zX0707aA3a0w631UwlV"
OMG_Campaign.9["ChapterNameRef"] := "|<Ch9: The Deadlands>#967@0.70$92.000000033000000zw000000kk00000DzU00000AA000003kQ0000033000000w3U00000kk00000D0M7kDkDgA7sBw3vk77y7C7z33b3zVzw1lVlVlUkkksksMD0QsA0QsAA0CA6C3k7C307C3303X1XUw1nzkznUkkTskMsD0Ms0QQsAACCA6C3kCC0C7C3373X1XUw31U3VnUklkskMsDXkQAswQQAQSA677zk3z7z3z33zX1Uzzk0D0wkQkkSMkM7C"
OMG_Campaign.10["ChapterNameRef"] := "|<Ch10: Godfrey's Crossing>#1012@0.70$96.0k0000M7U00003007y0000MD00000300DD0000MA00000300Q3U000MA00000600Q3U000MQ00000600M00TUTMz6sT31k3ws01zkzsz7tzXVU7Cs01UkkMA71VnXUC6s03UtkMA63UlXUC0sTXUtkMA63UlX070s3XUNkMA63zln03wM1XUtkMA63U0r00yQ3XUtkMA63U0y007Q3VUtkMA61U0y0A7C3VlkssA61kkQ0C67z0zUTsA60zkQ07y1w0T0CMA60D0Q01s000000000000M000000000000000M000000000000000s000000000000003k0000000000000010000U"
OMG_Campaign.11["ChapterNameRef"] := "|<Ch11: Hallowed Halls>#830@0.70$91.000033000000001s1k01VU00000000w0s00kk00000000S0Q00MM00000000D0C00AA000000007U73w661y6731w3vk3Xb333rX3VXz3zzzlVlVVUllllVlUzzs0sklkQNwlkNkT0Q0QMMsCAqMsAsD0C7yAAM36PATyM7U77766C1XcaC0C3k3b3X371kwS7071s1nVlVVUsSD1U3Uw0tlskkssC3UsMsy0QTwMMDs71kDwDz0A7aAA1s1Uk1s3b"
OMG_Campaign.12["ChapterNameRef"] := "|<Ch12: Brimstone Path>#0@0.80$66.zs01U000000sw01000000QkA00000000QkC00000000QkC6tVjbkDlzkA7lVvwsQsQss71VUsMMMQzs61VUkMM0QkQ61VUkMQ0QkC61VUkMDUQk661VUkM1sQk661VUkM0MQkC61VUkMkQQkQ61VUkMMMAzs61VUkMTsDT061VUkM7U7U"
OMG_Campaign.1["ArtifactSetName"] := "Life"
OMG_Campaign.2["ArtifactSetName"] := "Offense"
OMG_Campaign.3["ArtifactSetName"] := "Defense"
OMG_Campaign.4["ArtifactSetName"] := "CritRate"
OMG_Campaign.5["ArtifactSetName"] := "Accuracy"
OMG_Campaign.6["ArtifactSetName"] := "Speed"
OMG_Campaign.7["ArtifactSetName"] := "Resistance"
OMG_Campaign.8["ArtifactSetName"] := "Lifesteal"
OMG_Campaign.9["ArtifactSetName"] := "Destroy"
OMG_Campaign.10["ArtifactSetName"] := "Retaliation"
OMG_Campaign.11["ArtifactSetName"] := "Fury"
OMG_Campaign.12["ArtifactSetName"] := "Curing"
OMG_Campaign.1["ArtifactSetRef"] := OMG_ImgArtifacts["Life"]
OMG_Campaign.2["ArtifactSetRef"] := OMG_ImgArtifacts["Offense"]
OMG_Campaign.3["ArtifactSetRef"] := OMG_ImgArtifacts["Defense"]
OMG_Campaign.4["ArtifactSetRef"] := OMG_ImgArtifacts["CritRate"]
OMG_Campaign.5["ArtifactSetRef"] := OMG_ImgArtifacts["Accuracy"]
OMG_Campaign.6["ArtifactSetRef"] := OMG_ImgArtifacts["Speed"]
OMG_Campaign.7["ArtifactSetRef"] := OMG_ImgArtifacts["Resistance"]
OMG_Campaign.8["ArtifactSetRef"] := OMG_ImgArtifacts["Lifesteal"]
OMG_Campaign.9["ArtifactSetRef"] := OMG_ImgArtifacts["Destroy"]
OMG_Campaign.10["ArtifactSetRef"] := OMG_ImgArtifacts["Retaliation"]
OMG_Campaign.11["ArtifactSetRef"] := OMG_ImgArtifacts["Fury"]
OMG_Campaign.12["ArtifactSetRef"] := OMG_ImgArtifacts["Curing"]
global OMG_TxtDungeons := []
OMG_TxtDungeons["Dragon"] := "|<Dungeon: Dragon's Lair>#421@0.70$70.zk0000000003zU000000000A70000000000kC00000000030MPXw3vUz1jg1lyQsTyDS7zk771VlUskMMT0QM07C3b1lUw1lU0QsCQ763k760znUtkAMD0MM77C3b0lUw3VUsQsCQ763kA63VlUskQMDXkMCD77XXVUzy1UTwDy7w63z060wkSkDUMA000000300000000000Q0000000001nk0000000003w00008"
OMG_TxtDungeons["FireKnight"] := "|<Dungeon: Fire Knight's Castle>#847@0.70$89.00M000000000M01zsk0000A3U00k03zlU0000MC001U060000000kQ00000A0000001Vk00000M0ABky0370PsA7rk0MTby06Q0zsMTzk0ksAC0Bk1VkkkTzVVUsA0Tk31VXUzz331kM0zU63371w0663zk1nUA66C3s0AA7003XUMAAQ7k0MMC00670kMMsDU0kkA00A71UkkkT01VUQA0M731VVly0330Ts0k76331zw0660D01UCA661v00000000000000600000000000000Q0000000000000ts0000000000000zY"
OMG_TxtDungeons["IceGolem"] := "|<Dungeon: Ice Golem's Peak>0xFFE67D@0.70$99.0000001U001U00007000001zU00A00000s00000SS001U000070000070s00A00000s00000s7001U000073w1w06007sA3sBwyszkzk1k03rVVzVzzz67670C00MAAACAD3tkNkM1k071lXUlUkTC0C30C7ssCAQ6A63tk1zs1k770lXzlUkTC0C0060Ms6AQ0A63tk1k00s371lXU1UkTC360070sMCAA0A63ssssM0Q73XVVklUkT3y3z01zkDsA7yA63kD07U03s0y1UD1UkQ"
OMG_TxtDungeons["Minotaur"] := "|<Dungeon: Minotuar's Labyrinth>0xFFE67D@0.70$91.000A00000000000S0C600000000000D0D300000s000007U7U00000Q000003s7k00000C000001g3MMPs3wTkz3Ukrq1gADy7j7ktkkMTtVa66731VkMQsACAkn331XUss0CQ666QNVVUlkQQ07C3336MkkkMk6C1zb1VVXAMMMAQ371lnUkkkyAAA6C3XVkskMMMS666331lksQMAAAD3331VlksQSCC6631VVUkTkD7z7z331UkkkM7k3VtVtVV"
OMG_TxtDungeons["SpidersDen"] := "|<Dungeon: Spider's Den>0xFFE67D@0.70$80.0U00301U000k03z000k0M000A01ts00A06000300M700001U000k061k0000M000A01U0PsA7q1w6s3wQ07z33zVzVw1nXk1UkkkMMQQ0MMTUMCAQ6C360601y63X71XUlU1k03VUslkMzwM0DU0QMCAQ6C0600ys763X71XU1U01y1lUklkMM0M0kRksQQACC7360C6Dy7y31zUzlU1zUy1b0kCM3kM07U00M00000000000060000000000001U000000000000M0000000000U"
OMG_TxtDungeons["PotionsKeep"] := "|<Potions Keep>0xFDE57C@0.70$49.kC000000MC000000AD000000670000003707k7kPtb0DwDwDyz0676763Tk71b1X1zs3UnUlUzC1ztzskTXUs0s0MDVkQ0Q0A7kQ606063s73VXVXXg1kzkzlza0s7U7UrU000000M0000000A000000060000000308"
OMG_TxtDungeons["FactionCrypt"] := "|<Faction Crypt>0xFFE67D@0.70$55.0000000001zU0000001ts0000071kA000003Us7000001kM1XRUtjXyQ01ysMzszC00sQQMAC700M6CA773U0A3663XVk061n31lkM030PVUssA1lUDUkQQ70kk7kMAC1ksM1kCC70TsA0s7y1s3k60Q3C0Q0000A1U00000060k00000070M000000D0A000000200000000000001"
global OMG_ImgDungeonArtifacts := []
OMG_ImgDungeonArtifacts.Dragon["Accuracy"] := OMG_ImgArtifacts["Accuracy"]
OMG_ImgDungeonArtifacts.Dragon["Avenging"] := OMG_ImgArtifacts["Avenging"]
OMG_ImgDungeonArtifacts.Dragon["Daze"] := OMG_ImgArtifacts["Daze"]
OMG_ImgDungeonArtifacts.Dragon["Destroy"] := OMG_ImgArtifacts["Destroy"]
OMG_ImgDungeonArtifacts.Dragon["Frost"] := OMG_ImgArtifacts["Frost"]
OMG_ImgDungeonArtifacts.Dragon["Lifesteal"] := OMG_ImgArtifacts["Lifesteal"]
OMG_ImgDungeonArtifacts.Dragon["Speed"] := OMG_ImgArtifacts["Speed"]
OMG_ImgDungeonArtifacts.Dragon["Stalwart"] := OMG_ImgArtifacts["Stalwart"]
OMG_ImgDungeonArtifacts.Dragon["Toxic"] := OMG_ImgArtifacts["Toxic"]
OMG_ImgDungeonArtifacts.FireKnight["Fury"] := OMG_ImgArtifacts["Fury"]
OMG_ImgDungeonArtifacts.FireKnight["Curing"] := OMG_ImgArtifacts["Curing"]
OMG_ImgDungeonArtifacts.FireKnight["Immunity"] := OMG_ImgArtifacts["Immunity"]
OMG_ImgDungeonArtifacts.FireKnight["Shield"] := OMG_ImgArtifacts["Shield"]
OMG_ImgDungeonArtifacts.FireKnight["CritDamage"] := OMG_ImgArtifacts["CritDamage"]
OMG_ImgDungeonArtifacts.FireKnight["Frenzy"] := OMG_ImgArtifacts["Frenzy"]
OMG_ImgDungeonArtifacts.FireKnight["Regeneration"] := OMG_ImgArtifacts["Regeneration"]
OMG_ImgDungeonArtifacts.FireKnight["Stun"] := OMG_ImgArtifacts["Stun"]
OMG_ImgDungeonArtifacts.FireKnight["Savage"] := OMG_ImgArtifacts["Savage"]
OMG_ImgDungeonArtifacts.IceGolem["Life"] := OMG_ImgArtifacts["Life"]
OMG_ImgDungeonArtifacts.IceGolem["Offense"] := OMG_ImgArtifacts["Offense"]
OMG_ImgDungeonArtifacts.IceGolem["Defense"] := OMG_ImgArtifacts["Defense"]
OMG_ImgDungeonArtifacts.IceGolem["CritRate"] := OMG_ImgArtifacts["CritRate"]
OMG_ImgDungeonArtifacts.IceGolem["Resistance"] := OMG_ImgArtifacts["Resistance"]
OMG_ImgDungeonArtifacts.IceGolem["Retaliation"] := OMG_ImgArtifacts["Retaliation"]
OMG_ImgDungeonArtifacts.IceGolem["Reflex"] := OMG_ImgArtifacts["Reflex"]
OMG_ImgDungeonArtifacts.IceGolem["Cursed"] := OMG_ImgArtifacts["Cursed"]
OMG_ImgDungeonArtifacts.IceGolem["Taunting"] := OMG_ImgArtifacts["Taunting"]
OMG_ImgDungeonArtifacts.SpidersDen["Banner Lords"] := "|<Faction: Banner Lords>0x368822@0.80$13.000k6QVgkzsAUDy7z28VvkxsSgTT7j1q0+001"
OMG_ImgDungeonArtifacts.SpidersDen["Banner Lords"] .= "|<Faction: Banner Lords 2>0x2F761D@0.90$12.001UFWNYDw00DwTwNYSQSQO4SSSQ6E00U"
OMG_ImgDungeonArtifacts.SpidersDen["High Elves"] := "|<Faction: High Elves>0x048F9F@0.75$16.0000U0202Q0Dy0Mk31UA67kS31U7w0zs2QU0U0200800U000U"
OMG_ImgDungeonArtifacts.SpidersDen["High Elves"] .= "|<Faction: High Elves 2>0x058695@0.90$14.000401U3z0kU044170M4A2a0zk1U0M04010008"
OMG_ImgDungeonArtifacts.SpidersDen["Sacred Order"] := "|<Faction: Sacred Order>0xB7B087@0.81$14.000A0306m0h0/EGk7gt/22o0h0/04m0A03U008"
OMG_ImgDungeonArtifacts.SpidersDen["Sacred Order"] .= "|<Faction: Sacred Order 2>0x988F71@0.90$15.000500801E0+0NE1+G9S/+E9E1+0NE690100s000U"
OMG_ImgDungeonArtifacts.SpidersDen["Barbarians"] := "|<Faction: Barbarians>0xD14C00@0.80$13.004F3zVztzwzyQa4F18040203U0U0E08002"
OMG_ImgDungeonArtifacts.SpidersDen["Ogryn Tribes"] := "|<Faction: Ogryn Tribes>0x9C893F@0.75$14.000E0DU3y03sACDtX6NkaNla0MkCBr1zUT0008"
OMG_ImgDungeonArtifacts.SpidersDen["Lizardmen"] := "|<Faction: Lizardmen>0x759819@0.75$14.00040301s3zszwBx7SMzw7K0yU/M240P03U008"
OMG_ImgDungeonArtifacts.SpidersDen["Lizardmen"] .= "|<Faction: Lizardmen 2>0x6E9018@0.90$13.000E0A0C0zkTy/sAs3SUlU7008201Y0A002"
OMG_ImgDungeonArtifacts.SpidersDen["Skinwalkers"] := "|<Faction: Skinwalkers>0x877D3C@0.81$18.000C0MDgwNS6Mz2FSWNAUAz44S82GE4G00G0000U"
OMG_ImgDungeonArtifacts.SpidersDen["Skinwalkers"] .= "|<Faction: Skinwalkers 2>0x6E6631@0.90$19.0003U63tD1VkFVw8lQ28i26TU0ZE0Gd08000I00+00008"
OMG_ImgDungeonArtifacts.SpidersDen["Orcs"] := "|<Faction: Orcs>0x800000@0.81$19.0000E808806A1zbwzryDvy7b71V30Nl05g00r00lU0Mk08A0002"
OMG_ImgDungeonArtifacts.SpidersDen["Orcs"] .= "|<Faction: Orcs>0x7B0101@0.81$18.00010U0007nkTnyTzyTyyCAA6AM2SE0z00n01VU1VU000U"
OMG_ImgDungeonArtifacts.SpidersDen["Demonspawn"] := "|<Faction: Demonspawn>0x830450@0.75$16.0003k0Tk390Pq1zs73USO1jMD3lrtY720M01U0600M01U000U"
OMG_ImgDungeonArtifacts.SpidersDen["Demonspawn"] .= "|<Faction: Demonspawn 2>0x8B0355@0.90$14.000N0804s1p0QM541CEs+Ew0601U0E04010008"
OMG_ImgDungeonArtifacts.SpidersDen["Undead Hordes"] := "|<Faction: Undead Hordes>0x0B6961@0.81$15.000Q07V1y0Tm3tMTs3z0Tvlzw9wX76DzVxs1w0DU10000U"
OMG_ImgDungeonArtifacts.SpidersDen["Undead Hordes"] .= "|<Faction: Undead Hordes 2>0x0C5C55@0.90$14.000s0w0TU7sVs8Sk7g1zOLy4z1b2Tz3nE7U3s002"
OMG_ImgDungeonArtifacts.SpidersDen["Dark Elves"] := "|<Faction: Dark Elves>0x6A44B9@0.75$14.00201028FVgVxS7q3htfOOqahccG+4W104E140G000U"
OMG_ImgDungeonArtifacts.SpidersDen["Dark Elves"] .= "|<Faction: Dark Elves 2>0x5E3CA0@0.90$14.00400W44m7dsG0+p0h8/G2Y0V18E200W00U008"
OMG_ImgDungeonArtifacts.SpidersDen["Knight Revenant"] := "|<Faction: Knight Revenant>0x7A4E36@0.80$16.0000U020391sXXWC6MUNm0b83RUNm0700z00U0600M0008"
OMG_ImgDungeonArtifacts.SpidersDen["Knight Revenant"] .= "|<Faction: Knight Revenant 2>0x64422E@0.90$15.000102N3nAQMkX44MUn81P0X40M0Dk0M0300M000U"
OMG_ImgDungeonArtifacts.SpidersDen["Dwarves"] := "|<Faction: Dwarves>0xA49056@0.75$15.000AU3a1sQQMnDWPyHTkMMH22/20DU320ME3u070004"
OMG_ImgDungeonArtifacts.SpidersDen["Dwarves"] .= "|<Faction: Dwarves 2>0x877647@0.90$14.000G0AsC77A97kHy4i110EE0UU7U260UU/c0k002"
OMG_Stats := []
global OMG_txtConnectionError := "|<ConnectionError>0xD9C559@0.70$96.7s1w3UMs6Dy7sTzADy7z3UMs6DyDyTzCSC773kMw6C0SC1kCQ7C3XsMy6C0Q71kCM2A3XsMy6C0M21kCs0A1XwMz6C0s01kCs0Q1XiMvaDws01kCs0Q1XiMvaDws01kCs0Q1XbstyC0s01kCM2A3XXssyC0M21kCQ7C3XXssyC0Q71kCQCC73VssSC0QC1kCDy7z3UssCDyDy1kC7w3y3UssCDy7w1kCU"
global OMG_txtConnectionError .= "|<ConnectionError>0xE5CD58@0.70$92.7kC1U7zDwDw1w3z7y3UM1znzXzVzUztlkw60Q0sQsQQQC7sCDVU60A7A7C3X1w1XsM1U30n0n0MkD0Mz60Q0kQkQk6A7k6AlU7yCCCCA1XXg1X6M1zXz3z30Mzn0Mly0Q0zkzkk6Dwk6ADU60CQCQA1XbC3X3s1U33X3XUskvUkkS0M0kMkMsAA6TwA3U7zA7A77z31nw30s1zn0n0kz0kC"
global OMG_btnRetry := "|<Retry>0xFFFFFF@0.70$51.zs0000007zU00k000kC00600060k01k000k63wzXRUy0kznwTi6sCC663UkrjVUkkM6CzsA7630tb73zskM3AkMS0630Na3VU0kM3skAA0630D61lkkkM1ss67y7X0C60MD0QM0k0000000600000001U0000000Q0000000700000000U4"
OMG_fcnRestoreEnergy() {
if (OMG_RestoreEnergy) {
OMG_OSDmsg("Checking if you have enough energy to continue...")
if (OMG_FindThis(OMG_BtnRestoreEnergy, 1, 0.15, 0.15, 450, 460, 690, 535))	{
Sleep, 500
if (OMG_FindThis(OMG_BtnGetNow,,,,650, 386, 757, 420)) {
OMG_FindThis(OMG_BtnGetNowCancel, 1, 0.15, 0.15,408, 391, 482, 415)
OMG_RestoreEnergy := FALSE
GuiControl,, OMG_RestoreEnergy, 0
OMG_WaitForEnergyRecharge()
Return FALSE
}
Sleep, 1000
Return TRUE
}
If (OMG_FindThis(OMG_BtnConfirm, 1, 0.1, 0.1, 450, 460, 690, 535)) {
Return TRUE
}
}
else {
if (OMG_FindThis(OMG_BtnRestoreEnergy, 0, 0.15, 0.15, 450, 460, 690, 535)) {
OMG_FindThis(OMG_ImgTimerDim, 1)
sleep 500
Return FALSE
}
}
Return True
}
OMG_fcnReplayBattle() {
OMG_FindThis(OMG_BtnReplay, 1)
OMG_Client[currentClientIndex]["RunsPerformed"] += 1
If (!OMG_fcnRestoreEnergy()) {
OMG_Client[currentClientIndex]["RunsPerformed"] -= 1
}
NthRun := OMG_Client[currentClientIndex]["RunsPerformed"]
GuiControl, , OMG_guiBtnStartStop, Stop Run: %NthRun%
Return
}
OMG_MakeConfig(OMG_ConfigFileIn) {
FileAppend,
	(
		; Auto-Generated by OMGclick`n`n[Client]`n`n[Monitor]`n`n[Main]`n`n[Energy]`n`n[Auto-Sell]`n`n[Other]
), % OMG_ConfigFileIn, utf-16
OMG_WriteConfig(OMG_ConfigFileIn)
Return
}
OMG_WriteConfig(OMG_ConfigFileIn) {
IniWrite, %OMG_ClientType%, %OMG_ConfigFileIn%, Client, Client Type
IniWrite, %OMG_ClientCount%, %OMG_ConfigFileIn%, Client, Number of Clients
IniWrite, %OMG_MinimizeClientWindow%, %OMG_ConfigFileIn%, Client, Minimize Client
IniWrite, %OMG_Use2ndMonitor%, %OMG_ConfigFileIn%, Monitor, Use 2nd Monitor
IniWrite, %OMG_2ndMonitorPos%, %OMG_ConfigFileIn%, Monitor, Monitor Position
IniWrite, %OMG_BlockInput%, %OMG_ConfigFileIn%, Main, Block User Input
IniWrite, %OMG_CheckBoostEXP2x%, %OMG_ConfigFileIn%, Main, Check 2x EXP Boost
IniWrite, %OMG_StopAtMaxLevel%, %OMG_ConfigFileIn%, Main, Stop At Max Level
IniWrite, %OMG_boolOverrideMaxLevel%, %OMG_ConfigFileIn%, Main, Ignore Levels in Dungeons
IniWrite, %OMG_FullStop%, %OMG_ConfigFileIn%, Main, Disable When Stopped
IniWrite, %OMG_LevelingSingleChamp%, %OMG_ConfigFileIn%, Main, Leveling Single Champion
IniWrite, %OMG_RoundTimeMin%, %OMG_ConfigFileIn%, Main, Round Time Minutes
IniWrite, %OMG_RoundTimeSec%, %OMG_ConfigFileIn%, Main, Round Time Seconds
IniWrite, %OMG_DynamicBattleTime%, %OMG_ConfigFileIn%, Main, Dynamic Battle Time
IniWrite, %OMG_EnergyNeededForRound%, %OMG_ConfigFileIn%, Energy, Energy Per Round
IniWrite, %OMG_RestoreEnergy%, %OMG_ConfigFileIn%, Energy, Restore Energy
IniWrite, %OMG_NumRuns%, %OMG_ConfigFileIn%, Energy, Number of Runs
IniWrite, %OMG_SellArtifacts%, %OMG_ConfigFileIn%, Auto-Sell, Sell Artifacts
IniWrite, %OMG_SaveScreenshots%, %OMG_ConfigFileIn%, Auto-Sell, Save Screenshots
IniWrite, %OMG_SellRank1%, %OMG_ConfigFileIn%, Auto-Sell, Rank 1
IniWrite, %OMG_SellRank2%, %OMG_ConfigFileIn%, Auto-Sell, Rank 2
IniWrite, %OMG_SellRank3%, %OMG_ConfigFileIn%, Auto-Sell, Rank 3
IniWrite, %OMG_SellRank4%, %OMG_ConfigFileIn%, Auto-Sell, Rank 4
IniWrite, %OMG_SellRank5%, %OMG_ConfigFileIn%, Auto-Sell, Rank 5
IniWrite, %OMG_SellRank6%, %OMG_ConfigFileIn%, Auto-Sell, Rank 6
IniWrite, %OMG_SendMode%, %OMG_ConfigFileIn%, Other, SendMode
IniWrite, %OMG_SendModeType%, %OMG_ConfigFileIn%, Other, SendModeType
IniWrite, %OMG_SellAllCh12%, %OMG_ConfigFileIn%, Other, SellAllCh12
IniWrite, %OMG_boolSellAllCampaignLoot%, %OMG_ConfigFileIn%, Other, Sell ALL Campaign Loot
IniWrite, %OMG_CombatModeAuto%, %OMG_ConfigFileIn%, Other, Auto Combat Mode
IniWrite, %OMG_CombatSpeedX2%, %OMG_ConfigFileIn%, Other, Combat Speed x2
IniWrite, %OMG_ReplayDelay%, %OMG_ConfigFileIn%, Other, Replay Delay
IniWrite, %OMG_ShowOSD%, %OMG_ConfigFileIn%, Other, Disable OSD
Return
}
OMG_LoadConfig(OMG_ConfigFileIn) {
IniRead, OMG_ClientType, %OMG_ConfigFileIn%, Client, Client Type
IniRead, OMG_ClientCount, %OMG_ConfigFileIn%, Client, Number of Clients
IniRead, OMG_MinimizeClientWindow, %OMG_ConfigFileIn%, Client, Minimize Client
IniRead, OMG_Use2ndMonitor, %OMG_ConfigFileIn%, Monitor, Use 2nd Monitor
IniRead, OMG_2ndMonitorPos, %OMG_ConfigFileIn%, Monitor, Monitor Position
IniRead, OMG_BlockInput, %OMG_ConfigFileIn%, Main, Block User Input
IniRead, OMG_CheckBoostEXP2x, %OMG_ConfigFileIn%, Main, Check 2x EXP Boost
IniRead, OMG_StopAtMaxLevel, %OMG_ConfigFileIn%, Main, Stop At Max Level
IniRead, OMG_boolOverrideMaxLevel, %OMG_ConfigFileIn%, Main, Ignore Levels in Dungeons
IniRead, OMG_FullStop, %OMG_ConfigFileIn%, Main, Disable When Stopped
IniRead, OMG_LevelingSingleChamp, %OMG_ConfigFileIn%, Main, Leveling Single Champion
IniRead, OMG_RoundTimeMin, %OMG_ConfigFileIn%, Main, Round Time Minutes
IniRead, OMG_RoundTimeSec, %OMG_ConfigFileIn%, Main, Round Time Seconds
IniRead, OMG_DynamicBattleTime, %OMG_ConfigFileIn%, Main, Dynamic Battle Time
IniRead, OMG_EnergyNeededForRound, %OMG_ConfigFileIn%, Energy, Energy Per Round
IniRead, OMG_RestoreEnergy, %OMG_ConfigFileIn%, Energy, Restore Energy
IniRead, OMG_NumRuns, %OMG_ConfigFileIn%, Energy, Number of Runs
IniRead, OMG_SellArtifacts, %OMG_ConfigFileIn%, Auto-Sell, Sell Artifacts
IniRead, OMG_SaveScreenshots, %OMG_ConfigFileIn%, Auto-Sell, Save Screenshots
IniRead, OMG_SellRank1, %OMG_ConfigFileIn%, Auto-Sell, Rank 1
IniRead, OMG_SellRank2, %OMG_ConfigFileIn%, Auto-Sell, Rank 2
IniRead, OMG_SellRank3, %OMG_ConfigFileIn%, Auto-Sell, Rank 3
IniRead, OMG_SellRank4, %OMG_ConfigFileIn%, Auto-Sell, Rank 4
IniRead, OMG_SellRank5, %OMG_ConfigFileIn%, Auto-Sell, Rank 5
IniRead, OMG_SellRank6, %OMG_ConfigFileIn%, Auto-Sell, Rank 6
OMG_RanksToSell := {6:OMG_SellRank6, 5:OMG_SellRank5, 4:OMG_SellRank4, 3:OMG_SellRank3, 2:OMG_SellRank2, 1:OMG_SellRank1}
IniRead, OMG_SendMode, %OMG_ConfigFileIn%, Other, SendMode
IniRead, OMG_SendModeType, %OMG_ConfigFileIn%, Other, SendModeType
IniRead, OMG_SellAllCh12, %OMG_ConfigFileIn%, Other, SellAllCh12
IniRead, OMG_boolSellAllCampaignLoot, %OMG_ConfigFileIn%, Other, Sell ALL Campaign Loot
IniRead, OMG_CombatModeAuto, %OMG_ConfigFileIn%, Other, Auto Combat Mode
IniRead, OMG_CombatSpeedX2, %OMG_ConfigFileIn%, Other, Combat Speed x2
IniRead, OMG_ReplayDelay, %OMG_ConfigFileIn%, Other, Replay Delay
IniRead, OMG_ShowOSD, %OMG_ConfigFileIn%, Other, Disable OSD
Return
}
OMG_GetClientPID() {
if OMG_ClientPID.1
OMG_ClientPID := []
if OMG_Client.1
OMG_Client := []
Loop, %OMG_ClientCount%
{
WinActivateBottom, ahk_exe %OMG_ClientEXE%
WinGet, var, PID, A
OMG_ClientPID.Push(var)
OMG_Client[A_Index] := {"PID":var,"RunsPerformed":1, "RunsComplete":FALSE, "WaitingForNewChamps":FALSE, "EnergyWaitStart":0, "EnergyWaitElapsed":0}
sleep 100
}
Loop, %OMG_ClientCount%
OMG_MinimizeWindow(currentPID)
Return
}
OMG_SetTargetWindow(iPID, clientIndex) {
osdMsg := "Processing Client #" . clientIndex . "/" . OMG_ClientCount . " (PID: " . iPID . ")"
OMG_OSDmsg(osdMsg)
WinGet, MMX, MinMax, ahk_pid %currentPID%
If (MMX == -1) {
WinRestore, ahk_pid %currentPID%
WinWait, ahk_pid %currentPID%, , 3
}
WinGetPos, ThisWinX1, ThisWinY1, ThisWinW, ThisWinH, ahk_pid %iPID%
ThisWinX2 := ThisWinX1 + ThisWinW
ThisWinY2 := ThisWinY1 + ThisWinH
if ((ThisWinW != OMG_ClientWidth) OR (ThisWinH != OMG_ClientHeight) OR (OMG_Debug)) {
OMG_ResizeReposTargetWindow(iPID)
}
OMG_OSDxPos := ThisWinX1 + 10
OMG_OSDyPos := ThisWinY1 + round(ThisWinH/2,0) - (OMG_OSDh/2)
Return
}
OMG_ResizeReposTargetWindow(iPID) {
SysGet, Mon1, MonitorWorkArea, 1
SysGet, Mon2, MonitorWorkArea, 2
WinGetActiveStats, ThisWinTitle, ThisWinW, ThisWinH, ThisWinX1, ThisWinY1
if (OMG_Debug)
{
WinMove, ahk_pid %iPID%, , 0, 0, OMG_ClientWidth, OMG_ClientHeight
Return
}
if (OMG_Use2ndMonitor)
{
if (OMG_2ndMonitorPos == "Left")
{
WinMove, ahk_pid %iPID%, , (Mon2Left/2)-(OMG_ClientWidth/2), (Mon2Bottom/2)-(OMG_ClientHeight/2), OMG_ClientWidth, OMG_ClientHeight
}
else
{
WinMove, ahk_pid %iPID%, , Mon2Left+(((Mon2Right-Mon2Left)/2)-(OMG_ClientWidth/2)), (Mon2Bottom/2)-(OMG_ClientHeight/2), OMG_ClientWidth, OMG_ClientHeight
}
}
else
{
WinMove, ahk_pid %iPID%, , (A_ScreenWidth/2)-(OMG_ClientWidth/2), (A_ScreenHeight/2)-(OMG_ClientHeight/2), OMG_ClientWidth, OMG_ClientHeight
}
Return
}
OMG_FindThis(SearchStringIn, ClickThis := 0, tol0 := 0, tol1 := 0, ResX1 := 0, ResY1 := 0, ResX2 := 0, ResY2 := 0) {
CoordMode, Mouse,Screen
x1 := ThisWinx1 + ResX1
y1 := ThisWinY1 + ResY1
x2 := ResX2 > 0 ? ThisWinX1 + ResX2 : ThisWinX1 + ThisWinW
y2 := ResY2 > 0 ? ThisWinY1 + ResY2 : ThisWinY1 + ThisWinH
if (ok:=FindText(x1, y1, x2, y2, tol0, tol1, SearchStringIn))
{
ClickTargetX := ok.1.x
ClickTargetY := ok.1.y
If (OMG_Debug)
{
MouseTip(ClickTargetX,ClickTargetY)
osdMsg := ok.1.id . " found."
if (ClickThis)
OMG_OSDmsg("Clicking in 3 seconds")
sleep 3000
}
if (ClickThis)
{
if (OMG_BlockInput)
BlockInput, On
WinActivate, ahk_pid %currentPID%
sleep 100
Click, %ClickTargetX%, %ClickTargetY%
sleep 250
}
Return True
}
Return False
}
OMG_CheckMaxLevels() {
OMG_OSDmsg("Checking for max levels")
if (ok:=FindText(ThisWinX1, ThisWinY1 + 250, ThisWinX2, ThisWinY1 + 325, 0.15, 0.15, OMG_TxtMaxLevel))
{
if (OMG_LevelingSingleChamp)
Return TRUE
if (ok.MaxIndex() > 1 AND !OMG_LevelingSingleChamp)
Return TRUE
}
Return FALSE
}
OMG_DisableScript() {
OMG_OSDmsg("Coming to a complete stop now.")
sleep, 1000
OMG_RestoreUserInput()
OMG_guiBtnFcnStartStop()
Return
}
OMG_GetMoreEnergy() {
}
OMG_WaitForEnergyRecharge() {
EnergyRechargeRate := 180000
OMG_OSDmsg("Waiting for more energy...x.")
OMG_EnergyRechargeDelay := EnergyRechargeRate
OMG_DoLongWait := true
Return
}
OMG_ExpBoostNotFound() {
OMG_OSDmsg("+100% EXP Boost not detected")
OMG_RestoreUserInput()
MsgBox, 4, %OMG_MsgBoxTitle%, % "2x EXP Boost has expired. Do you wish to continue grind session?", 5
IfMsgBox, Yes
{
OMG_CheckBoostEXP2x := False
GuiControl,,OMG_CheckBoostEXP2x,0
Return
}
Else
{
MsgBox, 0, %OMG_MsgBoxTitle%, "Terminating grind session.",5
OMG_DisableScript()
Return
}
}
OMG_RestoreUserInput() {
OMG_OSDmsg("You can have your mouse back now.")
BlockInput, Off
Return
}
OMG_MinimizeWindow(targetPID) {
If (OMG_MinimizeClientWindow)	{
OMG_OSDmsg("Minimizing client")
WinMinimize, ahk_pid %targetPID%
}
Return
}
OMG_CalcBattleTime() {
OMG_RoundTime := ((OMG_RoundTimeMin * 60) + OMG_RoundTimeSec ) * 1000
Return
}
OMG_ResetRunCounts() {
Loop, % OMG_Client.MaxIndex()
{
OMG_Client[A_Index]["RunsPerformed"] := 1
OMG_Client[A_Index]["RunsComplete"] := FALSE
}
Return
}
OMG_fcnCheckConnection()
{
If OMG_FindThis(OMG_txtConnectionError, 0, 0.1, 0.1, 450, 200, 700, 300)
{
OMG_OSDmsg("Connection Error detected...trying to reconnect.")
OMG_FindThis(OMG_btnRetry, 1, 0.1, 0.1, 570, 350, 830, 460)
Sleep, 5000
}
Return
}
OMG_DrawGUI() {
Gui, OMG_GUI:Show, Center AutoSize, OMGclick %OMG_version%
Return
}
OMG_PostGUI() {
if (OMG_ClientType == "Plarium Play")
{
OMG_ClientEXE := "Raid.exe"
OMG_ClientWidth := 1149
OMG_ClientHeight := 712
}
if (OMG_ClientType == "BlueStacks")
{
OMG_ClientEXE := "BlueStacks.exe"
OMG_ClientWidth := 1199
OMG_ClientHeight := 682
}
Return
}
OMG_CreateOSD() {
OMG_OSDbgColor = 000000
Gui, OMG_OSD:New, +hWndOMG_OSDhWnd
Gui +LastFound -Caption +ToolWindow +AlwaysOnTop
Gui, Color, %OMG_OSDbgColor%
Gui, Font, bold s13, Arial
Gui, Add, Text, x10 y3 cFFFFFF vOMG_OSDhdr w%OMG_OSDw%,
Gui, Font
Gui, Font, s12
Gui, Add, Text, x10 y+0 cFFFFFF vOMG_OSDmsg w%OMG_OSDw%,
WinSet, Trans, 96
SysGet, OMG_Display1, MonitorWorkArea, 1
xPos := OMG_Display1Left
yPos := OMG_Display1Bottom-80
Return
}
OMG_OSDmsg(msg) {
Gui, 1:Default
SB_SetText("`t" . msg)
if (OMG_ShowOSD) {
Gui, OMG_OSD:Show, x%OMG_OSDxPos% y%OMG_OSDyPos% w%OMG_OSDw% h%OMG_OSDh% NoActivate
GuiControl,OMG_OSD:, OMG_OSDhdr, OMGclick Status:
GuiControl,OMG_OSD:, OMG_OSDmsg, %msg%
}
return
}
OMG_OSDoff() {
Gui, 1:Default
SB_SetText("`tConditions met for session halt. Press START to resume.")
if (OMG_ShowOSD) {
GuiControl,OMG_OSD:, OMG_OSDhdr,
GuiControl,OMG_OSD:, OMG_OSDmsg,
Gui, OMG_OSD:Hide
}
return
}
FindText( x1, y1, x2, y2, err1, err0, text, ScreenShot:=1
, FindAll:=1, JoinText:=0, offsetX:=20, offsetY:=10 ) {
local
bch:=A_BatchLines
SetBatchLines, -1
x:=(x1<x2 ? x1:x2), y:=(y1<y2 ? y1:y2)
, w:=Abs(x2-x1)+1, h:=Abs(y2-y1)+1
, xywh2xywh(x,y,w,h,x,y,w,h,zx,zy,zw,zh)
if (w<1 or h<1)
{
SetBatchLines, %bch%
return 0
}
bits:=GetBitsFromScreen(x,y,w,h,ScreenShot,zx,zy,zw,zh)
sx:=x-zx, sy:=y-zy, sw:=w, sh:=h, arr:=[], info:=[]
Loop, Parse, text, |
if IsObject(j:=PicInfo(A_LoopField))
info.Push(j)
if (!(num:=info.MaxIndex()) or !bits.1)
{
SetBatchLines, %bch%
return 0
}
VarSetCapacity(input, num*7*4), k:=0
Loop, % num
k+=Round(info[A_Index].2 * info[A_Index].3)
VarSetCapacity(s1, k*4), VarSetCapacity(s0, k*4)
, VarSetCapacity(gs, sw*sh), VarSetCapacity(ss, sw*sh)
, allpos_max:=(FindAll ? 1024 : 1)
, VarSetCapacity(allpos, allpos_max*4)
Loop, 2
{
if (err1=0 and err0=0) and (num>1 or A_Index>1)
err1:=0.1, err0:=0.05
if (JoinText)
{
j:=info[1], mode:=j.8, color:=j.9, n:=j.10
, w1:=-1, h1:=j.3, comment:="", v:="", i:=0
Loop, % num
{
j:=info[A_Index], w1+=j.2+1, comment.=j.11
Loop, 7
NumPut((A_Index=1 ? StrLen(v)
: A_Index=6 and err1 and !j.12 ? Round(j.4*err1)
: A_Index=7 and err0 and !j.12 ? Round(j.5*err0)
: j[A_Index]), input, 4*(i++), "int")
v.=j.1
}
ok:=PicFind( mode,color,n,offsetX,offsetY
, bits,sx,sy,sw,sh,gs,ss,v,s1,s0
, input,num*7,allpos,allpos_max )
Loop, % ok
pos:=NumGet(allpos, 4*(A_Index-1), "uint")
, rx:=(pos&0xFFFF)+zx, ry:=(pos>>16)+zy
, arr.Push( {1:rx, 2:ry, 3:w1, 4:h1
, x:rx+w1//2, y:ry+h1//2, id:comment} )
}
else
{
For i,j in info
{
mode:=j.8, color:=j.9, n:=j.10, comment:=j.11
, w1:=j.2, h1:=j.3, v:=j.1
Loop, 7
NumPut((A_Index=1 ? 0
: A_Index=6 and err1 and !j.12 ? Round(j.4*err1)
: A_Index=7 and err0 and !j.12 ? Round(j.5*err0)
: j[A_Index]), input, 4*(A_Index-1), "int")
ok:=PicFind( mode,color,n,offsetX,offsetY
, bits,sx,sy,sw,sh,gs,ss,v,s1,s0
, input,7,allpos,allpos_max )
Loop, % ok
pos:=NumGet(allpos, 4*(A_Index-1), "uint")
, rx:=(pos&0xFFFF)+zx, ry:=(pos>>16)+zy
, arr.Push( {1:rx, 2:ry, 3:w1, 4:h1
, x:rx+w1//2, y:ry+h1//2, id:comment} )
if (ok and !FindAll)
Break
}
}
if (err1=0 and err0=0 and num=1 and !arr.MaxIndex())
{
k:=0
For i,j in info
k+=(!j.12)
if (k=0)
Break
}
else Break
}
SetBatchLines, %bch%
return arr.MaxIndex() ? arr:0
}
BindWindow(window_id:=0, set_exstyle:=0, get:=0) {
local
static id:=0, old:=0
if (get)
return id
if (window_id)
{
id:=window_id, old:=0
if (set_exstyle)
{
WinGet, old, ExStyle, ahk_id %id%
WinSet, Transparent, 255, ahk_id %id%
Loop, 30
{
Sleep, 100
WinGet, i, Transparent, ahk_id %id%
}
Until (i=255)
}
}
else
{
if (old)
WinSet, ExStyle, %old%, ahk_id %id%
id:=old:=0
}
}
xywh2xywh(x1,y1,w1,h1, ByRef x,ByRef y,ByRef w,ByRef h
, ByRef zx:="", ByRef zy:="", ByRef zw:="", ByRef zh:="") {
local
SysGet, zx, 76
SysGet, zy, 77
SysGet, zw, 78
SysGet, zh, 79
left:=x1, right:=x1+w1-1, up:=y1, down:=y1+h1-1
left:=left<zx ? zx:left, right:=right>zx+zw-1 ? zx+zw-1:right
up:=up<zy ? zy:up, down:=down>zy+zh-1 ? zy+zh-1:down
x:=left, y:=up, w:=right-left+1, h:=down-up+1
}
GetBitsFromScreen(x, y, w, h, ScreenShot:=1
, ByRef zx:="", ByRef zy:="", ByRef zw:="", ByRef zh:="") {
local
static hBM:="", bits:=[], Ptr:=A_PtrSize ? "UPtr" : "UInt"
static init:=!GetBitsFromScreen(0,0,0,0,1)
if (!ScreenShot)
{
zx:=bits.3, zy:=bits.4, zw:=bits.5, zh:=bits.6
return bits
}
bch:=A_BatchLines, cri:=A_IsCritical
Critical
if (zw<1 or zh<1)
{
SysGet, zx, 76
SysGet, zy, 77
SysGet, zw, 78
SysGet, zh, 79
}
if (zw>bits.5 or zh>bits.6 or !hBM)
{
DllCall("DeleteObject", Ptr,hBM), hBM:="", bpp:=32
VarSetCapacity(bi, 40, 0), NumPut(40, bi, 0, "int")
NumPut(zw, bi, 4, "int"), NumPut(-zh, bi, 8, "int")
NumPut(1, bi, 12, "short"), NumPut(bpp, bi, 14, "short")
hBM:=DllCall("CreateDIBSection", Ptr,0, Ptr,&bi
, "int",0, Ptr "*",ppvBits:=0, Ptr,0, "int",0, Ptr)
Scan0:=(!hBM ? 0:ppvBits), Stride:=((zw*bpp+31)//32)*4
bits.1:=Scan0, bits.2:=Stride
bits.3:=zx, bits.4:=zy, bits.5:=zw, bits.6:=zh
x:=zx, y:=zy, w:=zw, h:=zh
}
if (hBM) and !(w<1 or h<1)
{
win:=DllCall("GetDesktopWindow", Ptr)
hDC:=DllCall("GetWindowDC", Ptr,win, Ptr)
mDC:=DllCall("CreateCompatibleDC", Ptr,hDC, Ptr)
oBM:=DllCall("SelectObject", Ptr,mDC, Ptr,hBM, Ptr)
DllCall("BitBlt",Ptr,mDC,"int",x-zx,"int",y-zy,"int",w,"int",h
, Ptr,hDC, "int",x, "int",y, "uint",0x00CC0020|0x40000000)
DllCall("ReleaseDC", Ptr,win, Ptr,hDC)
if (id:=BindWindow(0,0,1))
WinGet, id, ID, ahk_id %id%
if (id)
{
WinGetPos, wx, wy, ww, wh, ahk_id %id%
left:=x, right:=x+w-1, up:=y, down:=y+h-1
left:=left<wx ? wx:left, right:=right>wx+ww-1 ? wx+ww-1:right
up:=up<wy ? wy:up, down:=down>wy+wh-1 ? wy+wh-1:down
x:=left, y:=up, w:=right-left+1, h:=down-up+1
}
if (id) and !(w<1 or h<1)
{
hDC2:=DllCall("GetDCEx", Ptr,id, Ptr,0, "int",3, Ptr)
DllCall("BitBlt",Ptr,mDC,"int",x-zx,"int",y-zy,"int",w,"int",h
, Ptr,hDC2, "int",x-wx, "int",y-wy, "uint",0x00CC0020|0x40000000)
DllCall("ReleaseDC", Ptr,id, Ptr,hDC2)
}
DllCall("SelectObject", Ptr,mDC, Ptr,oBM)
DllCall("DeleteDC", Ptr,mDC)
}
Critical, %cri%
SetBatchLines, %bch%
return bits
}
PicInfo(text) {
local
static info:=[]
If !InStr(text,"$")
return
if (info[text])
return info[text]
v:=text, comment:="", e1:=e0:=0, set_e1_e0:=0
if RegExMatch(v,"<([^>]*)>",r)
v:=StrReplace(v,r), comment:=Trim(r1)
if RegExMatch(v,"\[([^\]]*)]",r)
{
v:=StrReplace(v,r)
r:=StrSplit(r1, ",")
e1:=r.1, e0:=r.2, set_e1_e0:=1
}
r:=StrSplit(v,"$")
color:=r.1, v:=r.2
r:=StrSplit(v,".")
w1:=r.1, v:=base64tobit(r.2), h1:=StrLen(v)//w1
if (w1<1 or h1<1 or StrLen(v)!=w1*h1)
return
mode:=InStr(color,"-") ? 4 : InStr(color,"#") ? 3
: InStr(color,"**") ? 2 : InStr(color,"*") ? 1 : 0
if (mode=4)
{
color:=StrReplace(color,"0x")
r:=StrSplit(color,"-")
color:="0x" r.1, n:="0x" r.2
}
else
{
color:=RegExReplace(color,"[*#]")
r:=StrSplit(color,"@")
color:=r.1, n:=Round(r.2,2)+(!r.2)
, n:=Floor(9*255*255*(1-n)*(1-n))
}
StrReplace(v,"1","",len1), len0:=StrLen(v)-len1
, e1:=Round(len1*e1), e0:=Round(len0*e0)
return info[text]:=[v,w1,h1,len1,len0,e1,e0
, mode,color,n,comment,set_e1_e0]
}
PicFind(mode, color, n, offsetX, offsetY
, bits, sx, sy, sw, sh
, ByRef gs, ByRef ss, ByRef text, ByRef s1, ByRef s0
, ByRef input, num, ByRef allpos, allpos_max) {
local
static MyFunc:="", Ptr:=A_PtrSize ? "UPtr" : "UInt"
if (!MyFunc)
{
x32:="5557565383EC788B8424CC0000008BBC24CC000000C7442"
. "424000000008B40048B7F148944243C8B8424CC000000897C2"
. "42C8BBC24CC0000008B40088B7F18894424388B8424CC00000"
. "0897C24308B400C89C6894424288B8424CC0000008B401039C"
. "6894424200F4DC68944241C8B8424D000000085C00F8E15010"
. "0008BB424CC0000008B44242489F78B0C868B7486048B44870"
. "88974241085C0894424180F8ED700000089CD894C2414C7442"
. "40C00000000C744240800000000C744240400000000890C248"
. "D76008DBC27000000008B5C24108B7424088B4C24148B54240"
. "C89DF89F029F101F78BB424C000000001CE85DB7E5E8B0C248"
. "9EB893C2489D7EB198BAC24C800000083C70483C00189548D0"
. "083C101390424742C83BC248C0000000389FA0F45D0803C063"
. "175D48BAC24C400000083C70483C00189549D0083C30139042"
. "475D48B7424100174241489DD890C2483442404018BB424B00"
. "000008B442404017424088BBC24A4000000017C240C3944241"
. "80F8554FFFFFF83442424078B442424398424D00000000F8FE"
. "BFEFFFF83BC248C000000030F84A00600008B8424A40000008"
. "BB424A80000000FAF8424AC0000008BBC24A40000008D2CB08"
. "B8424B0000000F7D88D04878BBC248C0000008944241085FF0"
. "F84F702000083BC248C000000010F847F08000083BC248C000"
. "000020F84330900008B8424900000008B9C24940000000FB6B"
. "C24940000000FB6B42490000000C744241800000000C744242"
. "400000000C1E8100FB6DF0FB6D08B84249000000089D10FB6C"
. "4894424088B842494000000C1E8100FB6C029C101D08904248"
. "B442408894C24408B4C240801D829D9894424088D043E894C2"
. "40489F129F9894424148BBC24B40000008B8424B0000000894"
. "C240C89E98B6C2440C1E00285FF894424340F8EBA0000008BB"
. "424B000000085F60F8E910000008B8424A00000008B5424240"
. "39424BC00000001C8034C243489CF894C244003BC24A000000"
. "0EB3D8D76008DBC2700000000391C247C3D394C24047F37394"
. "C24087C3189F30FB6F33974240C0F9EC3397424140F9DC183C"
. "00483C20121D9884AFF39F8741E0FB658020FB648010FB6303"
. "9DD7EBE31C983C00483C201884AFF39F875E28BB424B000000"
. "0017424248B4C24408344241801034C24108B442418398424B"
. "40000000F8546FFFFFF8B8424B00000002B44243C8944240C8"
. "B8424B40000002B442438894424600F886D0900008B4424288"
. "BBC24C40000008B74243CC744241000000000C744243800000"
. "000C7442434000000008D3C8789C583EE01897C246C8974247"
. "48B44240C85C00F88E70000008B7C24388B8424AC000000BE0"
. "0000000C704240000000001F8C1E0108944246889F82B84249"
. "C0000000F49F08B84249C000000897424640FAFB424B000000"
. "001F8894424708974245C8DB6000000008B04240344241089C"
. "1894424088B442430394424200F84AA0100008B5C241C89C60"
. "38C24BC00000031C08B54242C85DB0F8EC8010000897424048"
. "B7C2420EB2D39C77E1C8BB424C80000008B1C8601CB803B007"
. "40B836C240401782B8D74260083C0013944241C0F849101000"
. "039C57ECF8BB424C40000008B1C8601CB803B0174BE83EA017"
. "9B9830424018B04243944240C0F8D68FFFFFF83442438018BB"
. "424B00000008B44243801742410394424600F8DEFFEFFFF8B4"
. "C243483C47889C85B5E5F5DC250008B8424900000008BB424B"
. "4000000C744240C00000000C744241400000000C1E8100FB6C"
. "08904248B8424900000000FB6C4894424040FB684249000000"
. "0894424088B8424B0000000C1E00285F68944242489E88BAC2"
. "4940000000F8E24FEFFFF8B9C24B000000085DB7E758B9C24A"
. "00000008B7424148BBC24A000000003B424BC00000001C3034"
. "424248944241801C78D76008DBC27000000000FB643020FB64"
. "B012B04242B4C24040FB6132B5424080FAFC00FAFC98D04400"
. "FAFD28D04888D045039C50F930683C30483C60139DF75C98BB"
. "C24B0000000017C24148B4424188344240C01034424108B742"
. "40C39B424B40000000F8566FFFFFFE985FDFFFF85ED7E358B7"
. "424088BBC24BC00000031C08B54242C8D1C378BB424C400000"
. "08B0C8601D9803901740983EA010F8890FEFFFF83C00139C57"
. "5E683BC24D0000000070F8EAA0100008B442474030424C7442"
. "44007000000896C2444894424288B8424CC00000083C020894"
. "4243C8B44243C8B9424B00000008B7C24288B0029C28944245"
. "08B84249800000001F839C20F4EC289C68944244C39FE0F8C0"
. "90100008B44243C8B700C8B78108B6808897424148B7014897"
. "C242489C7897424548BB424B40000002B700489F08B7424703"
. "9C60F4EC68BB424C4000000894424188B47FC89442404C1E00"
. "201C6038424C8000000894424588B4424648B7C2428037C245"
. "C3B442418894424040F8F8700000085ED7E268B8C24BC00000"
. "08B54242431C08D1C398B0C8601D9803901740583EA01784A8"
. "3C00139C575EA8B4424148B4C245439C8747E85C07E7A8B9C2"
. "4BC000000896C244831C08B6C245801FBEB0983C0013944241"
. "4745C8B54850001DA803A0074EC83E90179E78B6C244890834"
. "424040103BC24B00000008B442404394424180F8D79FFFFFF8"
. "3442428018B4424283944244C0F8D4CFFFFFF830424018B6C2"
. "4448B04243944240C0F8D7EFCFFFFE911FDFFFF8B4424288B7"
. "C245083442440078344243C1C8D4438FF894424288B4424403"
. "98424D00000000F8F7FFEFFFF8B6C24448B7C24348B0424038"
. "424A80000008BB424D40000000B4424688D4F01398C24D8000"
. "0008904BE0F8ED8FCFFFF85ED7E278B7424088BBC24BC00000"
. "08B8424C40000008D1C378B74246C8B1083C00401DA39F0C60"
. "20075F283042401894C24348B04243944240C0F8DDEFBFFFFE"
. "971FCFFFF89F68DBC27000000008B74243C8B8424900000003"
. "1D2F7F60FAF8424A40000008D0490894424188B8424B000000"
. "0038424A800000029F0894424348B8424AC000000038424B40"
. "000002B442438398424AC0000008944243C0F8F560400008B8"
. "424A40000008BB424A80000000FAF8424AC000000C74424240"
. "00000008D04B0034424188BB424A0000000894424388B44243"
. "4398424A80000000F8F320100008B8424AC000000C1E010894"
. "424408B442438894424148B8424A8000000894424088B44241"
. "40FB67C060289C52B6C2418893C240FB67C0601897C24040FB"
. "63C068B44241C85C00F8E1E0100008B442430894424108B442"
. "42C8944240C31C0EB678D76008DBC2700000000394424207E4"
. "A8B9C24C80000008B0C8301E90FB6540E020FB65C0E012B142"
. "42B5C24040FB60C0E0FAFD20FAFDB29F98D14520FAFC98D149"
. "A8D144A39942494000000720C836C2410017865908D7426008"
. "3C0013944241C0F84A3000000394424287E9D8B9C24C400000"
. "08B0C8301E90FB6540E020FB65C0E012B14242B5C24040FB60"
. "C0E0FAFD20FAFDB29F98D14520FAFC98D149A8D144A3B94249"
. "40000000F865BFFFFFF836C240C010F8950FFFFFF834424080"
. "183442414048B442408394424340F8DEFFEFFFF838424AC000"
. "000018BBC24A40000008B44243C017C24383B8424AC0000000"
. "F8D99FEFFFF8B4C242483C4785B5E89C85F5DC250008D74260"
. "08B7C24248B4424400B4424088B9C24D40000008D4F013B8C2"
. "4D80000008904BB0F8D64FAFFFF894C2424EB848B842490000"
. "0008B8C24B4000000C7042400000000C74424040000000083C"
. "001C1E00789C68B8424B0000000C1E00285C98944240889E88"
. "9F50F8EAFF8FFFF8B9424B000000085D27E5F8B8C24A000000"
. "08B5C2404039C24BC00000001C1034424088944240C038424A"
. "000000089C70FB651020FB641010FB6316BC04B6BD22601C28"
. "9F0C1E00429F001D039C50F970383C10483C30139F975D58BB"
. "424B0000000017424048B44240C83042401034424108B34243"
. "9B424B40000007582E92CF8FFFF8B8424B0000000C70424000"
. "00000C744240400000000C1E002894424088B8424B40000008"
. "5C00F8E920000008B8424B000000085C07E6F8B8C24A000000"
. "08B5C24048BB424B800000001E9036C240801DE039C24BC000"
. "000896C240C03AC24A00000000FB651020FB6410183C1040FB"
. "679FC83C60183C3016BC04B6BD22601C289F8C1E00429F801D"
. "0C1F8078846FFC643FF0039CD75CC8BBC24B0000000017C240"
. "48B6C240C83042401036C24108B0424398424B40000000F856"
. "EFFFFFF83BC24B4000000020F8E60F7FFFF8B8424BC0000000"
. "38424B00000008BAC24B800000003AC24B0000000C74424040"
. "1000000894424088B8424B400000083E8018944240C8B8424B"
. "000000083C0018944241083BC24B0000000027E798B4424108"
. "9E92B8C24B00000008B5C240889EA8D34288D45FE8904240FB"
. "642010FB63A0384249000000039F87C360FB67A0239F87C2E0"
. "FB6790139F87C260FB63E39F87C1F0FB63939F87C180FB6790"
. "239F87C100FB67EFF39F87C080FB67E0139F87D04C64301018"
. "3C20183C30183C10183C6013B0C2475A3834424040103AC24B"
. "00000008B4424048BBC24B0000000017C24083944240C0F855"
. "8FFFFFFE96FF6FFFF83C47831C95B89C85E5F5DC2500090909"
. "090909090"
x64:="4157415641554154555756534881EC88000000488B84245"
. "0010000488BB42450010000448B94245801000089542428448"
. "944240844898C24E80000008B40048B76144C8BBC244001000"
. "04C8BB42448010000C74424180000000089442430488B84245"
. "00100008974241C488BB424500100008B40088B76188944243"
. "C488B842450010000897424388B400C89C789442440488B842"
. "4500100008B401039C7894424100F4DC74585D289442454488"
. "B84245001000048894424200F8ECB000000488B442420448B0"
. "8448B68048B400885C0894424040F8E940000004489CE44890"
. "C244531E431FF31ED0F1F8400000000004585ED7E614863142"
. "4418D5C3D0089F848039424380100004589E0EB1D0F1F0083C"
. "0014D63D94183C0044183C1014883C20139C34789149E74288"
. "3F9034589C2440F45D0803A3175D783C0014C63DE4183C0048"
. "3C6014883C20139C34789149F75D844012C2483C50103BC241"
. "80100004403A42400010000396C24047582834424180748834"
. "424201C8B442418398424580100000F8F35FFFFFF83F9030F8"
. "43D0600008B8424000100008BBC24080100000FAF842410010"
. "0008BB424000100008D3CB88B842418010000F7D885C9448D2"
. "C860F841101000083F9010F844108000083F9020F84E008000"
. "08B742428C744240400000000C74424180000000089F0440FB"
. "6CEC1E8104589CC0FB6D84889F08B7424080FB6D44189DB89F"
. "0440FB6C64889F1C1E8100FB6CD89D60FB6C08D2C0A8B94242"
. "00100004129C301C3438D040129CE4529C48904248B8424180"
. "10000C1E00285D2894424080F8E660100004C89BC244001000"
. "0448BBC24180100004585FF0F8E91040000488B8C24F800000"
. "04863C74C6354241831D24C03942430010000488D440102EB3"
. "A0F1F80000000004439C37C4039CE7F3C39CD7C384539CC410"
. "F9EC044390C240F9DC14421C141880C124883C2014883C0044"
. "139D70F8E2D040000440FB6000FB648FF440FB648FE4539C37"
. "EBB31C9EBD58B5C2428448B8C242001000031ED4531E44889D"
. "84189DB0FB6DB0FB6F48B84241801000041C1EB10450FB6DBC"
. "1E0024585C98904240F8EA10000004C89BC24400100004C89B"
. "42448010000448B7C2408448BB424180100004585F67E60488"
. "B8C24F80000004D63D44C039424300100004863C74531C94C8"
. "D440102410FB600410FB648FF410FB650FE4429D829F10FAFC"
. "029DA0FAFC98D04400FAFD28D04888D04504139C7430F93040"
. "A4983C1014983C0044539CE7FC4033C244501F483C5014401E"
. "F39AC2420010000758C4C8BBC24400100004C8BB4244801000"
. "08B8424180100002B4424308904248B8424200100002B44243"
. "C894424680F88750800008B7C24404D89F5488BAC243001000"
. "0448B7424104C89FEC74424040000000048C74424280000000"
. "0C74424200000000089F883E801498D4487044189FF4889442"
. "4088B44243083E801894424788B042485C00F88D9000000488"
. "B5C24288B8424100100004D89EC448B6C245401D8C1E010894"
. "4247089D82B8424F000000089C7B8000000000F49C731FF894"
. "4246C0FAF842418010000894424648B8424F000000001D8894"
. "42474908B442404897C24188D1C388B4424384139C60F84AB0"
. "000004189C131C04585ED448B44241C7F36E9C30000000F1F4"
. "0004139CE7E1B418B148401DA4863D2807C150000740B4183E"
. "901782E0F1F4400004883C0014139C50F8E920000004139C78"
. "9C17ECC8B148601DA4863D2807C15000174BD4183E80179B74"
. "883C701393C240F8D7AFFFFFF4D89E54883442428018B9C241"
. "8010000488B442428015C2404394424680F8DFCFEFFFF8B4C2"
. "42089C84881C4880000005B5E5F5D415C415D415E415FC3458"
. "5FF7E278B4C241C4C8B4424084889F28B0201D84898807C050"
. "001740583E90178934883C2044939D075E583BC24580100000"
. "70F8EE60100008B442478488B8C24500100000344241844896"
. "C2450448BAC241801000044897C24404883C1204889742410C"
. "744243C07000000448974244448897C24484989CF895C247C8"
. "9C64C89642430418B074489EA29C28944245C8B8424E800000"
. "001F039C20F4EC239F0894424580F8CD0000000418B47148BB"
. "C2420010000412B7F0449635FFC458B4F08458B670C8944246"
. "08B442474458B771039C70F4FF8488B44241048C1E3024C8D1"
. "41848035C24308B442464448D04068B44246C39F84189C37F7"
. "2904585C97E234489F131D2418B04924401C04898807C05000"
. "1740583E90178464883C2014139D17FE28B4424604139C40F8"
. "4AA0000004585E40F8EA100000089C131D2EB0D4883C201413"
. "9D40F8E8E0000008B04934401C04898807C05000074E483E90"
. "179DF4183C3014501E84439DF7D8F83C601397424580F8D6EF"
. "FFFFF488B7C2448448B7C2440448B742444448B6C2450488B7"
. "424104C8B6424304883C701393C240F8D97FDFFFFE918FEFFF"
. "F6690037C240844017C241883442404014401EF8B442404398"
. "424200100000F854DFBFFFF4C8BBC2440010000E996FCFFFF8"
. "B44245C8344243C074983C71C8D7406FF8B44243C398424580"
. "100000F8F87FEFFFF448B7C2440448B742444448B6C2450488"
. "B7C24488B5C247C488B7424104C8B64243048634424208B542"
. "418039424080100004C8B9C24600100000B5424708D4801398"
. "C2468010000418914830F8E9AFDFFFF4585FF7E1D4C8B44240"
. "84889F08B104883C00401DA4C39C04863D2C64415000075EB4"
. "883C701393C24894C24200F8DBAFCFFFFE93BFDFFFF0F1F440"
. "0008B7C24308B44242831D2F7F70FAF8424000100008D04908"
. "94424208B8424180100000384240801000029F8894424308B8"
. "42410010000038424200100002B44243C39842410010000894"
. "424440F8F2B0400008B8424000100008BBC24080100000FAF8"
. "42410010000448B642440448B6C24544C8B8C24F8000000C74"
. "42428000000008D04B8034424208944243C8B4424303984240"
. "80100000F8F360100008B8424100100008B6C243CC1E010894"
. "424408B8424080100008904248D450289EF2B7C24204585ED4"
. "898450FB61C018D45014898410FB61C014863C5410FB634010"
. "F8E1C0100008B442438894424188B44241C8944240431C0EB6"
. "90F1F800000000044395424107E4E418B0C8601F98D5102448"
. "D41014863C9410FB60C094863D24D63C0410FB61411470FB60"
. "40129F10FAFC94429DA4129D80FAFD2450FAFC08D1452428D1"
. "4828D144A395424087207836C241801786B4883C0014139C50"
. "F8E9F0000004139C44189C27E96418B0C8701F98D5102448D4"
. "1014863C9410FB60C094863D24D63C0410FB61411470FB6040"
. "129F10FAFC94429DA4129D80FAFD2450FAFC08D1452428D148"
. "28D144A3B5424080F864BFFFFFF836C2404010F8940FFFFFF8"
. "304240183C5048B0424394424300F8DE6FEFFFF83842410010"
. "000018BBC24000100008B442444017C243C3B8424100100000"
. "F8D95FEFFFF8B4C2428E95CFBFFFF48634424288B5424400B1"
. "424488BBC24600100008D48013B8C24680100008914870F8D3"
. "5FBFFFF8304240183C504894C24288B0424394424300F8D7AF"
. "EFFFFEB92448B5C2428448B84242001000031DB8B842418010"
. "00031F6448B9424180100004183C30141C1E3074585C08D2C8"
. "5000000000F8E6BF9FFFF4585D27E57488B8C24F80000004C6"
. "3CE4C038C24300100004863C74531C0488D4C01020FB6110FB"
. "641FF440FB661FE6BC04B6BD22601C24489E0C1E0044429E00"
. "1D04139C3430F9704014983C0014883C1044539C27FCC01EF4"
. "401D683C3014401EF399C24200100007595E9FBF8FFFF8B8C2"
. "4200100008B84241801000031DB31F6448B8C241801000085C"
. "98D2C85000000007E7D4585C97E694C63C6488B8C24F800000"
. "04863C74D89C24C038424300100004C0394242801000031D24"
. "88D4C0102440FB6190FB641FF4883C104440FB661FA6BC04B4"
. "56BDB264101C34489E0C1E0044429E04401D8C1F8074188041"
. "241C60410004883C2014139D17FC401EF4401CE83C3014401E"
. "F399C2420010000758383BC2420010000020F8E4BF8FFFF486"
. "3B424180100008B9C24180100008BBC2420010000488D56014"
. "48D67FFBF010000004889D0480394243001000048038424280"
. "100004889D58D53FD4C8D6A0183BC241801000002488D1C067"
. "E7E4989C04D8D5C05004989D94929F04889E90FB610440FB65"
. "0FF035424284439D27C44440FB650014439D27C3A450FB6104"
. "439D27C31450FB6114439D27C28450FB650FF4439D27C1E450"
. "FB650014439D27C14450FB651FF4439D27C0A450FB65101443"
. "9D27D03C601014883C0014983C1014883C1014983C0014C39D"
. "8759383C7014801F54889D84139FC0F8562FFFFFFE968F7FFF"
. "F31C9E9D9F8FFFF909090909090909090909090"
MCode(MyFunc, A_PtrSize=8 ? x64:x32)
}
return !bits.1 ? 0:DllCall(&MyFunc, "int",mode, "uint",color
, "uint",n, "int",offsetX, "int",offsetY, Ptr,bits.1
, "int",bits.2, "int",sx, "int",sy, "int",sw, "int",sh
, Ptr,&gs, Ptr,&ss, "AStr",text, Ptr,&s1, Ptr,&s0
, Ptr,&input, "int",num, Ptr,&allpos, "int",allpos_max)
}
MCode(ByRef code, hex) {
local
bch:=A_BatchLines
SetBatchLines, -1
VarSetCapacity(code, len:=StrLen(hex)//2)
lls:=A_ListLines=0 ? "Off" : "On"
ListLines, Off
Loop, % len
NumPut("0x" SubStr(hex,2*A_Index-1,2),code,A_Index-1,"uchar")
ListLines, %lls%
Ptr:=A_PtrSize ? "UPtr" : "UInt", PtrP:=Ptr "*"
DllCall("VirtualProtect",Ptr,&code, Ptr,len,"uint",0x40,PtrP,0)
SetBatchLines, %bch%
}
base64tobit(s) {
local
Chars:="0123456789+/ABCDEFGHIJKLMNOPQRSTUVWXYZ"
. "abcdefghijklmnopqrstuvwxyz"
lls:=A_ListLines=0 ? "Off" : "On"
ListLines, Off
Loop, Parse, Chars
{
i:=A_Index-1, v:=(i>>5&1) . (i>>4&1)
. (i>>3&1) . (i>>2&1) . (i>>1&1) . (i&1)
s:=RegExReplace(s,"[" A_LoopField "]",StrReplace(v,"0x"))
}
ListLines, %lls%
return RegExReplace(RegExReplace(s,"10*$"),"[^01]+")
}
bit2base64(s) {
local
s:=RegExReplace(s,"[^01]+")
s.=SubStr("100000",1,6-Mod(StrLen(s),6))
s:=RegExReplace(s,".{6}","|$0")
Chars:="0123456789+/ABCDEFGHIJKLMNOPQRSTUVWXYZ"
. "abcdefghijklmnopqrstuvwxyz"
lls:=A_ListLines=0 ? "Off" : "On"
ListLines, Off
Loop, Parse, Chars
{
i:=A_Index-1, v:="|" . (i>>5&1) . (i>>4&1)
. (i>>3&1) . (i>>2&1) . (i>>1&1) . (i&1)
s:=StrReplace(s,StrReplace(v,"0x"),A_LoopField)
}
ListLines, %lls%
return s
}
ASCII(s)
{
local
if RegExMatch(s,"\$(\d+)\.([\w+/]+)",r)
{
s:=RegExReplace(base64tobit(r2),".{" r1 "}","$0`n")
s:=StrReplace(StrReplace(s,"0","_"),"1","0")
}
else s=
return s
}
PicLib(comments, add_to_Lib:=0, index:=1) {
local
static Lib:=[]
if (add_to_Lib)
{
re:="<([^>]*)>[^$]+\$\d+\.[\w+/]+"
Loop, Parse, comments, |
if RegExMatch(A_LoopField,re,r)
{
s1:=Trim(r1), s2:=""
Loop, Parse, s1
s2.="_" . Format("{:d}",Ord(A_LoopField))
Lib[index,s2]:=r
}
Lib[index,""]:=""
}
else
{
Text:=""
Loop, Parse, comments, |
{
s1:=Trim(A_LoopField), s2:=""
Loop, Parse, s1
s2.="_" . Format("{:d}",Ord(A_LoopField))
Text.="|" . Lib[index,s2]
}
return Text
}
}
PicN(Number, index:=1) {
return PicLib(RegExReplace(Number,".","|$0"), 0, index)
}
PicX(Text) {
local
if !RegExMatch(Text,"\|([^$]+)\$(\d+)\.([\w+/]+)",r)
return Text
v:=base64tobit(r3), Text:=""
c:=StrLen(StrReplace(v,"0"))<=StrLen(v)//2 ? "1":"0"
wz:=RegExReplace(v,".{" r2 "}","$0`n")
While InStr(wz,c)
{
While !(wz~="m`n)^" c)
wz:=RegExReplace(wz,"m`n)^.")
i:=0
While (wz~="m`n)^.{" i "}" c)
i:=Format("{:d}",i+1)
v:=RegExReplace(wz,"m`n)^(.{" i "}).*","$1")
wz:=RegExReplace(wz,"m`n)^.{" i "}")
if (v!="")
Text.="|" r1 "$" i "." bit2base64(v)
}
return Text
}
ScreenShot(x1:="", y1:="", x2:="", y2:="") {
local
if (x1+y1+x2+y2="")
n:=150000, x:=y:=-n, w:=h:=2*n
else
x:=(x1<x2 ? x1:x2), y:=(y1<y2 ? y1:y2)
, w:=Abs(x2-x1)+1, h:=Abs(y2-y1)+1
xywh2xywh(x,y,w,h,x,y,w,h,zx,zy,zw,zh)
GetBitsFromScreen(x,y,w,h,1,zx,zy,zw,zh)
}
ScreenShot_GetColor(x,y) {
local
bits:=GetBitsFromScreen(0,0,0,0,0,zx,zy,zw,zh)
return (x<zx or x>zx+zw-1 or y<zy or y>zy+zh-1 or !bits.1)
? "0xFFFFFF" : Format("0x{:06X}",NumGet(bits.1
+(y-zy)*bits.2+(x-zx)*4,"uint")&0xFFFFFF)
}
OcrOK(ok, offsetX:=20, offsetY:=20) {
local
ocr_Text:=ocr_X:=ocr_Y:=min_X:=""
For k,v in ok
x:=v.1
, min_X:=(A_Index=1 or x<min_X ? x : min_X)
, max_X:=(A_Index=1 or x>max_X ? x : max_X)
While (min_X!="" and min_X<=max_X)
{
LeftX:=""
For k,v in ok
{
x:=v.1, y:=v.2, w:=v.3, h:=v.4
if (x<min_X) or Abs(y-ocr_Y)>offsetY
Continue
if (LeftX="" or x<LeftX)
LeftX:=x, LeftY:=y, LeftW:=w, LeftH:=h, LeftOCR:=v.id
else if (x=LeftX)
{
Loop, 100
{
err:=(A_Index-1)/100+0.000001
if FindText(LeftX,LeftY,LeftX+LeftW-1,LeftY+LeftH-1,err,err,Text,0)
Break
if FindText(x, y, x+w-1, y+h-1, err, err, Text, 0)
{
LeftX:=x, LeftY:=y, LeftW:=w, LeftH:=h, LeftOCR:=v.id
Break
}
}
}
}
if (ocr_X="")
ocr_X:=LeftX, ocr_Y:=LeftY
ocr_Text.=(ocr_Text!="" and LeftX-min_X>offsetX ? "*":"") . LeftOCR
min_X:=LeftX+LeftW
}
return {ocr:ocr_Text, x:ocr_X, y:ocr_Y}
}
SortOK(ok, dy:=10) {
local
if !IsObject(ok)
return ok
ypos:=[]
For k,v in ok
{
x:=v.x, y:=v.y, add:=1
For k2,v2 in ypos
if Abs(y-v2)<=dy
{
y:=v2, add:=0
Break
}
if (add)
ypos.Push(y)
n:=(y*150000+x) "." k, s:=A_Index=1 ? n : s "-" n
}
Sort, s, N D-
ok2:=[]
Loop, Parse, s, -
ok2.Push( ok[(StrSplit(A_LoopField,".")[2])] )
return ok2
}
SortOK2(ok, px, py) {
local
if !IsObject(ok)
return ok
For k,v in ok
{
x:=v.1+v.3//2, y:=v.2+v.4//2
n:=((x-px)**2+(y-py)**2) "." k
s:=A_Index=1 ? n : s "-" n
}
Sort, s, N D-
ok2:=[]
Loop, Parse, s, -
ok2.Push( ok[(StrSplit(A_LoopField,".")[2])] )
return ok2
}
MouseTip(x:="", y:="") {
local
if (x="")
{
VarSetCapacity(pt,16,0), DllCall("GetCursorPos","ptr",&pt)
x:=NumGet(pt,0,"uint"), y:=NumGet(pt,4,"uint")
}
omg_padding:=5
x:=Round(x-omg_padding), y:=Round(y-omg_padding), w:=h:=2*omg_padding+1
Gui, _MouseTip_: +AlwaysOnTop -Caption +ToolWindow +Hwndmyid +E0x08000000
Gui, _MouseTip_: Show, Hide NoActivate w%w% h%h%
dhw:=A_DetectHiddenWindows
DetectHiddenWindows, On
d:=4, i:=w-d, j:=h-d
s=0-0 %w%-0 %w%-%h% 0-%h% 0-0
s=%s%  %d%-%d% %i%-%d% %i%-%j% %d%-%j% %d%-%d%
WinSet, Region, %s%, ahk_id %myid%
DetectHiddenWindows, %dhw%
Gui, _MouseTip_: Show, NA x%x% y%y%
Loop, 10
{
Gui, _MouseTip_: Color, % A_Index & 1 ? "Red" : "Yellow"
Sleep, 100
}
Gui, _MouseTip_: Destroy
}
GetTextFromScreen(x1, y1, x2, y2, Threshold:="", ScreenShot:=1
, ByRef rx:="", ByRef ry:="") {
local
bch:=A_BatchLines
SetBatchLines, -1
x:=(x1<x2 ? x1:x2), y:=(y1<y2 ? y1:y2)
, w:=Abs(x2-x1)+1, h:=Abs(y2-y1)+1
, xywh2xywh(x,y,w,h,x,y,w,h,zx,zy,zw,zh)
if (w<1 or h<1)
{
SetBatchLines, %bch%
return 0
}
lls:=A_ListLines=0 ? "Off" : "On"
ListLines, Off
GetBitsFromScreen(x,y,w,h,ScreenShot,zx,zy,zw,zh)
gc:=[], k:=0
Loop, %h% {
j:=y+A_Index-1
Loop, %w%
i:=x+A_Index-1, c:=ScreenShot_GetColor(i,j)
, gc[++k]:=(((c>>16)&0xFF)*38+((c>>8)&0xFF)*75+(c&0xFF)*15)>>7
}
Threshold:=StrReplace(Threshold,"*")
if (Threshold="")
{
pp:=[]
Loop, 256
pp[A_Index-1]:=0
Loop, % w*h
pp[gc[A_Index]]++
IP:=IS:=0
Loop, 256
k:=A_Index-1, IP+=k*pp[k], IS+=pp[k]
Threshold:=Floor(IP/IS)
Loop, 20
{
LastThreshold:=Threshold
IP1:=IS1:=0
Loop, % LastThreshold+1
k:=A_Index-1, IP1+=k*pp[k], IS1+=pp[k]
IP2:=IP-IP1, IS2:=IS-IS1
if (IS1!=0 and IS2!=0)
Threshold:=Floor((IP1/IS1+IP2/IS2)/2)
if (Threshold=LastThreshold)
Break
}
}
s:=""
Loop, % w*h
s.=gc[A_Index]<=Threshold ? "1":"0"
w:=Format("{:d}",w), CutUp:=CutDown:=0
re1=(^0{%w%}|^1{%w%})
re2=(0{%w%}$|1{%w%}$)
While RegExMatch(s,re1)
s:=RegExReplace(s,re1), CutUp++
While RegExMatch(s,re2)
s:=RegExReplace(s,re2), CutDown++
rx:=x+w//2, ry:=y+CutUp+(h-CutUp-CutDown)//2
s:="|<>*" Threshold "$" w "." bit2base64(s)
SetBatchLines, %bch%
ListLines, %lls%
return s
}
OMG_fcnGetDungeon() {
OMG_OSDmsg("Detecting dungeon...")
global OMG_boolDungeonRun := FALSE
For thisDungeon, thisDungeonRef in OMG_TxtDungeons
{
If (OMG_FindThis(thisDungeonRef, 0, 0.1, 0.1, 20, 40, 430, 100))
{
OMG_OSDmsg(thisDungeon . " detected...")
OMG_boolDungeonRun := TRUE
OMG_fcnGetArtifactSet(thisDungeon, 1)
Return
}
}
OMG_OSDmsg("Dungeon not identified")
OMG_fcnGetCampaign()
Return
}
OMG_fcnGetCampaign() {
OMG_OSDmsg("Detecting campaign chapter...")
loop, 12
{
if (OMG_FindThis(OMG_Campaign[A_Index]["ChapterNameRef"], 0, 0.1, 0.1, 20, 40, 430, 100))
{
osdMsg := OMG_Campaign[A_Index]["ChapterName"] . " detected..."
OMG_OSDmsg(osdMsg)
OMG_fcnGetArtifactSet(A_Index, 0)
Return
}
}
OMG_OSDmsg("ERROR: Dungeon/Campaign not detected")
screenshotFilename := "screenshots/" . currentPID . "-" . A_Now . " Dungeon or Campaign ID Failure.bmp"
Winactivate, ahk_pid %currentPID%
CaptureScreen(1,0,screenshotFilename)
Sleep, 1000
OMG_RestoreUserInput()
MsgBox, 0, %OMG_MsgBoxTitle%, "ERROR: The dungeon or campaign chapter could not be indentified. "
. "A screenshot was saved of your post-battle screen. Please post a bug-report on the Discord server. "
. "A link to it can be found above the [Save Settings] button. Thank you.", 30
Return
}
OMG_fcnGetArtifactSet(setSource, isDungeon) {
if (isDungeon) {
For setName, setRef in OMG_ImgDungeonArtifacts[setSource]
{
osdMsg := "Searching for " . setSource . " artifacts..."
OMG_OSDmsg(osdMsg)
if (OMG_FindThis(setRef,0,0.15, 0.15,277, 188, 875, 274)) {
OMG_fcnGetArtifactRank(setSource, setName, setRef, 1)
Return
}
}
}
else {
if (OMG_FindThis(OMG_Campaign[setSource]["ArtifactSetRef"],0,0.15, 0.15,277, 188, 875, 274)) {
osdMsg := "Searching for " . OMG_Campaign[setSource]["ArtifactSetName"] . " artifacts..."
OMG_OSDmsg(osdMsg)
setName := OMG_Campaign[setSource]["ArtifactSetName"]
setRef := OMG_Campaign[setSource]["ArtifactSetRef"]
setSource := OMG_Campaign[setSource]["ChapterName"]
OMG_fcnGetArtifactRank(setSource, setName, setRef, 0)
Return
}
}
if (!isDungeon)
setSource := OMG_Campaign[setSource]["ChapterName"]
OMG_OSDmsg("No artifact detected for this " . setSource . " run.")
if (OMG_SaveScreenshots) {
screenshotFilename := "screenshots/" . currentPID . "-" . A_Now . "-" . setSource . "-No artifact detected.bmp"
Winactivate, ahk_pid %currentPID%
CaptureScreen(1,0,screenshotFilename)
Sleep, 1000
}
Return
}
OMG_fcnGetArtifactRank(setSource, setName, setRef, isDungeon) {
rank := OMG_RanksToSell.Length()
Loop, % rank
{
if (!OMG_RanksToSell[rank]) {
If (OMG_FindThis(OMG_ImgRanks[rank], 0, 0.1, 0.1, 190, 190, 960, 300)) {
If ((OMG_SellAllCh12) && (setSource=="Brimstone Path")) {
if (OMG_SaveScreenshots) {
screenshotFilename := "screenshots/" . currentPID . "-" . A_Now . "-SALE_OVERRIDE-" . setSource . "-" . setName . " Artifact-SOLD" ".bmp"
CaptureScreen(1,0,screenshotFilename)
sleep 500
}
OMG_fcnSellArtifact(setName, rank)
Return
}
OMG_OSDmsg("Keeping Rank " . rank . " " . setName " Artifact")
if ((rank>3) && (OMG_SaveScreenshots)) {
screenshotFilename := "screenshots/" . currentPID . "-" . A_Now . "-Rank " . rank . " " . setName . " Artifact-KEPT.bmp"
Winactivate, ahk_pid %currentPID%
CaptureScreen(1,0,screenshotFilename)
sleep 500
}
Return
}
}
else {
if (OMG_FindThis(OMG_ImgRanks[rank], 0, 0.1, 0.1, 190, 190, 960, 300)) {
if ((rank>3) && (OMG_SaveScreenshots)) {
FILENAME := "screenshots/" . currentPID . "-" . A_Now . "-Rank " . rank . " " . setName . " Artifact-SOLD.bmp"
Winactivate, ahk_pid %currentPID%
CaptureScreen(1,0,FILENAME)
sleep 500
}
OMG_OSDmsg("Selling Rank " . rank . " " . setName " Artifact")
OMG_fcnSellArtifact(setName, rank)
Return
}
}
rank--
}
OMG_OSDmsg("ERROR: Rank not identified.")
screenshotFilename := "screenshots/" . currentPID . "-" . A_Now . "-" . setName . " Rank ID Failure.bmp"
Winactivate, ahk_pid %currentPID%
CaptureScreen(1,0,screenshotFilename)
Sleep, 1000
OMG_RestoreUserInput()
MsgBox, 0, %OMG_MsgBoxTitle%, "ERROR: This item's rank could not be identified. "
. "A screenshot of your post-battle screen was saved. Please post a bug-report on the Discord server. "
. "A link to it can be found above the [Save Settings] button. Thank you.", 30
Return
}
OMG_fcnSellArtifact(setName, rank) {
osdMsg := "Selling rank " . rank . " " . setName . " artifact..."
OMG_OSDmsg(osdMsg)
timeoutStart := A_TickCount
While (!OMG_FindThis(OMG_BtnKeep, 0, 0.15, 0.15, 300, 350, 850, 700)) {
OMG_FindThis(OMG_ImgRanks[rank], 1, 0.1, 0.1, 190, 190, 960, 300)
if ((A_TickCount - timeoutStart) > 10000)
break
}
SaleComplete := FALSE
Sleep, 500
timeoutStart := A_TickCount
While (!SaleComplete) {
if ((A_TickCount - timeoutStart) > 10000)
break
While (OMG_FindThis(OMG_BtnKeep, 0, 0.15, 0.15, 300, 350, 850, 700)) {
OMG_FindThis(OMG_BtnSell, 1, 0.15, 0.15, 301, 362, 847, 694)
}
While (OMG_FindThis(OMG_BtnSell, 1, 0.15, 0.15, 582, 364, 824, 442))
SaleComplete := TRUE
}
Return
}
CaptureScreen(aRect = 0, bCursor = False, sFile = "", nQuality = "")
{
If !aRect
{
SysGet, nL, 76
SysGet, nT, 77
SysGet, nW, 78
SysGet, nH, 79
}
Else If aRect = 1
WinGetPos, nL, nT, nW, nH, A
Else If aRect = 2
{
WinGet, hWnd, ID, A
VarSetCapacity(rt, 16, 0)
DllCall("GetClientRect" , "ptr", hWnd, "ptr", &rt)
DllCall("ClientToScreen", "ptr", hWnd, "ptr", &rt)
nL := NumGet(rt, 0, "int")
nT := NumGet(rt, 4, "int")
nW := NumGet(rt, 8)
nH := NumGet(rt,12)
}
Else If aRect = 3
{
VarSetCapacity(mi, 40, 0)
DllCall("GetCursorPos", "int64P", pt), NumPut(40,mi,0,"uint")
DllCall("GetMonitorInfo", "ptr", DllCall("MonitorFromPoint", "int64", pt, "Uint", 2, "ptr"), "ptr", &mi)
nL := NumGet(mi, 4, "int")
nT := NumGet(mi, 8, "int")
nW := NumGet(mi,12, "int") - nL
nH := NumGet(mi,16, "int") - nT
}
Else
{
StringSplit, rt, aRect, `,, %A_Space%%A_Tab%
nL := rt1
nT := rt2
nW := rt3 - rt1
nH := rt4 - rt2
znW := rt5
znH := rt6
}
mDC := DllCall("CreateCompatibleDC", "ptr", 0, "ptr")
hBM := CreateDIBSection(mDC, nW, nH)
oBM := DllCall("SelectObject", "ptr", mDC, "ptr", hBM, "ptr")
hDC := DllCall("GetDC", "ptr", 0, "ptr")
DllCall("BitBlt", "ptr", mDC, "int", 0, "int", 0, "int", nW, "int", nH, "ptr", hDC, "int", nL, "int", nT, "Uint", 0x40CC0020)
DllCall("ReleaseDC", "ptr", 0, "ptr", hDC)
If bCursor
CaptureCursor(mDC, nL, nT)
DllCall("SelectObject", "ptr", mDC, "ptr", oBM)
DllCall("DeleteDC", "ptr", mDC)
If znW && znH
hBM := Zoomer(hBM, nW, nH, znW, znH)
If sFile = 0
SetClipboardData(hBM)
Else Convert(hBM, sFile, nQuality), DllCall("DeleteObject", "ptr", hBM)
}
CaptureCursor(hDC, nL, nT)
{
VarSetCapacity(mi, 32, 0), Numput(16+A_PtrSize, mi, 0, "uint")
DllCall("GetCursorInfo", "ptr", &mi)
bShow   := NumGet(mi, 4, "uint")
hCursor := NumGet(mi, 8)
xCursor := NumGet(mi,8+A_PtrSize, "int")
yCursor := NumGet(mi,12+A_PtrSize, "int")
DllCall("GetIconInfo", "ptr", hCursor, "ptr", &mi)
xHotspot := NumGet(mi, 4, "uint")
yHotspot := NumGet(mi, 8, "uint")
hBMMask  := NumGet(mi,8+A_PtrSize)
hBMColor := NumGet(mi,16+A_PtrSize)
If bShow
DllCall("DrawIcon", "ptr", hDC, "int", xCursor - xHotspot - nL, "int", yCursor - yHotspot - nT, "ptr", hCursor)
If hBMMask
DllCall("DeleteObject", "ptr", hBMMask)
If hBMColor
DllCall("DeleteObject", "ptr", hBMColor)
}
Zoomer(hBM, nW, nH, znW, znH)
{
mDC1 := DllCall("CreateCompatibleDC", "ptr", 0, "ptr")
mDC2 := DllCall("CreateCompatibleDC", "ptr", 0, "ptr")
zhBM := CreateDIBSection(mDC2, znW, znH)
oBM1 := DllCall("SelectObject", "ptr", mDC1, "ptr",  hBM, "ptr")
oBM2 := DllCall("SelectObject", "ptr", mDC2, "ptr", zhBM, "ptr")
DllCall("SetStretchBltMode", "ptr", mDC2, "int", 4)
DllCall("StretchBlt", "ptr", mDC2, "int", 0, "int", 0, "int", znW, "int", znH, "ptr", mDC1, "int", 0, "int", 0, "int", nW, "int", nH, "Uint", 0x00CC0020)
DllCall("SelectObject", "ptr", mDC1, "ptr", oBM1)
DllCall("SelectObject", "ptr", mDC2, "ptr", oBM2)
DllCall("DeleteDC", "ptr", mDC1)
DllCall("DeleteDC", "ptr", mDC2)
DllCall("DeleteObject", "ptr", hBM)
Return zhBM
}
Convert(sFileFr = "", sFileTo = "", nQuality = "")
{
If (sFileTo = "")
sFileTo := A_ScriptDir . "\screen.bmp"
SplitPath, sFileTo, , sDirTo, sExtTo, sNameTo
If Not hGdiPlus := DllCall("LoadLibrary", "str", "gdiplus.dll", "ptr")
Return	sFileFr+0 ? SaveHBITMAPToFile(sFileFr, sDirTo (sDirTo = "" ? "" : "\") sNameTo ".bmp") : ""
VarSetCapacity(si, 16, 0), si := Chr(1)
DllCall("gdiplus\GdiplusStartup", "UintP", pToken, "ptr", &si, "ptr", 0)
If !sFileFr
{
DllCall("OpenClipboard", "ptr", 0)
If	(DllCall("IsClipboardFormatAvailable", "Uint", 2) && (hBM:=DllCall("GetClipboardData", "Uint", 2, "ptr")))
DllCall("gdiplus\GdipCreateBitmapFromHBITMAP", "ptr", hBM, "ptr", 0, "ptr*", pImage)
DllCall("CloseClipboard")
}
Else If	sFileFr Is Integer
DllCall("gdiplus\GdipCreateBitmapFromHBITMAP", "ptr", sFileFr, "ptr", 0, "ptr*", pImage)
Else	DllCall("gdiplus\GdipLoadImageFromFile", "wstr", sFileFr, "ptr*", pImage)
DllCall("gdiplus\GdipGetImageEncodersSize", "UintP", nCount, "UintP", nSize)
VarSetCapacity(ci,nSize,0)
DllCall("gdiplus\GdipGetImageEncoders", "Uint", nCount, "Uint", nSize, "ptr", &ci)
struct_size := 48+7*A_PtrSize, offset := 32 + 3*A_PtrSize, pCodec := &ci - struct_size
Loop, %	nCount
If InStr(StrGet(Numget(offset + (pCodec+=struct_size)), "utf-16") , "." . sExtTo)
break
If (InStr(".JPG.JPEG.JPE.JFIF", "." . sExtTo) && nQuality<>"" && pImage && pCodec < &ci + nSize)
{
DllCall("gdiplus\GdipGetEncoderParameterListSize", "ptr", pImage, "ptr", pCodec, "UintP", nCount)
VarSetCapacity(pi,nCount,0), struct_size := 24 + A_PtrSize
DllCall("gdiplus\GdipGetEncoderParameterList", "ptr", pImage, "ptr", pCodec, "Uint", nCount, "ptr", &pi)
Loop, %	NumGet(pi,0,"uint")
If (NumGet(pi,struct_size*(A_Index-1)+16+A_PtrSize,"uint")=1 && NumGet(pi,struct_size*(A_Index-1)+20+A_PtrSize,"uint")=6)
{
pParam := &pi+struct_size*(A_Index-1)
NumPut(nQuality,NumGet(NumPut(4,NumPut(1,pParam+0,"uint")+16+A_PtrSize,"uint")),"uint")
Break
}
}
If pImage
pCodec < &ci + nSize	? DllCall("gdiplus\GdipSaveImageToFile", "ptr", pImage, "wstr", sFileTo, "ptr", pCodec, "ptr", pParam) : DllCall("gdiplus\GdipCreateHBITMAPFromBitmap", "ptr", pImage, "ptr*", hBitmap, "Uint", 0) . SetClipboardData(hBitmap), DllCall("gdiplus\GdipDisposeImage", "ptr", pImage)
DllCall("gdiplus\GdiplusShutdown" , "Uint", pToken)
DllCall("FreeLibrary", "ptr", hGdiPlus)
}
CreateDIBSection(hDC, nW, nH, bpp = 32, ByRef pBits = "")
{
VarSetCapacity(bi, 40, 0)
NumPut(40, bi, "uint")
NumPut(nW, bi, 4, "int")
NumPut(nH, bi, 8, "int")
NumPut(bpp, NumPut(1, bi, 12, "UShort"), 0, "Ushort")
Return DllCall("gdi32\CreateDIBSection", "ptr", hDC, "ptr", &bi, "Uint", 0, "UintP", pBits, "ptr", 0, "Uint", 0, "ptr")
}
SaveHBITMAPToFile(hBitmap, sFile)
{
VarSetCapacity(oi,104,0)
DllCall("GetObject", "ptr", hBitmap, "int", 64+5*A_PtrSize, "ptr", &oi)
fObj := FileOpen(sFile, "w")
fObj.WriteShort(0x4D42)
fObj.WriteInt(54+NumGet(oi,36+2*A_PtrSize,"uint"))
fObj.WriteInt64(54<<32)
fObj.RawWrite(&oi + 16 + 2*A_PtrSize, 40)
fObj.RawWrite(NumGet(oi, 16+A_PtrSize), NumGet(oi,36+2*A_PtrSize,"uint"))
fObj.Close()
}
SetClipboardData(hBitmap)
{
VarSetCapacity(oi,104,0)
DllCall("GetObject", "ptr", hBitmap, "int", 64+5*A_PtrSize, "ptr", &oi)
sz := NumGet(oi,36+2*A_PtrSize,"uint")
hDIB :=	DllCall("GlobalAlloc", "Uint", 2, "Uptr", 40+sz, "ptr")
pDIB := DllCall("GlobalLock", "ptr", hDIB, "ptr")
DllCall("RtlMoveMemory", "ptr", pDIB, "ptr", &oi + 16 + 2*A_PtrSize, "Uptr", 40)
DllCall("RtlMoveMemory", "ptr", pDIB+40, "ptr", NumGet(oi, 16+A_PtrSize), "Uptr", sz)
DllCall("GlobalUnlock", "ptr", hDIB)
DllCall("DeleteObject", "ptr", hBitmap)
DllCall("OpenClipboard", "ptr", 0)
DllCall("EmptyClipboard")
DllCall("SetClipboardData", "Uint", 8, "ptr", hDIB)
DllCall("CloseClipboard")
}
OMG_fcnCheckMaxLevels() {
OMG_OSDmsg("Checking for max levels")
If (OMG_FindThis(OMG_TxtMaxLevel, 0, 0.15, 0.15, 180, 280, 295, 330)) {
If (OMG_FindThis(OMG_TxtMaxLevel, 0, 0.15, 0.15, 345, 280, 975, 330))
Return TRUE
Else
Return FALSE
}
If (OMG_FindThis(OMG_TxtMaxLevel, 0, 0.15, 0.15, 260, 280, 380, 330)) {
If (OMG_FindThis(OMG_TxtMaxLevel, 0, 0.15, 0.15, 430, 280, 890, 330))
Return TRUE
Else
Return FALSE
}
If (OMG_FindThis(OMG_TxtMaxLevel, 0, 0.15, 0.15, 350, 280, 465, 330)) {
If (OMG_FindThis(OMG_TxtMaxLevel, 0, 0.15, 0.15, 515, 280, 805, 330))
Return TRUE
Else
Return FALSE
}
If (OMG_FindThis(OMG_TxtMaxLevel, 0, 0.15, 0.15, 430, 280, 550, 330)) {
If (OMG_FindThis(OMG_TxtMaxLevel, 0, 0.15, 0.15, 600, 280, 720, 330))
Return TRUE
Else
Return FALSE
}
If (OMG_FindThis(OMG_TxtMaxLevel, 0, 0.15, 0.15, 180, 280, 975, 330))
Return TRUE
Else
Return FALSE
}
if (!FileExist(OMG_ConfigFile))
OMG_MakeConfig(OMG_ConfigFile)
else
OMG_LoadConfig(OMG_ConfigFile)
IniRead, OMG_SendModeType, %OMG_ConfigFile%, Other, SendModeType
SendMode %OMG_SendModeType%
If (!InStr(FileExist("screenshots"), "D")) {
FileCreateDir, screenshots
}
If (!InStr(FileExist("img"), "D")) {
FileCreateDir, img
}
FileInstall, img/OMGclick_Banner.png, img/OMGclick_Banner.png, 1
FileInstall, img/icon-uac.png, img/icon-uac.png, 1
FileInstall, version.txt, version.txt, 1
if !A_IsCompiled
Menu Tray, Icon, OMGclick.ico
Gui +hWndOMG_hGUI -MaximizeBox
Gui, Font, s8 Norm c0x333333, Microsoft Sans Serif
if (!A_IsCompiled) {
Gui Font, c0xFF0000 Bold, Microsoft Sans Serif
Gui Add, CheckBox, x10 y510 h23 vOMG_Debug Checked%OMG_Debug% gOMG_guiFcnQuickSave, Debug Mode
Gui, Font, s8 Norm c0x333333, Microsoft Sans Serif
}
Gui Font, Bold c0xAA0000, Microsoft Sans Serif
Gui Add, GroupBox, x8 y8 w260 h190, Client Settings
Gui, Font, s8 Norm c0x333333, Microsoft Sans Serif
Gui Add, Text, x24 y32 w120 h23 +0x200, Number of Clients:
Gui Add, Edit, x112 y32 w34 h21, 1
Gui Add, UpDown, x144 y32 w18 h21 vOMG_ClientCount gOMG_guiFcnClientCount Range1-99, %OMG_ClientCount%
Gui Add, CheckBox, x24 y62 w160 h23 vOMG_MinimizeClientWindow Checked%OMG_MinimizeClientWindow% gOMG_guiFcnMinimize, Minimize when not scanning
Gui Add, CheckBox, x24 y86 w200 h23 vOMG_ShowOSD Checked%OMG_ShowOSD% gOMG_guiFcnToggleOSD, Show Status Overlay
Gui Add, CheckBox, x24 y136 w196 h23 vOMG_SendMode Checked%OMG_SendMode% gOMG_guiFcnChangeSendMode, Alternate Click Mode
if (A_IsAdmin) {
Gui Add, CheckBox, x24 y160 w196 h23 vOMG_BlockInput Checked%OMG_BlockInput% gOMG_guiFcnQuickSave, Block user input while processing
} else {
Gui Add, CheckBox, x24 y160 h23 +Disabled vOMG_BlockInput Checked%OMG_BlockInput% gOMG_guiFcnReloadAsAdmin, Run as Admin to unlock this setting
Gui Add, Picture, x+5 y162 w16 h16 gOMG_guiFcnReloadAsAdmin Border, img/icon-uac.png
}
Gui Font, Bold c0xAA0000, Microsoft Sans Serif
Gui Add, GroupBox, x280 y8 w260 h190, Auto-Sell
Gui, Font, s8 Norm c0x333333, Microsoft Sans Serif
Gui Add, CheckBox, x296 y32 w100 h23 vOMG_SellArtifacts Checked%OMG_SellArtifacts% gOMG_guiFcnToggleAutoSellOptions, Enable auto-sell
Gui Add, CheckBox, x416 y32 w120 h23 vOMG_SaveScreenshots Checked%OMG_SaveScreenshots% gOMG_guiFcnQuickSave, Save screenshots
ShowRanks:=""
if (!OMG_SellArtifacts)
ShowRanks := "+Disabled"
Gui Add, GroupBox, x296 y64 w228 h95, Ranks to sell
WinVerMajor := DllCall("GetVersion") & 0xFF
WinVerMinor := DllCall("GetVersion") >> 8 & 0xFF
WinBuild  := DllCall("GetVersion") >> 16 & 0xFFFF
WinLang := A_Language
if ((WinVerMajor >= 10) && ((WinBuild >= 18300) || (WinVerMinor >= 0))) {
Gui Font, s14 c0xc99400, Microsoft Sans Serif
Gui Add, CheckBox, x312 y80 w100 h23 %ShowRanks% vOMG_SellRank6 Checked%OMG_SellRank6% gOMG_guiFcnQuickSave, 🟊🟊🟊🟊🟊🟊
Gui Add, CheckBox, x312 y104 w100 h23 %ShowRanks% vOMG_SellRank5 Checked%OMG_SellRank5% gOMG_guiFcnQuickSave, 🟊🟊🟊🟊🟊
Gui Add, CheckBox, x312 y128 w100 h23 %ShowRanks% vOMG_SellRank4 Checked%OMG_SellRank4% gOMG_guiFcnQuickSave, 🟊🟊🟊🟊
Gui Add, CheckBox, x448 y80 w60 h23 %ShowRanks% vOMG_SellRank3 Checked%OMG_SellRank3% gOMG_guiFcnQuickSave, 🟊🟊🟊
Gui Add, CheckBox, x448 y104 w60 h23 %ShowRanks% vOMG_SellRank2 Checked%OMG_SellRank2% gOMG_guiFcnQuickSave, 🟊🟊
Gui Add, CheckBox, x448 y128 w60 h23 %ShowRanks% vOMG_SellRank1 Checked%OMG_SellRank1% gOMG_guiFcnQuickSave, 🟊
}
else {
Gui, Font, s8 c0x333333, Microsoft Sans Serif
Gui Add, CheckBox, x312 y80 w100 h23 %ShowRanks% vOMG_SellRank6 Checked%OMG_SellRank6% gOMG_guiFcnQuickSave, Rank 6
Gui Add, CheckBox, x312 y104 w100 h23 %ShowRanks% vOMG_SellRank5 Checked%OMG_SellRank5% gOMG_guiFcnQuickSave, Rank 5
Gui Add, CheckBox, x312 y128 w100 h23 %ShowRanks% vOMG_SellRank4 Checked%OMG_SellRank4% gOMG_guiFcnQuickSave, Rank 4
Gui Add, CheckBox, x448 y80 w60 h23 %ShowRanks% vOMG_SellRank3 Checked%OMG_SellRank3% gOMG_guiFcnQuickSave, Rank 3
Gui Add, CheckBox, x448 y104 w60 h23 %ShowRanks% vOMG_SellRank2 Checked%OMG_SellRank2% gOMG_guiFcnQuickSave, Rank 2
Gui Add, CheckBox, x448 y128 w60 h23 %ShowRanks% vOMG_SellRank1 Checked%OMG_SellRank1% gOMG_guiFcnQuickSave, Rank 1
}
Gui, Font, s8 Norm c0x333333, Microsoft Sans Serif
Gui Add, CheckBox, x296 y168 w150 h23 vOMG_SellAllCh12 Checked%OMG_SellAllCh12% gOMG_guiFcnQuickSave, Sell everything from Ch. 12
Gui Font, Bold c0xAA0000, Microsoft Sans Serif
Gui Add, GroupBox, x8 y208 w532 h300, General Settings
Gui, Font, s8 Norm c0x333333, Microsoft Sans Serif
Gui Add, CheckBox, x24 y232 h23 vOMG_CheckBoostEXP2x Checked%OMG_CheckBoostEXP2x% gOMG_guiFcnQuickSave, Check for +100`% EXP Boost
Gui Add, CheckBox, x24 y256  h23 vOMG_StopAtMaxLevel Checked%OMG_StopAtMaxLevel% gOMG_guiFcnToggleMaxLevelOptions, Stop at Max Level
IgnoreDungeonsOption:=""
if (!OMG_StopAtMaxLevel)
IgnoreDungeonsOption := "+Disabled"
Gui Add, CheckBox, x+10 h23 %IgnoreDungeonsOption% vOMG_boolOverrideMaxLevel Checked%OMG_boolOverrideMaxLevel% gOMG_guiFcnToggleMaxLevelOptions, Ignore Levels in Dungeons
Gui Add, CheckBox, x24 y292  h23 vOMG_CombatModeAuto Checked%OMG_CombatModeAuto% gOMG_guiFcnQuickSave, Always "Auto" Combat Mode
Gui Add, CheckBox, x24 y318  h23 vOMG_CombatSpeedX2 Checked%OMG_CombatSpeedX2% gOMG_guiFcnQuickSave, Always "x2" Combat Speed
Gui Add, Text, x24 y356 w85 h23 +0x200 +Right, Replay Delay:
Gui Add, Slider, vOMG_ReplayDelay x114 y356 w145 h32 TickInterval1 Range0-10 Line1 ToolTipTop gOMG_guiFcnQuickSave, %OMG_ReplayDelay%
Gui Add, Text, x24 y396 w85 h23 +0x200 +Right, Scan Interval:
Gui Add, Edit, x112 y396 w40 h21 gOMG_guiFcnQuickSave, 0
Gui Add, UpDown, x146 y396 w18 h21 vOMG_RoundTimeMin Range0-99 gOMG_guiFcnQuickSave, %OMG_RoundTimeMin%
Gui Add, Text, x160 y396 w20 h23 +0x200, min
Gui Add, Edit, x184 y396 w40 h21 gOMG_guiFcnQuickSave, 10
Gui Add, UpDown, x208 y396 w18 h21 vOMG_RoundTimeSec Range0-59 gOMG_guiFcnQuickSave, %OMG_RoundTimeSec%
Gui Add, Text, x232 y396 w20 h23 +0x200, sec
Gui Add, Text, x24 y426 w85 h23 +0x200 +Right, Number of Runs:
Gui Add, Edit, x112 y426 w40 h21 Number Limit3 gOMG_guiFcnQuickSave, 0
Gui Add, UpDown, x136 y426 w18 h21 vOMG_NumRuns Range0-999 gOMG_guiFcnQuickSave, %OMG_NumRuns%
Gui, Font, c0xAA0000, Microsoft Sans Serif
Gui Add, Text, x160 y426 w70 h23 +0x200, (0 = Infinite)
Gui, Font, s8 Norm c0x333333, Microsoft Sans Serif
Gui, Font, bold
Gui Add, Button, hWndOMG_hBtnStartStop x24 y468 w120 h23 vOMG_guiBtnStartStop gOMG_guiBtnFcnStartStop, Start
Gui, Font, s8 Norm c0x333333, Microsoft Sans Serif
Gui Add, CheckBox, x150 y468 h23 vOMG_RestoreEnergy Checked%OMG_RestoreEnergy% gOMG_guiFcnQuickSave, Restore Energy
Gui Add, Picture, x317 y222 w200 h100, img/OMGclick_Banner.png
Gui Add, Link, x330 y330, <a href="https://github.com/omgmarc/OMGclick-Releases">Get the latest version or buy me coffee</a>
Gui Add, Link, x365 y350, <a href="https://discord.gg/RBzHB5n">Join the Discord Server</a>
Gui Add, Button, x328 y468 w100 h23 vOMG_guiBtnReload gOMG_guiBtnFcnReload, Reload Settings
Gui Add, Button, x432 y468 w90 h23 vOMG_guiBtnSave gOMG_guiBtnFcnSave, Save Settings
Gui, Add, StatusBar
Gui Show, AutoSize, OMGclick %OMG_version%
OMG_guiFcnQuickSave() {
Gui, Submit, NoHide
OMG_CalcBattleTime()
Return
}
OMG_guiFcnChangeSendMode() {
OMG_guiFcnQuickSave()
if (OMG_SendMode) {
OMG_SendModeType := "Event"
} else {
OMG_SendModeType := "Input"
}
warningMsg := "Changing this setting requires reloading this program."
. " Your current settings will be saved before reloading."
. "`n`nClick [OK] to reload; otherwise, click [Cancel] to manually reload later."
MsgBox, 1, %OMG_MsgBoxTitle%, %warningMsg%, 30
IfMsgBox, Ok
OMG_guiBtnFcnReload()
Return
}
OMG_guiFcnClientCount() {
OMG_FirstRun = TRUE
Gui, Submit, NoHide
Return
}
OMG_guiFcnMinimize() {
if (!OMG_MinimizeClientWindow && OMG_ShowOSD) {
MsgBox, 1, %OMG_MsgBoxTitle%, % "Enabling this option while displaying status messages is not ideal as the status messages will linger momentarily when the game client is minimized."
. "`n`nClick OK if you still wish to enable this option; otherwise, click CANCEL to leave it disabled."
IfMsgBox, OK
{
GuiControl, , OMG_MinimizeClientWindow, 1
} else {
GuiControl, , OMG_MinimizeClientWindow, 0
}
}
OMG_guiFcnQuickSave()
Return
}
OMG_guiFcnReloadAsAdmin() {
OMG_guiBtnFcnSave()
Run *RunAs "%A_ScriptFullPath%"
ExitApp
Return
}
OMG_guiFcnToggleAutoSellOptions() {
OMG_guiFcnQuickSave()
if (OMG_SellArtifacts) {
GuiControl, Enable, OMG_SellRank1
GuiControl, Enable, OMG_SellRank2
GuiControl, Enable, OMG_SellRank3
GuiControl, Enable, OMG_SellRank4
GuiControl, Enable, OMG_SellRank5
GuiControl, Enable, OMG_SellRank6
} else {
GuiControl, Disable, OMG_SellRank1
GuiControl, Disable, OMG_SellRank2
GuiControl, Disable, OMG_SellRank3
GuiControl, Disable, OMG_SellRank4
GuiControl, Disable, OMG_SellRank5
GuiControl, Disable, OMG_SellRank6
}
Return
}
OMG_guiFcnToggleOSD() {
if (!OMG_ShowOSD && OMG_MinimizeClientWindow) {
MsgBox, 1, %OMG_MsgBoxTitle%, % "Enabling this option when automatically minimizing the game window is not ideal as the status messages will linger momentarily when the game client is minimized."
. "`n`nClick OK if you still wish to enable this option; otherwise, click CANCEL to leave it disabled."
IfMsgBox, OK
{
GuiControl, , OMG_ShowOSD, 1
} else {
GuiControl, , OMG_ShowOSD, 0
}
}
OMG_guiFcnQuickSave()
if (!OMG_ShowOSD)
Gui, OMG_OSD: Hide
else {
if (MasterToggle)
Gui, OMG_OSD: Show, x%OMG_OSDxPos% y%OMG_OSDyPos%
Gui, OMG_OSD: Hide
}
}
OMG_guiFcnToggleMaxLevelOptions() {
OMG_guiFcnQuickSave()
if (OMG_StopAtMaxLevel) {
GuiControl, Enable, OMG_boolOverrideMaxLevel
}
else {
GuiControl, Disable, OMG_boolOverrideMaxLevel
}
Return
}
OMG_guiBtnFcnReload() {
OMG_guiBtnFcnSave()
Reload
Return
}
OMG_guiBtnFcnSave() {
Progress, b w200, Writing to config file, Saving..., Please wait
Gui, Submit, NoHide
OMG_RanksToSell := {6:OMG_SellRank6, 5:OMG_SellRank5, 4:OMG_SellRank4, 3:OMG_SellRank3, 2:OMG_SellRank2, 1:OMG_SellRank1}
Progress, 25
Gui, Submit, NoHide
OMG_CalcBattleTime()
OMG_WriteConfig(OMG_ConfigFile)
Progress, 100
sleep 500
Progress, Off
Return
}
OMG_guiBtnFcnStartStop() {
OMG_guiFcnQuickSave()
OMG_CalcBattleTime()
if (OMG_FirstRun)
{
OMG_guiBtnFcnSave()
}
if (!MasterToggle) {
OMG_OSDmsg("Starting up...")
if (OMG_Client[currentClientIndex]["RunsPerformed"]) {
NthRun := OMG_Client[currentClientIndex]["RunsPerformed"]
GuiControl, , OMG_guiBtnStartStop, Stop Run: %NthRun%
}
else {
GuiControl, , OMG_guiBtnStartStop, Stop Run: 1
}
sleep 100
Send +^{F4}
} else {
OMG_OSDoff()
SB_SetText("`tIdle.")
OMG_NthRun := 1
GuiControl, , OMG_guiBtnStartStop, Start
sleep 100
Send +^{F5}
}
Return
}
OMG_ClientEXE := "Raid.exe"
OMG_ClientWidth := 1149
OMG_ClientHeight := 712
SB_SetText("`tOMGclick is ready to work. =]")
global MasterToggle := 0
+^F4::
+^F5::
MasterToggle:=!MasterToggle
While (MasterToggle) {
WinGet, RestorePID, PID, A
MouseGetPos, MouseX, MouseY
if (OMG_FirstRun)
{
OMG_CreateOSD()
OMG_OSDmsg("Performing first run operations...")
OMG_GetClientPID()
OMG_ResetRunCounts()
OMG_FirstRun := !OMG_FirstRun
}
OMG_AllClientRunsComplete := TRUE
Loop, % OMG_Client.MaxIndex()
{
global currentClientIndex := A_Index
global currentPID := OMG_Client[A_Index]["PID"]
global currentRunsPerformed := OMG_Client[A_Index]["RunsPerformed"]
global currentRunsComplete := OMG_Client[A_Index]["RunsComplete"]
global currentWaitingForNewChamps := OMG_Client[A_Index]["WaitingForNewChamps"]
global BindID := WinExist("ahk_pid" . currentPID)
BindWindow(BindID)
OMG_SetTargetWindow(currentPID, A_Index)
If (currentRunsComplete)
{
if (OMG_FindThis(OMG_TxtInfo, 0, 0, 0, 35, 515, 105, 580) && currentWaitingForNewChamps) {
OMG_Client[A_Index]["RunsComplete"] := FALSE
}
OMG_OSDmsg("Client is done working.")
Continue
}
OMG_OSDmsg("Checking battle state")
OMG_fcnCheckConnection()
if (!OMG_FindThis(OMG_BtnReplay))
{
OMG_fcnRestoreEnergy()
if (OMG_FindThis(OMG_TxtLevelUP))
{
OMG_FindThis(OMG_ImgTimerDim, 1)
sleep 1000
}
if (OMG_FindThis(OMG_ImgTimerDim, 1))
{
sleep 200
}
if (OMG_FindThis(OMG_BtnStart, 1, 0.15, 0.15, 870, 590, 1126, 692)) {
OMG_Client[A_Index]["RunsPerformed"] :=1
OMG_MinimizeWindow(currentPID)
Continue
}
if (OMG_FindThis(OMG_TxtInfo, 0, 0, 0, 35, 515, 105, 580))
{
if (OMG_CombatSpeedX2)
OMG_FindThis(OMG_TxtCombatSpeed1, 1,,,145, 633, 185, 661)
if (OMG_CombatModeAuto)
OMG_FindThis(OMG_TxtAutoCombatOFF, 1, 0.15, 0.15, 38, 636, 98, 660)
OMG_MinimizeWindow(currentPID)
Continue
}
if (OMG_FindThis(OMG_ImgResourceAdd))
{
OMG_MinimizeWindow(currentPID)
Continue
}
Continue
}
if (OMG_SellArtifacts) {
OMG_fcnGetDungeon()
Sleep, 300
}
if (OMG_StopAtMaxLevel && OMG_CheckBoostEXP2x)
{
If (!OMG_FindThis(OMG_img2xEXP, 0, 0.1, 0.1, 750, 140, 950, 220))
{
OMG_ExpBoostNotFound()
sleep, 1000
if (!MasterToggle)
Break
}
}
if (OMG_StopAtMaxLevel && OMG_fcnCheckMaxLevels())
{
If OMG_boolDungeonRun && OMG_boolOverrideMaxLevel
Goto, OMG_lblDoReplay
If OMG_FindThis(OMG_BtnEditTeam, 1)
OMG_Client[A_Index]["RunsPerformed"] := 1
OMG_Client[A_Index]["RunsComplete"] := TRUE
OMG_Client[A_Index]["WaitingForNewChamps"] := TRUE
OMG_fcnRestoreEnergy()
Continue
}
OMG_lblDoReplay:
if (OMG_FindThis(OMG_BtnReplay) AND (OMG_NumRuns > 0))
{
If (OMG_Client[A_Index]["RunsPerformed"] < OMG_NumRuns)
{
ReplayDelayLoop := OMG_ReplayDelay
loop % ReplayDelayLoop {
waitMsg := "Starting next round in " . ReplayDelayLoop . "..."
OMG_OSDmsg(waitMsg)
sleep 1000
ReplayDelayLoop--
}
OMG_fcnReplayBattle()
}
else
{
OMG_Client[A_Index]["RunsComplete"] := TRUE
}
}
else
{
ReplayDelayLoop := OMG_ReplayDelay
loop % ReplayDelayLoop {
waitMsg := "Starting next round in " . ReplayDelayLoop . "..."
OMG_OSDmsg(waitMsg)
sleep 1000
ReplayDelayLoop--
}
OMG_fcnReplayBattle()
}
Sleep, 250
OMG_fcnRestoreEnergy()
OMG_MinimizeWindow(currentPID)
}
Loop % OMG_ClientPID.MaxIndex() {
OMG_AllClientRunsComplete *= OMG_Client[A_Index]["RunsComplete"]
}
if (OMG_AllClientRunsComplete)
{
OMG_RestoreUserInput()
MsgBox, 0, %OMG_MsgBoxTitle%, "All runs complete."
IfMsgBox, OK
{
OMG_ResetRunCounts()
OMG_DisableScript()
}
Return
}
OMG_RestoreUserInput()
WinActivate, ahk_pid %RestorePID%
MouseMove, MouseX, MouseY, 0
OMG_OSDoff()
scanLoop := round(OMG_RoundTime/1000,0)
Loop, % scanLoop {
if !MasterToggle
break
scanSec := scanLoop>1 || scanloop<1 ? " seconds" : " second"
SB_SetText("`tNext scan in " . scanLoop . scanSec)
scanLoop--
Sleep, 1000
}
}
Return
GuiClose:
ExitAppPA�PNG


;================= END SCRIPT ===================
