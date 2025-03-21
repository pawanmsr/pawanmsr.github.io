---
layout: post
title:  "Equations for Laughs"
description:    "Everyday mathematics with a sprinkle of life."
date:   2025-03-06 10:45:39 +0530
updated: 2025-03-21 10:31:50 +0530
toc:    true
math: true
categories: [fun]
---

A mathematical post to test the blogging system. Popular equations, people, and related commentary.

## Finding F

A function is a **vehicle** that transports from one region to another.

$$
    F = f(x, y, z, . . . )
$$

The region where it starts is called *Domain* and the region where it ends is called *Co-domain*.

$$
    x, y, z \in mathbf{R} \equiv (-\infty, +\infty) \\
    F \in mathbf{R} \equiv (-\infty, +\infty)
$$

It may not be able to reach everywhere in the region where it ends. The places within the region reachable by the vehicle are cumulatively called *Range*.

$$
    P = probability(x, y, z, . . . )  
    probability : \mathbf{R}_{+}^{n} \rightarrow [0, 1) \in \mathbf{R}
$$

The classification is based on different parameters such as type of vehicle (its complexity, speed, comfort, and others), the people and goods it admits, locations it starts from ends up at, and more.

Vehicles that have a reverse gear are called invertible. Not all functions have an inverse.

$$
    F^{-1}(F) = Identity
$$

### I and the Ds

$$
    D = \nabla{\vec{F}} \\
    D = F'
$$

$$
    I = \int_{C} F
$$

Functions can be understood in more details by means of derivatives and integrals. It is possible to arrange methods, in order of their difficulty.

1. Derivative of function gives insight on $F$.
2. Double Derivative of function gives insight on $D$.
3. Further derivatives of function gives finer insights on $F$ and its $D$s.
4. Integral can be used to measure correctness of $F$ against actual.
5. $F$ enables 1 to 3. 4 may not always be possible. Respects are paid for discovering $F$ (by being awarded, for example, a PhD).

![Calculus on Curves](/assets/img/posts/coc.svg)

## Hot Enough To Handle

Behavior of a substance (such as volume and other macroscopic states) corresponding to various pressures, temperatures are presented on a phase diagram.

### Workout

Energy is needed to do work ($Q_{input}$). Some energy is lost, usually as heat ($Q_{lost}$). Work done ($W$) is the difference between the two.

$$
	W = Q_{input} - Q_{lost}
$$

Work done is closed path integral in pressure-volume ($P$ and $V$) phase diagram.

$$
	W = \oint PdV
$$

On a temperature-entropy ($T$ and $S$) phase diagram too, the work done is closed path integral.

$$
	W = \oint TdS
$$

Efficiency is the ratio of work done and energy supplied, and is related to the temperature of the system and its surroundings.

$$
	\eta_{efficiency} = \frac{W}{Q_{input}} = 1 - \frac{T_{outside}}{T_{inside}}
$$

Nutrition energises us.

![Isothermal-Adiabatic Cycle](/assets/img/posts/aic.svg)

### Candlelight

Inspired from $\eta_{efficiency}$, let's define $\gamma_{delighted}$.

$$
	\gamma_{delighted} = 1 - \frac{T_{tummy} - T_{dish}}{T_{tummy} -T_{environment}}
$$

We feel better when we have ice-cream on a hot day, and we feel amazing when we have sizzlers on a cold day. Note that $\gamma_{delighted}$ can be greater than one.

### Menu

Entropy in information sense, measures confusion.

$$
	S = - \sum_{tasting} p_{flavor} \times ln(p_{flavor})
$$

This is one reason, I think, chefs despise adding pineapple to pizza.

![Entropy and Information Theory](/assets/img/posts/eait.svg)
