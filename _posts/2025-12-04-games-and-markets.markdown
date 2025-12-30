---
layout: post
title: "Analysis Adventures: Games and Markets"
description: "Theoretical understanding of market mechanics and games."
date: 2025-12-04 20:14 +0530
updated: 2026-xx-xx xx:xx +0530
categories: [blog]
math: true
---

## Overview

Elementary theoretical understanding of games, markets and related stochastic processes.

### Precis

Systems that evolve over time have excited me ever so often, and my attempts to grasp their complexity (for certifications or otherwise) have resulted in limited avail. I have got an opportunity lately, to make a definitive attempt in my spare time. This article, however elaborate, is not backed by any practical insights or data and any comical aspects may be simplifications without concern for accuracy.

## Functional Programming

Stateless evaluation, often lazy, is the prime advantage of functional programming. Greater importance is given to declaration and definition.

```haskell
-- x is the beginning inventory
-- y is the ending inventory

cogs :: Float -> Float -> Float
cogs x y = x - y

averageInventory :: Float -> Float -> Float
averageInventory x y = (x + y) / 2

inventoryTurnover :: Float -> Float -> Float
inventoryTurnover x y = (cogs x y) / (averageInventory x y)

```

Data types may behave like apples and oranges. Apples and oranges may not be comparable, but they can be put in the same basket and consumed ensemble. This is done by defining types that encapsulate primitives, and functions that operate on those new types.

```haskell
-- Product can be an Apple or an Orange
-- Apple has cost price and percent discount
-- Orange has cost price and percent staleness
data Product = Apple Float Float | Orange Float Float deriving (Show)

-- Minimum selling price
price :: Product -> Maybe Float
price (Apple cost discount)
    | discount <= 100 && discount >= 0 = Just (cost * 100 / (100 - discount))
    | otherwise = Nothing
price (Orange cost staleness)
    | staleness <= 100 && staleness >= 0 = Just (cost * 100 / (100 - staleness))
    | otherwise = Nothing

```

More about this programming paradigm can be learnt from blogs, books and courses. Snippets of simple formulae can be found scattered throughout.

## Time (and Tick Size)

## Signed, Sealed, Delivered (I'm Yours)

## Poems and Mnemonic

My poems are result of my reveries.

![Derivatives Free Verse](/assets/img/posts/dfv.svg)

## References


