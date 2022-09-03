
% input taken as x(n) = 1, n>20; x(n) = 0, n<20;
input = ones(1, 69);
for i=1:19
    input(i) = 0;
end

%implementing y(n) = 0.95y(n-1) + 0.05x(n)

xCofficient = [0.05 0];
yCofficient = [1 -0.95];
subplot(2, 1, 1);
stem(input);
res_out = takeLook(xCofficient, yCofficient, input);
subplot(2, 1, 2);
stem(res_out);

