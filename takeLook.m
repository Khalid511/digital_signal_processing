function output = takeLook(xCo, yCo, input)

    output = zeros(1, length(input));
    for i=1:length(input)
        for j=2:length(yCo)
            if(i-j+1>0)
                output(i) = output(i) - yCo(j)*output(i-j+1);
            end
        end
        for k=1:length(xCo)
            if(i-k+1>0)
                output(i) = output(i) + xCo(k)*input(i-k+1);
            end
        end
        output(i) = output(i)/yCo(1);
        %disp(output(i));
    end
    
end