# Give 44. Magnum
# Gives a weapon to the source entity

# Weapon ID
scoreboard players set @s 2ndWeapon 1

# Firerate and reload time
scoreboard players set @s 2ndFirerate 10
scoreboard players set @s 2ndReloadTime 100

# Loader Size
scoreboard players set @s 2ndLoadCapacity 6

# Bullets Damages
scoreboard players set @s 2ndWeaponDamage 15
scoreboard players set @s 2ndHeadDamage 22

# Unaccuracy of the weapon. The higher this number is, the higher the spread of the bullets will be (The maximum shift if 0.04 * Unaccuracy degrees)
scoreboard players set @s 2ndUnaccuracy 10

# Recoil of the weapon (in 10th of degrees)
scoreboard players set @s 2ndRecoil 80

# Other
scoreboard players operation @s 2ndAmoLoaded = @s 2ndLoadCapacity
scoreboard players add @s 2ndCdShoot 0
scoreboard players add @s 2ndReloading 0
