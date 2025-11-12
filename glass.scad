// ARMAÇÃO DE ÓCULOS COM LENTES REDONDAS
// Configurações personalizáveis

diametro_lente = 50;           // Diâmetro das lentes
distancia_entre_lentes = 70;   // Distância entre os centros das lentes
largura_estrutura = 6;         // Largura da estrutura que segura as lentes
comprimento_aste = 130;        // Comprimento das hastes
espessura_armacao = 5;         // Espessura do material da armação
angulo_aste = 15;              // Ângulo das hastes (graus)

// ========== CÁLCULOS DERIVADOS ==========
raio_lente = diametro_lente / 2;
raio_externo = raio_lente + largura_estrutura;

// ========== MÓDULOS PRINCIPAIS ==========

// Aro para lente
module aro_lente(centro_x) {
    color("Yellow")
    translate([centro_x, 0, 0]) {
        difference() {
            // Aro externo
            cylinder(h = espessura_armacao, r = raio_externo, center = true, $fn = 100);
            
            // Corte interno para lente
            cylinder(h = espessura_armacao + 1, r = raio_lente, center = true, $fn = 100);
        }
        color("Yellow")
        // Ponte de conexão entre aros
        if (centro_x < 0) {
            translate([raio_externo, -raio_externo, 0])
            cube([distancia_entre_lentes , 
                  largura_estrutura, espessura_armacao], center = true);
        }
    }
}

// Ponte nasal
module ponte_nasal() {
    largura_ponte = distancia_entre_lentes - diametro_lente - largura_estrutura;
    color("Yellow")
    translate([0, -raio_externo/2 + largura_estrutura/2, 0])
    cube([largura_ponte, largura_estrutura, espessura_armacao], center = true);
}

// Haste dos óculos
module haste(lado) {
    // lado: -1 para esquerda, 1 para direita
    
    x_inicio = -(distancia_entre_lentes/2 + raio_externo);
    
    angulo = 180;
color("Yellow")
    translate([x_inicio, 0, 0])
    rotate([0, 0, 0])
        
    cube([ espessura_armacao,largura_estrutura, comprimento_aste], center = false);
}
module haste2(lado) {
    // lado: -1 para esquerda, 1 para direita
    
    x_inicio = -(-distancia_entre_lentes+espessura_armacao+(largura_estrutura/2) );
    
    angulo = 180;
color("Yellow")
    translate([x_inicio, -largura_estrutura/2, 0])
    rotate([0, 0, 0])
    
    
    cube([ espessura_armacao,largura_estrutura, comprimento_aste], center = false);
}

// Sistema de dobradiça (opcional)
module dobradica(lado) {
    x_pos = lado * (distancia_entre_lentes/2 + raio_externo);
    color("Yellow")
    translate([x_pos, 0, 0])
    rotate([0, 90, 0])
    cylinder(h = largura_estrutura * 2, r = 2, center = true, $fn = 30);
}

// ========== MONTAGEM FINAL ==========
union() {
    // Aro esquerdo
    aro_lente(-distancia_entre_lentes/2);
    
    // Aro direito
    aro_lente(distancia_entre_lentes/2);
    
    // Ponte nasal
    ponte_nasal();
    
    // Hastes
    haste(-1); // Haste esquerda
    haste2(1);  // Haste direita
    
    // Dobradiças
    dobradica(-1);
    dobradica(1);
}

// ========== VISUALIZAÇÃO DAS LENTES ==========
// Lente esquerda (visualização)
/*
translate([-distancia_entre_lentes/2, 0, 0])
color("Yellow", 0.3)
cylinder(h = 1, r = raio_lente, center = true, $fn = 100);
*/
// Lente direita (visualização)
/*
translate([distancia_entre_lentes/2, 0, 0])
color("Yellow", 0.3)
cylinder(h = 1, r = raio_lente, center = true, $fn = 100);
*/
// ========== INFORMAÇÕES TÉCNICAS ==========
echo("=== ESPECIFICAÇÕES DOS ÓCULOS ===");
echo(str("Diâmetro das lentes: ", diametro_lente, "mm"));
echo(str("Distância entre lentes: ", distancia_entre_lentes, "mm"));
echo(str("Largura da estrutura: ", largura_estrutura, "mm"));
echo(str("Comprimento das hastes: ", comprimento_aste, "mm"));

/*
INSTRUÇÕES DE USO E PERSONALIZAÇÃO:

1. PERSONALIZAÇÃO:
   - Ajuste 'diametro_lente' para o tamanho das suas lentes
   - Modifique 'distancia_entre_lentes' para sua distância interpupilar
   - Altere 'comprimento_aste' para hastes mais longas/curtas
   - Ajuste 'angulo_aste' para melhor encaixe atrás da orelha

2. IMPRESSÃO 3D:
   - Imprima com a parte frontal na cama
   - Use preenchimento de 20-25%
   - Velocidade moderada para detalhes precisos

3. MONTAGEM:
   - Cole as lentes nos aros
   - Aqueça as hastes para ajuste personalizado
   - Adicione plaquetas nas pontas das hastes para conforto

DICAS:
- Para óculos de sol, aumente 'espessura_armacao' para 6-7mm
- Para lentes de grau, verifique o diâmetro exato com seu oftalmologista
- Para melhor ajuste, imprima em nylon ou PETG flexível
*/