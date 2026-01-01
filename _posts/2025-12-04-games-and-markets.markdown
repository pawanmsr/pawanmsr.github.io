---
layout: post
title: "Analysis Adventures: Games and Markets"
description: "Theoretical understanding of market mechanics and games."
date: 2025-12-04 20:14 +0530
updated: 2026-01-xx xx:xx +0530
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

## The Times They Are A-Changin'

Markets such as exchanges enable trading of products (or vehicles) that include stocks, derivatives and commodities among others. Gold and iron are commodities, so are adamantium and kryptonite (from the motion pictures).

> The only gold I know about is the kind you wear.
>
> <cite>Moneypenny</cite>

Gold is also used in radiation shields on exosphere vehicles and spacecrafts.

> Just how many souls do you think my soul is worth?
>
> <cite>~~Captain~~ Jack Sparrow</cite>

One object can be used to measure the value another object. Alternatively, units of pricing can be standardized.

> Oh, a man of principle - with a price on his head.
>
> <cite>Octopussy</cite>

The price can be denominated using centralized units of currency, which can themselves be traded with other such units at foreign exchanges.

> . . . I'm afraid currency, is the currency of the realm.
>
> <cite>Cutler Beckett</cite>

Long buys, and short sells the product.

> [!TIP] Last Train Home
>
> Running late and long queue at the counter? It is possible to travel on public transportation without a ticket, but there is a risk of being fined. If the odds against being fined 100 currency units is $30:1$ on a ticket of 5 currency units then one would be better off traveling without a ticket.
>

> Aye, but that's a gamble of long odds ain't it?
> 
> <cite>Captain Barbossa</cite>

> [!TIP] . . . And I surrender
>
> "How do I quantify the wager?" you may ask. Maybe, a friend of yours thought that the best way to spend his pocket money was to load up a margin to risk a month of ticketless travel.
>

Units of monetary measurements have names (used in literature), short forms (used on displays and statements), and symbols (used in mathematics and accounting).

![Lost Jack](/assets/img/posts/lj.svg)

## Wicked Game

Agents' information set may comprise of private knowledge and mutual knowledge. A mutual knowledge becomes common knowledge if every agent knows that every other agent possesses it. A game is defined by its agents (or players), their strategies and payoff functions. The strategy profile in a complete information game, such as Tic-Tac-Toe, can be predetermined. In games with incomplete information, strategies follow a distribution. The payoffs (or utility) may be differential, with dependence on multitude of factors which include strategies of every agent, and (terminal) histories which are sequences of actions (movements or yields).

```haskell
-- spot price is the current price
-- strike price is the price at which the 
--  seller/buyer agrees to sell/buy
payoffLong :: Double -> Double -> Double
payoffLong spot strike
    | spot >= strike = spot - strike
    | otherwise = 0.0

payoffShort :: Double -> Double -> Double
payoffShort spot strike
    | spot <= strike = strike - spot
    | otherwise = 0.0

```

> Well because he thought it was good sport. Because some men aren't looking for anything logical, like money.
>
> <cite>Alfred Pennyworth</cite>

It may not be possible to put a value on everything.

> I got a jar of dirt. I got a jar of dirt.
>
> <cite>Jack</cite>

It could also be possible that something that is worthless to one may be priceless to some other. Jack assumes mutual knowledge, but he is acting on private information.

> [!IMPORTANT] Do You Want To Know A Secret?
> Based On True Events
>
> Jack the Sparrow (Jack) and Capitan Salazar (Sala[^1]) are friends and often enjoy cycling together. Witch of Horology (Hoe[^2]) wants a set of components, and often requests Jack for delivery in return for chocolates. One day, all of a sudden, Hoe stops rewarding Jack with the usual chocolates for the delivery.
>
> **Jack**: I like cookies too, if you have them.  
> **Hoe**: Were you not pleasured already?  
> **Jack**: How do you know I like cycling?  
> **Hoe**: Sala is my sibling.  
> . . .  
> **Jack**: I gave you half each time!  
> **Sala**: And Hoe saw me eating them!  
>
> [^1]: In-laws turned outlaws.  
> [^2]: Farming equipment.  
>

## Signed, Sealed, Delivered (I'm Yours)

Whimsical words become worthless, and so, statements record financial activities and positions. A position is closed when the underlying asset is delivered - until then it remains an accounts payable or longer term notes payable with the borrower. Accounting can be performed in each of the different ways, and a particular method can be pointed to, based on purpose.

### I Want to Break Free

Small debts are borrowers' problem, but large debts become lenders' problem. If the yield spread of bonds ($S$) can be computed from history, and recovery rate ($R$) is known, then one way to formulate probability of default ($P$) at time $t$ is by defining average hazard rate ($\overline{\lambda(t)}$).

$$
\begin{equation}
    \overline{\lambda(t)} \approx \frac{S(t)}{1 - R} \\
    P(t) = 1 - e^{-\overline{\lambda(t)}t}
\end{equation}
$$

Debt is not always bad - it can be leveraged. Debt financing becomes an interesting tool when debt is cheap. Although, when defaults increase, banks and financial institutions tighten up lending by increasing interest rates, which may cause a negative feedback.

> [!TIP] Time Of Our Lives
> The best time to default, from a macroeconomics perspective, will be when the debt is cheap - the repercussions can be absorbed effectively. Individually, the best time to default would be when default rates soar - the debt collector may get busy worrying about their own debt(s).
>

### The Winner Takes It All

Markets may not always be free. Demand can be manufactured and supply can be constricted - as it often happens during wartime. Prices my not remain constant regardless. While a small predictable rise in prices is expected a fall can lead to deflation. Deflation is not good because demand suffers due to anticipation of lower prices, and excessive inflation is not good because demand explodes due to fear of being priced out. Negative feedback is a whirlwind eager to transmute into a tornado, if left unchecked.

Options (contract) offer protection against unpredictable changes in prices. Call buys and put sells the underlying asset if the right is exercised.

> [!NOTE] Marry You
> Marriages can be thought of as bipartite graph (or an n-partite graph if it's not just men and women), wherein girls buy call options from boys at different dates, and boys buy call options from girls at different dates. They keep buying them without exercising them. The prices of the options decreases as the expiration date get nearer. The value of the underlying assets nullify if the holders decide to exercise their options and those underlying assets who had issued the options lose all the options they have had. This way the web gradually collapses.
>

Futures and Forwards (contract) insure the price of the underlying asset at a later date. (American variant of) The former can be exercised before its delivery date.

## Time (and Tick Size)

> One, two, three, four, five, six. Six. Perfect number.
>
> <cite>Blondie</cite>

6 is the smallest perfect number. Perfect numbers are part of the natural realm which is countable. World operates in the real realm which is uncountable and continuous. Discretization is done through measurements which may be accompanied with time and place. If a measurement is made every second then $\delta t = 1$ and duration of observation ($T$) in seconds equals number of measurements ($N$). $\delta t$ is a stochastic variable.

$$
\begin{equation}
    \delta t = \frac{T}{N} \\
    \delta f = f(t + \delta t) - f(t)
\end{equation}
$$

The measured value $f$ may depend on other parameters and actions of participating agents. The smallest possible change in $f$ is the tick size.

## Poems and Mnemonic

My poems are result of my reveries.

![Derivatives Free Verse](/assets/img/posts/dfv.svg)

## References


