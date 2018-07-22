execute at @a[tag=is_sleeping] run summon snowball ~ ~1 ~
tellraw @a[tag=is_sleeping] [{"text":"You have been kicked out of bed by ","color":"gray"},{"selector":"@s","color":"reset"}]
tellraw @a[tag=!is_sleeping] [{"selector":"@a[tag=is_sleeping]"},{"text":" has been kicked out of bed by ","color":"gray"},{"selector":"@s","color":"reset"}]
scoreboard players set @s kick_sleeping 0
