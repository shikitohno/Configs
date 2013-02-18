-- Imports.
import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks

-- The main function.
main = xmonad =<< statusBar myBar myPP toggleStrutsKey myConfig

-- Command to launch the bar.
myBar = "xmobar ~/.xmobarrc"

-- Custom PP, configure it as you like. It determines what is being written to the bar.
myPP = xmobarPP { ppCurrent = xmobarColor "#429942" "" . wrap "<" ">" }

-- Key binding to toggle the gap for the bar.
toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)

-- Main configuration, override the defaults to your liking.
myConfig = defaultConfig 
      { manageHook =  manageDocks <+> myManageHook <+> manageHook defaultConfig
      , focusFollowsMouse = True
      , workspaces = ["1:irssi","2:dwb","3:LibreOffice","4:Comix","5:vlc","6:files","7:vim","8:misc"]
      , borderWidth = 0
      , modMask = mod4Mask
      , terminal = "urxvt"
      , layoutHook=avoidStruts $ layoutHook defaultConfig
}

myManageHook = composeAll [ className =? "File Operation Progress" --> doFloat
  , className =? "Downloads" --> doFloat
  , className =? "Vlc" --> doFloat
  , className =? "Dwb" --> doShift "2:dwb"
  , className =? "Firefox" --> doShift "3:Firefox"]


