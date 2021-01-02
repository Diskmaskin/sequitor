/* 

Calculation template maps with an absolute reference
reference = 1 m = 1 metre (meter)

formula: 
input * ([unit a] x [reference of a]) / ([unit b] * [reference of b])


*/

const Map<String, Map<String, dynamic>> massUnitSystems = {
  'metric': <String, dynamic>{
    'reference': 1, // 1 m
    'units': <String, double>{
      'μm': 0.000001, // micrometre
      'mm': 0.001, // millimetre
      'cm': 0.01, // centimetre
      'dm': 0.1, // decimetre
      'm': 1, // metre
      // 'dam': 10, // decametre
      // 'hm': 100, // hectometre
      'km': 1000, //kilometre
    },
    'unit_description': <String, String>{
      'μm': 'micrometre',
      'mm': 'millimetre',
      'cm': 'centimetre',
      'dm': 'decimetre',
      'm': 'metre',
      // 'dam': 'decametre',
      // 'hm': 'hectometre',
      'km': 'kilometre',
    },
  },
  'imperial': <String, dynamic>{
    'reference': 0.3048, // 1 ft = 0.3048 m
    'units': <String, double>{
      'th': 0.000083333, // thou
      'in': 0.083333333, //inch
      'ft': 1, // foot
      'yd': 3, // yard
      'ch': 66, // chain
      'fur': 660, // furlong
      'mi': 5280, // mile
      'lea': 15840, // league
    },
    'unit_description': <String, String>{
      'th': 'thou: ',
      'in': 'inch: ',
      'ft': 'foot: ',
      'yd': 'yard: ',
      'ch': 'chain: ',
      'fur': 'furlong: ',
      'mi': 'mile: ',
      'lea': 'league: ',
    },
  },
  'astronomical': <String, dynamic>{
    'reference': 1, // Using standard metre as reference
    'units': <String, double>{
      'AU': 149597870700, // Astronomical unit
      'ly': 9460730472580800, // Light Year
      'pc': 30856775810000000 // Parsec
    },
    'unit_description': <String, String>{
      'AU':
          'Astronomical unit: (149597870700 m) Roughly the distance between the Earth and the Sun',
      'ly':
          'Light Year: The distance light travels in a vacuum in one Julian year (9460730472580800 m)',
      'pc': 'Parsec: (30856775810000000 m)'
    },
  },
};
