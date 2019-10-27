import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks

myBlue   = "#0080FF"
myRed    = "#FF4A36"

-- Define how xmonad-workspace-status is presented in what color.
myXmobarPP = xmobarPP
  { ppCurrent = xmobarColor myBlue "" . wrap "[" "]"  -- currently focused workspace
  , ppTitle   = xmobarColor myRed ""   -- title of currently focused program
  -- ...
  }

-- Function to create the keyboard shortcut to show and hide the bar.
xmobarShowHideKeymap (XConfig {modMask = modKey}) = (modKey, xK_b)

myConfig = def
  { borderWidth     = 2
  , modMask         = mod4Mask -- set 'Mod' to windows key
  , terminal        = "gnome-terminal"
  , handleEventHook = handleEventHook defaultConfig <+> docksEventHook
  }

main = xmonad =<< statusBar "xmobar" myXmobarPP xmobarShowHideKeymap myConfig
