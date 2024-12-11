clc; clear;

% testing and debugging sawCount3xN.m by comparing found paths to all paths

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

n = 2;
disp('count saws')
[hMatArr, vMatArr] = countSAWS(2,2);

%%%%%%%%%%%%%%%%%%%%%

% intializing for recursion

counts = zeros(1,n);
counts(1) = 3;

AC0 = zeros(1,n);
hAC0Arr = 

A00 = ones(1,n);
A01 = ones(1,n);
A02 = ones(1,n);
A03 = ones(1,n);

A10 = zeros(1,n);
hA10arr = 
A11 = zeros(1,n);
A12 = zeros(1,n);
A13 = zeros(1,n);

A20 = zeros(1,n);
A21 = zeros(1,n);
A22 = zeros(1,n);

A30C = zeros(1,n);
A30D = zeros(1,n);
A31 = zeros(1,n);
A32C = zeros(1,n);
A32D = zeros(1,n);

A40 = zeros(1,n);
A41 = zeros(1,n);
A42 = zeros(1,n);
A43 = zeros(1,n);

A50C = zeros(1,n);
A50D = zeros(1,n);
A51C = zeros(1,n);
A51D = zeros(1,n);
A52C = zeros(1,n);
A52D = zeros(1,n);
A53 = zeros(1,n);

A60C = zeros(1,n);
A60D = zeros(1,n);
A61C = zeros(1,n);
A61D = zeros(1,n);
A62 = zeros(1,n);

A701 = zeros(1,n);
A702 = zeros(1,n);
A703 = zeros(1,n);
A71 = zeros(1,n);
A72 = zeros(1,n);

% computing sums with recurrence relations

for ii = 2:n

    AC0(ii) = counts(ii-1); 

    A10(ii) = A00(ii-1) + A01(ii-1) + A03(ii-1) + A10(ii-1) + A21(ii-1) + A30C(ii-1) + A32C(ii-1) + A43(ii-1) + A50C(ii-1) + A52C(ii-1) + A61C(ii-1) + A72(ii-1);
    hA10temp = get_hA10(hA00arr, hA01arr, hA03arr, hA10arr, hA21arr, hA30Carr, hA32Carr, hA43arr, hA50Carr, hA52Carr, hA61Carr, hA72arr);
    vA10temp = get_vA10(vA00arr, vA01arr, vA03arr, vA10arr, vA21arr, vA30Carr, vA32Carr, vA43arr, vA50Carr, vA52Carr, vA61Carr, vA72arr);    
    A11(ii) = A10(ii);
    hA11temp = hA10temp;
    vA11temp = vA10temp;
    A12(ii) = A10(ii);
    hA12temp = hA10temp;
    vA12temp = vA10temp;
    A13(ii) = A10(ii);
    hA13temp = hA10temp;
    vA13temp = vA10temp;
    
    A20(ii) = A00(ii-1) + A01(ii-1) + A02(ii-1) + A11(ii-1) + A20(ii-1) + A30C(ii-1) + A42(ii-1) + A51C(ii-1) + A52C(ii-1) + A60C(ii-1);
    hA20temp = get_hA20(hA00arr, hA01arr, hA02arr, hA11arr, hA20arr, hA30Carr, hA42arr, hA51Carr, hA52Carr, hA60Carr);
    vA20temp = get_vA20(vA00arr, vA01arr, vA02arr, vA11arr, vA20arr, vA30Carr, vA42arr, vA51Carr, vA52Carr, vA60Carr);
    A21(ii) = A20(ii);
    hA21temp = hA20temp;
    vA21temp = vA20temp;
    A22(ii) = A20(ii);
    hA22temp = hA20temp;
    vA22temp = vA20temp;
    
    A30C(ii) = A01(ii-1) + A30C(ii-1) + A52C(ii-1);
    hA30Ctemp = get_hA30C(hA01arr, hA30Carr, hA52Carr);
    vA30Ctemp = get_vA30C(vA01arr, vA30Carr, vA52Carr);
    A30D(ii) = A00(ii-1) + A02(ii-1) + A10(ii-1) + A12(ii-1) + A20(ii-1) + A30D(ii-1) + A42(ii-1) + A50C(ii-1) + A52D(ii-1) + A60C(ii-1) + A702(ii-1) + A703(ii-1);
    hA30Dtemp = get_hA30D(hA00arr, hA02arr, hA10arr, hA12arr, hA20arr, hA30Darr, hA42arr, hA50Carr, hA52Darr, hA60Carr, hA702arr, hA703Arr);
    vA30Dtemp = get_vA30D(vA00arr, vA02arr, vA10arr, vA12arr, vA20arr, vA30Darr, vA42arr, vA50Carr, vA52Darr, vA60Carr, vA702arr, vA703Arr);
    A31(ii) = A30D(ii);
    hA31temp = hA30Dtemp;
    vA31temp = vA30Dtemp;
    A32C(ii) = A30C(ii);
    hA32Ctemp = hA30Ctemp;
    vA32Ctemp = vA30Ctemp;
    A32D(ii) = A30D(ii);
    hA32Dtemp = hA30Dtemp;
    vA32Dtemp = vA30Dtemp;
    
    A40(ii) = A00(ii-1) + A02(ii-1) + A03(ii-1) + A13(ii-1) + A22(ii-1) + A32C(ii-1) + A40(ii-1) + A50C(ii-1) + A51C(ii-1) + A60C(ii-1) + A61C(ii-1) + A71(ii-1);
    hA40temp = get_hA40(hA00arr, hA02arr, hA03arr, hA13arr, hA22arr, hA32Carr, hA40arr, hA50Carr, hA51Carr, hA60Carr, hA61Carr, hA71arr);
    vA40temp = get_vA40(vA00arr, vA02arr, vA03arr, vA13arr, vA22arr, vA32Carr, vA40arr, vA50Carr, vA51Carr, vA60Carr, vA61Carr, vA71arr);
    A41(ii) = A40(ii);
    hA41temp = hA40temp;
    vA41temp = vA40temp;
    A42(ii) = A40(ii);
    hA42temp = hA40temp;
    vA42temp = vA40temp;
    A43(ii) = A40(ii);
    hA43temp = hA40temp;
    vA43temp = hA40temp;
    
    A50C(ii) = A03(ii-1) + A32C(ii-1) + A50C(ii-1) + A61C(ii-1);
    hA50Ctemp = get_hA50C(hA03arr, hA32Carr, hA50Carr, hA61Carr);
    vA50Ctemp = get_vA50C(vA03arr, vA32Carr, vA50Carr, vA61Carr);
    A50D(ii) = A00(ii-1) + A01(ii-1) + A02(ii-1) + A10(ii-1) + A12(ii-1) + A21(ii-1) + A22(ii-1) + A30C(ii-1) + A32D(ii-1) + A40(ii-1) + A41(ii-1) + A50D(ii-1) +A60C(ii-1) + A61D(ii-1) + A701(ii-1) + A703(ii-1);
    hA50Dtemp = get_hA50D(hA00arr, hA01arr, hA02arr, hA10arr, hA12arr, hA21arr, hA22arr, hA30Carr, hA32Darr, hA40arr, hA41arr, hA50Darr, hA60Carr, hA61Darr, hA701arr, hA703arr);
    vA50Dtemp = get_vA50D(vA00arr, vA01arr, vA02arr, vA10arr, vA12arr, vA21arr, vA22arr, vA30Carr, vA32Darr, vA40arr, vA41arr, vA50Darr, vA60Carr, vA61Darr, vA701arr, vA703arr);
    A51C(ii) = A50C(ii);
    hA51Ctemp = hA50Ctemp;
    vA51Ctemp = vA50Ctemp;
    A51D(ii) = A50D(ii);
    hA51Dtemp = hA50Dtemp;
    vA51Dtemp = vA50Dtemp;
    A52C(ii) = A50C(ii);
    hA52Ctemp = hA50Ctemp;
    vA52Ctemp = vA50Ctemp;
    A52D(ii) = A50D(ii);
    hA52Dtemp = hA50Dtemp;
    vA52Dtemp = vA50Dtemp;
    A53(ii) = A50D(ii);
    hA53temp = hA50Dtemp;
    vA53temp = vA50Dtemp;
    
    A60C(ii) = A02(ii-1) + A51C(ii-1) + A60C(ii-1);
    hA60Ctemp = get_hA60C(hA02arr, hA51Carr, hA60Carr);
    vA60Ctemp = get_vA60C(vA02arr, vA51Carr, vA60Carr);
    A60D(ii) = A00(ii-1) + A01(ii-1) + A11(ii-1) + A20(ii-1) + A30C(ii-1) + A40(ii-1) + A41(ii-1) + A50C(ii-1) + A51D(ii-1) + A60D(ii-1) + A701(ii-1) + A702(ii-1);
    hA60Dtemp = get_hA60D(hA00arr, hA01arr, hA11arr, hA20arr, hA30Carr, hA40arr, hA41arr, hA50Carr, hA51Darr, hA60Darr, hA701arr, hA702arr);
    vA60Dtemp = get_vA60D(vA00arr, vA01arr, vA11arr, vA20arr, vA30Carr, vA40arr, vA41arr, vA50Carr, vA51Darr, vA60Darr, vA701arr, vA702arr);
    A61C(ii) = A60C(ii);
    hA61Ctemp = hA60Ctemp;
    vA61Ctemp = vA60Ctemp;
    A61D(ii) = A60D(ii);
    hA61Dtemp = hA60Dtemp;
    vA61Dtemp = vA60Dtemp;
    A62(ii) = A60D(ii);
    hA62temp = hA60Dtemp;
    vA62temp = vA60Dtemp;
    
    A701(ii) = A01(ii-1) + A30C(ii-1) + A41(ii-1) + A701(ii-1);
    hA701temp = get_hA701(hA01arr, hA30Carr, hA41arr, hA701arr);
    vA701temp = get_vA701(vA01arr, vA30Carr, vA41arr, vA701arr);
    A702(ii) = A50C(ii-1) + A702(ii-1);
    hA702temp = get_hA702(hA50Carr, hA702arr);
    vA702temp = get_vA702(vA50Carr, vA702arr);
    A703(ii) = A02(ii-1) + A12(ii-1) + A60C(ii-1) + A703(ii-1);
    hA703temp = get_hA702(hA02arr, hA12arr, hA60Carr, hA703arr);
    vA703temp = get_vA702(vA02arr, vA12arr, vA60Carr, vA703arr);
    A71(ii) = A02(ii-1) + A12(ii-1) + A50C(ii-1) + A60C(ii-1) + A703(ii-1);
    hA71temp = get_hA71(hA02arr, hA12arr, hA50Carr, hA60Carr, hA703arr);
    vA71temp = get_vA71(vA02arr, vA12arr, vA50Carr, vA60Carr, vA703arr);
    A72(ii) = A01(ii-1) + A30C(ii-1) + A50C(ii-1) + A41(ii-1) + A701(ii-1);
    hA72temp = get_hA72(hA01arr, hA30Carr, hA50Carr, hA41arr, hA701arr);
    vA72temp = get_vA72(vA01arr, vA30Carr, vA50Carr, vA41arr, vA701arr);

    counts(ii) = AC0(ii) + A01(ii) + A02(ii) + A03(ii) + A10(ii) + A11(ii) + A13(ii) + A20(ii) + A21(ii) + A22(ii) + A30C(ii) + A31(ii) + A32C(ii) + A40(ii) + A42(ii) + A43(ii) + A50C(ii) + A51C(ii) + A52C(ii) + A53(ii) + A60C(ii) + A61C(ii) + A62(ii) + A71(ii) + A72(ii);

end

function [index, matOut] = getNew(index, matIn, hvArr, vec)
    matOut = matIn;
    for ii = 1:size(hvArr,3)
        temp = hvArr(:,:,ii);
        temp(:,size(temp,2)+1) = vec;
        matOut(index) = temp;
        index = index+1;
    end
end

function hA10out = get_hA10(hA00arr, hA01arr, hA03arr, hA10arr, hA21arr, hA30Carr, hA32Carr, hA43arr, hA50Carr, hA52Carr, hA61Carr, hA72arr)
    index = 1;
    vec = [1,0,0];
    hA10out = zeros(size(hA00arr,1), size(hA00arr,2));
    [index, hA10out] = getNew(index, hA10out, hA00arr, vec);
    [index, hA10out] = getNew(index, hA10out, hA01arr, vec);
    [index, hA10out] = getNew(index, hA10out, hA03arr, vec);
    [index, hA10out] = getNew(index, hA10out, hA10arr, vec);
    [index, hA10out] = getNew(index, hA10out, hA21arr, vec);
    [index, hA10out] = getNew(index, hA10out, hA30Carr, vec);
    [index, hA10out] = getNew(index, hA10out, hA32Carr, vec);
    [index, hA10out] = getNew(index, hA10out, hA43arr, vec);
    [index, hA10out] = getNew(index, hA10out, hA50Carr, vec);
    [index, hA10out] = getNew(index, hA10out, hA52Carr, vec);
    [index, hA10out] = getNew(index, hA10out, hA61Carr, vec);
    [~, hA10out] = getNew(index, hA10out, hA72arr, vec);
end

function vA10out = get_vA10(vA00arr, vA01arr, vA03arr, vA10arr, vA21arr, vA30Carr, vA32Carr, vA43arr, vA50Carr, vA52Carr, vA61Carr, vA72arr)
    index = 1;
    vec = [0,0];
    vA10out = zeros(size(vA00arr,1), size(vA00arr,2));
    [index, vA10out] = getNew(index, vA10out, vA00arr, vec);
    [index, vA10out] = getNew(index, vA10out, vA01arr, vec);
    [index, vA10out] = getNew(index, vA10out, vA03arr, vec);
    [index, vA10out] = getNew(index, vA10out, vA10arr, vec);
    [index, vA10out] = getNew(index, vA10out, vA21arr, vec);
    [index, vA10out] = getNew(index, vA10out, vA30Carr, vec);
    [index, vA10out] = getNew(index, vA10out, vA32Carr, vec);
    [index, vA10out] = getNew(index, vA10out, vA43arr, vec);
    [index, vA10out] = getNew(index, vA10out, vA50Carr, vec);
    [index, vA10out] = getNew(index, vA10out, vA52Carr, vec);
    [index, vA10out] = getNew(index, vA10out, vA61Carr, vec);
    [~, vA10out] = getNew(index, vA10out, vA72arr, vec);
end

function hA20out = get_hA20(hA00arr, hA01arr, hA02arr, hA11arr, hA20arr, hA30Carr, hA42arr, hA51Carr, hA52Carr, hA60Carr)
    index = 1;
    vec = [1,0,0];
    hA10out = zeros(size(hA00arr,1), size(hA00arr,2));
    [index, hA10out] = getNew(index, hA10out, hA00arr, vec);
end

%%%%% brute force algorithm %%%%%

function [hMatArr, vMatArr] = countSAWS(m, n)

    
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
    hMatArr = hMat;
    vMat = zeros(m+1, n);
    vMatArr = vMat;
    
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
            hMatArr(:,:,count) = hMat;
            vMatArr(:,:,count) = vMat;
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
            %disp('fork violation')
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
                %disp ('we have a sap')
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
        %disp('some disconnection')
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

%%%%% FUNCIONS %%%%%

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
