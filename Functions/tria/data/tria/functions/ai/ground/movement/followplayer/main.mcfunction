# AI Ground Movement: Follow Player
# Made by: KubbyDev

# Determines the action to do based on the distance to the nearest player
execute if entity @e[tag=FollowPlayer,tag=!AIFighting] run function tria:ai/ground/movement/followplayer/getrangenormal
execute if entity @e[tag=FollowPlayer,tag=AIFighting] run function tria:ai/ground/movement/followplayer/getrangefighting

# TP (FPrange = 5)
execute as @e[scores={FPrange=5},tag=FollowPlayer] run function tria:ai/ground/movement/followplayer/tp

# Walking or running (FPrange = 3 or 4)
execute as @e[scores={FPrange=3},tag=FollowPlayer] at @s run data merge entity @e[tag=BMZombie,tag=FPZombie,distance=..0.1,limit=1,sort=nearest] {Attributes:[{Name:generic.movementSpeed,Base:0.34}]}
execute as @e[scores={FPrange=4},tag=FollowPlayer] at @s run data merge entity @e[tag=BMZombie,tag=FPZombie,distance=..0.1,limit=1,sort=nearest] {Attributes:[{Name:generic.movementSpeed,Base:0.45}]}

# Movement stop (FPrange = 1)
execute as @e[scores={FPrange=1},tag=FollowPlayer] at @s run data merge entity @e[tag=BMZombie,tag=FPZombie,distance=..0.1,limit=1,sort=nearest] {Attributes:[{Name:generic.movementSpeed,Base:0}]}

# ------------------------------------------------
# How to use it:

# To make any entity follow the nearest player with ID = 1 to 4:
# /execute as @e[any entity (With an ID)] run function tria:ai/ground/movement/followplayer/start

# To stop the follow:
# /execute as @e[your entity] run function tria:ai/ground/movement/followplayer/stop

# ------------------------------------------------
# All the scores and tags used by the whole system

# Scores:
#FPrange: The range in which the AI is (stop moving, do nothing, walk, run, tp)

# Tags:
#FollowPlayer: All AIs following other entities should have this tag
#AIFighting: All AIs using the combat system have this tag
#FPZombie: The zombies used by this system have this tag (given in ai/ground/movement/basic/spawnzombie)