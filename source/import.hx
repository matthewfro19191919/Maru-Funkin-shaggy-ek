#if !macro
//Main shit
import funkin.Controls;
import funkin.Controls.getKey;
import flixel.input.FlxInput.FlxInputState as InputType;
import funkin.Preferences;
import funkin.Preferences.getPref;
#if mobile
import funkin.MobileTouch;
#end

//Song
import funkin.util.song.Conductor;
import funkin.util.song.Highscore;
import funkin.util.song.Song;
import funkin.util.song.WeekSetup;

//Util
import funkin.util.Paths;
import funkin.util.backend.AssetManager;
import funkin.util.CoolUtil;
import funkin.util.FunkMath;
import funkin.util.SkinUtil;
import funkin.util.frontend.Shader;
import funkin.util.backend.DiscordClient;
#if (desktop && sys)
import sys.io.File;
import sys.FileSystem;
#end
import funkin.util.modding.FunkScript;
import funkin.util.modding.ModdingUtil;
import lime.utils.Assets;
import funkin.util.frontend.FlxColorFix;
import funkin.util.JsonUtil;
import funkin.util.Stage;
import funkin.util.backend.SaveData;
import funkin.util.backend.FunkThread;
import funkin.ScriptConsole;
import funkin.Transition;

//Note
import funkin.objects.note.Note;
import funkin.objects.note.Sustain;
import funkin.util.NoteUtil;
import funkin.objects.note.NoteSplash;
import funkin.objects.note.NoteStrum;
import funkin.objects.note.Event;

//PlayState Others
import funkin.objects.RatingGroup;
import funkin.objects.dialogue.*;
import funkin.objects.Character;
import funkin.objects.HealthIcon;

//Alphabet
import funkin.objects.alphabet.*;

// Sound
import funkin.sound.FlxFunkSound;

//Main graphics
import funkin.graphics.FlxSpriteExt;
import funkin.graphics.FunkinSprite;
import funkin.graphics.FunkinText;
import funkin.graphics.FlxFunkText;
import funkin.graphics.TypedGroup.Group;
import funkin.graphics.TypedGroup.SpriteGroup;
import funkin.graphics.TypedGroup.TypedGroup;
import funkin.graphics.TypedGroup.TypedSpriteGroup;

//Main states
import funkin.states.MusicBeatState;
import funkin.states.PlayState;

//Main substates
import funkin.substates.MusicBeatSubstate;
import funkin.substates.GameOverSubstate;
import funkin.substates.PauseSubState;

//States shorcuts
import funkin.states.menus.FreeplayState;
import funkin.states.menus.MainMenuState;
import funkin.states.menus.StoryMenuState;
import funkin.states.menus.TitleState;
import funkin.states.options.OptionsState;

#if DEV_TOOLS
import funkin.states.editors.StageDebug;
import funkin.states.editors.AnimationDebug;
import funkin.states.editors.ChartingState;
#end

//Haxeflixel shit
import flixel.FlxG;
import flixel.FlxBasic;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.util.FlxColor;
import flixel.graphics.FlxGraphic;
import flixel.graphics.frames.FlxFramesCollection;
import flixel.util.FlxSort;
import flixel.util.FlxTimer;
import openfl.geom.Rectangle;
import flixel.group.FlxGroup;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.group.FlxSpriteGroup;
import flixel.FlxState;
import flixel.math.FlxAngle;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.system.FlxAssets.FlxSoundAsset;
import flixel.math.FlxMath;
import flixel.math.FlxPoint;
import flixel.math.FlxRect;
import flixel.sound.FlxSound;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.FlxCamera;
import flixel.input.keyboard.FlxKey;
import flixel.util.FlxDestroyUtil;
import flixel.util.FlxArrayUtil;
import flixel.graphics.tile.FlxDrawTilesItem;

import haxe.Json;

using StringTools;
using macros.FastArray;

import #if cpp cpp.UInt8 #else Int #end as Int8;
#end

//shaggy
import MansionDebris;
import BGElement;
