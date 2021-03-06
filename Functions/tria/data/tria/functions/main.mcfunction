#Main function
#Called every tick (by the command block at 0 99 0)

# Source entity is the armor_stand with tag Data

# Important tags and scores:
# Score ID: 0: lobby, 1: player 1, 2: player 2, 3: player 3, 4: player 4, 5+: other entities ID

# ---- Global Systems -------------------------------------------------------------------------------------

#Timers
#The Timer2s on every entity that has the tag Timer2s runs from 1 to 40 constantly
#The Timer1s on every entity that has the tag Timer1s runs from 1 to 20 constantly
#The Timer10ticks on every entity that has the tag Timer10ticks runs from 1 to 10 constantly
#The Timer5ticks on every entity that has the tag Timer5ticks runs from 1 to 5 constantly
scoreboard players add @e[tag=Timer2s] Timer2s 1
scoreboard players set @e[scores={Timer2s=41..},tag=Timer2s] Timer2s 1
scoreboard players add @e[tag=Timer1s] Timer1s 1
scoreboard players set @e[scores={Timer1s=21..},tag=Timer1s] Timer1s 1
scoreboard players add @e[tag=Timer10ticks] Timer10ticks 1
scoreboard players set @e[scores={Timer10ticks=11..},tag=Timer10ticks] Timer10ticks 1
scoreboard players add @e[tag=Timer5ticks] Timer5ticks 1
scoreboard players set @e[scores={Timer5ticks=6..},tag=Timer5ticks] Timer5ticks 1

#Slow update mains
execute if entity @s[scores={Timer2s=25}] run function tria:main40ticks
execute if entity @s[scores={Timer1s=15}] run function tria:main20ticks 
execute if entity @s[scores={Timer10ticks=10}] run function tria:main10ticks 
execute if entity @s[scores={Timer5ticks=3}] run function tria:main5ticks 

#Useless Entities Kill 
#Tags: Perm = Permanent, CanBeAlive = Kill on next reset
#Other Life times: LifeTimeInTicks * -1 on the CanBeAlive objective
scoreboard players add @e CanBeAlive 0
scoreboard players set @e[tag=CanBeAlive,scores={CanBeAlive=0..}] CanBeAlive 1
tag @e remove CanBeAlive
scoreboard players set @e[tag=Perm] CanBeAlive 1
scoreboard players add @e[scores={CanBeAlive=..-1}] CanBeAlive 1 
execute as @e[scores={CanBeAlive=0},type=!player] at @s run tp @s ~ -200 ~
kill @e[scores={CanBeAlive=0},type=!player]

#Teams joining
scoreboard players set @e[tag=Ally] Team 1
scoreboard players set @e[tag=Enemy] Team -1

# ---- Story ----------------------------------------------------------------------------------------------

#TEMPORAIRE: Apres ce sera dans les fichiers de chaque chapitre
function tria:systemsactivations/aiinfantry
function tria:systemsactivations/aigesture
function tria:systemsactivations/playerhealth
function tria:systemsactivations/playergroundweapons
function tria:weapons/canon/main
function tria:ai/mobs/noxus/main
function tria:weapons/air_vehicle/base/main
function tria:weapons/air_vehicle/shuttle/main
function tria:weapons/ground_vehicle/as_ground_vehicle
function tria:weapons/ground_vehicle/as_tank
function tria:weapons/guided_missile/main

# ---- Weapons --------------------------------------------------------------------------------------------

#Shoot
execute if entity @e[tag=Shoot] run function tria:weapons/projectiles/bullets/shoot

#Bullets movement, damage and collisions
execute if entity @e[tag=Projectile] run function tria:weapons/projectiles/main

# ---- Other ----------------------------------------------------------------------------------------------

#Hotbars
function tria:hotbar/main

#Explosions
#You can make any location explode by running tria:generic/explosions/(tiny/small/big/huge) on it
#The huge needs to be executed as an entity, the others don't
execute as @e[tag=HugeExpl] at @s run function tria:generic/explosions/hugeexplparticles
execute if entity @a[scores={AnimExpl=1..}] run function tria:generic/explosions/animexpl

#Effects
execute as @e[tag=NoFire] run data merge entity @s {Fire:0}
execute as @e[tag=StopMotion] run data merge entity @s {Motion:[0.0,0.0,0.0]}

#Input Detections Reset
scoreboard players set @a Walking 0
scoreboard players set @a Drop 0
scoreboard players set @a UseCarrot 0
scoreboard players set @a Sneak 0