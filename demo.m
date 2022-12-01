clear;
close all;

addpathrec('.');
deterministic('on');

L = 2;
denoiser = @bs_wnnm;


ima = loadimage('data/lena_gray.png');
% x = loadimage('data/lena_gray.png');
x = ima.^2;
% y =x;
[m, n] = size(x);
y = x .* mean((randn(m, n, L).^2 + randn(m, n, L).^2) / 2, 3);


disp('Run BS-WNNM');
Sigma = (noiselevel(log(y+1)));
final_result = denoiser(ima, log(y+1), Sigma,L);

a4 = uint8(final_result);
imshow(a4)

