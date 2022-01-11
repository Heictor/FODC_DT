% Rotina desenvolvida a partir da Função de Grünwald-Letnikov
% Implementada em Linguagem MATLAB
% Referência utilizada: Ivo Petráš, Technical University of Košice - Slovak Republic

function Y = deriv_frac( alpha, y, h )

%   ================================================================================
%   Script: deriv_frac
%
%   Calcula a Derivada Fracional de ordem (alpha) para a função Amostra (Y)
%   representada com espaçamento regular (h), utilizando a formulação de
%   Grunwald-Letnikov.
%   
%
%   Inputs:
%   alpha : Ordem da derivada
%   y : Função Amostra
%   h : Intervalo de amostragem
%
%
%   Output:
%   Y : Função de Derivada Fracional estimada para y
%   ================================================================================
%   Determinação do número de elementos em uma matriz ou de uma expressão: numel    
    n  = numel(y);
%   
%   Função Gamma
    J  = 0:(n-1);
    G1 = gamma( J+1 );
    G2 = gamma( alpha + 1 - J );
    
    % A derivada simétrica de Riesz de ordem J
    dsR  = (-1) .^ J;
% 
%   Extração da parte inferior da matriz triangular: tril
    M  = tril( ones(n) );
%
%   Determinação da matriz não-simétrica R(C,D), tendo C como primeira coluna e
%   D como primeira linha: toeplitz 
    R  = toeplitz( y(:)' );
%    
%   Discretização cartesiana em 2D ou 3D: meshgrid
    T  = meshgrid( (gamma(alpha + 1)/(h^alpha)) * dsR ./ (G1.*G2) );
%
%   Determinação da matriz de resultados (M,N) em forma de matriz coluna: reshape
    Y  = reshape(sum( R .* M .* T, 2 ), size(y));
    
end