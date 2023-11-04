#include "TimerOne.h"
#include "Mouse.h"
#define ON true
#define OFF false
#define SENSIBILIDADE 30
#define TEMPO_DWELL_CICK_MS 1000
#define DWELL_CICK false
//
void maquinaBordas(void);
void MaquinaPiscadas(void);
void MaquinaAcao(void);
unsigned long calculaMedia(void);
long calculaDerivada(void);
void SalvarPiscada(int valorPicoDerivadaP, int valorPicoDerivadaN, int tempoEntrePicos);
void CalibrarPiscada(void);
void dwellClick(int x, int y, int s) ;
void inicializaRTC();
void inicializaSD();
void printaESalvaPiscadas();
void eyeBlinkSetup() ;
void callback();
void eyeBlinkRefresh();
void acionadorPiscadaAcionamentoRele(bool on_off) ;
void AcionadorPiscada_acionamentoBuzzer(bool on_off) ;
void acionadorPiscadaRefresh();
void maquinaMedias(void) ;