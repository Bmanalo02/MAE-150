function ScaleAtPoint(x,y,Refx,Refy,Sx,Sy)
n=length(x);
X=zeros(2,n);
    for i=1:n
        TranslateFromRef=[1 0 -Refx;
           0 1 -Refy;
           0 0 0];
        X0=[x(i);
           y(i);
           1];
        XOrigin=TranslateFromRef*X0;
        S=[Sx 0 0;
            0 Sy 0;
            0 0 1];
        X1=S*XOrigin;
        TranslateToRef=[1 0 Refx;
           0 1 Refy;
           0 0 1];
        X2=TranslateToRef*X1;
        X(1,i)=X2(1,1);
        X(2,i)=X2(2,1);
    end
    X
end