---
layout: post
title:  "Hobby Mechanics: Practical Methods for TVC"
description:    "[DRAFT] Actuation methods for thrust vector control in gyro-stabilized systems."
date:   2023-02-17 18:00 +0530
categories: [blog,projects]
---

Stalled.

## Overview

Most aero-systems need stabilization during flight to prevent loss of control, and maintain their course. Depending upon the properties of the ambient atmosphere (or lack thereof), and the system in consideration, method of stabilization is selected. [Fin stabilization](https://en.wikipedia.org/wiki/Stabilizer_(aeronautics)){:target="_blank"} is the most common form of stabilization when ambient fluid is dense. Fins that can actively change their configuration are called control surfaces. Most active stabilization use gyroscope for motion reference. A large enough gyroscope can also be used for stabilization, but it is not common [SIT]. Systems that do not depend on the ambient fluid for stabilization often use [thrust vectoring](https://en.wikipedia.org/wiki/Thrust_vectoring){:target="_blank"}.

## TODO

*Host figures/drawings and images of setup. 3D Printing/CAM service?*

### Hydro-Pneumatic

High pressure post combustion bleed air (right after the high pressure turbine phase) can be used to push the actuation rods. Standard pre-combustion bleed air can also be used, but I think they might not work as effectively at high altitudes due to low air density - but then the thrust is also reduced; so one would need the proportionality equations to make theoretical judgements. From a hobbyist's standpoint the primary problem would be to find a way to simulate all of this or maybe try it out on miniature setup - if only they can be built/purchased.

#### Process

Engines are notoriously difficult to build [IMO]. If an enthusiast wants to construct one (for hobby purpose), they would first go about selecting a simple prevalent design that they think has high chance functioning; draw the parts and select the materials (possibly perform simulations); get it machined and assembled. Then they would need to dry run it: correct for alignment/vibrations. Next, they would have to tune through multiple iterations on a test bench or a suitable environment - while risking rupture and explosion; in which case it would be a gigantic waste of resources. All this, just to test a few affixed components.

Scaled to an industrial level: an efficient, reliable, low maintenance, high thrust (power) engine is extremely difficult to develop even if one possesses a working system to reverse engineer. Of course, one has to get it right once and then they can simply create an assembly line out of the entire process (maybe even make incremental improvements), but it is ludicrously capital intensive, and restrictive market to enter; something completely out of reach of hobbyists who have no practical experience bar reading few books and a bunch of field manuals.

### Electromagnetic

*I mounted an array of independently powered electromagnets on one of the two coaxial rings/toroids (the other ring supported a parallel array of ferromagnetic tabs). If one does the math then they will realise that the energy needed to provide sufficient torque to move a turbojet nozzle gusting 100kN of thrust isn't any lower than the more mechanical methods, and battery or an APU is not an option to enable TVC actuation when many other onboard systems rely on electrical power. It can be useful however, on battery powered drones as it offers greater redundancy compared to a pair of servos.*

*I thought I was doing something interesting, but turns out it's another faux pas.*

TODO

## References

Some definitions:

- [Gimbal](https://en.wikipedia.org/wiki/Gimbal){:target="_blank"}
- [Pneumatic Actuation](https://en.wikipedia.org/wiki/Pneumatic_actuator){:target="_blank"}
- [PID](https://en.wikipedia.org/wiki/PID_controller){:target="_blank"}
- [Gyroscopic Control](https://en.wikipedia.org/wiki/Control_moment_gyroscope){:target="_blank"}

### Academic References

TODO: text books.
