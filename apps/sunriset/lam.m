pkg load optim;format long;data=csvread("lambda.csv");n=524288;t=data([1:n],1);lambda=data([1:n],2);args = [   5.022440501755778e+06   4.890899777335416e+00   5.022680079203663e+06   6.244922869391880e+00   3.479109925478395e-04   3.336588305199348e-02];#   -1.887243500212101e-14dargs = [  1e-5  1e-5  1e-5  1e-5  1e-5  1e-5];L = @(t,p) polyval([1/p(1),p(2)],t);M = @(t,p) polyval([1/p(3),p(4)],t);C = @(t,p) p(5)*sin(2*M(t,p)) + p(6)*sin(M(t,p));LAM = @(t,p) L(t,p) + C(t,p);func = @(t,p) sin(lambda-LAM(t,p));[mylambda,newargs,cvg,iter]=leasqr(t,zeros(size(t)),args,func,0.000000001,20,ones(size(t)),dargs);cvgiternewargs-argsrad2deg(asin(max(abs(func(t,newargs))))) # 1.157736806426570e-02 1.088437188121810e-02newargs