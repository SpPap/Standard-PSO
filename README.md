# Standard-PSO

## Intro
This repository contains a standard implementation of the Particle Swarm Optimization (PSO) algorithm. To evaluate the effectiveness of this nonlinear optimization technique, the 2D version of the Michalewicz function has been utilized. Additionally, the repository features a 3D visualization of the algorithm, providing a clearer demonstration of how PSO operates. All code and simulations have been developed in the MATLAB environment.

## Particle Swarm Optimization (PSO) Algorithm 
<p align="justify ">
Particle Swarm Optimization (PSO) is a nature-inspired optimization algorithm, particularly influenced by the behavior of flocks of birds. It was developed by Kennedy and Eberhart in the late 1990s and has gained significant fame since then [1]. As a swarm intelligence algorithm, PSO utilizes multiple "agents" also known as particles, that move randomly within the search space to explore and identify the optimal solution $\mathbf{x}^*$. Specifically, it seeks the input vector that minimizes a given cost function $f$, similar to how birds fly in the sky. Each particle moves in a stochastic manner, influenced by its own best position $y$ discovered so far. Simultaneously, the particles are also motivated to converge toward the best position found by the entire swarm $\hat{y}$. This dual influence drives the particles to explore and exploit the search space effectively. 
</p>

<p align="center">
<img src="https://github.com/user-attachments/assets/555a002a-705a-4cd1-ab83-1e727eef0483" width="350"/> <br>
  <i>Visualization of the algorithm for swarm of 10 particles finding global minima on Michalewicz function</i>
</p>

### Update Rule
Each swarm particle updates its current position and velocity at each time step $t$ in the following way [2],[3].
<p align="justify ">
For a single swarm, the position of the $i^{th}$ particle is updated as follows:
</p>

$$ 
\mathbf{x}_i(t+1)=\mathbf{x}_i(t)+\mathbf{v}_i(t+1)   
$$ 

where $i=1,2,..,s$

<p align="justify ">
The velocity is calculated as:
</p>

$$ 
v_{ij}(t+1) = wv_{ij}(t) + c_{1} r_{1j} (y_{ij} - x_{ij}(t)) + c_{2} r_{2j} (\hat{y_{ij}} - x_{ij}(t)) 
$$ 

where $v_{ij}(t)$, $i=1,2,..,s$, $j=1,2,..,d$, denotes the velocity of the $i^{th}$ particle in the $j^{th}$ dimension, $y_{ij}, \hat{y_{ij}}$ are the personal and global best respectively, $r_{1j}, r_{2j}$ are random values picked from a uniform distribution that lie in the interval [0, 1] and the rest $w, c_{1}, c_{2}$ are PSO's tuning parameters that will be explained in the next subsection.

### Tuning Parameters
- Inertia coefficient  ($w$)<br />
    This parameter represents the inertia weight of the particle, which indicates the particle's tendency to maintain its previous speed. This term is often referred to as controlling the particle's momentum
- Nostalgia constant  ($c_{1}$)<br />
    The nostalgia constant, or cognitive term, represents each particle's personal experience and acts as an amplification of its personal best, making it tend to keep its best position so far.
- Envy constant ($c_{2}$)<br />
    The envy constant, or social term, determines the influence of the entire swarm. This means each particle tries to mimic the neighboring particles to move as a whole based on the global best.

## Benchmark Test Case - Michalewicz Function

<p align="justify ">
To test the algorithm, a benchmark function in nonlinear optimization, i.e. the Michalewicz function is employed [3]. This function is characterized by many local minima and a single global minima, making the search process quite challenging. Mathematically, for a d-dimensional space, the function can be expressed as follows [4]:
</p>

$$
  f(x) = -\sum_{i=1}^{d}sin(x_i)sin^{2m}\left(\frac{ix_i^{2}}{\pi}\right) 
$$

where $m$ denotes the steepness and the input space is usually limited to $[0, \pi]$

<p align="justify ">
For demonstration purposes, the 2D version is used in this repository where the true global minima (for a $d$ = 2 case) is located in $\textbf{x}^* =  [x_1 \ \  x_2]^T =  [2.20 \ \  1.57]^T$ and the function's value is  $f(\textbf{x}^*) \simeq  -1.8013$

As a stopping criterion, a total of 200 iterations was chosen however, the algorithm converges in the first 30.
</p>

<p align="center">
<img src="https://github.com/user-attachments/assets/d617bcd4-eb97-4ca8-9cb1-8793930d51e9" width="350"/>
</p>

<p align="center">
<img src="https://github.com/user-attachments/assets/a5a03630-723b-4bc7-9040-3387c35af667" width="350"/>
</p>


### References
[1] J. Kennedy and R. Eberhart, “Particle swarm optimization,” in Proceedings of ICNN’95 - International Conference on Neural Networks, Perth, WA, Australia: IEEE, 1995, pp. 1942–1948. doi: 10.1109/ICNN.1995.488968. <br>
[2] A. Kapnopoulos and A. Alexandridis, “A cooperative particle swarm optimization approach for tuning an MPC-based quadrotor trajectory tracking scheme,” Aerospace Science and Technology, vol. 127, p. 107725, Aug. 2022, doi: 10.1016/j.ast.2022.107725.<br>
[3] X.-S. Yang, Nature-inspired optimization algorithms, First edition. in Elsevier insights. Amsterdam Boston Heidelberg London New York Oxford Paris San Diego San Francisco Singapore Sydney Tokyo: Elsevier, 2014.  <br>
[4] M. Molga and C. Smutnicki, Test functions for optimization needs, 2005


