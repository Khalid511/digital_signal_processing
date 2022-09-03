h = [1 2 1 -1]; % h(0) = 2

x = [1 2 3 1]; % x(0) = 1;

X = [x, zeros(1, length(h))];
H = [h, zeros(1, length(x))];

y = zeros(1, length(x)+length(h)-1);

for i=1:length(x)+length(h)-1
    for j=1:length(x)
        if(i-j+1>0)
            y(i) = y(i)+X(j)*H(i-j+1);
        end
    end
end

nx = -1:5; % output range -1, 0, 1, 2, 3, 4, 5

stem(nx, y);
%xlim([-1, 7]);

 