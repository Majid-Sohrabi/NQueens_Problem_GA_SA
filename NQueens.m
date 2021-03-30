function z=NQueens(x)
    z=0;
    for i=1:8
        for j=i+1:8
              if (abs(i-j)==abs(x(i)-x(j)))
                  z= z+1;
              end
        end     
    end
end