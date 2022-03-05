# ChainFireworks
A firework simulation with chained explosions.  
Language: Processing(Java based)  
Project in October, 2019.

## Get Started
To start the simulation, clone this repository, and run `real_firework.exe`.  
To view the source code (Processing, Java based), go to `source/real_firework.pde`.

## Details
This is a program that visualizes firework on 2D canvas. Especially, 
a **chained explosion** can frequently occur while the simulation. Every single particles explode and split into children particles, when they collide with another ones.

no additional explosions:
<p align = "center">
<img src = "https://user-images.githubusercontent.com/99002885/155993818-c23b64ec-faa7-4f8a-b58d-a181c8f4f675.gif", width = 400>
</p>

chain explosions:
<p align = "center">
<img src = "https://user-images.githubusercontent.com/99002885/155996163-92cf4493-63fa-4439-aefa-50a84ff0c728.gif", width = 400>
</p>

Due to the limit of computing resources, each particles are set to lose their ability to explode after reaching 3rd generation. Still, the simulation can run slowly in the case when extremely many particles exist at some moment. You can check the total count of chain explosions in white number.
