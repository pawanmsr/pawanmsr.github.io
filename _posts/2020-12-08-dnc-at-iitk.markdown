---
layout: post
title:  "Data and Computation at IITK"
description:   "Thoughts, experiences and resources."
date:   2020-12-08 12:06 +0530
categories: [blog]
---

## Overview

This article is flavored like a blog post wherein I will be discussing my thoughts, and experiences at [IITK](https://iitk.ac.in/){:target="_blank"} when dealing with data and performing computation on it. Since I majored in Physics, this blog post will largely carry its essence.

Data is generated in many forms but almost all data can be transformed into some kind of mathematical representation. Data may be persistent or may change with time. The latter has more to do with the nature of the source of data. For instance, you have to write a review of a product you bought online. The review might be slightly different based on the time of the day, environment around you or people you’ve interacted with. For computational purposes and to eliminate ambiguities, only that which has been recorded is called data. Less heed is given to the agent or the way in which data was recorded. Recorded data can be accompanied by highly descriptive metadata which might carry as much information as possible about the agent and the environment.

Dealing with data will involve its collection, assimilation, transfer, storage, retrieval, and processing. Each of these are subjects of their own accord. Working with data is not limited to specific fields of education but the necessary knowledge and tools that will give you an edge majorly belong to certain fields of education. In this article, I will provide an idea of the fields, and resources where they can be explored further. All the external links and books are those that were part of my courses, and only act as a guide. They are listed in a particular order and must be ignored if interest does not persist. One must not limit themselves to the mentioned resources but explore other resources that suit them.

### Supplement

- L1: Level 1 or equivalent to difficulty rating of 1 out of 5.
- L2: Level 2 or equivalent to difficulty rating of 3 out of 5.
- L3: Level 3 or equivalent to difficulty rating of 5 out of 5.
- IMO: In My strong Opinion.
- SIT: So I Think.

L1, L2, L3 are judged based on required prior knowledge, required time input, and required mental ability.

I’ve had hard time comprehending topics mentioned in resources tagged L3 (and with little success). If you choose to read them and would like to discuss them, feel free to [contact me](mailto:{{ site.author.email }}).

### Note To Reader

This article is for gaining perspective only. Any information, however useful, does not come with any warranty whatsoever. None of the topics discussed in this article are exhaustive, and should be considered opinionated and possibly biased. Readers should further explore the topics from books and other resources.

## Mathematics

Although only possessing knowledge of basic mathematics will help you get by in the industry, having a further grasp on the subject will help you perform better and make steadfast decisions. Moreover, mathematics is essential in developing other skills with regard to computation.

Algebra and single variable calculus are necessary foundations in mathematics. Certain topics such as abstract algebra and topology will seldom be used in industry, but they are good to have if research is involved. Applied mathematics will be all that is required to work in industry. This will involve topics such as probability and statistics, numerical analysis and basic algebra.

In any course, which requires prior knowledge of certain aspects of mathematics, is covered at the start of the course, but you may choose to do dedicated courses for in depth knowledge.

### Resources

- Kreyszig. Advanced Engineering Mathematics. Wiley. [L2].
- Ross. Introduction to Probability Models. Elsevier. [L2].
- Hogg, McKean, Craig. Introduction to Mathematical Statistics. Pearson. [L2].
- Rohatgi, Saleh. An Introduction to Probability and Statistics. Wiley. [L2].
- Zee. Group Theory in a Nutshell for Physicists. Princeton University Press. [L3].
- Stone, Goldbart. Mathematics for Physics. Cambridge University Press. [L3].
- Patashnik, Knuth, Graham. Concrete Mathematics. Addison Wesley. [L3].
- Georgi. Lie Algebras in Particle Physics. Hachette UK. [L3].

## Programming Skills

Programming is an essential skill to have; not just for working on data but in general. May it be for programming lathe and milling machines, or calibrating pid controllers in rate processes, programming has multitude of applications wherever computer numerical control (cnc) is required. For most industrial purposes it is only required to know how to use a certain programming language. The more difficult task of optimizing a compiler/interpreter or creating a new language altogether is native to computer science and engineering (and possibly electrical engineering) and is highly specialized in the discipline.

Programming languages which are closer to assembly/machine language, such as C or C++, usually have lower runtime for tasks as compared to higher level languages, such as Python, performing the same task. On the other hand, higher level languages have syntax that is closer to languages used for human to human communication, making them easier to use. Easy typed languages are used for prototyping and rapid development of digital infrastructure. Lower level languages are used to improve performance and optimization.

There may **not** be dedicated courses that only teach a programming language [SIT]. Most courses that teach programming language, teach them in conjunction with a task. Any programming language can be easily learnt by reading the manual and documentation, and using it to perform some task until one gets the hang of it [IMO]. Besides, it is not the language that needs to be learnt, rather, the principles that govern a consortium of languages. Concepts like data types, variables, loops, conditional statements, functions, classes, objects and so on are common across most languages. This coupled with programming disciplines, such as procedural programming, object-oriented programming, functional programming and so on, are all that is required to be able to quickly learn any new language. Furthermore, to be able to efficiently use any language one needs to know about various data structures and common algorithms that one might come across while performing tasks.

A course tutor in college once suggested that I should be experienced in one language which is compiled, one language which is interpreted, one high level language and another lower level language, one language specifically designed for each of the major programming disciplines. This seems a tad bit much even for the most experienced programmers in industry, but it’s always fun to embark on such an educational journey [SIT].

### Resources

- Stewart. Python for Scientists. Cambridge University Press. [L1].
- Stroustrup. Programming Principles and Practice Using C++. Addison Wesley. [L2]
- Kernighan, Ritchie. The C Programming Language. Prentice Hall. [L2/L3]
- Cormen, Leiserson, Rivest, Stein. Introduction to Algorithms. MIT Press. [L2/L3]
- Knuth. The Art of Computer Programming. Addison Wesley. [L3]

## Analysis

Analysis involves working with different types of data and performing operations on them.

One of the most underrated yet powerful tools used in the analysis domain is spreadsheet. Spreadsheets are easy to learn and are shipped with a wide variety of data types, functions and formulas. With the functionality to create and embed charts, spreadsheets have added functionality of data visualization. Almost all commonly used operations on small to moderately sized clean data can be performed using spreadsheets. Further complexity on operations can be added by programming and enabling macros. Some popular spreadsheet applications are: LibreOffice [Calc](https://www.libreoffice.org/discover/calc/){:target="_blank"}, Calligra [Sheets](https://calligra.org/sheets/){:target="_blank"} (Linux), [Gnumeric](http://www.gnumeric.org/){:target="_blank"} (Linux), Google [Sheets](https://www.google.com/sheets/about/){:target="_blank"} (Web Application), Apple [Numbers](https://www.apple.com/numbers/){:target="_blank"}, Microsoft [Excel](https://www.microsoft.com/en-us/microsoft-365/excel){:target="_blank"}.

All digital infrastructure is innately discrete. For certain purposes, although rare, you may need to work on differential equations or single/multi-variable calculus. Working with continuous data and solving equations will require the knowledge of numerical analysis. To get a glimpse of the methods used, you may look into the algorithms coded into your standard scientific calculator that is capable of solving equations. There are some tools available that can actually parse equations: [Mathematica](https://www.wolfram.com/mathematica/){:target="_blank"} is one such software.

Data visualization is another important skill that many people sideline. A simple picture, at times, may replace profuse amounts of texts [IMO]. Moreover, viewing information in pictorial form is often preferred by the audience. Any data may be visualized in many ways but some way of visualization is better than the rest. To be capable of identifying the best way to represent data in visual form, a basic knowledge of all sorts of charts, graphs, diagrams and error representation is essential. There is a wide array of tools that can be used to display information visually and there isn’t one that fits all [SIT]. I often use python integrations of various tools: [matplotlib](https://matplotlib.org/){:target="_blank"} provides most functionality for static visualizations; [seaborn](https://seaborn.pydata.org/){:target="_blank"} integrates well with [pandas](https://pandas.pydata.org/){:target="_blank"} and provides more options. You may checkout [Plotly](https://plotly.com/python/){:target="_blank"} for complex visualizations and [D3.js](https://d3js.org/){:target="_blank"} if you wish to have control over the web.

Data is seldom available in the desirable form. It may require extraction and cleaning. This falls under data preprocessing routine. There may be data points which may be missing, incorrect or dubious. Anomaly detection will help identify such data points and remove them or replace them with certain statistical values. Further, aggregation and summarization of data will help better understand it. To maintain consistency and ease of use, transformation/standardization/normalization will be needed to be performed on the data.

More advanced preprocessing will involve dimensionality reduction, clustering and regression analysis. Each of these are purposeful topics that require more than a few pages to explain.

Please note that I am **not** endorsing any tool/software. I discourage buying software that does not have enough use; and more so to just check them out. I used Mathematica for filling in my physics assignments at times when I got stuck, and didn’t have friends or study groups around to help - and I really liked it. The Mathematica subscription belonged to the institute where I studied. The same is true for most other paid softwares I used: [Matlab](https://www.mathworks.com/products/matlab.html){:target="_blank"}, [Fusion360](https://www.autodesk.in/products/fusion-360/overview){:target="_blank"}, [Ansys](https://www.ansys.com/en-in/products/fluids/ansys-cfx){:target="_blank"}, etc. You may request your employer or institute of study to get you an educational subscription. Besides, there are open source (free) counterparts for most softwares: [Octave](https://www.gnu.org/software/octave/index){:target="_blank"} for Matlab, for instance. All that I have mentioned worked for me, and you may try out a few of several other options. Do let me know if any of them turn out to be better/more versatile than those mentioned above.

### Resources

- Yevick. A First Course in Computational Physics and Object-Oriented Programming with C++. Cambridge University Press. [L2].
- Flowers. An Introduction to Numerical Methods in C++. Oxford University Press. [L2/L3].
- Han, Kamber, Pei. Data Mining: Concepts and Techniques. Elsevier. [L3].
- Press, Teukolsky, Vetterling, Flannery. Numerical Recipes 3rd Edition: The Art of Scientific Computing. Cambridge University Press. [L3].

## Storage

All data is stored on a storage media. It is good to know the characteristics of different (types of) physical storage so that informed decisions can be made on usage. The characteristics include, among others, fixed and variable costs, operation, persistence and latency.

Data on cloud is channeled through an interface and data management system to remote storage servers. These servers are part of large data centers located around the globe (some even under water). Besides storage, [data centers](https://en.wikipedia.org/wiki/Data_center){:target="_blank"} also have servers with exceptional computational capabilities.

Storage for loose unstructured and semi-structured data is often cheaper than storage associated with structured data. Databases are by far the most common storage for structured data. Data from databases are accessed using the structured query language (SQL). SQL is a strongly typed language that performs create, read, update and delete (CRUD) operations on a database. Knowledge of SQL and the relational data model is all that is required to operate on database tables. Normalization, indexing, hashing, transaction processing, concurrency control are some advanced topics one might need to touch when deploying databases. Database design is only necessary for research purposes.

Some special databases are distributed storage systems and nosql databases. These come into operation when volume and velocity of data is high. These systems are becoming increasingly popular as more and more data is generated.

Databases and storage are part of a broader subject called information theory. Besides everything mentioned above, information theory also covers data compression and error correction.

### Resources
- Elmasri, Navathe. Fundamentals of Database System. Addison Wesley. [L2/L3].

## Processing

Processing is trying to fulfill a task or achieve some result from data by performing a set of operations. These operations can be deterministic, randomized or statistical.

Deterministic algorithms have a well defined complexity for each run. The computational pathway taken to achieve a result or fulfill a task is determined and always the same on each run. [Bubble sort](https://en.wikipedia.org/wiki/Bubble_sort){:target="_blank"} is one of the most basic examples of a deterministic algorithm.

Randomized algorithms, on the other hand, leverage the nature of certain mathematical chaos to tend towards order on the limit. Randomized algorithms are often an optimization of their deterministic counterparts. The optimization is on space, time or both. (Here space and time are computational terms as opposed to Minkowski space-time. Computational space is the memory and computational time is loosely related to the machine cycle of the processing unit). A randomized algorithm that produces a result may not always give a correct one but they have other advantages in use of computational resources. Such algorithms find use in low latency, controlled risk applications wherein high performance is essential, and it will do if the result fails from time to time. [Quick sort](https://en.wikipedia.org/wiki/Bubble_sort){:target="_blank"} is one of the most basic examples of a randomized algorithm.

Statistical algorithms (or more commonly known as statistical models) are probabilistic in nature. They are data hungry and only as good as the data fed to them. Some more advanced forms of these algorithms have memory in the form of parameters. These parameters are initially reset or random and as the algorithm sees data, the parameters are set to certain seemingly random values. These interestingly inexplicable learned values synergize to produce results in a way that has strong correlation to actual learning.

Various domains of data processing techniques, classified on the basis of type of data, are:

- Image processing, recognition and generation
- Language processing and generation
- Signal processing
- Learning theory and probabilistic modeling

### Resources

Data processing is a vast area and the domains mentioned above are full fledged fields of their own. The list of resources is endless. [Drop me a mail](mailto:{{ site.author.email }}?subject=[DnC]%20Resource%20Request) with the particular field you are interested in and I will tell you of the resources I know of.

## Exploration

Becoming an expert in each of the above mentioned sections is a nice thing to aim, but it is not required. Each of the above sections have job roles associated with them. A Database Administrator, for instance, needs to deploy and maintain (and seldom design) databases. They need to perform queries and organize data models.

For certain roles, the kind of work is highly variable. One such role is Data Analyst. A Data Analyst needs to have prowess in areas that are required to help them successfully analyse the data they intend to work with. A Financial Analyst, for example, needs to have working knowledge of time series analysis and differential equations, among others.

Many roles cannot be easily bifurcated from each other and there is substantial overlap between roles [SIT]. Always try to find out what will be expected from you before accepting the role. Firms often try to ramp up the nature of work in their job descriptions, against the actual expectation, to attract candidates. In other words, be wary of taking a job as Data Engineer, for example, and then end up running SQL queries all day (there’s nothing wrong or extremely easy about running SQL queries all day; but that is not the only thing a Data Engineer does [IMO]).

## Acknowledgements

The brilliant community of professors, students and researchers at IITK, and the fabulous friends I made there.
