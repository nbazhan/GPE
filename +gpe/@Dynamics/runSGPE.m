function [Psi, mu] = runSGPE(obj, Psi, mu, tf)
ecut = mu + obj.config.kb*obj.config.T*log(2);
kcut = sqrt(2*obj.config.M*ecut/obj.config.hbar^2);
projec = obj.grid.kk*2 <= kcut^2;
t = 0;

obj.dispstat('','init');
tic;
while t < tf 
    [Psi, mu] = obj.stepSGPE(Psi, mu, t, projec);
    t = t + obj.dt;
    time = toc;
    obj.dispstat(sprintf(['Split-step: t - %0.3f/%0.2g, mu - %0.2g,', ...
                          ' time - %0.2g sec'], ...
                           t, tf, mu, time));
end

end