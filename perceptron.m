% Step 1 Initializing inputs 

% The bias has been added in the form of all 1s in the last row 
inputs = [1 1 0 0; 1 0 1 0; 1 1 1 1];

% The below targets are for OR Operation
% targets = [1 1 1 0];

% The below targets are for AND Operation
targets = [1 0 0 0];
learning_rate =0.1;
epochs = 100;

% Step 2 Initializing weights for the system
[rows, columns] = size(inputs);

% Adjusted for bias
weights = [rand(1, rows-1), 1];
disp('Initial Weights: ');
disp(weights);

% Step 4 Training the Perceptron
for epoch = 1:epochs
    for i = 1:columns
        input = inputs(:,i);
        target = targets(i);

        weighted_sum = weights * input;
        output = step_function(weighted_sum);

        error = target-output;
        weights = weights + learning_rate * error *input';
    end
end

% Step 5 Testing the trained perceptron with all inputs
disp('Final Weights:');
disp(weights);
disp('Classification results for the inputs: ');
for i = 1:columns
    input = inputs(:,i);
    weighted_sum = weights * input;
    output = step_function(weighted_sum);
    disp(['Input: ', mat2str(input'), ' Output: ', num2str(output)]);
end

% Step 3 Defining the stepFunction 
function result = step_function(number)
    if number >= 0
        result = 1 ;
    else 
        result = 0;
    end
end


