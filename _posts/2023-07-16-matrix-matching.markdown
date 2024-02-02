---
layout: post
title:  "Positioning and Navigation by Matrix Comparison"
description: "[DRAFT] High speed heuristic contour matching for navigation and guidance."
date:   2023-07-16 23:23 +0530
categories: [blog]
---

Stalled.

## Attempt

I have been trying to add heuristic layers to matrix matching program for a microcontroller (and programmable gate arrays), that tries to search a small two dimensional matrix inside a two dimensional matrix hyperplane (localized representation of globe). The elements of the matrices are elevation data (hills and valleys) upto a certain resolution. The hyperplane matrix is pre-loaded inside the microcontroller and the smaller matrix is provided as serial input. Ideally the production rig (which can be embedded inside an aerial vehicle), would consist of upper band radar / lidar for input. For simulation purposes, a large matrix can be generated (that follows a degree of gradient smoothness and other similar rules), and a candidate can be picked from the large matrix to act as the smaller matrix (with added noise). I tried this on a cheap microcontroller but the directional vectors that were being output were far from the expected vectors - might as well be labelled random.

## TODO

*Need more reading and exprimentation.*

## References

Some definitions one might need to know to understand the article:

- [TERCOM](https://en.wikipedia.org/wiki/TERCOM)
- [Manifold](https://en.wikipedia.org/wiki/Manifold)
- [Distance](https://en.wikipedia.org/wiki/Distance)
- [Topography](https://en.wikipedia.org/wiki/Topography)
- [LIDAR](https://en.wikipedia.org/wiki/Lidar)
- [INS](https://en.wikipedia.org/wiki/Inertial_navigation_system)
- [CPLD](https://en.wikipedia.org/wiki/Complex_programmable_logic_device)
- [Polynomial Complexity](https://en.wikipedia.org/wiki/P_(complexity))
- [Heuristic](https://en.wikipedia.org/wiki/Heuristic_(computer_science))

### Academic References

TODO
