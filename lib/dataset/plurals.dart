enum Plurals {
  p0('přátelé','přátel','přátelům','přátele','přátelé','přátelích','přáteli', true, false),
  p1('nepřátelé','nepřátel','nepřátelům','nepřátele','nepřátelé','nepřátelích','nepřáteli', false, false),
  p2('snílci','snílků','snílkům','snílky','snílci','snílcích','snílky', true, false),
  p3('hrdinové','hrdinů','hrdinům','hrdiny','hrdinové','hrdinech','hrdiny', true, false),
  p4('zbabělci','zbabělců','zbabělcům','zbabělce','zbabělci','zbabělcích','zbabělci', false, false),
  p5('pokrytci','pokrytců','pokrytcům','pokrytce','pokrytci','pokrytcích','pokrytci', false, false),
  p6('muži','mužů','mužům','muže','muži','mužích','muži', true, true),
  p7('ženy','žen','ženám','ženy','ženy','ženách','ženami', true, true),
  p8('děti','dětí','dětěm','děti','děti','dětech','dětmi', true, true),
  p9('rytíři','rytířů','rytířům','rytíře','rytíři','rytířích','rytíři', true, false),
  p10('alkoholici','alkoholiků','alkoholikům','alkoholiky','alkoholici','alkoholicích','alkoholiky', false, true),
  p11('hlupáci','hlupáků','hlupákům','hlupáky','hlupáci','hlupácích','hlupáky', false, false),
  p12('cizinci','cizinců','cizincům','cizince','cizinci','cizincích','cizinci', false, true),
  p13('smolaři','smolařů','smolařům','smolaře','smolaři','smolařích','smolaři', false, false),
  p14('vrazi','vrahů','vrahům','vrahy','vrazi','vrazích','vrahy', false, true),
  p15('byrokraté','byrokratů','byrokratům','byrokraty','byrokraté','byrokratech','byrokraty', false, false),
  p16('blázni','bláznů','bláznům','blázny','blázni','bláznech','blázny', false, false),
  p17('milenci','milenců','milencům','milence','milenci','milencích','milenci', true, false),
  p18('psychopati','psychopatů','psychopatům','psychopaty','psychopati','psychopatech','psychopaty', false, true),
  p19('kapitalisti','kapitalistů','kapitalistům','kapitalisty','kapitalisti','kapitalistech','kapitalisty', false, true),
  p20('blíženci','blíženců','blížencům','blížence','blíženci','blížencích','blíženci', true, false),
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
  const Plurals(
      this.c1, this.c2, this.c3, this.c4, this.c5, this.c6, this.c7,
      this.positive, this.controversial
      );

}
