using ScikitLearn, CSV
using Conda
#SepalLength,SepalWidth,PetalLength,PetalWidth,Name

folder = "/Users/yamaguchishun/Documents/Julia/AtomJulia/ML/"
iris = CSV.read("$(folder)iris.csv",normalizenames = true)
@show iris

iris_x = convert(Array,iris[:,[1,2,3,4]]);
iris_y = convert(Array,iris[:, 5]);

@sk_import linear_model: LogisticRegression
log_reg_model = LogisticRegression()
fit!(log_reg_model,iris_x,iris_y)
predictions = predict(log_reg_model, iris_x)
@show predictions

@sk_import metrics: accuracy_score
accuracy = accuracy_score(predictions,iris_y)
@show accuracy

@sk_import tree: DecisionTreeClassifier
tree_model = DecisionTreeClassifier()
fit!(tree_model, iris_x, iris_y)
tree_predictions = predict(tree_model, iris_x)
@show tree_predictions
@show accuracy_score(tree_predictions, iris_y)

@sk_import ensemble: RandomForestClassifier
rf_model = RandomForestClassifier()
@show rf_model
fit!(rf_model, iris_x, iris_y)
rf_predictions = predict(rf_model,iris_x)
rf_accuracy = accuracy_score(rf_predictions, iris_y)
@show rf_accuracy

@sk_import model_selection: train_test_split

for ts in [0.5,0.6,0.7,0.8,0.95]
    x_train, x_test, y_train, y_test =
      train_test_split(iris_x, iris_y, test_size=ts,random_state=1)
    log_reg_2 = LogisticRegression()
    fit!(log_reg_2, x_train, y_train)
    predictions_log_reg = predict(log_reg_2,x_test)
    @show "accuracy of $(ts) = $(accuracy_score(predictions_log_reg, y_test))"
end
