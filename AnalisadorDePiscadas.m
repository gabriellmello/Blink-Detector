% 1. Lendo arquivo .txt
filename = 'PISCADAS.txt'; % Substitua pelo nome do seu arquivo
fileID = fopen(filename, 'r');
fileContents = fscanf(fileID, '%c', inf);
fclose(fileID);

% 2.Extraindo datas e horas
datePattern = '\d{4}/\d{2}/\d{2}';
timePattern = '\d{1,2}:\d{1,2}:\d{1,2}';
dates = regexp(fileContents, datePattern, 'match');
times = regexp(fileContents, timePattern, 'match');

% 3. Convertendo datas e horas para matrizes de data e hora
dateArray = datetime(dates, 'InputFormat', 'yyyy/MM/dd');
timeArray = datetime(times, 'InputFormat', 'yyyy/MM/dd HH:mm:ss.SSS');

% 4. Calcule o número de piscadas e a duração total do registro
numPiscadas = length(dateArray);
durationMinutos = minutes(timeArray(end) - timeArray(1));

% 5. Calculando a frequência de piscadas por minuto
frequenciaPiscadasPorMinuto = numPiscadas / durationMinutos;

%6. Calculando os intervalos entre as piscadas
intervalos = diff(timeArray); % Calcula os intervalos de tempo

%7. Calculando a média dos intervalos
intervaloMedio = mean(intervalos);

%10. Criando um vetor de números inteiros representando a ordem das piscadas
numPiscadas = 1:length(timeArray);

%11. Plotando gráfico de Momento de Ocorrencia de Piscadas
subplot(2, 1, 1); % O primeiro gráfico
plot(timeArray, ones(size(timeArray)), 'o');
xlabel('Hora da Piscada');
ylabel('Ocorrência');
title('Gráfico de Momento de Ocorrência das Piscadas');

%12. Definindo o eixo X em intervalos de 10 segundos
timeDelta = seconds(60); % Intervalo de 10 segundos
xticks(timeArray(1):timeDelta:timeArray(end));

% 13. Adicionando informações ao gráfico
infoTexto = sprintf('Frequência Média: %.2f piscadas por minuto\nIntervalo Médio: %.2f segundos', frequenciaPiscadasPorMinuto, seconds(intervaloMedio));
text(timeArray(1), 1.1, infoTexto, 'FontSize', 10, 'VerticalAlignment', 'bottom');

% 13. Rotação dos rótulos do eixo X para melhor visualização
xtickangle(45);

% 12. Plote o segundo gráfico
subplot(2, 1, 2); % O segundo gráfico
scatter(timeArray, ones(size(timeArray)), 'o');
xlabel('Hora Exata da Piscada');
title('Gráfico de Hora Exata de Ocorrência das Piscadas');
xtickangle(45);




