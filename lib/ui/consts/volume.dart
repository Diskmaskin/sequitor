/* 

Calculation template maps with an absolute reference
reference = 1 l = 1 litre (liter)

formula: 
input * ([unit a] x [reference of a]) / ([unit b] * [reference of b])


*/

const Map<String, Map<String, dynamic>> massUnitSystems = {
  'metric': <String, dynamic>{
    'reference': 1, // 1 l
    'units': <String, double>{
      'μg': 0.000001, // microlitre
      'mg': 0.001, // millilitre
      'cg': 0.01, // centilitre
      'dg': 0.1, // decilitre
      'g': 1, // litre
      'dag': 10, // decalitre
      'hg': 100, // hectolitre
      'kg': 1000, //kilolitre
      'Mg': 1000000 // megalitre
    },
    'unit_description': <String, String>{
      'μg': 'microlitre',
      'mg': 'millilitre',
      'cg': 'centilitre',
      'dg': 'decilitre',
      'g': 'litre',
      'dag': 'decalitre',
      'hg': 'hectolitre',
      'kg': 'kilolitre',
      'Mg': 'megalitre',
    },
  },
  'imperial': <String, dynamic>{
    'reference': 0.0284131,
    'units': <String, double>{
      'fl oz': 1, // fluid ounce
      'gi': 5, // gill
      'pt': 20, // pint
      'qt': 40, // quart
      'gal': 160, // gallon
    },
    'unit_description': <String, String>{
      'fl oz': 'fluid ounce: ',
      'gi': 'gill: ',
      'pt': 'pint: ',
      'qt': 'quart: ',
      'gal': 'gallon: ',
    },
  },
  'cooking': <String, dynamic>{
    'reference': 0.0295735, // 1 fl oz in cooking = 0.0295735 l
    'units': <String, double>{
      'dr': 0.001736111, // drop
      'smdg': 0.00390625, // smidgen
      'pn': 0.0078125, // pinch
      'ds': 0.015625, // dash
      'ssp': 0.03125, // saltspoon / scruple
      'csp': 0.0625, // coffeespoon
      't': 0.166666667, // teaspoon
      'dsp': 0.333333333, // dessertspoon
      'T': 0.5, // tablespoon
      'fl oz': 1, // fluid ounce
      'wgf': 2, // wineglass
      'tcf': 4, // teacup
      'C': 8, // cup
      'pot': 64 // pottle
    },
    'unit_description': <String, String>{
      'dr': 'drop',
      'smdg': 'smidgen',
      'pn': 'pinch',
      'ds': 'dash',
      'ssp': 'saltspoon / scruple',
      'csp': 'coffeespoon',
      't': 'teaspoon',
      'dsp': 'dessertspoon',
      'T': 'tablespoon',
      'fl oz': 'fluid ounce',
      'wgf': 'wineglass',
      'tcf': 'teacup',
      'C': 'cup',
      'pot': ' pottle',
    },
  },
};
