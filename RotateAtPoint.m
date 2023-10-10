function RotateAtPoint(x,y,Refx,Refy,Theta)
n=length(x);
X=zeros(2,n);
    for i=1:n
        TranslateToOriginFromRef=[1 0 -Refx;
           0 1 -Refy;
           0 0 1];
        x0=[x(i);
           y(i);
           0];
        xOrigin=TranslateToOriginFromRef*x0;
        S=[cosd(Theta) -sind(Theta) 0;
           sind(Theta) cosd(Theta) 0;
            0 0 0];
        X1=S*xOrigin;
        TranslateToRefFromOrigin=[1 0 Refx;
           0 1 Refy;
           0 0 1];
        X2=TranslateToRefFromOrigin*X1;
        X(1,i)=X2(1,1);
        X(2,i)=X2(2,1);
    end
    X
end