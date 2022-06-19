# GPE
Matlab OOP module with GPE/SGPE relization

Folder lib contains gpe and util modules. Download lib folder and add path to it in matlab. After that you can call functions and classes inside modules using gpe.function or util.function namings.

Launch example_dynamics script, it will create folders with data. 

## Problems
- code is not dimensionless yet
- after launching example_dynamics you will see that GPE iterations with the same amount of step take up more and more time (perhaps the GPU optimization doesn't work correctly).
