% BD.pl
:- encoding(utf8).

% PHRASES IDEOMÁTICAS
% Con verbos
frase_idiomatica_verbo('estar en las nubes', 'be daydreaming').
frase_idiomatica_verbo('llover a cántaros', 'rain cats and dogs').
frase_idiomatica_verbo('buscar tres pies al gato', 'split hairs').
frase_idiomatica_verbo('costar un ojo de la cara', 'cost an arm and a leg').
% Sin verbos
frase_idiomatica('más vale tarde que nunca', 'better late than never').
frase_idiomatica('a lo hecho pecho', 'what is done is done').
frase_idiomatica('ojos que no ven corazón que no siente', 'out of sight out of mind').
frase_idiomatica('de tal palo tal astilla', 'like father like son').
frase_idiomatica('no todo lo que brilla es oro', 'not all that glitters is gold').

% INTERJECCIONES
interjeccion('hola', 'hellow').
interjeccion('adiós', 'goodbye').
interjeccion('gracias', 'thank you').
interjeccion('por favor', 'please').
interjeccion('lo siento', 'sorry').
interjeccion('perdón', 'excuse me').
interjeccion('eh', 'hey').
interjeccion('oye', 'listen').
interjeccion('bravo', 'bravo').
interjeccion('felicidades', 'congratulations').
interjeccion('cuidado', 'careful').
interjeccion('socorro', 'help').
interjeccion('genial', 'great').
interjeccion('increíble', 'amazing').
interjeccion('claro', 'of course').
interjeccion('exacto', 'exactly').
interjeccion('vale', 'okay').
interjeccion('vamos', 'lets go').
interjeccion('alto', 'stop').
interjeccion('excelente', 'excellent').
interjeccion('fantástico', 'fantastic').
interjeccion('maravilloso', 'wonderful').
interjeccion('perfecto', 'perfect').
interjeccion('estupendo', 'awesome').
interjeccion('impresionante', 'impressive').
interjeccion('increíble', 'incredible').
interjeccion('asombroso', 'amazing').
interjeccion('qué cosa', 'what a thing').
interjeccion('ojalá', 'i hope').
interjeccion('por supuesto', 'certainly').
interjeccion('naturalmente', 'naturally').
interjeccion('evidentemente', 'obviously').
interjeccion('definitivamente', 'definitely').
interjeccion('absolutamente', 'absolutely').
interjeccion('jamás', 'never').
interjeccion('cállate', 'shut up').
interjeccion('silencio', 'silence').
interjeccion('basta', 'enough').
interjeccion('para', 'stop').
interjeccion('detente', 'halt').
interjeccion('espera', 'wait').
interjeccion('rápido', 'quick').
interjeccion('deprisa', 'hurry').
interjeccion('vamos', 'come on').
interjeccion('ánimo', 'cheer up').
interjeccion('fuerza', 'stay strong').
interjeccion('cuídate', 'take care').
interjeccion('salud', 'bless you').
interjeccion('provecho', 'enjoy your meal').
interjeccion('felicidades', 'congratulations').
interjeccion('enhorabuena', 'congrats').
interjeccion('bien hecho', 'well done').
interjeccion('guau', 'wow').
interjeccion('uf', 'phew').
interjeccion('ay', 'ouch').
interjeccion('oh', 'oh').
interjeccion('ah', 'ah').
interjeccion('ey', 'hey').
interjeccion('epa', 'whoa').
interjeccion('ups', 'oops').
interjeccion('cuidado', 'watch out').
interjeccion('atención', 'attention').
interjeccion('alerta', 'alert').
interjeccion('peligro', 'danger').
interjeccion('fuego', 'fire').
interjeccion('auxilio', 'help').
interjeccion('socorro', 'help').
interjeccion('ladrón', 'thief').
interjeccion('policía', 'police').

% Sustantivos(español, inglés,persona, singular/plural, genero)
% Pronombres personales mas significativos
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sustantivo('yo', 'i', 'primera', 'singular', neutro).
sustantivo('tú', 'you', 'segunda', 'singular', neutro).
sustantivo('usted', 'you', 'segunda', 'singular', neutro).
sustantivo('él', 'he', 'tercera', 'singular', masculino).
sustantivo('ella', 'she', 'tercera', 'singular', femenino).
sustantivo('eso', 'it', 'tercera', 'singular', neutro).
sustantivo('ello', 'it', 'tercera', 'singular', neutro).
sustantivo('nosotros', 'we', 'primera', 'plural', masculino).
sustantivo('nosotras', 'we', 'primera', 'plural', femenino).
sustantivo('vosotros', 'you', 'segunda', 'plural', masculino).
sustantivo('vosotras', 'you', 'segunda', 'plural', femenino).
sustantivo('ustedes', 'you', 'segunda', 'plural', neutro).
sustantivo('ellos', 'they', 'tercera', 'plural', masculino).
sustantivo('ellas', 'they', 'tercera', 'plural', femenino).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

sustantivo('niño', 'boy', 'tercera', 'singular', masculino).
sustantivo('niños', 'boys', 'tercera', 'plural', masculino).
sustantivo('niña', 'girl', 'tercera', 'singular', femenino).
sustantivo('niñas', 'girls', 'tercera', 'plural', femenino).
sustantivo('hombre', 'man', 'tercera', 'singular', masculino).
sustantivo('hombres', 'men', 'tercera', 'plural', masculino).
sustantivo('mujer', 'woman', 'tercera', 'singular', femenino).
sustantivo('mujeres', 'women', 'tercera', 'plural', femenino).
sustantivo('profesor', 'teacher', 'tercera', 'singular', masculino).
sustantivo('profesores', 'teachers', 'tercera', 'plural', masculino).
sustantivo('estudiante', 'student', 'tercera', 'singular', neutro).
sustantivo('estudiantes', 'students', 'tercera', 'plural', neutro).
sustantivo('perro', 'dog', 'tercera', 'singular', masculino).
sustantivo('perros', 'dogs', 'tercera', 'plural', masculino).
sustantivo('gato', 'cat', 'tercera', 'singular', masculino).
sustantivo('gatos', 'cats', 'tercera', 'plural', masculino).
sustantivo('madre', 'mother', 'tercera', 'singular', femenino).
sustantivo('madres', 'mothers', 'tercera', 'plural', femenino).
sustantivo('padre', 'father', 'tercera', 'singular', masculino).
sustantivo('padres', 'fathers', 'tercera', 'plural', masculino).
sustantivo('hermano', 'brother', 'tercera', 'singular', masculino).
sustantivo('hermanos', 'brothers', 'tercera', 'plural', masculino).
sustantivo('hermana', 'sister', 'tercera', 'singular', femenino).
sustantivo('hermanas', 'sisters', 'tercera', 'plural', femenino).
sustantivo('amigo', 'friend', 'tercera', 'singular', masculino).
sustantivo('amigos', 'friends', 'tercera', 'plural', masculino).
sustantivo('amiga', 'friend', 'tercera', 'singular', femenino).
sustantivo('amigas', 'friends', 'tercera', 'plural', femenino).
sustantivo('familia', 'family', 'tercera', 'singular', femenino).
sustantivo('familias', 'families', 'tercera', 'plural', femenino).
sustantivo('casa', 'house', 'tercera', 'singular', femenino).
sustantivo('casas', 'houses', 'tercera', 'plural', femenino).
sustantivo('escuela', 'school', 'tercera', 'singular', femenino).
sustantivo('escuelas', 'schools', 'tercera', 'plural', femenino).
sustantivo('ciudad', 'city', 'tercera', 'singular', femenino).
sustantivo('ciudades', 'cities', 'tercera', 'plural', femenino).
sustantivo('país', 'country', 'tercera', 'singular', masculino).
sustantivo('países', 'countries', 'tercera', 'plural', masculino).
sustantivo('pueblo', 'town', 'tercera', 'singular', masculino).
sustantivo('pueblos', 'towns', 'tercera', 'plural', masculino).
sustantivo('edificio', 'building', 'tercera', 'singular', masculino).
sustantivo('edificios', 'buildings', 'tercera', 'plural', masculino).
sustantivo('mesa', 'table', 'tercera', 'singular', femenino).
sustantivo('mesas', 'tables', 'tercera', 'plural', femenino).
sustantivo('silla', 'chair', 'tercera', 'singular', femenino).
sustantivo('sillas', 'chairs', 'tercera', 'plural', femenino).
sustantivo('ventana', 'window', 'tercera', 'singular', femenino).
sustantivo('ventanas', 'windows', 'tercera', 'plural', femenino).
sustantivo('puerta', 'door', 'tercera', 'singular', femenino).
sustantivo('puertas', 'doors', 'tercera', 'plural', femenino).
sustantivo('techo', 'ceiling', 'tercera', 'singular', masculino).
sustantivo('techos', 'ceilings', 'tercera', 'plural', masculino).
sustantivo('suelo', 'floor', 'tercera', 'singular', masculino).
sustantivo('suelos', 'floors', 'tercera', 'plural', masculino).
sustantivo('libro', 'book', 'tercera', 'singular', masculino).
sustantivo('libros', 'books', 'tercera', 'plural', masculino).
sustantivo('coche', 'car', 'tercera', 'singular', masculino).
sustantivo('coches', 'cars', 'tercera', 'plural', masculino).
sustantivo('bicicleta', 'bicycle', 'tercera', 'singular', femenino).
sustantivo('bicicletas', 'bicycles', 'tercera', 'plural', femenino).
sustantivo('autobús', 'bus', 'tercera', 'singular', masculino).
sustantivo('autobuses', 'buses', 'tercera', 'plural', masculino).
sustantivo('tren', 'train', 'tercera', 'singular', masculino).
sustantivo('trenes', 'trains', 'tercera', 'plural', masculino).
sustantivo('avión', 'airplane', 'tercera', 'singular', masculino).
sustantivo('aviones', 'airplanes', 'tercera', 'plural', masculino).
sustantivo('agua', 'water', 'tercera', 'singular', femenino).
sustantivo('comida', 'food', 'tercera', 'singular', femenino).
sustantivo('pan', 'bread', 'tercera', 'singular', masculino).
sustantivo('leche', 'milk', 'tercera', 'singular', femenino).
sustantivo('carne', 'meat', 'tercera', 'singular', femenino).
sustantivo('fruta', 'fruit', 'tercera', 'singular', femenino).
sustantivo('frutas', 'fruits', 'tercera', 'plural', femenino).
sustantivo('verdura', 'vegetable', 'tercera', 'singular', femenino).
sustantivo('verduras', 'vegetables', 'tercera', 'plural', femenino).
sustantivo('trabajo', 'work', 'tercera', 'singular', masculino).
sustantivo('trabajos', 'works', 'tercera', 'plural', masculino).
sustantivo('dinero', 'money', 'tercera', 'singular', masculino).
sustantivo('tiempo', 'time', 'tercera', 'singular', masculino).
sustantivo('día', 'day', 'tercera', 'singular', masculino).
sustantivo('días', 'days', 'tercera', 'plural', masculino).
sustantivo('noche', 'night', 'tercera', 'singular', femenino).
sustantivo('noches', 'nights', 'tercera', 'plural', femenino).
sustantivo('semana', 'week', 'tercera', 'singular', femenino).
sustantivo('semanas', 'weeks', 'tercera', 'plural', femenino).
sustantivo('mes', 'month', 'tercera', 'singular', masculino).
sustantivo('meses', 'months', 'tercera', 'plural', masculino).
sustantivo('año', 'year', 'tercera', 'singular', masculino).
sustantivo('años', 'years', 'tercera', 'plural', masculino).
sustantivo('sol', 'sun', 'tercera', 'singular', masculino).
sustantivo('luna', 'moon', 'tercera', 'singular', femenino).
sustantivo('estrella', 'star', 'tercera', 'singular', femenino).
sustantivo('estrellas', 'stars', 'tercera', 'plural', femenino).
sustantivo('cielo', 'sky', 'tercera', 'singular', masculino).
sustantivo('tierra', 'earth', 'tercera', 'singular', femenino).
sustantivo('mar', 'sea', 'tercera', 'singular', masculino).
sustantivo('río', 'river', 'tercera', 'singular', masculino).
sustantivo('ríos', 'rivers', 'tercera', 'plural', masculino).
sustantivo('montaña', 'mountain', 'tercera', 'singular', femenino).
sustantivo('montañas', 'mountains', 'tercera', 'plural', femenino).
sustantivo('amor', 'love', 'tercera', 'singular', masculino).
sustantivo('vida', 'life', 'tercera', 'singular', femenino).
sustantivo('vidas', 'lives', 'tercera', 'plural', femenino).
sustantivo('muerte', 'death', 'tercera', 'singular', femenino).
sustantivo('felicidad', 'happiness', 'tercera', 'singular', femenino).
sustantivo('tristeza', 'sadness', 'tercera', 'singular', femenino).
sustantivo('miedo', 'fear', 'tercera', 'singular', masculino).
sustantivo('esperanza', 'hope', 'tercera', 'singular', femenino).
sustantivo('problema', 'problem', 'tercera', 'singular', masculino).
sustantivo('problemas', 'problems', 'tercera', 'plural', masculino).
sustantivo('solución', 'solution', 'tercera', 'singular', femenino).
sustantivo('soluciones', 'solutions', 'tercera', 'plural', femenino).
sustantivo('pregunta', 'question', 'tercera', 'singular', femenino).
sustantivo('preguntas', 'questions', 'tercera', 'plural', femenino).
sustantivo('respuesta', 'answer', 'tercera', 'singular', femenino).
sustantivo('respuestas', 'answers', 'tercera', 'plural', femenino).
sustantivo('juego', 'game', 'tercera', 'singular', masculino).
sustantivo('juegos', 'games', 'tercera', 'plural', masculino).
sustantivo('deporte', 'sport', 'tercera', 'singular', masculino).
sustantivo('deportes', 'sports', 'tercera', 'plural', masculino).
sustantivo('música', 'music', 'tercera', 'singular', femenino).
sustantivo('película', 'movie', 'tercera', 'singular', femenino).
sustantivo('películas', 'movies', 'tercera', 'plural', femenino).
sustantivo('nombre', 'name', 'tercera', 'singular', masculino).

% === VERBOS ===
% verbo(InfinitivoEsp, InfinitivoEng, [ConjugacionesEsp], [ConjugacionesEng])
verbo('ser', 'be', ['soy', 'eres', 'es', 'somos', 'sois', 'son'], ['am', 'are', 'is', 'are', 'are', 'are']).
verbo('tener', 'have', ['tengo', 'tienes', 'tiene', 'tenemos', 'tenéis', 'tienen'], ['have', 'have', 'has', 'have', 'have', 'have']).
verbo('hablar', 'speak', ['hablo', 'hablas', 'habla', 'hablamos', 'habláis', 'hablan'], ['speak', 'speak', 'speaks', 'speak', 'speak', 'speak']).
verbo('comer', 'eat', ['como', 'comes', 'come', 'comemos', 'coméis', 'comen'], ['eat', 'eat', 'eats', 'eat', 'eat', 'eat']).
verbo('beber', 'drink', ['bebo', 'bebes', 'bebe', 'bebemos', 'bebéis', 'beben'], ['drink', 'drink', 'drinks', 'drink', 'drink', 'drink']).
verbo('correr', 'run', ['corro', 'corres', 'corre', 'corremos', 'corréis', 'corren'], ['run', 'run', 'runs', 'run', 'run', 'run']).
verbo('caminar', 'walk', ['camino', 'caminas', 'camina', 'caminamos', 'camináis', 'caminan'], ['walk', 'walk', 'walks', 'walk', 'walk', 'walk']).
verbo('leer', 'read', ['leo', 'lees', 'lee', 'leemos', 'leéis', 'leen'], ['read', 'read', 'reads', 'read', 'read', 'read']).
verbo('escribir', 'write', ['escribo', 'escribes', 'escribe', 'escribimos', 'escribís', 'escriben'], ['write', 'write', 'writes', 'write', 'write', 'write']).
verbo('estudiar', 'study', ['estudio', 'estudias', 'estudia', 'estudiamos', 'estudiáis', 'estudian'], ['study', 'study', 'studies', 'study', 'study', 'study']).
verbo('trabajar', 'work', ['trabajo', 'trabajas', 'trabaja', 'trabajamos', 'trabajáis', 'trabajan'], ['work', 'work', 'works', 'work', 'work', 'work']).
verbo('vivir', 'live', ['vivo', 'vives', 'vive', 'vivimos', 'vivís', 'viven'], ['live', 'live', 'lives', 'live', 'live', 'live']).
verbo('amar', 'love', ['amo', 'amas', 'ama', 'amamos', 'amáis', 'aman'], ['love', 'love', 'loves', 'love', 'love', 'love']).
verbo('querer', 'want', ['quiero', 'quieres', 'quiere', 'queremos', 'queréis', 'quieren'], ['want', 'want', 'wants', 'want', 'want', 'want']).
verbo('poder', 'can', ['puedo', 'puedes', 'puede', 'podemos', 'podéis', 'pueden'], ['can', 'can', 'can', 'can', 'can', 'can']).
verbo('hacer', 'do', ['hago', 'haces', 'hace', 'hacemos', 'hacéis', 'hacen'], ['do', 'do', 'does', 'do', 'do', 'do']).
verbo('decir', 'say', ['digo', 'dices', 'dice', 'decimos', 'decís', 'dicen'], ['say', 'say', 'says', 'say', 'say', 'say']).
verbo('ir', 'go', ['voy', 'vas', 'va', 'vamos', 'vais', 'van'], ['go', 'go', 'goes', 'go', 'go', 'go']).
verbo('ver', 'see', ['veo', 'ves', 've', 'vemos', 'veis', 'ven'], ['see', 'see', 'sees', 'see', 'see', 'see']).
verbo('venir', 'come', ['vengo', 'vienes', 'viene', 'venimos', 'venís', 'vienen'], ['come', 'come', 'comes', 'come', 'come', 'come']).
verbo('saber', 'know', ['sé', 'sabes', 'sabe', 'sabemos', 'sabéis', 'saben'], ['know', 'know', 'knows', 'know', 'know', 'know']).
verbo('pensar', 'think', ['pienso', 'piensas', 'piensa', 'pensamos', 'pensáis', 'piensan'], ['think', 'think', 'thinks', 'think', 'think', 'think']).
verbo('mirar', 'look', ['miro', 'miras', 'mira', 'miramos', 'miráis', 'miran'], ['look', 'look', 'looks', 'look', 'look', 'look']).
verbo('usar', 'use', ['uso', 'usas', 'usa', 'usamos', 'usáis', 'usan'], ['use', 'use', 'uses', 'use', 'use', 'use']).
verbo('encontrar', 'find', ['encuentro', 'encuentras', 'encuentra', 'encontramos', 'encontráis', 'encuentran'], ['find', 'find', 'finds', 'find', 'find', 'find']).
verbo('dar', 'give', ['doy', 'das', 'da', 'damos', 'dais', 'dan'], ['give', 'give', 'gives', 'give', 'give', 'give']).
verbo('contar', 'tell', ['cuento', 'cuentas', 'cuenta', 'contamos', 'contáis', 'cuentan'], ['tell', 'tell', 'tells', 'tell', 'tell', 'tell']).
verbo('pedir', 'ask', ['pido', 'pides', 'pide', 'pedimos', 'pedís', 'piden'], ['ask', 'ask', 'asks', 'ask', 'ask', 'ask']).
verbo('parecer', 'seem', ['parezco', 'pareces', 'parece', 'parecemos', 'parecéis', 'parecen'], ['seem', 'seem', 'seems', 'seem', 'seem', 'seem']).
verbo('sentir', 'feel', ['siento', 'sientes', 'siente', 'sentimos', 'sentís', 'sienten'], ['feel', 'feel', 'feels', 'feel', 'feel', 'feel']).
verbo('tratar', 'try', ['trato', 'tratas', 'trata', 'tratamos', 'tratáis', 'tratan'], ['try', 'try', 'tries', 'try', 'try', 'try']).
verbo('dejar', 'leave', ['dejo', 'dejas', 'deja', 'dejamos', 'dejáis', 'dejan'], ['leave', 'leave', 'leaves', 'leave', 'leave', 'leave']).
verbo('llamar', 'call', ['llamo', 'llamas', 'llama', 'llamamos', 'llamáis', 'llaman'], ['call', 'call', 'calls', 'call', 'call', 'call']).
verbo('necesitar', 'need', ['necesito', 'necesitas', 'necesita', 'necesitamos', 'necesitáis', 'necesitan'], ['need', 'need', 'needs', 'need', 'need', 'need']).
verbo('cambiar', 'change', ['cambio', 'cambias', 'cambia', 'cambiamos', 'cambiáis', 'cambian'], ['change', 'change', 'changes', 'change', 'change', 'change']).
verbo('jugar', 'play', ['juego', 'juegas', 'juega', 'jugamos', 'jugáis', 'juegan'], ['play', 'play', 'plays', 'play', 'play', 'play']).
verbo('creer', 'believe', ['creo', 'crees', 'cree', 'creemos', 'creéis', 'creen'], ['believe', 'believe', 'believes', 'believe', 'believe', 'believe']).
verbo('seguir', 'follow', ['sigo', 'sigues', 'sigue', 'seguimos', 'seguís', 'siguen'], ['follow', 'follow', 'follows', 'follow', 'follow', 'follow']).
verbo('empezar', 'start', ['empiezo', 'empiezas', 'empieza', 'empezamos', 'empezáis', 'empiezan'], ['start', 'start', 'starts', 'start', 'start', 'start']).
verbo('terminar', 'finish', ['termino', 'terminas', 'termina', 'terminamos', 'termináis', 'terminan'], ['finish', 'finish', 'finishes', 'finish', 'finish', 'finish']).
verbo('entender', 'understand', ['entiendo', 'entiendes', 'entiende', 'entendemos', 'entendéis', 'entienden'], ['understand', 'understand', 'understands', 'understand', 'understand', 'understand']).
verbo('recordar', 'remember', ['recuerdo', 'recuerdas', 'recuerda', 'recordamos', 'recordáis', 'recuerdan'], ['remember', 'remember', 'remembers', 'remember', 'remember', 'remember']).
verbo('esperar', 'wait', ['espero', 'esperas', 'espera', 'esperamos', 'esperáis', 'esperan'], ['wait', 'wait', 'waits', 'wait', 'wait', 'wait']).
verbo('ayudar', 'help', ['ayudo', 'ayudas', 'ayuda', 'ayudamos', 'ayudáis', 'ayudan'], ['help', 'help', 'helps', 'help', 'help', 'help']).
verbo('mover', 'move', ['muevo', 'mueves', 'mueve', 'movemos', 'movéis', 'mueven'], ['move', 'move', 'moves', 'move', 'move', 'move']).
verbo('ganar', 'win', ['gano', 'ganas', 'gana', 'ganamos', 'ganáis', 'ganan'], ['win', 'win', 'wins', 'win', 'win', 'win']).
verbo('perder', 'lose', ['pierdo', 'pierdes', 'pierde', 'perdemos', 'perdéis', 'pierden'], ['lose', 'lose', 'loses', 'lose', 'lose', 'lose']).
verbo('comprar', 'buy', ['compro', 'compras', 'compra', 'compramos', 'compráis', 'compran'], ['buy', 'buy', 'buys', 'buy', 'buy', 'buy']).
verbo('vender', 'sell', ['vendo', 'vendes', 'vende', 'vendemos', 'vendéis', 'venden'], ['sell', 'sell', 'sells', 'sell', 'sell', 'sell']).
verbo('pagar', 'pay', ['pago', 'pagas', 'paga', 'pagamos', 'pagáis', 'pagan'], ['pay', 'pay', 'pays', 'pay', 'pay', 'pay']).
verbo('costar', 'cost', ['cuesto', 'cuestas', 'cuesta', 'costamos', 'costáis', 'cuestan'], ['cost', 'cost', 'costs', 'cost', 'cost', 'cost']).
verbo('guardar', 'save', ['guardo', 'guardas', 'guarda', 'guardamos', 'guardáis', 'guardan'], ['save', 'save', 'saves', 'save', 'save', 'save']).
verbo('abrir', 'open', ['abro', 'abres', 'abre', 'abrimos', 'abríis', 'abren'], ['open', 'open', 'opens', 'open', 'open', 'open']).
verbo('cerrar', 'close', ['cierro', 'cierras', 'cierra', 'cerramos', 'cerráis', 'cierran'], ['close', 'close', 'closes', 'close', 'close', 'close']).
verbo('levantar', 'lift', ['levanto', 'levantas', 'levanta', 'levantamos', 'levantáis', 'levantan'], ['lift', 'lift', 'lifts', 'lift', 'lift', 'lift']).
verbo('bajar', 'lower', ['bajo', 'bajas', 'baja', 'bajamos', 'bajáis', 'bajan'], ['lower', 'lower', 'lowers', 'lower', 'lower', 'lower']).
verbo('construir', 'build', ['construyo', 'construyes', 'construye', 'construimos', 'construís', 'construyen'], ['build', 'build', 'builds', 'build', 'build', 'build']).
verbo('crear', 'create', ['creo', 'creas', 'crea', 'creamos', 'creáis', 'crean'], ['create', 'create', 'creates', 'create', 'create', 'create']).
verbo('destruir', 'destroy', ['destruyo', 'destruyes', 'destruye', 'destruimos', 'destruís', 'destruyen'], ['destroy', 'destroy', 'destroys', 'destroy', 'destroy', 'destroy']).
verbo('aprender', 'learn', ['aprendo', 'aprendes', 'aprende', 'aprendemos', 'aprendéis', 'aprenden'], ['learn', 'learn', 'learns', 'learn', 'learn', 'learn']).
verbo('enseñar', 'teach', ['enseño', 'enseñas', 'enseña', 'enseñamos', 'enseñáis', 'enseñan'], ['teach', 'teach', 'teaches', 'teach', 'teach', 'teach']).
verbo('explicar', 'explain', ['explico', 'explicas', 'explica', 'explicamos', 'explicáis', 'explican'], ['explain', 'explain', 'explains', 'explain', 'explain', 'explain']).
verbo('mostrar', 'show', ['muestro', 'muestras', 'muestra', 'mostramos', 'mostráis', 'muestran'], ['show', 'show', 'shows', 'show', 'show', 'show']).
verbo('escuchar', 'listen', ['escucho', 'escuchas', 'escucha', 'escuchamos', 'escucháis', 'escuchan'], ['listen', 'listen', 'listens', 'listen', 'listen', 'listen']).
verbo('cantar', 'sing', ['canto', 'cantas', 'canta', 'cantamos', 'cantáis', 'cantan'], ['sing', 'sing', 'sings', 'sing', 'sing', 'sing']).
verbo('bailar', 'dance', ['bailo', 'bailas', 'baila', 'bailamos', 'bailáis', 'bailan'], ['dance', 'dance', 'dances', 'dance', 'dance', 'dance']).
verbo('reír', 'laugh', ['río', 'ríes', 'ríe', 'reímos', 'reís', 'ríen'], ['laugh', 'laugh', 'laughs', 'laugh', 'laugh', 'laugh']).
verbo('llorar', 'cry', ['lloro', 'lloras', 'llora', 'lloramos', 'lloráis', 'lloran'], ['cry', 'cry', 'cries', 'cry', 'cry', 'cry']).
verbo('dormir', 'sleep', ['duermo', 'duermes', 'duerme', 'dormimos', 'dormís', 'duermen'], ['sleep', 'sleep', 'sleeps', 'sleep', 'sleep', 'sleep']).
verbo('despertar', 'wake', ['despierto', 'despiertas', 'despierta', 'despertamos', 'despertáis', 'despiertan'], ['wake', 'wake', 'wakes', 'wake', 'wake', 'wake']).
verbo('cocinar', 'cook', ['cocino', 'cocinas', 'cocina', 'cocinamos', 'cocináis', 'cocinan'], ['cook', 'cook', 'cooks', 'cook', 'cook', 'cook']).
verbo('limpiar', 'clean', ['limpio', 'limpias', 'limpia', 'limpiamos', 'limpiáis', 'limpian'], ['clean', 'clean', 'cleans', 'clean', 'clean', 'clean']).
verbo('lavar', 'wash', ['lavo', 'lavas', 'lava', 'lavamos', 'laváis', 'lavan'], ['wash', 'wash', 'washes', 'wash', 'wash', 'wash']).
verbo('planchar', 'iron', ['plancho', 'planchas', 'plancha', 'planchamos', 'plancháis', 'planchan'], ['iron', 'iron', 'irons', 'iron', 'iron', 'iron']).
verbo('conducir', 'drive', ['conduzco', 'conduces', 'conduce', 'conducimos', 'conducís', 'conducen'], ['drive', 'drive', 'drives', 'drive', 'drive', 'drive']).
verbo('viajar', 'travel', ['viajo', 'viajas', 'viaja', 'viajamos', 'viajáis', 'viajan'], ['travel', 'travel', 'travels', 'travel', 'travel', 'travel']).
verbo('visitar', 'visit', ['visito', 'visitas', 'visita', 'visitamos', 'visitáis', 'visitan'], ['visit', 'visit', 'visits', 'visit', 'visit', 'visit']).
verbo('invitar', 'invite', ['invito', 'invitas', 'invita', 'invitamos', 'invitáis', 'invitan'], ['invite', 'invite', 'invites', 'invite', 'invite', 'invite']).
verbo('recibir', 'receive', ['recibo', 'recibes', 'recibe', 'recibimos', 'recibís', 'reciben'], ['receive', 'receive', 'receives', 'receive', 'receive', 'receive']).
verbo('enviar', 'send', ['envío', 'envías', 'envía', 'enviamos', 'enviáis', 'envían'], ['send', 'send', 'sends', 'send', 'send', 'send']).
verbo('llevar', 'carry', ['llevo', 'llevas', 'lleva', 'llevamos', 'lleváis', 'llevan'], ['carry', 'carry', 'carries', 'carry', 'carry', 'carry']).
verbo('traer', 'bring', ['traigo', 'traes', 'trae', 'traemos', 'traéis', 'traen'], ['bring', 'bring', 'brings', 'bring', 'bring', 'bring']).
verbo('tomar', 'take', ['tomo', 'tomas', 'toma', 'tomamos', 'tomáis', 'toman'], ['take', 'take', 'takes', 'take', 'take', 'take']).
verbo('poner', 'put', ['pongo', 'pones', 'pone', 'ponemos', 'ponéis', 'ponen'], ['put', 'put', 'puts', 'put', 'put', 'put']).
verbo('mantener', 'keep', ['mantengo', 'mantienes', 'mantiene', 'mantenemos', 'mantenéis', 'mantienen'], ['keep', 'keep', 'keeps', 'keep', 'keep', 'keep']).
verbo('permitir', 'allow', ['permito', 'permites', 'permite', 'permitimos', 'permitís', 'permiten'], ['allow', 'allow', 'allows', 'allow', 'allow', 'allow']).
verbo('evitar', 'avoid', ['evito', 'evitas', 'evita', 'evitamos', 'evitáis', 'evitan'], ['avoid', 'avoid', 'avoids', 'avoid', 'avoid', 'avoid']).
verbo('elegir', 'choose', ['elijo', 'eliges', 'elige', 'elegimos', 'elegís', 'eligen'], ['choose', 'choose', 'chooses', 'choose', 'choose', 'choose']).
verbo('decidir', 'decide', ['decido', 'decides', 'decide', 'decidimos', 'decidís', 'deciden'], ['decide', 'decide', 'decides', 'decide', 'decide', 'decide']).
verbo('buscar', 'search', ['busco', 'buscas', 'busca', 'buscamos', 'buscan', 'buscan'], ['search', 'search', 'searchs', 'search', 'search', 'search']).
verbo('dividir', 'split', ['divido', 'divides', 'divide', 'dividimos', 'dividen', 'dividen'], ['split', 'split', 'splits', 'split', 'split', 'split']).

% === ADJETIVOS CON GÉNERO Y NÚMERO ===
% adjetivo(Español, Inglés, Género, Número)

% Adjetivos invariables (terminación -e, -ista, etc.)
adjetivo('grande', 'big', masculino, singular).
adjetivo('grande', 'big', masculino, plural).
adjetivo('grande', 'big', femenino, singular).
adjetivo('grande', 'big', femenino, plural).

adjetivo('pequeño', 'small', masculino, singular).
adjetivo('pequeños', 'small', masculino, plural).
adjetivo('pequeña', 'small', femenino, singular).
adjetivo('pequeñas', 'small', femenino, plural).

adjetivo('inteligente', 'smart', masculino, singular).
adjetivo('inteligentes', 'smart', masculino, plural).
adjetivo('inteligente', 'smart', femenino, singular).
adjetivo('inteligentes', 'smart', femenino, plural).

adjetivo('bonito', 'beautiful', masculino, singular).
adjetivo('bonitos', 'beautiful', masculino, plural).
adjetivo('bonita', 'beautiful', femenino, singular).
adjetivo('bonitas', 'beautiful', femenino, plural).

adjetivo('feo', 'ugly', masculino, singular).
adjetivo('feos', 'ugly', masculino, plural).
adjetivo('fea', 'ugly', femenino, singular).
adjetivo('feas', 'ugly', femenino, plural).

adjetivo('rápido', 'fast', masculino, singular).
adjetivo('rápidos', 'fast', masculino, plural).
adjetivo('rápida', 'fast', femenino, singular).
adjetivo('rápidas', 'fast', femenino, plural).

adjetivo('lento', 'slow', masculino, singular).
adjetivo('lentos', 'slow', masculino, plural).
adjetivo('lenta', 'slow', femenino, singular).
adjetivo('lentas', 'slow', femenino, plural).

adjetivo('feliz', 'happy', masculino, singular).
adjetivo('felices', 'happy', masculino, plural).
adjetivo('feliz', 'happy', femenino, singular).
adjetivo('felices', 'happy', femenino, plural).

adjetivo('triste', 'sad', masculino, singular).
adjetivo('tristes', 'sad', masculino, plural).
adjetivo('triste', 'sad', femenino, singular).
adjetivo('tristes', 'sad', femenino, plural).

% Colores
adjetivo('rojo', 'red', masculino, singular).
adjetivo('rojos', 'red', masculino, plural).
adjetivo('roja', 'red', femenino, singular).
adjetivo('rojas', 'red', femenino, plural).
adjetivo('azul', 'blue', masculino, singular).
adjetivo('azules', 'blue', masculino, plural).
adjetivo('azul', 'blue', femenino, singular).
adjetivo('azules', 'blue', femenino, plural).
adjetivo('verde', 'green', masculino, singular).
adjetivo('verdes', 'green', masculino, plural).
adjetivo('verde', 'green', femenino, singular).
adjetivo('verdes', 'green', femenino, plural).
adjetivo('blanco', 'white', masculino, singular).
adjetivo('blancos', 'white', masculino, plural).
adjetivo('blanca', 'white', femenino, singular).
adjetivo('blancas', 'white', femenino, plural).
adjetivo('negro', 'black', masculino, singular).
adjetivo('negros', 'black', masculino, plural).
adjetivo('negra', 'black', femenino, singular).
adjetivo('negras', 'black', femenino, plural).
adjetivo('amarillo', 'yellow', masculino, singular).
adjetivo('amarillos', 'yellow', masculino, plural).
adjetivo('amarilla', 'yellow', femenino, singular).
adjetivo('amarillas', 'yellow', femenino, plural).
adjetivo('naranja', 'orange', masculino, singular).
adjetivo('naranja', 'orange', masculino, plural).
adjetivo('naranja', 'orange', femenino, singular).
adjetivo('naranja', 'orange', femenino, plural).
adjetivo('morado', 'purple', masculino, singular).
adjetivo('morados', 'purple', masculino, plural).
adjetivo('morada', 'purple', femenino, singular).
adjetivo('moradas', 'purple', femenino, plural).
adjetivo('rosado', 'pink', masculino, singular).
adjetivo('rosados', 'pink', masculino, plural).
adjetivo('rosada', 'pink', femenino, singular).
adjetivo('rosadas', 'pink', femenino, plural).
adjetivo('marrón', 'brown', masculino, singular).
adjetivo('marrones', 'brown', masculino, plural).
adjetivo('marrón', 'brown', femenino, singular).
adjetivo('marrones', 'brown', femenino, plural).
adjetivo('gris', 'gray', masculino, singular).
adjetivo('grises', 'gray', masculino, plural).
adjetivo('gris', 'gray', femenino, singular).
adjetivo('grises', 'gray', femenino, plural).

% Tamaño y forma
adjetivo('alto', 'tall', masculino, singular).
adjetivo('altos', 'tall', masculino, plural).
adjetivo('alta', 'tall', femenino, singular).
adjetivo('altas', 'tall', femenino, plural).
adjetivo('bajo', 'short', masculino, singular).
adjetivo('bajos', 'short', masculino, plural).
adjetivo('baja', 'short', femenino, singular).
adjetivo('bajas', 'short', femenino, plural).
adjetivo('largo', 'long', masculino, singular).
adjetivo('largos', 'long', masculino, plural).
adjetivo('larga', 'long', femenino, singular).
adjetivo('largas', 'long', femenino, plural).
adjetivo('corto', 'short', masculino, singular).
adjetivo('cortos', 'short', masculino, plural).
adjetivo('corta', 'short', femenino, singular).
adjetivo('cortas', 'short', femenino, plural).
adjetivo('ancho', 'wide', masculino, singular).
adjetivo('anchos', 'wide', masculino, plural).
adjetivo('ancha', 'wide', femenino, singular).
adjetivo('anchas', 'wide', femenino, plural).
adjetivo('estrecho', 'narrow', masculino, singular).
adjetivo('estrechos', 'narrow', masculino, plural).
adjetivo('estrecha', 'narrow', femenino, singular).
adjetivo('estrechas', 'narrow', femenino, plural).

% Continuaré con el resto de los adjetivos...
adjetivo('profundo', 'deep', masculino, singular).
adjetivo('profundos', 'deep', masculino, plural).
adjetivo('profunda', 'deep', femenino, singular).
adjetivo('profundas', 'deep', femenino, plural).

adjetivo('superficial', 'shallow', masculino, singular).
adjetivo('superficiales', 'shallow', masculino, plural).
adjetivo('superficial', 'shallow', femenino, singular).
adjetivo('superficiales', 'shallow', femenino, plural).

% Edad y tiempo
adjetivo('joven', 'young', masculino, singular).
adjetivo('jóvenes', 'young', masculino, plural).
adjetivo('joven', 'young', femenino, singular).
adjetivo('jóvenes', 'young', femenino, plural).

adjetivo('viejo', 'old', masculino, singular).
adjetivo('viejos', 'old', masculino, plural).
adjetivo('vieja', 'old', femenino, singular).
adjetivo('viejas', 'old', femenino, plural).

adjetivo('nuevo', 'new', masculino, singular).
adjetivo('nuevos', 'new', masculino, plural).
adjetivo('nueva', 'new', femenino, singular).
adjetivo('nuevas', 'new', femenino, plural).

adjetivo('moderno', 'modern', masculino, singular).
adjetivo('modernos', 'modern', masculino, plural).
adjetivo('moderna', 'modern', femenino, singular).
adjetivo('modernas', 'modern', femenino, plural).

adjetivo('antiguo', 'ancient', masculino, singular).
adjetivo('antiguos', 'ancient', masculino, plural).
adjetivo('antigua', 'ancient', femenino, singular).
adjetivo('antiguas', 'ancient', femenino, plural).

% Textura y peso
adjetivo('fuerte', 'strong', masculino, singular).
adjetivo('fuertes', 'strong', masculino, plural).
adjetivo('fuerte', 'strong', femenino, singular).
adjetivo('fuertes', 'strong', femenino, plural).

adjetivo('débil', 'weak', masculino, singular).
adjetivo('débiles', 'weak', masculino, plural).
adjetivo('débil', 'weak', femenino, singular).
adjetivo('débiles', 'weak', femenino, plural).

adjetivo('duro', 'hard', masculino, singular).
adjetivo('duros', 'hard', masculino, plural).
adjetivo('dura', 'hard', femenino, singular).
adjetivo('duras', 'hard', femenino, plural).

adjetivo('suave', 'soft', masculino, singular).
adjetivo('suaves', 'soft', masculino, plural).
adjetivo('suave', 'soft', femenino, singular).
adjetivo('suaves', 'soft', femenino, plural).

adjetivo('pesado', 'heavy', masculino, singular).
adjetivo('pesados', 'heavy', masculino, plural).
adjetivo('pesada', 'heavy', femenino, singular).
adjetivo('pesadas', 'heavy', femenino, plural).

adjetivo('ligero', 'light', masculino, singular).
adjetivo('ligeros', 'light', masculino, plural).
adjetivo('ligera', 'light', femenino, singular).
adjetivo('ligeras', 'light', femenino, plural).

% Temperatura
adjetivo('caliente', 'hot', masculino, singular).
adjetivo('calientes', 'hot', masculino, plural).
adjetivo('caliente', 'hot', femenino, singular).
adjetivo('calientes', 'hot', femenino, plural).

adjetivo('frío', 'cold', masculino, singular).
adjetivo('fríos', 'cold', masculino, plural).
adjetivo('fría', 'cold', femenino, singular).
adjetivo('frías', 'cold', femenino, plural).

adjetivo('cálido', 'warm', masculino, singular).
adjetivo('cálidos', 'warm', masculino, plural).
adjetivo('cálida', 'warm', femenino, singular).
adjetivo('cálidas', 'warm', femenino, plural).

adjetivo('fresco', 'cool', masculino, singular).
adjetivo('frescos', 'cool', masculino, plural).
adjetivo('fresca', 'cool', femenino, singular).
adjetivo('frescas', 'cool', femenino, plural).

% === ARTÍCULOS Y DETERMINANTES ===
% determinante(Español, Inglés, Número, Género, Tipo)
determinante('el', 'the', 'singular', 'masculino', 'artículo definido').
determinante('la', 'the', 'singular', 'femenino', 'artículo definido').
determinante('los', 'the', 'plural', 'masculino', 'artículo definido').
determinante('las', 'the', 'plural', 'femenino', 'artículo definido').
determinante('un', 'a', 'singular', 'masculino', 'artículo indefinido').
determinante('una', 'a', 'singular', 'femenino', 'artículo indefinido').
determinante('unos', 'some', 'plural', 'masculino', 'artículo indefinido').
determinante('unas', 'some', 'plural', 'femenino', 'artículo indefinido').

% Demostrativos
determinante('este', 'this', 'singular', 'masculino', 'demostrativo').
determinante('esta', 'this', 'singular', 'femenino', 'demostrativo').
determinante('estos', 'these', 'plural', 'masculino', 'demostrativo').
determinante('estas', 'these', 'plural', 'femenino', 'demostrativo').
determinante('ese', 'that', 'singular', 'masculino', 'demostrativo').
determinante('esa', 'that', 'singular', 'femenino', 'demostrativo').
determinante('esos', 'those', 'plural', 'masculino', 'demostrativo').
determinante('esas', 'those', 'plural', 'femenino', 'demostrativo').
determinante('aquel', 'that', 'singular', 'masculino', 'demostrativo').
determinante('aquella', 'that', 'singular', 'femenino', 'demostrativo').
determinante('aquellos', 'those', 'plural', 'masculino', 'demostrativo').
determinante('aquellas', 'those', 'plural', 'femenino', 'demostrativo').

% Posesivos
determinante('mi', 'my', 'singular', 'neutro', 'posesivo').
determinante('mis', 'my', 'plural', 'neutro', 'posesivo').
determinante('tu', 'your', 'singular', 'neutro', 'posesivo').
determinante('tus', 'your', 'plural', 'neutro', 'posesivo').
determinante('su', 'his/her/its', 'singular', 'neutro', 'posesivo').
determinante('sus', 'his/her/its', 'plural', 'neutro', 'posesivo').
determinante('nuestro', 'our', 'singular', 'masculino', 'posesivo').
determinante('nuestra', 'our', 'singular', 'femenino', 'posesivo').
determinante('nuestros', 'our', 'plural', 'masculino', 'posesivo').
determinante('nuestras', 'our', 'plural', 'femenino', 'posesivo').
determinante('vuestro', 'your', 'singular', 'masculino', 'posesivo').
determinante('vuestra', 'your', 'singular', 'femenino', 'posesivo').
determinante('vuestros', 'your', 'plural', 'masculino', 'posesivo').
determinante('vuestras', 'your', 'plural', 'femenino', 'posesivo').

% Cuantificadores
determinante('algún', 'some', 'singular', 'masculino', 'cuantificador').
determinante('alguna', 'some', 'singular', 'femenino', 'cuantificador').
determinante('algunos', 'some', 'plural', 'masculino', 'cuantificador').
determinante('algunas', 'some', 'plural', 'femenino', 'cuantificador').
determinante('ningún', 'no', 'singular', 'masculino', 'cuantificador').
determinante('ninguna', 'no', 'singular', 'femenino', 'cuantificador').
determinante('ningunos', 'no', 'plural', 'masculino', 'cuantificador').
determinante('ningunas', 'no', 'plural', 'femenino', 'cuantificador').
determinante('todo', 'all', 'singular', 'masculino', 'cuantificador').
determinante('toda', 'all', 'singular', 'femenino', 'cuantificador').
determinante('todos', 'all', 'plural', 'masculino', 'cuantificador').
determinante('todas', 'all', 'plural', 'femenino', 'cuantificador').
determinante('mucho', 'much', 'singular', 'masculino', 'cuantificador').
determinante('mucha', 'much', 'singular', 'femenino', 'cuantificador').
determinante('muchos', 'many', 'plural', 'masculino', 'cuantificador').
determinante('muchas', 'many', 'plural', 'femenino', 'cuantificador').
determinante('poco', 'little', 'singular', 'masculino', 'cuantificador').
determinante('poca', 'little', 'singular', 'femenino', 'cuantificador').
determinante('pocos', 'few', 'plural', 'masculino', 'cuantificador').
determinante('pocas', 'few', 'plural', 'femenino', 'cuantificador').
determinante('varios', 'several', 'plural', 'masculino', 'cuantificador').
determinante('varias', 'several', 'plural', 'femenino', 'cuantificador').
determinante('cada', 'each', 'singular', 'neutro', 'cuantificador').
determinante('cualquier', 'any', 'singular', 'neutro', 'cuantificador').
determinante('cualquiera', 'any', 'singular', 'neutro', 'cuantificador').

% Interrogativos
determinante('qué', 'what', 'singular', 'neutro', 'interrogativo').
determinante('cuál', 'which', 'singular', 'neutro', 'interrogativo').
determinante('cuáles', 'which', 'plural', 'neutro', 'interrogativo').
determinante('cuánto', 'how much', 'singular', 'masculino', 'interrogativo').
determinante('cuánta', 'how much', 'singular', 'femenino', 'interrogativo').
determinante('cuántos', 'how many', 'plural', 'masculino', 'interrogativo').
determinante('cuántas', 'how many', 'plural', 'femenino', 'interrogativo').

% Numerales
determinante('uno', 'one', 'singular', 'masculino', 'numeral').
determinante('una', 'one', 'singular', 'femenino', 'numeral').
determinante('dos', 'two', 'plural', 'neutro', 'numeral').
determinante('tres', 'three', 'plural', 'neutro', 'numeral').
determinante('cuatro', 'four', 'plural', 'neutro', 'numeral').
determinante('cinco', 'five', 'plural', 'neutro', 'numeral').
determinante('primero', 'first', 'singular', 'masculino', 'numeral').
determinante('primera', 'first', 'singular', 'femenino', 'numeral').
determinante('segundo', 'second', 'singular', 'masculino', 'numeral').
determinante('segunda', 'second', 'singular', 'femenino', 'numeral').


% === PRONOMBRES ===
% pronombre(Español, Inglés, Persona, Número)
pronombre('yo', 'i', 'primera', 'singular').
pronombre('tú', 'you', 'segunda', 'singular').
pronombre('él', 'he', 'tercera', 'singular').
pronombre('ella', 'she', 'tercera', 'singular').
pronombre('eso', 'it', 'tercera', 'singular').
pronombre('nosotros', 'we', 'primera', 'plural').
pronombre('nosotras', 'we', 'primera', 'plural').
pronombre('vosotros', 'you', 'segunda', 'plural').
pronombre('vosotras', 'you', 'segunda', 'plural').
pronombre('ellos', 'they', 'tercera', 'plural').
pronombre('ellas', 'they', 'tercera', 'plural').

% Pronombres reflexivos
pronombre('mí', 'me', 'primera', 'singular').
pronombre('tu', 'you', 'segunda', 'singular').
pronombre('sí', 'himself', 'tercera', 'singular').
pronombre('sí', 'herself', 'tercera', 'singular').
pronombre('sí', 'itself', 'tercera', 'singular').
pronombre('nosotros', 'ourselves', 'primera', 'plural').
pronombre('vosotros', 'yourselves', 'segunda', 'plural').
pronombre('ellos', 'themselves', 'tercera', 'plural').

% Pronombres posesivos
pronombre('mío', 'mine', 'primera', 'singular').
pronombre('tuyo', 'yours', 'segunda', 'singular').
pronombre('suyo', 'his', 'tercera', 'singular').
pronombre('suyo', 'hers', 'tercera', 'singular').
pronombre('suyo', 'its', 'tercera', 'singular').
pronombre('nuestro', 'ours', 'primera', 'plural').
pronombre('vuestro', 'yours', 'segunda', 'plural').
pronombre('suyo', 'theirs', 'tercera', 'plural').

% Pronombres demostrativos
pronombre('este', 'this', 'tercera', 'singular').
pronombre('esta', 'this', 'tercera', 'singular').
pronombre('estos', 'these', 'tercera', 'plural').
pronombre('estas', 'these', 'tercera', 'plural').
pronombre('ese', 'that', 'tercera', 'singular').
pronombre('esa', 'that', 'tercera', 'singular').
pronombre('esos', 'those', 'tercera', 'plural').
pronombre('esas', 'those', 'tercera', 'plural').
pronombre('aquel', 'that', 'tercera', 'singular').
pronombre('aquella', 'that', 'tercera', 'singular').
pronombre('aquellos', 'those', 'tercera', 'plural').
pronombre('aquellas', 'those', 'tercera', 'plural').

% Pronombres interrogativos
pronombre('qué', 'what', 'tercera', 'singular').
pronombre('quién', 'who', 'tercera', 'singular').
pronombre('quiénes', 'who', 'tercera', 'plural').
pronombre('cuál', 'which', 'tercera', 'singular').
pronombre('cuáles', 'which', 'tercera', 'plural').
pronombre('cuánto', 'how much', 'tercera', 'singular').
pronombre('cuánta', 'how much', 'tercera', 'singular').
pronombre('cuántos', 'how many', 'tercera', 'plural').
pronombre('cuántas', 'how many', 'tercera', 'plural').

% Pronombres relativos
pronombre('que', 'that', 'tercera', 'singular').
pronombre('quien', 'who', 'tercera', 'singular').
pronombre('quienes', 'who', 'tercera', 'plural').
pronombre('cuyo', 'whose', 'tercera', 'singular').
pronombre('cuya', 'whose', 'tercera', 'singular').
pronombre('cuyos', 'whose', 'tercera', 'plural').
pronombre('cuyas', 'whose', 'tercera', 'plural').

% Pronombres indefinidos
pronombre('algo', 'something', 'tercera', 'singular').
pronombre('alguien', 'someone', 'tercera', 'singular').
pronombre('nada', 'nothing', 'tercera', 'singular').
pronombre('nadie', 'nobody', 'tercera', 'singular').
pronombre('todo', 'everything', 'tercera', 'singular').
pronombre('todos', 'everyone', 'tercera', 'plural').
pronombre('otro', 'another', 'tercera', 'singular').
pronombre('otra', 'another', 'tercera', 'singular').
pronombre('otros', 'others', 'tercera', 'plural').
pronombre('otras', 'others', 'tercera', 'plural').
pronombre('mucho', 'much', 'tercera', 'singular').
pronombre('mucha', 'much', 'tercera', 'singular').
pronombre('muchos', 'many', 'tercera', 'plural').
pronombre('muchas', 'many', 'tercera', 'plural').
pronombre('poco', 'little', 'tercera', 'singular').
pronombre('poca', 'little', 'tercera', 'singular').
pronombre('pocos', 'few', 'tercera', 'plural').
pronombre('pocas', 'few', 'tercera', 'plural').
pronombre('varios', 'several', 'tercera', 'plural').
pronombre('varias', 'several', 'tercera', 'plural').

% === PREPOSICIONES ===
% preposicion(Español, Inglés)

preposicion('a', 'to').
preposicion('de', 'of').
preposicion('en', 'in').
preposicion('con', 'with').
preposicion('por', 'for').
preposicion('para', 'for').
preposicion('sobre', 'about').
preposicion('desde', 'from').
preposicion('hacia', 'towards').
preposicion('ante', 'before').
preposicion('bajo', 'under').
preposicion('cabe', 'fits').
preposicion('contra', 'against').
preposicion('entre', 'between').
preposicion('hasta', 'until').
preposicion('mediante', 'through').
preposicion('según', 'according to').
preposicion('sin', 'without').
preposicion('so', 'under').
preposicion('tras', 'after').
preposicion('durante', 'during').
preposicion('excepto', 'except').
preposicion('incluso', 'including').
preposicion('más allá de', 'beyond').
preposicion('menos', 'except').
preposicion('salvo', 'except').
preposicion('versus', 'versus').
preposicion('vía', 'via').

% Preposiciones compuestas/common phrases
preposicion('a través de', 'through').
preposicion('al lado de', 'beside').
preposicion('cerca de', 'near').
preposicion('lejos de', 'far from').
preposicion('debajo de', 'underneath').
preposicion('encima de', 'on top of').
preposicion('delante de', 'in front of').
preposicion('detrás de', 'behind').
preposicion('alrededor de', 'around').
preposicion('enfrente de', 'opposite').
preposicion('junto a', 'next to').
preposicion('fuera de', 'outside of').
preposicion('dentro de', 'inside of').
preposicion('gracias a', 'thanks to').
preposicion('a pesar de', 'despite').
preposicion('acerca de', 'about').
preposicion('además de', 'in addition to').
preposicion('antes de', 'before').
preposicion('después de', 'after').
preposicion('en lugar de', 'instead of').
preposicion('en cuanto a', 'regarding').
preposicion('con respecto a', 'regarding').
preposicion('en vez de', 'instead of').

% === ADVERBIOS ===
% adverbio(Español, Inglés)
adverbio('bien', 'well').
adverbio('mal', 'badly').
adverbio('rápidamente', 'quickly').
adverbio('lentamente', 'slowly').
adverbio('siempre', 'always').
adverbio('nunca', 'never').
adverbio('aquí', 'here').
adverbio('allá', 'there').
adverbio('ahora', 'now').
adverbio('después', 'later').
adverbio('muy', 'very').
adverbio('mucho', 'a lot').

% Adverbios de tiempo
adverbio('ayer', 'yesterday').
adverbio('hoy', 'today').
adverbio('mañana', 'tomorrow').
adverbio('pronto', 'soon').
adverbio('tarde', 'late').
adverbio('temprano', 'early').
adverbio('antes', 'before').
adverbio('actualmente', 'currently').
adverbio('recientemente', 'recently').
adverbio('finalmente', 'finally').
adverbio('inmediatamente', 'immediately').

% Adverbios de lugar
adverbio('acá', 'here').
adverbio('ahí', 'there').
adverbio('allí', 'over there').
adverbio('arriba', 'up').
adverbio('abajo', 'down').
adverbio('adelante', 'forward').
adverbio('atrás', 'back').
adverbio('cerca', 'near').
adverbio('lejos', 'far').
adverbio('dentro', 'inside').
adverbio('fuera', 'outside').
adverbio('alrededor', 'around').
adverbio('enfrente', 'in front').
adverbio('detrás', 'behind').

% Adverbios de modo
adverbio('fácilmente', 'easily').
adverbio('difícilmente', 'hardly').
adverbio('correctamente', 'correctly').
adverbio('incorrectamente', 'incorrectly').
adverbio('claramente', 'clearly').
adverbio('obviamente', 'obviously').
adverbio('seguramente', 'surely').
adverbio('probablemente', 'probably').
adverbio('posiblemente', 'possibly').
adverbio('especialmente', 'especially').
adverbio('exactamente', 'exactly').
adverbio('completamente', 'completely').
adverbio('totalmente', 'totally').
adverbio('absolutamente', 'absolutely').
adverbio('parcialmente', 'partially').
adverbio('principalmente', 'mainly').

% Adverbios de cantidad
adverbio('bastante', 'quite').
adverbio('suficiente', 'enough').
adverbio('demasiado', 'too').
adverbio('apenas', 'barely').
adverbio('aproximadamente', 'approximately').
adverbio('casi', 'almost').
adverbio('solamente', 'only').
adverbio('únicamente', 'solely').
adverbio('específicamente', 'specifically').

% Adverbios de afirmación y negación
adverbio('sí', 'yes').
adverbio('ciertamente', 'certainly').
adverbio('efectivamente', 'indeed').
adverbio('realmente', 'really').
adverbio('verdaderamente', 'truly').
adverbio('claro', 'of course').
adverbio('no', 'no').
adverbio('tampoco', 'neither').
adverbio('jamás', 'never').

% Adverbios de duda
adverbio('quizás', 'perhaps').
adverbio('tal vez', 'maybe').
adverbio('acaso', 'perhaps').

% Adverbios de orden
adverbio('primero', 'first').
adverbio('segundo', 'second').
adverbio('tercero', 'third').
adverbio('últimamente', 'lately').

% === CONJUNCIONES ===
% conjuncion(Español, Inglés)
conjuncion('y', 'and').
conjuncion('o', 'or').
conjuncion('pero', 'but').
conjuncion('porque', 'because').
conjuncion('si', 'if').
conjuncion('aunque', 'although').

% === MÁS CONJUNCIONES ===
% Conjunciones coordinantes (unen elementos del mismo nivel)
conjuncion('e', 'and'). 
conjuncion('ni', 'nor').
conjuncion('u', 'or'). 
conjuncion('mas', 'more').
conjuncion('sino', 'but').
conjuncion('sin embargo', 'however').
conjuncion('no obstante', 'nevertheless').
conjuncion('por tanto', 'therefore').
conjuncion('por consiguiente', 'consequently').
conjuncion('así que', 'so').
conjuncion('entonces', 'then').
conjuncion('luego', 'then').

% Conjunciones subordinantes (introducen oraciones subordinadas)
conjuncion('que', 'that').
conjuncion('pues', 'since').
conjuncion('como', 'as').
conjuncion('cuando', 'when').
conjuncion('mientras', 'while').
conjuncion('según', 'according').

% Locuciones conjuntivas
conjuncion('además', 'besides').
conjuncion('también', 'also').
conjuncion('incluso', 'even').
conjuncion('hasta', 'even').

signo('.', '.').
signo('?', '?').
signo('!', '!').
signo(',', ',').
signo(';', ';').
signo(':', ':').
signo('¿', '').
signo('¡', '').
signo('(', '(').
signo(')', ')').
signo('[', '[').
signo(']', ']').
signo('{', '{').
signo('}', '}').
