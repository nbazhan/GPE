function V = getV(obj)
V = 0.5*obj.config.M*(...
            obj.wr^2*((obj.grid.X.^2 + obj.grid.Y.^2).^0.5 - obj.R).^2 + ...
            obj.wz^2*obj.grid.Z.^2);
end