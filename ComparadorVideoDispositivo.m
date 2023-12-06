% Lendo arquivo Coleta1_P1.txt
filename1 = 'ColetaN.txt'; 
fileID1 = fopen(filename1, 'r');

% Verificando se o arquivo 1 está vazio
if fileID1 == -1
    disp('Arquivo 1 está vazio.');
    validEntries1 = false(0, 1);  % Criando um vetor lógico vazio
    dateTimeArray1 = datetime([], 'InputFormat', 'yyyy/MM/dd HH:mm:ss.SSS');
else
    fileContents1 = fscanf(fileID1, '%c', inf);
    fclose(fileID1);

    % Extraindo datas e horas do arquivo Coleta1_P1.txt
    dateTimePattern1 = '\d{4}/\d{1,2}/\d{1,2} \d{1,2}:\d{1,2}:\d{1,2}\.\d{1,3}';
    dateTimeMatches1 = regexp(fileContents1, dateTimePattern1, 'match');

    % Convertendo datas e horas para matrizes de data e hora
    dateTimeArray1 = datetime(dateTimeMatches1, 'InputFormat', 'yyyy/MM/dd HH:mm:ss.SSS');

    % Calculando a duração total do registro
    validEntries1 = ~isnat(dateTimeArray1);

    % Exibindo o número de entradas válidas
    disp(['Número de entradas válidas : ', num2str(sum(validEntries1))]);
end

% Restante do código (arquivo 2)
filename2 = 'ColetaVideo.txt'; 
fid = fopen(filename2, 'r');
data = textscan(fid, '%f %s', 'Delimiter', ' ');
fclose(fid);

% Extraindo dados do arquivo Coleta1Retina38mm150216.txt
ordemPiscadas2 = data{1};
horaPiscadas2 = data{2};

% Convertendo as horas para o formato de data e hora
dateTimeArray2 = datetime(horaPiscadas2, 'InputFormat', 'HH:mm:ss.SSS');

% Criando um vetor constante para o eixo Y
yConstant2 = ones(size(ordemPiscadas2));

% Plotando os dados em um único gráfico
figure;

subplot(2, 1, 1);
scatter(dateTimeArray1(validEntries1), ones(sum(validEntries1), 1), 'o');
xlabel('Hora Exata da Piscada');
ylabel('Ocorrência');
title('Gráfico de Hora Exata de Ocorrência das Piscadas');

ax1 = gca;
ax1.XTick = sort(dateTimeArray1(validEntries1));
xtickformat(ax1, 'HH:mm:ss.SSS');
xtickangle(ax1, 45);
set(ax1, 'FontSize', 5);

infoTexto1 = sprintf('Número Total de Piscadas: %d', sum(validEntries1));

% Verificando se validEntries1 não está vazio antes de acessar o primeiro elemento
if ~isempty(validEntries1)
    text(dateTimeArray1(validEntries1(1)), 1.1, infoTexto1, 'FontSize', 10, 'VerticalAlignment', 'bottom');
else
    disp('Não há entradas válidas para exibir informações no subplot 1.');
end

subplot(2, 1, 2);
scatter(dateTimeArray2, yConstant2, 'o', 'MarkerFaceColor', 'r', 'MarkerEdgeColor', 'r');
xlabel('Hora Exata da Piscada');
ylabel('Ordem de Ocorrência (constante em 1)');
title('Gráfico de Hora Exata de Ocorrência das Piscadas');

ax2 = gca;
ax2.XTick = sort(dateTimeArray2); % Certifique-se de que os rótulos estejam corretos para o segundo subplot
xtickformat(ax2, 'HH:mm:ss.SSS');
xtickangle(ax2, 45);
set(ax2, 'FontSize', 5);

infoTexto2 = sprintf('Número Total de Piscadas: %d', numel(ordemPiscadas2));
text(dateTimeArray2(1), 1.1, infoTexto2, 'FontSize', 10, 'VerticalAlignment', 'bottom');
