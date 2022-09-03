x = [1 1 2 2];
y1 = [1 3 1];
y2 = fliplr(y1);
%y = xcorr(x, y1);

n1 = length(x);
n2 = length(y2);

X = [x, zeros(1, n2)];
Y = [y2, zeros(1, n1)];

y = zeros(1, n1+n2-1);

for i = 1:n1+n2-1
    for j = 1:n1
        if(i-j+1>0)
            y(i) = y(i) + X(j)*Y(i-j+1);
        else
        end
    end
end


subplot(2, 1, 1);
stem(x);
xlabel('a');
ylabel('Input sequence');

nx = -(length(y1)-1):(length(x)-1);

subplot(2, 1, 2);
stem(nx, y);
xlabel('b');
ylabel('Output Sequence');