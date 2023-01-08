enum Verbs {
  v0('žít','žij', true, false),
  v1('umírat','umírej', false, true),
  v2('milovat','miluj', true, false),
  v3('věřit','věř', true, false),
  v4('spát','spi', true, false),
  v5('platit','plať', false, true),
  v6('riskovat','riskuj', true, false),
  v7('konat','konej', true, false),
  v8('utíkat','utíkej', false, false),
  v9('bojovat','bojuj', true, false),
  v10('zhluboka dýchat','dýchej zhluboka', true, false),
  v11('zpívat','zpívej', true, false),
  v12('tančit','tanči', true, false),
  v13('plakat','plakej', false, false),
  v14('naříkat','naříkej', false, false),
  v15('snít','sni', true, false),
  v16('ničit','nič', false, true),
  v17('bdít','bdi', true, false),
  v18('doufat','doufej', true, false),
  v19('zabíjet','zabíjej', false, true),
  v20('ležet','lež', true, false),
  v21('kouřit','kuř', false, false),
  v22('pít hodně vody','pij hodně vody', false, false),
  v23('mávat','mávej', true, false),
  v24('přemýšlet','přemýšlej', true, false),
  v25('hřešit','hřeš', false, false),
  v26('litovat','lituj', false, false),
  v27('pracovat','pracuj', true, false),
  v28('vraždit','vraždi', false, true),
  v29('vařit','vař', true, false),
  v30('meditovat','medituj', true, false),
  ;

  final String c1;
  final String c2;
  final bool positive;
  final bool controversial;
  const Verbs(this.c1, this.c2, this.positive, this.controversial);
}
