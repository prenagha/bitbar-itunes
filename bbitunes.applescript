
on run argv
	set arg to ""
	set scpt to item 1 of argv
	if (count of argv) > 1 then
		set arg to item 2 of argv
	end if
	set notAvail to "♫
---
iTunes status not available"
	set tm to 3
	if arg is "launch" then
		try
			tell application "iTunes"
				with timeout of tm seconds
					activate
				end timeout
			end tell
		on error errTxt
			return notAvail
		end try
		return "Starting iTunes..."
	end if
	if arg is "playpause" then
		try
			tell application "iTunes"
				with timeout of tm seconds
					playpause
				end timeout
			end tell
		on error errTxt
			return notAvail
		end try
		return "Play Pause..."
	end if
	if arg is "previous" then
		try
			tell application "iTunes"
				with timeout of tm seconds
					previous track
				end timeout
			end tell
		on error errTxt
			return notAvail
		end try
		return "Previous track..."
	end if
	if arg is "next" then
		try
			tell application "iTunes"
				with timeout of tm seconds
					next track
				end timeout
			end tell
		on error errTxt
			return notAvail
		end try
		return "Next track..."
	end if
	
	if application "iTunes" is not running then
		return "♫
---
iTunes is not running
Launch iTunes | bash='" & scpt & "' param1=launch terminal=false refresh=true"
	end if
	
	try
		tell application "iTunes"
			with timeout of tm seconds
				if player state is playing then
					set picon to "▶︎"
					set pact to "Ⅱ Pause | bash='" & scpt & "' param1=playpause terminal=false refresh=true"
				else
					set picon to "Ⅱ"
					set pact to "▶︎ Play | bash='" & scpt & "' param1=playpause terminal=false refresh=true"
				end if
				set trck to name of current track as string
				set albm to album of current track as string
				set artst to artist of current track as string
				return "♫ " & picon & " " & trck & " - " & artst & "
---
" & artst & "\n" & albm & "\n" & trck & "\n" & pact
			end timeout
		end tell
	on error errTxt
		return notAvail
	end try
	
	
end run