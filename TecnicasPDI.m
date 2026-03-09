%TÉCNICAS DE PROCESAMIENTO DE IMÁGENES DIGITALES PARA LA MEJORA DE IMÁGENES
%MÉDICAS

% 3.1.1 Preprocesamiento - Conversión a escala de grises

RGB1 = imread("C:\Users\Laura Morales\Documents\12\Proyecto\Non-demented 1.jpg"); % Imagen de paciente sin demencia
I1=rgb2gray(RGB1);

RGB2 = imread("C:\Users\Laura Morales\Documents\12\Proyecto\Very mild dementia 2.jpg"); % Imagen de paciente con demencia muy leve
I2=rgb2gray(RGB2);

RGB3 = imread("C:\Users\Laura Morales\Documents\12\Proyecto\Mild dementia 1.jpg"); % Imagen de paciente con demencia leve
I3=rgb2gray(RGB3);

RGB4 = imread("C:\Users\Laura Morales\Documents\12\Proyecto\Moderate dementia 1.jpg"); % Imagen de paciente con demencia moderada
I4=rgb2gray(RGB4);

figure(1) % Mostrar resultados
subplot(2,2,1); imshow(I1); title('EDG - Paciente sin demencia');
subplot(2,2,2); imshow(I2); title('EDG - Paciente con demencia muy leve');
subplot(2,2,3); imshow(I3); title('EDG - Paciente con demencia leve');
subplot(2,2,4); imshow(I4); title('EDG - Paciente con demencia moderada');

sgtitle('Imagenes convertidas a escala de grises'); % Titulo de la figura



% 3.1.2 Aplicación de técnicas básicas de PDI 

% 3.1.2.1 Filtrado de imágenes

%Filtro de media

h = fspecial('average', [3 3]); % Crear un filtro de media (promedio) de 3x3

I1_filtered = imfilter(I1, h); % Aplicar el filtro con imfilter

figure(2); % Mostrar resultados

subplot(2,2,1); imshow(I1); title('Imagen Original');
subplot(2,2,2); imshow(I1_filtered); title('Filtrada con imfilter (media)');

sgtitle('Paciente sin demencia'); % Titulo de la figura

I2_filtered = imfilter(I2, h);

figure(3); % Mostrar resultados

subplot(2,2,1); imshow(I2); title('Imagen Original');
subplot(2,2,2); imshow(I2_filtered); title('Filtrada con imfilter (media)');

sgtitle('Paciente con demencia muy leve'); % Titulo de la figura

I3_filtered = imfilter(I3, h);

figure(4); % Mostrar resultados

subplot(2,2,1); imshow(I3); title('Imagen Original');
subplot(2,2,2); imshow(I3_filtered); title('Filtrada con imfilter (media)');

sgtitle('Paciente con demencia leve'); % Titulo de la figura

I4_filtered = imfilter(I4, h);

figure(5); % Mostrar resultados

subplot(2,2,1); imshow(I4); title('Imagen Original');
subplot(2,2,2); imshow(I4_filtered); title('Filtrada con imfilter (media)');

sgtitle('Paciente con demencia moderada'); % Titulo de la figura


%Filtro de mediana

I1_median = medfilt2(I1, [3 3]); % Aplicar filtro de mediana con vecindario 3x3

figure(6); % Mostrar resultados

subplot(1,2,1); imshow(I1); title('Imagen Original');
subplot(1,2,2); imshow(I1_median); title('Filtrada con medfilt2 (mediana)');

sgtitle('Paciente sin demencia'); % Titulo de la figura

I2_median = medfilt2(I2, [3 3]); % Aplicar filtro de mediana con vecindario 3x3

figure(7); % Mostrar resultados

subplot(1,2,1); imshow(I2); title('Imagen Original');
subplot(1,2,2); imshow(I2_median); title('Filtrada con medfilt2 (mediana)');

sgtitle('Paciente con demencia muy leve'); % Titulo de la figura

I3_median = medfilt2(I3, [3 3]); % Aplicar filtro de mediana con vecindario 3x3

figure(8); % Mostrar resultados

subplot(1,2,1); imshow(I3); title('Imagen Original');
subplot(1,2,2); imshow(I3_median); title('Filtrada con medfilt2 (mediana)');

sgtitle('Paciente con demencia leve'); % Titulo de la figura

I4_median = medfilt2(I4, [3 3]); % Aplicar filtro de mediana con vecindario 3x3

figure(9); % Mostrar resultados

subplot(1,2,1); imshow(I4); title('Imagen Original');
subplot(1,2,2); imshow(I4_median); title('Filtrada con medfilt2 (mediana)');

sgtitle('Paciente con demencia moderada'); % Titulo de la figura



%Mejora de contraste - basado en histograma 
%Se utilizan las imágenes con filtro de mediana

y1=histeq(I1_median); %Ecualizando histograma 1 

figure(10);

subplot(2, 2, 1); imshow(I1_median); title('Imagen original');
subplot(2, 2, 2); imhist(I1_median); title('Histograma original');

subplot(2, 2, 3); imshow(y1); title('Imagen ecualizada');
subplot(2, 2, 4); imhist(y1);title('histograma ecualizado');

sgtitle('Paciente sin demencia'); 

y2=histeq(I2_median); %Ecualizando histograma 2

figure(11);

subplot(2, 2, 1); imshow(I2_median); title('Imagen original');
subplot(2, 2, 2); imhist(I2_median); title('Histograma original');

subplot(2, 2, 3); imshow(y2); title('Imagen ecualizada');
subplot(2, 2, 4); imhist(y2); title('histograma ecualizado');

sgtitle('Paciente con demencia muy leve'); 


y3=histeq(I3_median);  %Ecualizando histograma 3

figure(12);

subplot(2, 2, 1); imshow(I3_median); title('Imagen original');
subplot(2, 2, 2); imhist(I3_median); title('Histograma original');

subplot(2, 2, 3); imshow(y3); title('Imagen ecualizada');
subplot(2, 2, 4); imhist(y3); title('histograma ecualizado');

sgtitle('Paciente con demencia leve'); 


y4=histeq(I4_median); %Ecualizando histograma 4

figure(13);

subplot(2, 2, 1); imshow(I4_median); title('Imagen original');
subplot(2, 2, 2); imhist(I4_median); title('Histograma original');

subplot(2, 2, 3); imshow(y4); title('Imagen ecualizada');
subplot(2, 2, 4); imhist(y4); title('histograma ecualizado');

sgtitle('Paciente con demencia moderada'); 


%Estiramiento de contraste

I1_adj = imadjust(y1, [0.2 0.8], [0 1]); % Esto toma los píxeles en el rango [0.2, 0.8] y los estira a [0, 1]

figure(14);
subplot(2,2,1); imshow(y1); title('Original');
subplot(2,2,2); imhist(y1); title('Histograma Original');

subplot(2,2,3); imshow(I1_adj); title('Ajustada');
subplot(2,2,4); imhist(I1_adj); title('Histograma Ajustado');

sgtitle('Paciente sin demencia'); 

I2_adj = imadjust(y2, [0.2 0.8], [0 1]); % Esto toma los píxeles en el rango [0.2, 0.8] y los estira a [0, 1]

figure(15);
subplot(2,2,1); imshow(y2); title('Original');
subplot(2,2,2); imhist(y2); title('Histograma Original');

subplot(2,2,3); imshow(I2_adj); title('Ajustada');
subplot(2,2,4); imhist(I2_adj); title('Histograma Ajustado');

sgtitle('Paciente con demencia muy leve'); 

I3_adj = imadjust(y3, [0.2 0.8], [0 1]); % Esto toma los píxeles en el rango [0.2, 0.8] y los estira a [0, 1]

figure(16);
subplot(2,2,1); imshow(y3); title('Original');
subplot(2,2,2); imhist(y3); title('Histograma Original');

subplot(2,2,3); imshow(I3_adj); title('Ajustada');
subplot(2,2,4); imhist(I3_adj); title('Histograma Ajustado');

sgtitle('Paciente con demencia leve'); 

I4_adj = imadjust(y4, [0.2 0.8], [0 1]); % Esto toma los píxeles en el rango [0.2, 0.8] y los estira a [0, 1]

figure(17);
subplot(2,2,1); imshow(y4); title('Original');
subplot(2,2,2); imhist(y4); title('Histograma Original');

subplot(2,2,3); imshow(I4_adj); title('Ajustada');
subplot(2,2,4); imhist(I4_adj); title('Histograma Ajustado');

sgtitle('Paciente con demencia moderada'); 


%Aplicación de filtro Gaussiano para detección de bordes

I1_edges = edge(I1_adj, 'canny');

% Mostrar resultados
figure (18);
imshow(I1_edges);
title('Detección de Bordes con Canny');


I2_edges = edge(I2_adj, 'canny');

% Mostrar resultados
figure (19);
imshow(I2_edges);
title('Detección de Bordes con Canny');

I3_edges = edge(I3_adj, 'canny');

% Mostrar resultados
figure (20);
imshow(I3_edges);
title('Detección de Bordes con Canny');


I4_edges = edge(I4_adj, 'canny');

% Mostrar resultados
figure (21);
imshow(I4_edges);
title('Detección de Bordes con Canny');


