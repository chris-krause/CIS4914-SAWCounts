% brute force counting saws on an m by n grid

% adding the condition that they span the entire grid width-wise

% example on a 2 by 3 grid
%  _
% | |__
% |_
%   |__|
%
% example on a 1 by 2 grid
% 
%  _
% |
% |_

m = 1;
n = 2;

horizontalMat = zeros(m, n+1);
verticalMat = zeros(m+1, n);

horizontalMat(1,1) = 1;
horizontalMat(1,2) = 1;
verticalMat(1,1) = 1;
verticalMat(2,2) = 1;

isSAW(horizontalMat, verticalMat)

function bool = isSAW(hMat, vMat)
    
    bool = 1;
    zeroConn = 0;
    singleConn = 0;
    m = size(hMat, 1);
    n = size(hMat, 2)-1;

    % horizontal
    for ii = 1:m
        for jj = n+1
            if hMat(ii, jj) == 1
                disp('horz')
                ii
                jj
                count1 = 0;
                count2 = 0;
                if ii-1 >= 1
                    if hMat(ii-1, jj) == 1
                        count1 = count1 + 1
                    end
                end
                if ii+1 <= m
                    if hMat(ii+1, jj) == 1
                        count2 = count2 + 1
                    end
                end
                if jj-1 >= 1
                    if vMat(ii, jj-1) == 1
                        count1 = count1 + 1
                    end
                    if vMat(ii+1, jj-1) == 1
                        count2 = count2 + 1
                    end
                end
                if jj <= n
                    if vMat(ii, jj) == 1
                        count1 = count1 + 1
                    end
                    if vMat(ii+1, jj) == 1
                        count2 = count2 + 1
                    end
                end
                if count1 == 0 && count2 == 0
                    zeroConn = zeroConn + 1;
                elseif count1+count2 == 1
                    singleConn = singleConn + 1;
                elseif count1 > 1 || count2 > 1
                    bool = 0;
                end
            end
        end
    end

    % vertical
    for ii = 1:m+1
        for jj = 1:n
            if vMat(ii, jj) == 1
                disp('vert')
                ii
                jj
                count1 = 0;
                count2 = 0;
                if jj-1 >= 1
                    if vMat(ii, jj-1) == 1
                        count1 = count1 + 1
                    end
                end
                if jj+1 <= n
                    if vMat(ii, jj+1) == 1
                        count2 = count2 + 1
                    end
                end
                if ii-1 >= 1
                    if hMat(ii-1, jj) == 1
                        count1 = count1 + 1
                    end
                    if hMat(ii-1, jj+1) == 1
                        count2 = count2 + 1
                    end
                end
                if ii <= m
                    if hMat(ii, jj) == 1
                        count1 = count1 + 1
                    end
                    if hMat(ii, jj+1) == 1
                        count2 = count2 + 1
                    end
                end               
                if count1 == 0 && count2 == 0
                    zeroConn = zeroConn + 1;
                elseif count1+count2 == 1
                    singleConn = singleConn + 1;
                elseif count1 > 1 || count2 > 1
                    bool = 0;
                end
            end
        end
    end

    if singleConn ~= 2
        bool = 0;
        if singleConn == 0 && zeroConn == 1
            bool = 1
        end
    end
       

end
