# Quartic.ai1
Target prediction

1. Briefly describe the conceptual approach you chose! What are the trade-offs?

I have used R code to predict the target for the test data given and I have chose the Logistic regression as the target to predict is of (0 & 1), so i prefer this regression would help build better model. I have compared the two models (m1 & m2) with the details P values, standard error, null & residual deviance, AIC, AUC and ROC for better perfomance of the model

2. What's the model performance? What is the complexity? Where are the bottlenecks?

Since i am working on a regresion model, to check the model perfomance i have been keen on the below points.
1. No noise in the data
2. 0 error
3. Stochastic nature of the modeling algorithm.
4. Incompleteness of the variables

And the bottleneck faced here is working on the large chunk of data, as the R was bit slow to compile. If i had more time i would have used better algorithm to pre process the data

3. If you had more time, what improvements would you make, and in what order of priority?
I would have used the decision tree, SVM and K fold cross validation to check the better perfomance of the model.
