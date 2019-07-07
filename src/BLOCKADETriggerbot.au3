Local $team = 0

_Main()

Func _Main()
	_Init()
	_Run()
EndFunc

Func _Init()
	; AutoItSetOption('MouseCoordMode', 2)
	HotKeySet('{PAUSE}', '_Exit')
	HotKeySet('`', '_ChangeTeam')
EndFunc

Func _Run()
	Local $hWnd = WinWait('BLOCKADE3D', '', 5)
	Local $mouseOffset = 1
	Local $color
	Local $colorVariation
	Local $mouse
	Local $fire
	Local $timer
	Local $nShots = 0

	While True
		$color = $team = 0 ? 0x083CC6 : $team = 1 ? 0xC61008 : $team = 2 ? 0x0 : $team = 3 ? 0x0 : 0
		$colorVariation = 50

		$mouse = MouseGetPos()

		ToolTip('    ' & ($team = 0 ? 'Blue' : $team = 1 ? 'Red' : $team = 2 ? 'Green' : $team = 3 ? 'Yellow' : 'None') & @CRLF & '    ' & $nShots & @CRLF & '    ' & $mouse[0] & ', ' & $mouse[1], 0, 0, 'BLOCKADE Triggerbot')

		$fire = PixelSearch($mouse[0] - $mouseOffset, $mouse[1] - $mouseOffset, $mouse[0] + $mouseOffset, $mouse[1] + $mouseOffset, $color, $colorVariation, 1, $hWnd)

		If $fire = 0 Then
			$fire = PixelSearch($mouse[0] - $mouseOffset, $mouse[1] - $mouseOffset, $mouse[0] + $mouseOffset, $mouse[1] + $mouseOffset, 0xFFD77B, $colorVariation, 1, $hWnd)
		EndIf

		If $fire <> 0 Then
			MouseClick('primary', $mouse[0], $mouse[1], 1, 0)

			$nShots += 1
		EndIf
	WEnd
EndFunc

Func _Run2()
	Local $hWnd = WinWait('BLOCKADE3D', '', 5)
	Local $mouseOffset = 100
	Local $color
	Local $colorVariation
	Local $mouse
	Local $fire
	Local $timer
	Local $nShots = 0

	While True
		$color = $team = 0 ? 0x083CC6 : $team = 1 ? 0xC61008 : $team = 2 ? 0x0 : $team = 3 ? 0x0 : 0
		$colorVariation = 0

		ToolTip('    ' & ($team = 0 ? 'Blue' : $team = 1 ? 'Red' : $team = 2 ? 'Green' : $team = 3 ? 'Yellow' : 'None') & @CRLF & '    ' & $nShots, 0, 0, 'BLOCKADE Triggerbot')

		$mouse = MouseGetPos()
		$fire = PixelSearch($mouse[0] - $mouseOffset, $mouse[1] - $mouseOffset, $mouse[0] + $mouseOffset, $mouse[1] + $mouseOffset, $color, $colorVariation, 1, $hWnd)

		If $fire = 0 Then
			$fire = PixelSearch($mouse[0] - $mouseOffset, $mouse[1] - $mouseOffset, $mouse[0] + $mouseOffset, $mouse[1] + $mouseOffset, 0xFFD77B, $colorVariation, 1, $hWnd)
		EndIf

		If $fire <> 0 Then
			MouseMove($fire[0], $fire[1], 0)

			$mouse = MouseGetPos()

			MouseClick('primary', $mouse[0], $mouse[1], 1, 0)

			$nShots += 1
		EndIf
	WEnd
EndFunc

Func _ChangeTeam()
	If $team = 3 Then
		$team = 0
	Else
		$team += 1
	EndIf
EndFunc

Func _Exit()
	Exit
EndFunc