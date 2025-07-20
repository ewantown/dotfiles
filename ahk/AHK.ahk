;;=============================================================================================================
;; Remap modifier keys
SetCapsLockState, AlwaysOff
Capslock::LCtrl                                                          ; [C-]

;;Space::LCtrl							         ; [C-]
	
;;Space up::								 ; preserves tap default					
;;	if (A_PriorKey = "Space") {
;;      	Send {Space}
;;	} else {
;;	Send {LCtrl up}
;;	}
;;	return
;;^-::
;;	Send ^{Space}

; Swap for Keychron MacOS mode
;;LAlt::RWin
;;RAlt::RWin
;;LWin::LAlt
;;RWin::LAlt

;;=============================================================================================================
;; Esc as mouse-key modifier

Esc::return 
	
Esc up::								; preserves touch default
	if (A_PriorKey = "Escape") {
      	Send {Esc}
   	}
	return

;;=============================================================================================================
;; Mouse-key button actions
~Esc & 1::
	if (not GetKeyState("LButton", "P")) {
		Send {Click, Left down}
	}
	return

~Esc & 1 up::Click, Left up


~Esc & 2::Click, Right

;;=============================================================================================================
;; Mouse-key movement                                                 ; Accelerating movement
~Esc & q::return
~Esc & i::
~Esc & l::
~Esc & k::
~Esc & j::
     key   := SubStr(A_ThisHotKey, 8)
     mMin  := 2, mMax := 200, secs := 3
     start := A_TickCount
     While GetKeyState(key, "P") {
     	   If GetKeyState("q", "P") {                                 ; Esc & q := move slower
	      move(key, mMin)
	      Sleep 1
	   } Else {
		delta := Round((A_TickCount - start) * (mMax - mMin) / secs / 1000)
	   	dist  := (delta < mMax) ? delta : mMax
	   	move(key, dist)
		Sleep 1
	   }
     }
     return

move(key, dist) {
     mouseKey := { "j & i": [-1, -1], "i": [ 0, -1]  , "i & l":   [ 1, -1]
                 , "j":     [-1,  0]                 , "l":       [ 1,  0]
                 , "j & k": [-1,  1], "k": [ 0,  1]  , "l & k":   [ 1,  1]}
     MouseMove, %dist * mouseKey[key].1%, %dist * mouseKey[key].2%, 100, R
}
