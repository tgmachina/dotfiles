import XMonad
import XMonad.Config (def)
import XMonad.Config.Kde
import XMonad.Actions.CycleWS
import qualified Data.Map as M
import qualified XMonad.StackSet as W -- to shift and float windows

altMask = mod1Mask

main = xmonad kdeConfig
    { modMask = mod4Mask -- use the Windows button as mod
    , manageHook = manageHook kdeConfig <+> myManageHook
    , keys = \c -> mykeys c `M.union` keys def c
    }
   where
     mykeys (XConfig {XMonad.modMask = modm}) = M.fromList $
        [ ((altMask, xK_k), nextWS)
        , ((altMask, xK_j),  prevWS)
        , ((controlMask, xK_space), spawn "krunner") ]

myManageHook = composeAll . concat $
    [ [ className   =? c --> doFloat           | c <- myFloats]
    , [ title       =? t --> doFloat           | t <- myOtherFloats]
    -- , [ className   =? c --> doF (W.shift "2") | c <- term]
    -- , [ className   =? c --> doF (W.shift "3") | c <- chat]
    ]
  where myFloats      = [ "MPlayer"
                        , "Gimp"
                        , "yakuake"
                        , "Yakuake"
                        , "Kmix"
                        , "kmix"
                        , "plasma"
                        , "plasmashell"
                        , "Plasma"
                        , "plasma-desktop"
                        , "Plasma-desktop"
                        , "krunner"
                        , "ksplashsimple"
                        , "ksplashqml"
                        , "ksplashx"
                        ]
        myOtherFloats = ["alsamixer"]
        term = ["konsole"]
        chat = ["slack"]
