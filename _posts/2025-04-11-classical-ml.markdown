---
layout: post
title: "Statistics Adventures: Classical ML and Language Generation"
description: "Experiences in designing classical machine learning systems, and capabilities of language generation models."
date: 2025-04-11 10:45 +0530
categories: [blog]
math: true
---

Statistical algorithms capable of recognizing patterns in data, and exploiting those patterns to perform specific tasks, have evolved quite rapidly over the past decade. In this article I lay out my experiences in designing classical ML systems and testing capabilities of larger compute intensive generative models and agents.

### Note

The focus is more on industrial applications rather than theoretical study.

## Treatise on designing Classical ML systems

Classical machine learning focuses on classification, regression and recommendation and other non reasoning based tasks.

### Data

- Numerical (such as the number of pages in a book).
- Categorical (such as the color of pen's ink).
    - Ordinal is special type of categorical wherein the value of data elements may not have a linear distribution (such as importance of chess pieces).

### Encoding

Encoding is a method of mapping data onto Hilbert space. One Hot Encoding (OHE) forms the basis of vector space for hashed categorical data. Specifically, text has tokens (read: words) that forms a dictionary. English has upwards of 100,000 words that are in current use, many other languages, that I know of, have even more. The OHE for english will then be a 100,000 length vector with exactly one of its values set (to 1). OHE works when the number of categories are much less ($~10$).

Data can be transformed from a higher dimensional space to lower dimensional space by use of one or more projections (sequentially). Data can be transformed from lower dimensional space to higher dimensional space by means of kernels. Projections and kernels are often represented as matrices which may include non-linear functions.

$$
\begin{equation}
    \displaylines{
        x_{embedding} = x_{ohe} P \\
        P : \mathbf{R}^{n} \rightarrow \mathbf{R}^{m}
    }
\end{equation}
$$

$m$ and $n$ are dimensions.

$$
\begin{equation}
    \displaylines{
        \kappa_{i} = \sum_{i} \lambda_{i} \phi_{i} \beta_{i} \\
        K = \langle \Phi \Phi' \rangle = \langle B B' \rangle
    }
\end{equation}
$$

$\phi$ and $\beta$ are one and the same when applying kernel method. The most common is the radial basis function:

$$
\begin{equation}
    \kappa(x_{i}, x_{j}) = e^{- \gamma \Vert x_[i] - x_[j] \Vert^{2}}
\end{equation}
$$
