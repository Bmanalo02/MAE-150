function Translate(x,y,tx,ty)
n=length(x);
X=zeros(2,n);
    for i=1:n
        T=[1 0 tx;
           0 1 ty;
           0 0 1];
        x0=[x(i);
           y(i);
           1];
        X1=T*x0;
        X(1,i)=X1(1,1);
        X(2,i)=X1(2,1);
    end
    X
end
