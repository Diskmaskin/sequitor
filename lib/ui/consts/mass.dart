/* 

Calculation template maps with an absolute reference
reference = hkg = Kilogram defined in relation to Planck's constant (h)

formula: 
input * ([unit a] x [reference of a]) / ([unit b] * [reference of b])


*/

const Map<String, Map<String, dynamic>> massUnitSystems = {
  'metric': <String, dynamic>{
    'reference': 0.001, // (1 hkg / 1000) 1 hkg = 1000 g
    'units': <String, double>{
      'μg': 0.000001, // microgram
      'mg': 0.001, // milligram
      'cg': 0.01, // centigram
      'dg': 0.1, // decigram
      'g': 1, // gram
      'dag': 10, // decagram
      'hg': 100, // hectogram
      'kg': 1000, //kilogram
      'Mg': 1000000 // megagram (tonne)
    },
    'unit_description': <String, String>{
      'μg': 'microgram',
      'mg': 'milligram',
      'cg': 'centigram',
      'dg': 'decigram',
      'g': 'gram',
      'dag': 'decagram',
      'hg': 'hectogram',
      'kg': 'kilogram',
      'Mg': 'megagram / tonne'
    },
  },
  'imperial': <String, dynamic>{
    'reference': 0.45359237, // (1 hkg / 2.20462262185) 1 hkg = lb 2.2046
    'units': <String, double>{
      'gr': 0.000142857, //grain: (gr) lb 1/7000
      'dr': 0.00390625, // drachm: (dr) lb 1/256
      'oz': 0.0625, // ounce: (oz) lb 1/16
      'lb': 1, // pound: (lb)
      'st': 14, // stone: (st) lb * 14
      'qr': 28, // quarter: (qr, or qtr) lb * 28 quarter of a long hundredweight
      'cwt': 112, // hundredweight: lb * 112
      't': 2240 // ton: (imperial, or long ton) lb * 2240
    },
    'unit_description': <String, String>{
      'gr': 'grain: (gr) lb 1/7000',
      'dr': 'drachm: (dr) 1/256',
      'oz': 'ounce: (oz) lb 1/16',
      'lb': 'pound: (lb)',
      'st': 'stone: (st)',
      'qr': 'quarter: (qr, or qtr): quarter of a long hundredweight',
      'cwt': 'hundredweight: ',
      't': 'ton: (imperial, or long ton)',
    },
  },
};
