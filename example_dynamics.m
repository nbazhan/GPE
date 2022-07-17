% example of dynamics script
clear;

% propagate sf cycles each for real time dt
sf = 50;
dt = 0.005;

% initialize objects: grid, config, model, save, run
example_init;

[Psi, mu] = run.getITP();

tic;
t = 0;
for s = 1 : sf + 1
    % save pictures and data
    sv.savePic(Psi, s, t) ;
    sv.saveData(s, sf, struct('t', t, ...
                              'mu', mu, ...
                               'Psi', Psi, ...
                                'L', model.getAllL(Psi), ...
                                'Ub', model.getAllUb(t), ...
                                'U1d', model.getU1d(t)));  
    % display information
    disp([num2str(s), '/', num2str(sf), ...
          ': L = [', num2str(model.getAllL(Psi)), ...
          '], time: ', num2str(toc, '%0.0f'), ' s']);
        
    % calculate evolution on dt
    if s < sf + 1
        [Psi, mu] = run.runGPE(Psi, mu, t, t + dt);
        t = t + dt;
    end
end
    
% save illustrations with angular momentum
sv.saveIlls()
