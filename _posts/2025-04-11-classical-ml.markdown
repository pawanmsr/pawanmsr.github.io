---
layout: post
title: "Statistics Adventures: Classical Machine Learning and Language Generation"
description: "Experiences in designing classical machine learning systems and capabilities of language generation models."
date: 2025-04-11 10:45 +0530
categories: [blog]
math: true
---

Statistical algorithms capable of recognizing patterns in data, and exploiting those patterns to perform specific tasks, have evolved quite rapidly over the past decade. In this article I lay out my experiences in designing classical machine learning systems, and testing capabilities of larger compute intensive generative models and agents.

### Note

The focus is more on industrial applications rather than theoretical study.

- IME: In My Experience.
- $\vert S \vert$ is cardinality of (number of elements in) set $S$.

## Treatise on Classical Machine Learning

Classical machine learning consists of classification, regression, recommendation and other non reasoning based tasks.

### Data

- Numerical (such as the number of pages in a book).
- Categorical (such as the color of pen's ink).
    - Ordinal is special type of categorical wherein the data elements can be (compared and) ordered, but their values may not follow linear distribution (such as importance of chess pieces).

#### Transformation

Encoding is a method of mapping data onto Hilbert space. One Hot Encoding (OHE) forms the basis of vector space for hashed categorical data. Specifically, text has tokens (read: words) that form a dictionary. English has upwards of 100,000 words that are in current use. Many other languages, that I know of, have even more. The OHE for english will then be a 100,000 length vector with exactly one of its values set (to 1). OHE works well when the number of categories are much less ($\simeq 10$).

Data can be transformed from a higher dimensional space to lower dimensional space by use of one or more projections (sequentially). Data can be transformed from lower dimensional space to higher dimensional space by means of kernels. Projections and kernels are often represented as matrices, which may include non-linear functions. The transformed data becomes an *embedding*.

$$
\begin{equation}
    \displaylines{
        x_{embedding} = x_{ohe} P \\
        P : \mathbf{R}^{n} \rightarrow \mathbf{R}^{m}
    }
\end{equation}
$$

$m$ and $n$ are dimensions. Colloquially, this is also known as dimensionality reduction and feature selection. $P$ can be obtained by component analysis, discriminant analysis, clustering (such as nearest neighbor and t-SNE) or methods suited specifically for the particular data (such as unsupervised encoder - decoder networks for text and image). Lower dimensional embeddings are versatile for upstream tasks.

$$
\begin{equation}
    \displaylines{
        \kappa_{i} = \sum_{i} \lambda_{i} \phi_{i} \beta_{i} \\
        K = \langle \Phi \Phi' \rangle = \langle B B' \rangle
    }
\end{equation}
$$

$\phi$ and $\beta$ are one and the same when applying kernel method. The most common is the radial basis function.

$$
    \displaylines{
        \kappa(x_{i}, x_{j}) = e^{- \gamma \Vert x_{i} - x_{j} \Vert^{2}} \\
        \Phi = e^{- \gamma \Vert x \Vert^{2}} \\
        B = \Phi' = e^{\gamma \Vert x \Vert^{2}}
    }
$$

### Classification

Classification involves labelled data points. Data points with a particular label belong to a class. Data point to class: is usually a surjection. Multiple labels leads to multi-class classification problem.

#### Sampling

Data abundance is incredible, but too much data can cause excessive variance. This can be countered by supplying just enough data to the relevant algorithms so that they limit themselves to learning collective patterns rather than finer details of small set of data points. This is done by sampling. We can pick required amount of data randomly (not considering their labels), for one. Stratified sampling is a better way to pick same number of data points from each class for training and for validation. Stratification can be made more complex by considering the importance of each data point.

#### Augmentation

Lack of enough data can lead to bias. Synthetic data can be generated to counter this. Images, for instance, can be flipped, cropped or down-sampled, rotated, lightened, darkened et cetera.

#### Imbalance

Variation in number of data points belonging to different classes, even when there is ample data, can cause variance within a particular class, and bias against other set of classes. This can be countered by oversampling data from minority classes (with our without augmentation).

#### Methods

The logistic boundary separates data points belonging to two different classes.

$$
\begin{equation}
    w_{0} + \sum_{i} w_{i} x_{i} \gt 0
\end{equation}
$$

Support vectors are pairs of points, each belonging to a different class, that are nearest to the logistic boundary.

$$
\begin{equation}
    \displaylines{
        w_{0} + \sum_{i} w_{i} x_{i} = 1 \\
        w_{0} + \sum_{i} w_{i} x_{i} = -1
    }
\end{equation}
$$

Support Vector Machines (SVMs) try to maximize the minimum distance of the logistic boundaries from the corresponding support vectors. Detecting and removing anomaly helps train better SVMs. When number of classes is huge, it is more efficient to train with one-versus-all strategy. On the other hand, training with one-versus-one strategy increases accuracy at the cost of increased complexity (and variance).

Decision trees are another great way of segregating data. Analogous to breadth first search, each node tries to reduce entropy of training data that reaches the node. Decision trees have one of the quickest inference runtime (IME).

#### Boosting

Classification metrics: precision and recall, and their harmonic mean indicates the strength of a classifier. Combining multiple weak classifiers by weighting them based on their classification metrics often results in a much stronger classifier.

### Regression and Prediction

Regression tries to make sense of past trends to predict future trends. Prediction is generated from an hypothesis ($h$). One can come up with many different hypotheses by referring and analyzing data, ranging from: binary generators, to trend-lines, to piecewise continuous polynomials. Each of these hypotheses will have a prior ($P(h)$), which is an indicator of quality of assumptions made to construct the hypothesis. The likelihood of occurrence of an event ($e$) when following a particular hypothesis is $P(e \| h)$. A model or policy can be a stand-alone hypothesis or an *ensemble*. Relevance of different hypothesis is given by posterior ($P(h \| e)$).

$$
\begin{equation}
    \displaylines{
        h \in H \,, \ \vert H \vert = m \\
        e \in E \,, \ \vert E \vert = n \\
        P(h | e) = \frac{P(e | h) P(h)}{\sum_{e, h} P(e | h)}
    }
\end{equation}
$$

#### Bagging

We sample $E$ to create many different datasets ($E_{i}$), and train a model ($h_{i}$) on each of the $E_{i}$s. Ensembling the independently trained models (by weighted mean, for example) often improves the overall result.

### Recommendation

Recommendation tries to increase the chance of buyers ($B$) accepting products ($P$), if the products are offered to them, or brought to their knowledge. If $\vert B \vert$ is small, then we can find correlation and degree of association of every product with each $b_{i} \in B$.  On the other hand, if $\vert B \vert$ is large, then we can train independent recommender for each $b_{i} \in B$, especially if $\vert P \vert$ is small. We can also cluster $b_{i} \in B$, and then apply similar methods as when $\vert B \vert$ is small. Matrix factorization works well for the former, whereas collaborative-filtering and neural-network architectures such as two-towers work well for later.

SVMs and Decision Trees also work well in the case when $\vert B \vert$ is not too large, and $\vert P \vert$ is small (IME).

### Function Selection

Algorithms that learn by back propagation, must have activation, loss, value, return functions that are piecewise differentiable or at least have a gradient defined for them. Moreover, different layers of neural networks can have different sets of activation functions depending on the data features that need emphasis.

#### Loss and Return

Loss functions need to be minimized, whereas value functions need to be maximized. Functions such as mean-squared-error accentuate the difference between the obtained and expected. If the difference is smaller than 1, then the loss diminishes, whereas it aggravates if the difference is larger than 1. Ideally, in probabilistic modelling, the output is obtained from a softmax layer, so the loss diminishes. In this case, it is conducive to use mean-absolute-error.

$$
\begin{equation}
    \displaylines{
        L_{mse} = \frac{1}{2} \frac{\sum_{e} \Vert y - \hat{y} \Vert^{2}}{\vert E \vert} \\
        L_{mae} = \frac{\sum_{e} \Vert y - \hat{y} \Vert}{\vert E \vert}
    }
\end{equation}
$$

It is possible to design a custom loss function based on business optimizations. Furthermore, it is also possible to combine loss functions linearly or as a weighted sum with weights derived from importance of individual data points. One such example is the Huber Loss.

$$
\begin{equation}
    \displaylines{
        L_{huber} = \begin{cases}
            L_{mse} & \Vert y - \hat{y} \Vert \lt \delta \\
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

$R_{t}$ is return at time $t$.

## Designing Machine Learning Systems

Systems need to handle data, code, and the results from running the code.

### Infrastructure, Operations and Deployment

Data collection can be difficult if the data domain is niche (images of engine blocks in differing configurations, for example). Data bought from external vendors is often refined and categorized, but there may be restrictions, to say nothing of the costs. It is better to put compressed BLOB at locations dedicated for storage. There is also a possibility of shipping data along with code by incorporating large file storage systems, but I have no practical experience with this method.

It is a logical step to create applications to view, label and handle data. The same application can also run batch processes to transport data to servers dedicated for training, and prepare them for consumption. It may enable options to commence training as well as save the architecture and weights to storage server (usually at predefined checkpoints).

When required benchmarks have been achieved, the model (as a package) can be copied and reconstructed at servers that are nearest to its end users.

#### Try This At Home

Although, I would strongly recommend renting compute and storage from known vendors as they are hassle-free and have much better interface, it is possible to setup servers with help of open source tools (IME) if one can get hold of a workstation.

1. Install operating system and drivers followed by database, code and network management systems.
2. Create users, write systemd configurations and scripts for services.
3. Create microservices for remote execution (similar to command injection).

I tried this using a set of refurbished and new mini-PCs running low-end processors (under the hood), as a downstream task for another of my projects. It is possible to run simple algorithms with limited data and communicate with edge devices. Multiprocessing often led to heating and subsequent throttling to the extent that it didn't make much difference.

### Edge Computing

Inference cost can be saved for miniature models by shipping them with user applications. Additionally, inference will no longer require an API call. Programming the algorithm in application native language can become a bottleneck. A web application will usually need the forward propagation programmed in javascript or typescript, for instance.

Models that can retrain or fine tune themselves in short durations (~ 10s of seconds) on at least a few types of devices, can be shipped with user application. Repeated retraining can lead to slow-downs and heat-up that might force users to review the application negatively. Moreover, there can be minor differences in parameter values if trained on non-standard host devices, due to non-availability or differences in data types within the processors.

## Capabilities of Language Generation

Tokens are basic data units of language models. One or more tokens combine to form larger units of language (such as words and sentences). Models predict generation probabilities of tokens. Heuristics can be applied to these probabilities to change to outcome of the generated text.

### Channels

Language generators I tested had three channels: greediness selector (called *temperature*), maximum cumulative probability of token choices and lastly, the maximum number of choices (called *k*). I presume that at every token generation step, the probabilities corresponding to most of the tokens in dictionary would be zero.

$$
\begin{equation}
    \displaylines{
        k_{max} = \sum_{tokens} [\, p_{token} \gt 0 \,]
    }
\end{equation}
$$

Assume, $p_{token} = 0$ for those tokens that have positive probabilities, but not large enough to be included in cumulative probability. So, for very specific, but common conversations, choosing high values for each of the channels would not matter (other than possibly increasing the time to fulfill requests) because of how limited the choices would be.

### Embeddings and Vector Databases

Cosine and dot product are elementary operations on vectors. Nearest neighbor and locality sensitive hashing are more advanced techniques for finding similarity or separation between vectors, although they may require lot of tweaking before being considered acceptable on metrics (IME).

Of all the options to play with, such as **FAISS**, **ChromaDB** and **Pinecone**, I decided to use **Qdrant** due to familiarity. Most of them have *in memory* feature for quick implementation that are typical of notebooks.

Embeddings generated from generative models can be used for semantic similarity with results ranging from satisfactory to unequivocal depending upon the texts from which the embeddings were generated and the model used. I used the stanzas from the poem below as documents, and queried on all four of the stanzas with the embedding of the text: *CAP Theorem*. The last stanza had the highest (dot product) score - as was expected.

### Multi-Modal Understanding and Generation

Language generation after providing data to the model is important because of its usefulness to people.

#### Retrieval Augmented Generation

Suppose a person wants to find differences in specifications in data-sheets. It is possible for them to provide the data-sheets to the models and question the model about the specification. I tested the models available to me by providing the poem below as a document. I received accurate response.

#### Image and Video

Obtaining text from image or video, is *Image* or *Video Understanding*. Obtaining images or videos from text, is *Image* or *Video Generation*.

##### Understanding

Worried about UFO sightings? It is possible to query the models for descriptions of images. If there have been similar sightings before, then one might get a good enough description that might relieve them of worries.

Evaluation of descriptions is possible. A simple way is to generated many descriptions and score them based on ratio of information present to required information.

##### Generation

I am not aware of quantifiable metrics for evaluating audio-visual generation. If you know of any then please do [share](mailto:{{ site.author.email }}). Nonetheless, image or video generation can be expensive.

### Invoking Functions

Simple as well as nested function calls are possible on simple functions with restrictions.

### Agents

[Lang-chain provider](https://python.langchain.com/docs/integrations/providers/) needs to be picked before they can be used to create agents with. Lang-graphs relay between well defined nodes and LLMs perform the conversation. Tools can be used for moderation.

Prospective applications have wide reach: from gaming to customer support. I have yet to apply lang-graphs extensively.

### Notebook

Later half of this blog follows my experiments in [kaggle notebook](https://www.kaggle.com/code/pawanmsr/capstone). One can find the code-blocks on GitHub too. Please feel free to review.

### Reference

Capstone on Kaggle by Google

![CAP on Stones](/assets/img/posts/cap.svg)

## Acknowledgements

The open-source community, papers, conferences, compassionate colleagues and employers.
