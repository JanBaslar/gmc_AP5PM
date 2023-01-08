enum Nouns {
  n0('život','života','životu','život','živote','životu','životem', true, false),
  n1('smrt','smrti','smrti','smrt','smrt','smrti','smrtí', false, true),
  n2('láska','lásky','lásce','lásku','lásko','lásce','láskou', true, false),
  n3('smích','smíchu','smíchu','smích','smíche','smíchu','smíchem', true, false),
  n4('vítězství','vítězství','vítězství','vítězství','vítězství','vítězství','vítězstvím', true, false),
  n5('vášeň','vášně','vášni','vášeň','vášeň','vášni','vášní', true, false),
  n6('úspěch','úspěchu','úspěchu','úspěch','úspěche','úspěchu','úspěchem', true, false),
  n7('prohra','prohry','prohře','prohru','prohro','prohře','prohrou', false, false),
  n8('pomsta','pomsty','pomstě','pomstu','pomsto','pomstě','pomstou', false, false),
  n9('sex','sexu','sexu','sex','sexe','sexu','sexem', true, true),
  n10('vůle','vůle','vůli','vůli','vůle','vůli','vůlí', true, false),
  n11('přátelství','přátelství','přátelství','přátelství','přátelství','přátelství','přátelstvím', true, false),
  n12('kuřecí polévka','kuřecí polévky','kuřecí polévce','kuřecí polévku','kuřecí polévko','kuřecí polévce','kuřecí polévkou', true, false),
  n13('nápad','nápadu','nápadu','nápad','nápade','nápadu','nápadem', true, false),
  n14('myšlenka','myšlenky','myšlence','myšlenku','myšlenko','myšlence','myšlenkou', true, false),
  n15('moc','moci','moci','moc','moc','moci','mocí', true, false),
  n16('sebejistota','sebejistoty','sebejistotě','sebejistotu','sebejistoto','sebejistotě','sebejistotou', true, false),
  n17('pláč','pláče','pláči','pláč','pláč','pláči','pláčem', false, false),
  n18('štěstí','štěstí','štěstí','štěstí','štěstí','štěstí','štěstím', true, false),
  n19('smutek','smutku','smutku','smutek','smutku','smutku','smutkem', false, false),
  n20('deprese','deprese','depresi','depresi','deprese','depresi','depresí', false, true),
  n21('sebevražda','sebevraždy','sebevraždě','sebevraždu','sebevraždo','sebevraždě','sebevraždou', false, true),
  n22('rodina','rodiny','rodině','rodinu','rodino','rodině','rodinou', true, false),
  n23('odhodlání','odhodlání','odhodlání','odhodlání','odhodlání','odhodlání','odhodláním', true, false),
  n24('válka','války','válce','válku','válko','válce','válkou', false, true),
  n25('problém','problému','problému','problém','probléme','problému','problémem', false, false),
  n38('krása','krásy','kráse','krásu','kráso','kráse','krásou', true, false),
  n39('osud','osudu','osudu','osud','osude','osudu','osudem', true, false),
  n40('alkohol','alkoholu','alkoholu','alkohol','alkohole','alkoholu','alkoholem', false, false),
  n41('závislost','závislosti','závislosti','závislost','závislosti','závislosti','závislostí', false, true),
  n42('svoboda','svobody','svobodě','svobodu','svobodo','svobodě','svobodou', true, false),
  n43('otroctví','otroctví','otroctví','otroctví','otroctví','otroctví','otroctvím', false, true),
  n44('chyba','chyby','chybě','chybu','chybo','chybě','chybou', false, false),
  n45('hřích','hříchu','hříchu','hřích','hříche','hříchu','hříchem', false, false),
  n46('rozhřešení','rozhřešení','rozhřešení','rozhřešení','rozhřešení','rozhřešení','rozhřešením', true, false),
  n47('zrada','zrady','zradě','zradu','zrado','zradě','zradou', false, false),
  n48('zoufalství','zoufalství','zoufalství','zoufalství','zoufalství','zoufalství','zoufalstvím', false, true),
  n49('nenávist','nenávisti','nenávisti','nenávist','nenávisti','nenávisti','nenávistí', false, true),
  n50('žárlivost','žárlivosti','žárlivosti','žárlivost','žárlivost','žárlivosti','žárlivostí', false, false),
  n51('empatie','empatie','empatii','empatii','empatie','empatii','empatií', true, false),
  n52('závist', 'závisti', 'závisti', 'závist', 'závisti', 'závisti', 'závistí', false, false),
  n53('sebereflexe', 'sebereflexe', 'sebereflexi', 'sebereflexi', 'sebereflexe', 'sebereflexi', 'sebereflexí', true, false),
  n54('strach', 'strachu', 'strachu', 'strach', 'strachu', 'strachu', 'strachem', false, false),
  n55('inspirace', 'inspirace', 'inspiraci', 'inspiraci', 'inspirace', 'inspiraci', 'inspirací', true, false),
  n56('bolest', 'bolesti', 'bolesti', 'bolest', 'bolesti', 'bolesti', 'bolestí', false, true),
  n57('práce', 'práce', 'práci', 'práci', 'práce', 'práci', 'prací', true, false),
  n58('fyzické násilí', 'fyzického násilí', 'fyzickému násilí', 'fyzické násilí', 'fyzické násilí', 'fyzickém násilí', 'fyzickým násilím', false, true),
  n59('komunismus', 'komunismu', 'komunismu', 'komunismus', 'komunismus', 'komunismu', 'komunismem', false, true),
  n60('utrpení', 'utrpení', 'utrpení', 'utrpení', 'utrpení', 'utrpení', 'utrpením', false, true),
  ;

  final String c1;
  final String c2;
  final String c3;
  final String c4;
  final String c5;
  final String c6;
  final String c7;
  final bool positive;
  final bool controversial;
  const Nouns(
      this.c1, this.c2, this.c3, this.c4, this.c5, this.c6, this.c7,
      this.positive, this.controversial
      );
}
