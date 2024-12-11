clc; clear;

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

%%%%%%%%%%%%%%%%%%%%% INITIALIZE

m = 1;
n = 2;

%%%%%%%%%%%%%%%%%%%%%

horizontalMat = zeros(m, n+1);
verticalMat = zeros(m+1, n);

horizontalMat(1,1) = 1;
horizontalMat(2,1) = 1;
horizontalMat(3,1) = 1;
horizontalMat(1,2) = 1;
horizontalMat(2,3) = 1;
horizontalMat(3,2) = 1;
verticalMat(1,1) = 1;
verticalMat(4,1) = 1;

disp('testing')
isSAW(horizontalMat, verticalMat)

disp('count saws')
countSAWS(3,2)

function count = countSAWS(m, n)
    count = 0;
    k = m*(n+1) + (m+1)*n;
    mat = ones(k,2^k);
    for ii = 1:k
        ind = 1;
        len = 2^(ii-1);
        for jj = 1:2^(k-ii)
            mat(ii, ind:ind+len-1) = 0;
            ind = ind+len*2;
        end
    end

    hMat = zeros(m, n+1);
    vMat = zeros(m+1, n);
    
    for bin = 1:2^k
        ind = 1;
        for ii = 1:m
            for jj = 1:n+1
                hMat(ii,jj) = mat(ind,bin);
                ind = ind+1;
            end
        end
        %hMat
        for ii = 1:m+1
            for jj = 1:n
                vMat(ii,jj) = mat(ind,bin);
                ind = ind+1;
            end
        end
        %vMat
        if isSAW(hMat, vMat) == 1
            count = count+1;
        end
    end

end

function bool = isSAW(hMat, vMat)
    segmentCount = length(find(hMat == 1)) + length(find(vMat == 1));

    %initialize 
    x1 = 0;
    for ii = 1:size(hMat,2)
        array = find(hMat(:,ii) == 1);
        if length(array) >= 1
            x1 = array(1);
            y1 = ii;
            dir1 = 1;
            x2 = x1;
            y2 = y1;
            dir2 = 3;
            break;
        end
    end
    if x1 == 0
        for ii = 1:size(vMat,2)
            array = find(vMat(:,ii) == 1);
            if length(array) >= 1
                x1 = array(1);
                y1 = ii;
                dir1 = 2;
                x2 = x1;
                y2 = y1;
                dir2 = 4;
                break;
            end
        end
    end
    if x1 == 0
        bool = 0;
        return;
    else 
        count = 1;
    end

    while true
        if dir1 == 1 || dir1 == 3
            [x1, y1, dir1] = hGetNext(hMat, vMat, x1, y1, dir1);
        elseif dir1 == 2 || dir1 == 4
            [x1, y1, dir1] = vGetNext(hMat, vMat, x1, y1, dir1);
        end

        if 1 <= dir1 && dir1 <= 4
            count = count+1;
        elseif dir1 == 5
            bool = 0;
            % disp('fork violation')
            return;
        end

        if dir2 == 1 || dir2 == 3
            [x2, y2, dir2] = hGetNext(hMat, vMat, x2, y2, dir2);
        elseif dir2 == 2 || dir2 == 4
            [x2, y2, dir2] = vGetNext(hMat, vMat, x2, y2, dir2);
        end

        if 1 <= dir2 && dir2 <= 4
            count = count+1;
        elseif dir2 == 5
            bool = 0;
            return;
        end
        
        % accounting for closed loops
        if (x1 == x2) && (y1 == y2)
            if (dir1 == 1 && dir2 == 3) || (dir2 == 1 && dir1 == 3) || (dir1 == 2 && dir2 == 4) || (dir2 == 2 && dir1 == 4)
                bool = 0;
                % disp ('we have a sap')
                return;
            end
        end

        % exit loop when ends of walk are reached
        if dir1 == 0 && dir2 == 0
            break;
        end

    end

    if count == segmentCount
        bool = 1;
    else
        % disp('some disconnection')
        bool = 0;
    end

end

function [xNext, yNext, dirNext] = hGetNext(hMat, vMat, x, y, dir)
    m = size(hMat, 1);
    n = size(hMat, 2)-1;
    
    count = 0;
    if dir == 1
        if x-1 >= 1
            if hMat(x-1, y) == 1
                xNext = x-1;
                yNext = y;
                dirNext = 1;
                count = count+1;
            end
        end
        if y <= n
            if vMat(x, y) == 1
                xNext = x;
                yNext = y;
                dirNext = 2;
                count = count+1;
            end
        end
        if y-1 >= 1
            if vMat(x, y-1) == 1
                xNext = x;
                yNext = y-1;
                dirNext = 4;
                count = count+1;
            end
        end
    elseif dir == 3
        if x+1 <= m
            if hMat(x+1, y) == 1
                xNext = x+1;
                yNext = y;
                dirNext = 3;
                count = count+1;
            end
        end
        if y <= n
            if vMat(x+1, y) == 1
                xNext = x+1;
                yNext = y;
                dirNext = 2;
                count = count+1;
            end
        end
        if y-1 >= 1
            if vMat(x+1, y-1) == 1
                xNext = x+1;
                yNext = y-1;
                dirNext = 4;
                count = count+1;
            end
        end
    end

    if count == 0
        xNext = x;
        yNext = y;
        dirNext = 0;
    elseif count > 1
        dirNext = 5;
    end
    
end

function [xNext, yNext, dirNext] = vGetNext(hMat, vMat, x, y, dir)
    m = size(hMat, 1);
    n = size(hMat, 2)-1;
    
    count = 0;
    if dir == 2
        if y+1 <= n
            if vMat(x, y+1) == 1
                xNext = x;
                yNext = y+1;
                dirNext = 2;
                count = count+1;
            end
        end
        if x-1 >= 1
            if hMat(x-1, y+1) == 1
                xNext = x-1;
                yNext = y+1;
                dirNext = 1;
                count = count+1;
            end
        end
        if x <= m
            if hMat(x, y+1) == 1
                xNext = x;
                yNext = y+1;
                dirNext = 3;
                count = count+1;
            end
        end
    elseif dir == 4
        if y-1 >= 1
            if vMat(x, y-1) == 1
                xNext = x;
                yNext = y-1;
                dirNext = 4;
                count = count+1;
            end
        end
        if x-1 >= 1
            if hMat(x-1, y) == 1
                xNext = x-1;
                yNext = y;
                dirNext = 1;
                count = count+1;
            end
        end
        if x <= m
            if hMat(x, y) == 1
                xNext = x;
                yNext = y;
                dirNext = 3;
                count = count+1;
            end
        end
    end

    if count == 0
        xNext = x;
        yNext = y;
        dirNext = 0;
    elseif count > 1
        dirNext = 5;
    end
    
end
