% Step 1 Initializing inputs 
inputs = [-1,rand(1,5)];
targets = [0,1,1,1,0];
learning_rate =0.1;
epochs =10;

% Step 2 Initializing weights for the system
[rows, columns] = size(inputs);

% Initial value == 1 for the bias term 
weights = [1,rand(rows,columns-1)];
disp('The weights are: ');
disp(weights);

% Step 3 Taking the weighted sum of input*weight
weighted_sum = inputs * weights';
disp('The weighted_sum is: ');
disp(weighted_sum);

% Step 5 Training the Perceptron
for epoch = 1:epochs
    for i = 1:columns
        input = inputs(:,i);
        target = targets(i);

        weighted_sum = input * weights';
        output = step_function(weighted_sum);

        error = target-output;
        weights = weights + learning_rate * error *input';
    end
end

% Step 5 Classifying the result based on function
disp('The classification label for the inputs is: ');
disp(step_function(weighted_sum));

% Step 4 Defining the stepFunction 
function result = step_function(number)
    if number >= 0
        result = 1 ;
    else 
        result = 0;
    end
end