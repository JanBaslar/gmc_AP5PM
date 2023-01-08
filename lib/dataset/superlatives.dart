enum Superlatives {
  s0('nejlepší', true, false),
  s1('nejhorší', false, false),
  s2('největší', true, false),
  s3('nejmenší', false, false),
  s4('nejčistčí', true, false),
  s5('nejhloupější', false, false),
  s6('nejchytřejší', true, false),
  s7('nejsilnější', true, false),
  s8('nejkrásnější', true, false),
  s9('nejhezčí', true, false),
  s10('nejupřímnější', true, false),
  s11('nejpitomnější', false, false),
  s12('nejšťastnější', true, false),
  s13('nejsmutnější', false, false),
  s14('nejkomplikovanější', false, false),
  s15('nejdokonalejší', true, false),
  ;

  final String c1;
  final bool positive;
  final bool controversial;
  const Superlatives(this.c1, this.positive, this.controversial);
}
