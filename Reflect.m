function Reflect(dir,x,y)
n=length(x);
X=zeros(2,n);
    if dir==0
        for i=1:n
            Rx=[1 0 0;
                0 -1 0;
                0 0 1];
            x0=[x(i);
               y(i);
               1];
            X1=Rx*x0;
            X(1,i)=X1(1,1);
            X(2,i)=X1(2,1);
        end
        X
    end
    if dir==1
        for i=1:n
            Ry=[-1 0 0;
                0 1 0;
                0 0 1];
            x0=[x(i);
               y(i);
               1];
            X1=Ry*x0;
            X(1,i)=X1(1,1);
            X(2,i)=X1(2,1);
        end
        X
    end
end