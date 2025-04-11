---
layout: post
title: "Statistics Adventures: Classical Machine Learning and Language Generation"
description: "Experiences in designing classical machine learning systems, and capabilities of language generation models."
date: 2025-04-11 10:45 +0530
categories: [blog]
math: true
---

Statistical algorithms capable of recognizing patterns in data, and exploiting those patterns to perform specific tasks, have evolved quite rapidly over the past decade. In this article I lay out my experiences in designing classical ML systems and testing capabilities of larger compute intensive generative models and agents.

### Note

The focus is more on industrial applications rather than theoretical study.

- IME: In My Experience

## Treatise on Classical ML

Classical machine learning focuses on classification, regression and recommendation and other non reasoning based tasks.

### Data

- Numerical (such as the number of pages in a book).
- Categorical (such as the color of pen's ink).
    - Ordinal is special type of categorical wherein the data elements can be (compared and) ordered, but their values of may not follow linear distribution (such as importance of chess pieces).

#### Transformation

Encoding is a method of mapping data onto Hilbert space. One Hot Encoding (OHE) forms the basis of vector space for hashed categorical data. Specifically, text has tokens (read: words) that forms a dictionary. English has upwards of 100,000 words that are in current use, many other languages, that I know of, have even more. The OHE for english will then be a 100,000 length vector with exactly one of its values set (to 1). OHE works when the number of categories are much less ($~10$).

Data can be transformed from a higher dimensional space to lower dimensional space by use of one or more projections (sequentially). Data can be transformed from lower dimensional space to higher dimensional space by means of kernels. Projections and kernels are often represented as matrices which may include non-linear functions. The transformed data becomes an *embedding*.

$$
\begin{equation}
    \displaylines{
        x_{embedding} = x_{ohe} P \\
        P : \mathbf{R}^{n} \rightarrow \mathbf{R}^{m}
    }
\end{equation}
$$

$m$ and $n$ are dimensions. Colloquially, this is also known as dimensionality reduction and feature selection. $P$ can be obtained by component analysis, discriminant analysis, clustering (such as nearest neighbor and t-SNE) or methods suited specially for the particular data (such as unsupervised encoder - decoder networks for text and image). Lower dimensional embeddings are versatile for upstream tasks.

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
    \displaylines{
        \kappa(x_{i}, x_{j}) = e^{- \gamma \Vert x_{i} - x_{j} \Vert^{2}} \\
        \Phi = e^{- \gamma \Vert x \Vert^{2}} \\
        B = \Phi' = e^{\gamma \Vert x \vert^{2}}
    }
$$

### Classification

Classification involves labelled data points. Data points with a particular label belong to a class. Data point to class is usually a surjection. Multiple labels leads to multi-class classification problem.

#### Sampling

Data abundance is incredible, but too much data can cause excessive variance. This can be countered by supplying just enough data to the relevant algorithms, so that they limit themselves to learning collective patterns rather than finer details of small set of data points. This is done by sampling. We can pick required amount of data randomly not considering their labels. Stratified sampling is a better way to pick same number of data points from each class for training and for validation. Stratification can be made more complex by considering the importance of each data point.

#### Augmentation

Lack of enough data can lead to bias. Synthetic data can be generated to counter this. Images, for one, can be flipped, cropped or down-sampled, rotated, lightened, darkened et cetera.

#### Imbalance

Variation in number of data points belonging to different classes even when there is ample data can cause variance within a particular class, and bias against other set of classes. This can be countered by oversampling data from minority classes (with our without augmentation).

#### Methods

The logistic boundary separates data points belonging to two different classes.

$$
\begin{equation}
    w_{0} + \sum_{i} w_{i} x_{i} \gt 0
\end{equation}
$$

Support vectors are pair of points, each belonging to a different class, that are nearest to the logistic boundary.

$$
\begin{equation}
    \displaylines{
    w_{0} + \sum_{i} w_{i} x_{i} = 1 \\
    w_{0} + \sum_{i} w_{i} x_{i} = -1
    }
\end{equation}
$$

Support Vector Machines (SVMs) try to maximize the distance to the support vectors. Detecting and removing anomaly helps train better SVMs. When number of classes is huge, it is more efficient to train with one-versus-all strategy. On the other hand, training with one-versus-one strategy increases accuracy at the cost of increased complexity (and variance).

Decision trees are another great way of segregating data. Analogous to breadth first search with each node tries to reduce entropy of the training data that reaches it, decision trees have one of the quickest inference runtime (IME).

#### Boosting

Classification metrics: precision and recall, and their harmonic mean indicates the strength of a classifier. Combining multiple weak classifiers by weighting them based on their classification metrics often results in a much stronger classifier.

### Regression and Prediction

Regression tries to make sense of past trends to predict future trends. Prediction is generated from an Hypothesis ($h$). One can come up with many different hypothesis by referring and analyzing data, ranging from a binary generator to a trend-line to a piecewise continuous polynomial. Each of these hypothesis will have a prior ($P(h)$), which is an indicator of quality of assumptions made to construct the hypothesis. The likelihood of occurrence of an event ($e$) when following a particular hypothesis is $P(e \| h)$. A model or policy can be a stand-alone hypothesis or an *ensemble*. Importance of different hypothesis is given by posterior ($P(h \| e)$).

$$
\begin{equation}
    \displaylines{
    h \in H \,, \ \vert H \vert = m \\
    e \in E \,, \ \vert E \vert = n \\
    P(h | e) = \frac{P(e | h) P(h)}{\sum P(e | h)}
    }
\end{equation}
$$

#### Bagging

We sample $E$ to create many different datasets $E_{i}$ and train a model ($h_{i}$) for each of the $E_{i}$s. Ensembling the independently trained models (by weighted mean, for example) often results in better overall results.

### Recommendation

We try to increase the chance of a buyer ($B$) accepting a product ($P$), if the product is offered to them, or brought to their knowledge. If $\vert B \vert$ is small, then we can find correlation and degree of association of every product with each $b_{i} \in B$.  On the other hand, if $\vert B \vert$ is large, then we can train independent system for each element $b_{i} \in B$, especially if $\vert P \vert$ is small. We can also cluster $b_{i} \in B$, and then apply similar methods as when $\vert B \vert$ is small. Matrix factorization works well for former, whereas collaborative-filtering and neural-network architectures such as two-towers work well for later.

SVMs and Decision Trees also work well in the case when $\vert B \vert$ is not too large and $\vert P \vert$ is small (IME).

### Function Selection

Algorithms that learn by back propagation, must have activation, loss, value, return functions that are piecewise differentiable or at least have a gradient defined for them. Moreover, different layers of neural networks can have different sets of activation functions depending on the data features that need emphasis.

#### Loss and Return

Loss functions need to be minimized whereas value functions need to be maximized. Functions such as mean-squared-error accentuate the difference between the obtained and expected. If the difference it smaller than 1, then the loss diminishes, whereas it aggravates if the difference is larger than 1. Ideally, in probabilistic modelling, the output is obtained from a softmax layer, so the loss usually diminishes. In this case, it is conducive to use mean-absolute-error.

$$
\begin{equation}
    \displaylines{
    L_{mse} = \frac{1}{2} \frac{\sum_{e} \Vert y - \hat{y} \Vert^{2}}{\vert E \vert} \\
    L_{mae} = \frac{\sum_{e} \vert y - \hat{y} \vert}{\vert E \vert}
    }
\end{equation}
$$

It is possible to design a custom loss function based on optimization with respect to business. Furthermore, it is also possible to combine loss functions linearly or weighted sum by focusing on data points. One such example is the Huber loss.

$$
\begin{equation}
    \displaylines{
    L_{huber} = \begin{cases}
        L_{mse} & \vert y - \hat{y} \vert \lt \delta \\
        \delta \times (L_{mae} - \frac{1}{2} \delta) & \\
        \end{cases}
    }
\end{equation}
$$

Value functions ($V_{t}$) become simpler if the discounting factor itself is not a function of time (action or state).

$$
\begin{equation}
    V_{t} = R_{t + 1} + \gamma \times V_{t + 1}
\end{equation}
$$

## Designing Machine Learning Systems
