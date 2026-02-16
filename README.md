# Carrion Physics Test
## Made with Defold

This project aims to mimic the physics of the movement in the game Carrion using Defold, taking advantage of raycasting and joints for tentacles.

Using the raycasting system, we can detect the distance to the ground and adjust the tentacles accordingly, smooth movement tentacle by tentacle like in carrion, using a force to move the player towards mouse position.

The blood splats are made using a custom particle system "AcidRain" https://github.com/approboGames/AcidRain and a script that spawns them when the player moves. Because AcidRain allows us to use collisions, we can detect tile collisions and spawn blood splats accordingly.

The splats were pretty hard to do because I could not find any examples of stencils, but after finding some old public examples https://github.com/jhonnyking/my-public-defold-examples/tree/master/sprite-masking and combining it with a little "prompt engineering", I was able to make it work. I find truly difficult to understand render scripts *sigh*

Might be buggy in certain situations, but it works at least.

Check out [the documentation pages](https://defold.com/learn) for examples, tutorials, manuals and API docs.