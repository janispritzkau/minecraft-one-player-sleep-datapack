tag @a[nbt={Sleeping: true}] add is_sleeping
scoreboard players add @a[tag=is_sleeping] sleep_timer 1
execute if entity @a[tag=is_sleeping] run scoreboard players enable @a kick_sleeping

execute as @a[tag=is_sleeping,scores={sleep_timer=1}] if entity @a[tag=!is_sleeping] run tellraw @a[tag=!is_sleeping] [{"selector":"@s"},{"text":" is now sleeping","color":"blue","clickEvent":{"action":"run_command","value":"/trigger kick_sleeping set 1"},"hoverEvent":{"action":"show_text","value":{"text":"","extra":[{"text":"Click to kick!","color":"aqua"}]}}}]
execute if entity @a[tag=is_sleeping, scores={sleep_timer=150..}] run time add 1000
execute if entity @a[tag=is_sleeping, scores={sleep_timer=120..}] run weather thunder 1

execute as @a[scores={kick_sleeping=1}] run function 1_player_sleep:kick

tag @a[tag=is_sleeping, nbt={Sleeping: false}] remove is_sleeping
scoreboard players set @a[tag=!is_sleeping, scores={sleep_timer=1..}] sleep_timer 0
