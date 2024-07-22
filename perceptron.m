% Step 1 Initializing inputs 
inputs = [1 1 0 0; 1 0 1 0];

% The below targets are for OR Operation
targets = [1 1 1 0];

% The below targets are for AND Operation
% targets = [1 0 0 0]
learning_rate =0.1;
epochs = 10;

% Step 2 Initializing weights for the system
[rows, columns] = size(inputs);

weights = rand(rows);
disp('The weights are: ');
disp(weights);

% Step 4 Training the Perceptron
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


% Step 3 Defining the stepFunction 

function result = step_function(number)
    if number >= 0
        result = 1 ;
    else 
        result = 0;
    end
end