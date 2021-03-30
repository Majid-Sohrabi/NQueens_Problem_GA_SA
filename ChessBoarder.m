function ChessBoarder(BestPop,BestCost)

% White pic
    A = ones(3,3);
    A = A*255;

    % Black pic
    B = zeros(3,3);
    
    C=[A B A B A B A B;
        B A B A B A B A;
        A B A B A B A B;
        B A B A B A B A;
        A B A B A B A B;
        B A B A B A B A;
        A B A B A B A B;
        B A B A B A B A];
    
for i=1:size(BestPop,1)
    close all;
    copy_C = C;
    sol = BestPop(i,:);
    for j=1:8
        d = sol(1,j);
        Row = (d-1)*3 + 1;
        Col = (j-1)*3 + 1;
        
        if(Col == 0)
            Col = Col+1;
        end
        if(Row == 0)
           Row = Row+1; 
        end
        
        if (copy_C(Row+1 , Col+1) == 255)
            copy_C(Row+1 , Col+1) = 0;
        else
            copy_C(Row+1 , Col+1) = 255;
        end
        
    end

    colormap(gray);image(copy_C)
    disp([num2str(i) ') Best Cost --->  ' num2str(BestCost(i))])
    pause(7)
%     S = input('If you want to continue plz enter y, else enter n :')
%     if(s == 'n')
%         break;
%     end
%     if(s == 'y')
%         continue;
%     end
end

end