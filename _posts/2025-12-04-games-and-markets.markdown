---
layout: post
title: "Analysis Adventures: Games and Markets"
description: "Theoretical understanding of market mechanics and games."
date: 2025-12-04 20:14 +0530
updated: 2026-01-04 00:25 +0530
categories: [blog]
math: true
---

## Overview

Elementary theoretical understanding of games, markets and related stochastic processes.

### Precis

Systems that evolve over time have excited me ever so often, and my attempts to grasp their complexity (for certifications or otherwise) have resulted in limited avail. I have got an opportunity lately, to make a definitive attempt in my spare time. This article, however elaborate, is not backed by any practical insights or data, and any comical aspects may be simplifications without concern for accuracy.

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
> <cite>~~Captain~~ Jack Sparrow</cite>

It could also be possible that something that is worthless to one may be priceless to some other. Jack assumes mutual knowledge, but he is acting on private information. Asymmetric information causes market inefficiencies.

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

It is easier to use continuous compounding rate ($r_{c}$), which can be obtained by equating the amounts equations, and solving for it.

$$
Pe^{r_{c}n} = P(1 + \frac{r}{m})^{nm} \\
r_{c} = m \ln(1 + \frac{r}{m})
$$

$P$ is the initial amount, $n$ is the number of years, and $m$ is the compounding per year.

### The Winner Takes It All

Markets may not always be free. Demand can be manufactured and supply can be constricted - as it often happens during wartime. Prices my not remain constant regardless. While a small predictable rise in prices is expected, a fall can lead to deflation. Deflation is not good because demand suffers due to anticipation of lower prices, and excessive inflation is not good because demand explodes due to fear of being priced out. Negative feedback is a whirlwind eager to transmute into a tornado, if left unchecked.

Options (contract) offer insurance against unpredictable changes in prices. Call buys and put sells the underlying asset if the right is exercised.

> [!NOTE] Marry You
> Marriages can be thought of as bipartite graph (or an n-partite graph if it's not just men and women), wherein girls buy call options from boys at different dates, and boys buy call options from girls at different dates. They keep buying them without exercising them. The prices of the options decreases as the expiration date get nearer. The value of the underlying assets nullify if the holders decide to exercise their options and those underlying assets who had issued the options, lose all the options they have had. This way the web gradually collapses.
>

Futures and Forwards (contract) lock the price of the underlying asset at a later date. (American variant of) The former can be exercised before its delivery date. Number of contracts needed is determined by hedge ratio ($h$), the size of the position being hedged ($Q_{P}$) and the size of futures contract of the underlying asset ($Q_{F}$).

$$
\begin{equation}
    h = \rho \times \frac{\sigma_{S}}{\sigma_{F}} \\
    N = h \times \frac{Q_{P}}{Q_{F}} \\
    N = \beta \times \frac{V_{P}}{V_{F}}
\end{equation}
$$

Hedge ratio is proportional to the ratio of standard deviations of change in spot price, and change in futures price. The proportionality constant ($\rho$) is the coefficient of correlation of the standard deviations ($\sigma_{S}$ and $\sigma_{F}$). If the assets being hedged are different from those in the futures contract, then the the ratio of their values ($V_{P}$ and $V_{F}$) is used instead. $\beta$ is the regression coefficient of return on the assets. It can be used to obtain the near term expected return on assets ($R_{f} + \beta (R_{m} - R_{f})$ where $R_{m}$ and $R_{f}$ are return on market and risk free investments respectively). The underlying asset could be a derivative, but surely there are restrictions on the number of times a derivative can be created for another derivative.

```haskell
-- underlying asset is a stock.
forwardPriceOnStock :: Float -> Float -> Float -> Float
forwardPriceOnStock spot rate time = spot * exp (rate * time)

-- underlying asset is another derivative
forwardPriceOnDerivative :: (Float -> Float) -> Float -> Float -> Float
forwardPriceOnDerivative derivative rate time = (derivative time) * exp (rate * time)

-- rate is risk free rate
-- time is time to maturity

```

Risk free rates are benchmark rates such as LIBOR or MIBOR. They can also be yields on bonds or return on treasury bills.

```shell
# price of forwards contract on a stock
# stock price is 100, risk is 5%, time is quarter of year
$ forwardPriceOnStock 100 0.05 0.25
$ 101.25785

# price of forwards contract on another forwards contract
# risk free rate is 5% and all else is same as before
$ forwardPriceOnDerivative (forwardPriceOnStock 100 0.05) 0.05 0.25
$ 102.531525

# let's buy a forwards contract on the forwards contract
#   on a stock that we just bought
$ forwardPriceOnDerivative (forwardPriceOnDerivative \
    (forwardPriceOnStock 100 0.05) 0.05) 0.05 0.25
$ 103.82121

# different rate and time may cause it to
#   increase more rapidly

```

Time to maturity can be negative if the price needs to be computed for a past date.

> [!NOTE] Somebody That I Used to Know
> If the asset pays an interest or a dividend, then the spot price must be reduced by that amount.
>
> The dividend date may not fall within the time to maturity, but their announcement often tumbles the stock price by dividend amount. Stocks are sold just after the ex-dividend date (because that is when the recipients of dividend are finalized).
>

The value of European call ($c$) or put ($p$) options can be obtained from put-call parity if the value of either of them is known.

$$
\begin{equation}
    \label{parity}
    D + c + Ke^{-rT} = p + S_{0}
\end{equation}
$$

The value of dividends ($D$), the strike price ($K$), and the spot price ($S_{0}$) must be given.

## Time (and Tick Size)

> One, two, three, four, five, six. Six. Perfect number.
>
> <cite>Blondie</cite>

6 is the smallest perfect number. Perfect numbers are part of the natural realm which is countable. World operates in the real realm which is uncountable and continuous. Discretization is done through measurements which may be accompanied with time and place. If a measurement is made every second then $\delta t = 1$ and duration of observation ($T$) in seconds equals number of measurements ($N$). $\delta t$ is a stochastic variable.

$$
\begin{equation}
    \delta t = \frac{T}{N} \\
    \delta y = y(t + \delta t) - y(t) \\
    \delta y = y_{i} - y_{i - 1}  
\end{equation}
$$

The measured value $y$ may depend on other parameters and actions of participating agents. The smallest possible change in $y$ is the tick size. Volatility ($\sigma$) is standard deviation of (continuously compounded) return ($r$) on $y$.

$$
    y_{i} = y_{i - 1}e^{r_{i}} \\
    r_{i} = \ln \frac{y_{i}}{y_{i - 1}}
$$

At the end of current timestep ($n$), over $m$ previous measurements of $y$, volatility becomes a maximum likelihood estimate.

$$
\begin{equation}
    \bar{r} = \frac{1}{m} \sum_{i = 1}^{m} r_{n - i} \\
    \sigma_{n}^{2} = \frac{1}{m} \sum_{i = 1}^{m} (r_{n - i} - \bar{r})^{2} \\
    \sigma_{n}^{2} = \sum_{i = 1}^{m} \alpha_{i} (r_{n - i} - \bar{r})^{2}
\end{equation}
$$

$\alpha_{i}$ are weights, which maybe higher for more recent measurements.

```haskell
-- Math.hs
power :: (Fractional x, Integral y) => x -> y -> x
power x y
    | y == 2 = x * x
    | y == 1 = x
    | y == 0 = 1
    | y < 0 = 1 / power x (-y)
    | even y = power (power x (div y 2)) 2
    | odd y = x * power (power x (div (y - 1) 2)) 2



-- Volatility.hs
import Math (power)

-- using change ratio, instead of natural log
returnRate :: Double -> Double -> Double
returnRate current previous = (current - previous) / previous

-- exponentially weighted moving average
volatilityEWMA :: Double -> Double -> Double -> Double -> Double
volatilityEWMA variance current previous lambda
    | lambda <= 1 && lambda > 0 = lambda * variance + 
        (1 - lambda) * power (returnRate current previous) 2
    | otherwise = error "lambda must be between 0 and 1"


```

More complex formulations for volatility use of heteroscedasticity.

### I Like to Move it Move it

If the time interval ($\delta t$) is small in comparison to volatility ($\sigma$), then (risk neutral) upward and downward movement factors are:

$$
    u = e^{\sigma \delta t} \\
    d = e^{- \sigma \delta t}
$$

The asset changes to $y_{0}u$ on upward movement and $y_{0}d$ on downward movement. Correspondingly, the derivative prices move to $f_{u}$ and $f_{d}$.

$$
\begin{equation}
    \label{tree}
    p^{*} = \frac{e^{r_{f}t} - d}{u - d} \\
    p = \frac{e^{\mu \delta t} - d}{u - d} \\
    f = e^{-rt}[pf_{u} + (1 - p)f_{d}] \\
    \Delta = \frac{f_{u} - f_{d}}{y_{0}u - y_{0}d}
\end{equation}
$$

$p$ is probability of upward movement, $r_{f}$ is risk free rate, $\mu$ is the expected actual return and $\Delta$ is the number of offsetting assets needed to hedge the position against price movements. American option prices for two possible movements, in each time step, are computed using binomial tree. If non-movement is also considered, that is, the price may not move, then the option prices need to be computed using trinomial tree. The expectation can be computed by performing a Monte-Carlo simulation that traverses a path of the tree by randomly selecting nodes weighted by their probabilities.

```haskell
-- Binomial tree is a type of binary tree
data BinaryTree node = Empty | Node node
    (BinaryTree node) (BinaryTree node) deriving (Show, Read)

type BinomialTree price probability = BinaryTree (price, probability)

isLeaf :: BinaryTree node -> Bool
isLeaf Empty = False
isLeaf (Node _ Empty Empty) = True
isLeaf (Node _ _ _) = False

pick :: Double -> node -> node -> node
pick probability left right = do
    -- implement random number generator
    let randomness = 0.5 -- for completeness
    -- left node for upward movement
    -- right node for downward movement
    if randomness > probability
        then left
        else right

simulate :: BinomialTree Double Double -> Double
simulate Empty = 0
simulate (Node (price, _) Empty Empty) = price
simulate (Node _ left Empty) = simulate left
simulate (Node _ Empty right) = simulate right
simulate (Node (_, probability) left right) = simulate (pick probability left right)

monteCarlo :: Int -> (BinomialTree Double Double -> Double) -> BinomialTree Double Double -> Double
monteCarlo n simulate node = foldl (\accumulate price -> accumulate + price / fromIntegral n) 
    0 (map simulate (replicate n node))

```

Running at least ten times as many times as the number of leaf nodes should provide good enough approximation.

```shell
# Tree is manually generated.
# Tree is complete binary tree.
# Tree has less than ten leaf nodes.

# Ten simulation runs.
$ monteCarlo 10 simulate Tree
$ 299.9999999999995

$ monteCarlo 10 simulate Tree
$ 133.0000000000000

# Thousand simulation runs.
$ monteCarlo 1000 simulate Tree
$ 157.0000000000000027

$ monteCarlo 1000 simulate Tree
$ 157.0000000000000005

```

Binomial tree must be given. Alternatively, asset prices $y$ can be sampled from normal distribution and equation \ref{tree}, where $f$ is computed from $f_{u}$ and $f_{d}$ (in reverse order), can be applied to generate a tree.

## Difference Solves Differential

Interaction with the market alters the market. Arbitrage allows small gains by selling a series of products at different locations. Since market moves to correct, acting on arbitrage opportunity closes it. As many players are on a lookout for an arbitrage opportunity, they tend to be infrequent. Pricing european options assumes no arbitrage.

$$
\begin{equation}
    dy = a(y, t) dt + b(y, t) dz \\
    a(y, t) = \mu y \\
    b(y, t) = \sigma y
\end{equation}
$$

If $a$ and $b$ were to be constants then the price of the asset would be a simple linear equation. They depend linearly on asset price $y$ resulting in a log-normal distribution.

$$
   \ln y_{t} - \ln y_{0} \sim \mathcal{N}(\mu t - \frac{1}{2}\sigma^{2}t, \sigma^{2}t)
$$

The derivative follows a slightly more complicated equation.

$$
\begin{equation}
    df = \underbrace{(\frac{\partial f}{\partial y} a + \frac{\partial f}{\partial t} + 
        \frac{1}{2} \frac{\partial^{2} f}{\partial y^{2}} b^{2})}_{\text{drift rate}} dt +
            \underbrace{\frac{\partial f}{\partial y} b}_{\sqrt{\text{variance}}} dz
\end{equation}
$$

Drift is expected, whereas $dz$ resembles Brownian motion, which means it is erratic. The formulations and derivations follow Itô calculus. The analytic solution assumes risk neutral world and constant volatility.

$$
\begin{equation}
    c = y_{0} \phi (d_{1}) - K e^{-rT} \phi (d_{2}) \\
    d_{1} = \frac{\ln (\frac{y_{0}}{K}) + (r + \frac{\sigma^2}{2})T}{\sigma \sqrt{T}} \\
    d_{2} = d_{1} - \sigma \sqrt{T} \\
    p = K e^{-rT} \phi (-d_{2}) - y_{0} \phi (-d_{1})
\end{equation}
$$

Price of put option ($p$) can be obtained from equation $\ref{parity}$ by substituting price of call option ($c$). $\phi$ is the CDF of $\mathcal N(0, 1)$ which can be looked up from a table.

```haskell
-- power x y raises x to y
import Math (power)

-- instead of writing the longer decimal numbers,
--  division by hundred has been done explicitly
-- look up table would be way more accurate
standardNormalCDF :: Float -> Float
standardNormalCDF z
    | z < -3 = 0.2 / 100
    | z < -2 = 2.3 / 100
    | z < -1 = 15.9 / 100
    | z <= 0 = 50 / 100
    | z <= 1 = 84.1 / 100
    | z <= 2 = 97.7 / 100
    | z <= 3 = 99.8 / 100
    | otherwise = 100 / 100

dOne :: Float -> Float -> Float -> Float -> Float -> Float
dOne spot strike rate volatility time = 
    (log (spot / strike) + 
        time * (rate + (power volatility 2) / 2)) /
            (volatility * sqrt time)

dTwo :: Float -> Float -> Float -> Float -> Float -> Float
dTwo spot strike rate volatility time = 
    (log (spot / strike) + 
        time * (rate - (power volatility 2) / 2)) /
            (volatility * sqrt time)

call :: Float -> Float -> Float -> Float -> Float -> (Float -> Float) -> Float
call spot strike rate volatility time cdf =
    spot * cdf (dOne spot strike rate volatility time) - 
        strike * exp (- rate * time) * cdf (dTwo spot strike rate volatility time)

put :: Float -> Float -> Float -> Float -> Float -> (Float -> Float) -> Float
put spot strike rate volatility time cdf =
    strike * exp (- rate * time) * cdf (- dTwo spot strike rate volatility time) -
        spot * cdf (- dOne spot strike rate volatility time)

```

It will get much more complicated if rate and volatility become functions of time (and other variables).

```shell
# On a spot price of 100, strike price of 110, with 5% risk free rate,
#   volatility of 1 and time to expiration 4 months
$ call 100 110 0.05 1 0.25 standardNormalCDF
$ 29.783218

$ put 100 110 0.05 1 0.25 standardNormalCDF
$ 41.360817

# The price of put option is greater then the price of call option.
# This means that market expects a slight decrease in stock price.

```

### Finite Difference Method

Trying to find solutions to differential equations may be painful exercise, and likely fruitless for most of us, but it is always possible to visualise them numerically. $y$ and all the other variables that affect $f$ are split equally (not necessarily same number of intervals). The partial derivative of $f$ with respect to each of the variable is computed (assuming all other variables are constant), and then these partial derivatives are substituted into the differential equation to get the value of $f$ at next step. This new value of $f$ is used to compute the next iteration of partial derivatives - at least that's how I do it.

More stateful programming methods may be better suited.

## Chalte Chalte

मेरे ये गीत याद रखना  
Songs help me associate - others may have different ways.

There is a lot more to all that is mentioned. Many more interesting details were skipped due to my insufficiency. I haven't been able to grasp levels of dominant strategies in games that involve more than two players, for one.

If you find any of it useful, then I hope you become Batman - I will be your butler in the more subtle vehicle.

> You have a debt to pay.
>
> <cite>Davy Jones</cite>

I seem to have more than just one - I am off to see what I can do about them.

## Poems and Mnemonic

My poems are result of my reveries.

![Derivatives Free Verse](/assets/img/posts/dfv.svg)

## References

- Options, Futures and Other Derivatives. Hull, J C. Basu, S.
- Game Theory and Mechanism Design. Narahari, Y.

Many other books and blogs such as 2018 CFA Curriculum Level 1 Volumes 1-3, Learn You a Haskell Great Good, et cetera.
