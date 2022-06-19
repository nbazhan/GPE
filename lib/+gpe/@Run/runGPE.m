function [Psi, mu] = runGPE(obj, Psi, mu, tf)

t = 0;
while t < tf
    [Psi, mu] = obj.stepGPE(Psi, mu, t);
    t = t + obj.dt;
end
end
      