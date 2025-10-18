%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% BASE DE DATOS L�XICA - TransLog
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ToDo...
% Sustantivos(español, inglés, singular/plural, 1st-2nd-3erd-persona)
% Verbo(InfinitivoEsp, InfinitivoEng, [conjugaciones_esp], [conjugaciones_ing])
% Adjetivos([conjugaciones_esp], [conjugaciones_ing])
% Preposicion([conjugaciones_esp], [conjugaciones_ing])
% conjugaciones = [1st_s, 1st_p, 2nd_s, 2nd_p, 3rd_s, 3rd_p]

% INTERJECCIONES
interjeccion('hola', 'hello').
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

% Sustantivos (español, inglés, tipo)
% Sustantivos(español, inglés, singular/plural)
sustantivo('niño', 'boy', 'singular').
sustantivo('niños', 'boys', 'plural').
sustantivo('niña', 'girl', 'singular').
sustantivo('niñas', 'girls', 'plural').
sustantivo('hombre', 'man', 'singular').
sustantivo('hombres', 'men', 'plural').
sustantivo('mujer', 'woman', 'singular').
sustantivo('mujeres', 'women', 'plural').
sustantivo('profesor', 'teacher', 'singular').
sustantivo('profesores', 'teachers', 'plural').
sustantivo('estudiante', 'student', 'singular').
sustantivo('estudiantes', 'students', 'plural').
sustantivo('perro', 'dog', 'singular').
sustantivo('perros', 'dogs', 'plural').
sustantivo('gato', 'cat', 'singular').
sustantivo('gatos', 'cats', 'plural').
sustantivo('casa', 'house', 'singular').
sustantivo('casas', 'houses', 'plural').
sustantivo('libro', 'book', 'singular').
sustantivo('libros', 'books', 'plural').
sustantivo('escuela', 'school', 'singular').
sustantivo('escuelas', 'schools', 'plural').
sustantivo('ciudad', 'city', 'singular').
sustantivo('ciudades', 'cities', 'plural').
sustantivo('país', 'country', 'singular').
sustantivo('países', 'countries', 'plural').
sustantivo('madre', 'mother', 'singular').
sustantivo('madres', 'mothers', 'plural').
sustantivo('padre', 'father', 'singular').
sustantivo('padres', 'fathers', 'plural').
sustantivo('hermano', 'brother', 'singular').
sustantivo('hermanos', 'brothers', 'plural').
sustantivo('hermana', 'sister', 'singular').
sustantivo('hermanas', 'sisters', 'plural').
sustantivo('amigo', 'friend', 'singular').
sustantivo('amigos', 'friends', 'plural').
sustantivo('amiga', 'friend', 'singular').
sustantivo('amigas', 'friends', 'plural').
sustantivo('familia', 'family', 'singular').
sustantivo('familias', 'families', 'plural').

sustantivo('mesa', 'table', 'singular').
sustantivo('mesas', 'tables', 'plural').
sustantivo('silla', 'chair', 'singular').
sustantivo('sillas', 'chairs', 'plural').
sustantivo('ventana', 'window', 'singular').
sustantivo('ventanas', 'windows', 'plural').
sustantivo('puerta', 'door', 'singular').
sustantivo('puertas', 'doors', 'plural').
sustantivo('techo', 'ceiling', 'singular').
sustantivo('techos', 'ceilings', 'plural').
sustantivo('suelo', 'floor', 'singular').
sustantivo('suelos', 'floors', 'plural').

sustantivo('coche', 'car', 'singular').
sustantivo('coches', 'cars', 'plural').
sustantivo('bicicleta', 'bicycle', 'singular').
sustantivo('bicicletas', 'bicycles', 'plural').
sustantivo('autobús', 'bus', 'singular').
sustantivo('autobuses', 'buses', 'plural').
sustantivo('tren', 'train', 'singular').
sustantivo('trenes', 'trains', 'plural').
sustantivo('avión', 'airplane', 'singular').
sustantivo('aviones', 'airplanes', 'plural').

sustantivo('agua', 'water', 'singular').
sustantivo('comida', 'food', 'singular').
sustantivo('pan', 'bread', 'singular').
sustantivo('leche', 'milk', 'singular').
sustantivo('carne', 'meat', 'singular').
sustantivo('fruta', 'fruit', 'singular').
sustantivo('frutas', 'fruits', 'plural').
sustantivo('verdura', 'vegetable', 'singular').
sustantivo('verduras', 'vegetables', 'plural').

sustantivo('trabajo', 'work', 'singular').
sustantivo('trabajos', 'works', 'plural').
sustantivo('dinero', 'money', 'singular').
sustantivo('tiempo', 'time', 'singular').
sustantivo('día', 'day', 'singular').
sustantivo('días', 'days', 'plural').
sustantivo('noche', 'night', 'singular').
sustantivo('noches', 'nights', 'plural').
sustantivo('semana', 'week', 'singular').
sustantivo('semanas', 'weeks', 'plural').
sustantivo('mes', 'month', 'singular').
sustantivo('meses', 'months', 'plural').
sustantivo('año', 'year', 'singular').
sustantivo('años', 'years', 'plural').

sustantivo('país', 'country', 'singular').
sustantivo('países', 'countries', 'plural').
sustantivo('ciudad', 'city', 'singular').
sustantivo('ciudades', 'cities', 'plural').
sustantivo('pueblo', 'town', 'singular').
sustantivo('pueblos', 'towns', 'plural').
sustantivo('casa', 'house', 'singular').
sustantivo('casas', 'houses', 'plural').
sustantivo('edificio', 'building', 'singular').
sustantivo('edificios', 'buildings', 'plural').

sustantivo('sol', 'sun', 'singular').
sustantivo('luna', 'moon', 'singular').
sustantivo('estrella', 'star', 'singular').
sustantivo('estrellas', 'stars', 'plural').
sustantivo('cielo', 'sky', 'singular').
sustantivo('tierra', 'earth', 'singular').
sustantivo('mar', 'sea', 'singular').
sustantivo('río', 'river', 'singular').
sustantivo('ríos', 'rivers', 'plural').
sustantivo('montaña', 'mountain', 'singular').
sustantivo('montañas', 'mountains', 'plural').

sustantivo('amor', 'love', 'singular').
sustantivo('vida', 'life', 'singular').
sustantivo('vidas', 'lives', 'plural').
sustantivo('muerte', 'death', 'singular').
sustantivo('felicidad', 'happiness', 'singular').
sustantivo('tristeza', 'sadness', 'singular').
sustantivo('miedo', 'fear', 'singular').
sustantivo('esperanza', 'hope', 'singular').

sustantivo('problema', 'problem', 'singular').
sustantivo('problemas', 'problems', 'plural').
sustantivo('solución', 'solution', 'singular').
sustantivo('soluciones', 'solutions', 'plural').
sustantivo('pregunta', 'question', 'singular').
sustantivo('preguntas', 'questions', 'plural').
sustantivo('respuesta', 'answer', 'singular').
sustantivo('respuestas', 'answers', 'plural').

sustantivo('juego', 'game', 'singular').
sustantivo('juegos', 'games', 'plural').
sustantivo('deporte', 'sport', 'singular').
sustantivo('deportes', 'sports', 'plural').
sustantivo('música', 'music', 'singular').
sustantivo('película', 'movie', 'singular').
sustantivo('películas', 'movies', 'plural').
sustantivo('libro', 'book', 'singular').
sustantivo('libros', 'books', 'plural').

% === VERBOS ===
% Verbo(InfinitivoEsp, InfinitivoEng, [conjugaciones_esp], [conjugaciones_ing])
verbo('ser', 'be', ['soy', 'eres', 'es', 'somos', 'sois', 'son'], ['am', 'are', 'is', 'are']).
verbo('tener', 'have', ['tengo', 'tienes', 'tiene', 'tenemos', 'tenéis', 'tienen'], ['have']).
verbo('hablar', 'speak', ['hablo', 'hablas', 'habla', 'hablamos', 'habláis', 'hablan'], ['speak','speaks']).
verbo('comer', 'eat', ['como', 'comes', 'come', 'comemos', 'coméis', 'comen'], ['eat', 'eats']).
verbo('beber', 'drink', ['bebo', 'bebes', 'bebe', 'bebemos', 'bebéis', 'beben'], ['drink','drinks']).
verbo('correr', 'run', ['corro', 'corres', 'corre', 'corremos', 'corréis', 'corren'], ['run', 'runs']).
verbo('caminar', 'walk', ['camino', 'caminas', 'camina', 'caminamos', 'camináis', 'caminan'], ['walk', 'walks']).
verbo('leer', 'read', ['leo', 'lees', 'lee', 'leemos', 'leéis', 'leen'], ['read', 'reads']).
verbo('escribir', 'write', ['escribo', 'escribes', 'escribe', 'escribimos', 'escribís', 'escriben'], ['write', 'writes']).
verbo('estudiar', 'study', ['estudio', 'estudias', 'estudia', 'estudiamos', 'estudiáis', 'estudian'], ['study',  'studies']).
verbo('trabajar', 'work', ['trabajo', 'trabajas', 'trabaja', 'trabajamos', 'trabajáis', 'trabajan'], ['work', 'works']).
verbo('vivir', 'live', ['vivo', 'vives', 'vive', 'vivimos', 'vivís', 'viven'], ['live', 'lives']).
verbo('amar', 'love', ['amo', 'amas', 'ama', 'amamos', 'amáis', 'aman'], ['love', 'loves']).
verbo('querer', 'want', ['quiero', 'quieres', 'quiere', 'queremos', 'queréis', 'quieren'], ['want', 'wants']).
verbo('poder', 'can', ['puedo', 'puedes', 'puede', 'podemos', 'podéis', 'pueden'], ['can', 'can']).
verbo('hacer', 'do', ['hago', 'haces', 'hace', 'hacemos', 'hacéis', 'hacen'], ['do', 'does']).
verbo('decir', 'say', ['digo', 'dices', 'dice', 'decimos', 'decís', 'dicen'], ['say', 'says']).
verbo('ir', 'go', ['voy', 'vas', 'va', 'vamos', 'vais', 'van'], ['go','goes']).
verbo('ver', 'see', ['veo', 'ves', 've', 'vemos', 'veis', 'ven'], ['see', 'sees']).
verbo('venir', 'come', ['vengo', 'vienes', 'viene', 'venimos', 'venís', 'vienen'], ['come','comes']).
verbo('saber', 'know', ['sé', 'sabes', 'sabe', 'sabemos', 'sabéis', 'saben'], ['know','knows']).
verbo('pensar', 'think', ['pienso', 'piensas', 'piensa', 'pensamos', 'pensáis', 'piensan'], ['think', 'thinks']).
verbo('mirar', 'look', ['miro', 'miras', 'mira', 'miramos', 'miráis', 'miran'], ['look', 'looks']).
verbo('usar', 'use', ['uso', 'usas', 'usa', 'usamos', 'usáis', 'usan'], ['use', 'uses']).
verbo('encontrar', 'find', ['encuentro', 'encuentras', 'encuentra', 'encontramos', 'encontráis', 'encuentran'], ['find','finds']).
verbo('dar', 'give', ['doy', 'das', 'da', 'damos', 'dais', 'dan'], ['give', 'gives']).
verbo('contar', 'tell', ['cuento', 'cuentas', 'cuenta', 'contamos', 'contáis', 'cuentan'], ['tell','tells']).
verbo('pedir', 'ask', ['pido', 'pides', 'pide', 'pedimos', 'pedís', 'piden'], ['ask','asks']).
verbo('parecer', 'seem', ['parezco', 'pareces', 'parece', 'parecemos', 'parecéis', 'parecen'], ['seem','seems']).
verbo('sentir', 'feel', ['siento', 'sientes', 'siente', 'sentimos', 'sentís', 'sienten'], ['feel','feels']).
verbo('tratar', 'try', ['trato', 'tratas', 'trata', 'tratamos', 'tratáis', 'tratan'], ['try','tries']).
verbo('dejar', 'leave', ['dejo', 'dejas', 'deja', 'dejamos', 'dejáis', 'dejan'], ['leave', 'leaves']).
verbo('llamar', 'call', ['llamo', 'llamas', 'llama', 'llamamos', 'llamáis', 'llaman'], ['call','calls']).
verbo('necesitar', 'need', ['necesito', 'necesitas', 'necesita', 'necesitamos', 'necesitáis', 'necesitan'], ['need', 'needs']).
verbo('cambiar', 'change', ['cambio', 'cambias', 'cambia', 'cambiamos', 'cambiáis', 'cambian'], ['change', 'changes']).
verbo('jugar', 'play', ['juego', 'juegas', 'juega', 'jugamos', 'jugáis', 'juegan'], ['play', 'plays']).
verbo('creer', 'believe', ['creo', 'crees', 'cree', 'creemos', 'creéis', 'creen'], ['believe', 'believes']).
verbo('seguir', 'follow', ['sigo', 'sigues', 'sigue', 'seguimos', 'seguís', 'siguen'], ['follow', 'follows']).
verbo('empezar', 'start', ['empiezo', 'empiezas', 'empieza', 'empezamos', 'empezáis', 'empiezan'], ['start', 'starts']).
verbo('terminar', 'finish', ['termino', 'terminas', 'termina', 'terminamos', 'termináis', 'terminan'], ['finish', 'finishes']).
verbo('entender', 'understand', ['entiendo', 'entiendes', 'entiende', 'entendemos', 'entendéis', 'entienden'], ['understand', 'understands']).
verbo('recordar', 'remember', ['recuerdo', 'recuerdas', 'recuerda', 'recordamos', 'recordáis', 'recuerdan'], ['remember', 'remembers']).
verbo('esperar', 'wait', ['espero', 'esperas', 'espera', 'esperamos', 'esperáis', 'esperan'], ['wait','waits']).
verbo('ayudar', 'help', ['ayudo', 'ayudas', 'ayuda', 'ayudamos', 'ayudáis', 'ayudan'], [ 'help', 'helps']).
verbo('mover', 'move', ['muevo', 'mueves', 'mueve', 'movemos', 'movéis', 'mueven'], ['move', 'moves']).
verbo('ganar', 'win', ['gano', 'ganas', 'gana', 'ganamos', 'ganáis', 'ganan'], ['win', 'wins']).
verbo('perder', 'lose', ['pierdo', 'pierdes', 'pierde', 'perdemos', 'perdéis', 'pierden'], ['lose', 'loses']).
verbo('comprar', 'buy', ['compro', 'compras', 'compra', 'compramos', 'compráis', 'compran'], ['buy', 'buys']).
verbo('vender', 'sell', ['vendo', 'vendes', 'vende', 'vendemos', 'vendéis', 'venden'], ['sell', 'sells']).
verbo('pagar', 'pay', ['pago', 'pagas', 'paga', 'pagamos', 'pagáis', 'pagan'], ['pay', 'pays']).
verbo('costar', 'cost', ['cuesto', 'cuestas', 'cuesta', 'costamos', 'costáis', 'cuestan'], ['cost', 'costs']).
verbo('guardar', 'save', ['guardo', 'guardas', 'guarda', 'guardamos', 'guardáis', 'guardan'], ['save','saves']).
verbo('abrir', 'open', ['abro', 'abres', 'abre', 'abrimos', 'abríis', 'abren'], ['open', 'opens']).
verbo('cerrar', 'close', ['cierro', 'cierras', 'cierra', 'cerramos', 'cerráis', 'cierran'], ['close',  'closes']).
verbo('levantar', 'lift', ['levanto', 'levantas', 'levanta', 'levantamos', 'levantáis', 'levantan'], ['lift', 'lifts']).
verbo('bajar', 'lower', ['bajo', 'bajas', 'baja', 'bajamos', 'bajáis', 'bajan'], ['lower', 'lowers']).
verbo('construir', 'build', ['construyo', 'construyes', 'construye', 'construimos', 'construís', 'construyen'], ['build','builds']).
verbo('crear', 'create', ['creo', 'creas', 'crea', 'creamos', 'creáis', 'crean'], ['create', 'creates']).
verbo('destruir', 'destroy', ['destruyo', 'destruyes', 'destruye', 'destruimos', 'destruís', 'destruyen'], ['destroy','destroys']).
verbo('aprender', 'learn', ['aprendo', 'aprendes', 'aprende', 'aprendemos', 'aprendéis', 'aprenden'], ['learn','learns']).
verbo('enseñar', 'teach', ['enseño', 'enseñas', 'enseña', 'enseñamos', 'enseñáis', 'enseñan'], ['teach','teaches']).
verbo('explicar', 'explain', ['explico', 'explicas', 'explica', 'explicamos', 'explicáis', 'explican'], ['explain', 'explains']).
verbo('mostrar', 'show', ['muestro', 'muestras', 'muestra', 'mostramos', 'mostráis', 'muestran'], ['show', 'shows']).
verbo('escuchar', 'listen', ['escucho', 'escuchas', 'escucha', 'escuchamos', 'escucháis', 'escuchan'], ['listen', 'listens']).
verbo('cantar', 'sing', ['canto', 'cantas', 'canta', 'cantamos', 'cantáis', 'cantan'], ['sing','sings']).
verbo('bailar', 'dance', ['bailo', 'bailas', 'baila', 'bailamos', 'bailáis', 'bailan'], ['dance', 'dances']).
verbo('reír', 'laugh', ['río', 'ríes', 'ríe', 'reímos', 'reís', 'ríen'], ['laugh', 'laughs']).
verbo('llorar', 'cry', ['lloro', 'lloras', 'llora', 'lloramos', 'lloráis', 'lloran'], ['cry','cries']).
verbo('dormir', 'sleep', ['duermo', 'duermes', 'duerme', 'dormimos', 'dormís', 'duermen'], ['sleep', 'sleeps']).
verbo('despertar', 'wake', ['despierto', 'despiertas', 'despierta', 'despertamos', 'despertáis', 'despiertan'], ['wake','wakes']).
verbo('cocinar', 'cook', ['cocino', 'cocinas', 'cocina', 'cocinamos', 'cocináis', 'cocinan'], ['cook', 'cooks']).
verbo('limpiar', 'clean', ['limpio', 'limpias', 'limpia', 'limpiamos', 'limpiáis', 'limpian'], ['clean','cleans']).
verbo('lavar', 'wash', ['lavo', 'lavas', 'lava', 'lavamos', 'laváis', 'lavan'], ['wash', 'washes']).
verbo('planchar', 'iron', ['plancho', 'planchas', 'plancha', 'planchamos', 'plancháis', 'planchan'], ['iron', 'irons']).
verbo('conducir', 'drive', ['conduzco', 'conduces', 'conduce', 'conducimos', 'conducís', 'conducen'], ['drive', 'drives']).
verbo('viajar', 'travel', ['viajo', 'viajas', 'viaja', 'viajamos', 'viajáis', 'viajan'], ['travel', 'travels']).
verbo('visitar', 'visit', ['visito', 'visitas', 'visita', 'visitamos', 'visitáis', 'visitan'], ['visit', 'visits']).
verbo('invitar', 'invite', ['invito', 'invitas', 'invita', 'invitamos', 'invitáis', 'invitan'], ['invite', 'invites']).
verbo('recibir', 'receive', ['recibo', 'recibes', 'recibe', 'recibimos', 'recibís', 'reciben'], ['receive','receives']).
verbo('enviar', 'send', ['envío', 'envías', 'envía', 'enviamos', 'enviáis', 'envían'], ['send','sends']).
verbo('llevar', 'carry', ['llevo', 'llevas', 'lleva', 'llevamos', 'lleváis', 'llevan'], ['carry','carries']).
verbo('traer', 'bring', ['traigo', 'traes', 'trae', 'traemos', 'traéis', 'traen'], ['bring','brings']).
verbo('tomar', 'take', ['tomo', 'tomas', 'toma', 'tomamos', 'tomáis', 'toman'], ['take''takes']).
verbo('poner', 'put', ['pongo', 'pones', 'pone', 'ponemos', 'ponéis', 'ponen'], ['put', 'puts']).
verbo('mantener', 'keep', ['mantengo', 'mantienes', 'mantiene', 'mantenemos', 'mantenéis', 'mantienen'], ['keep','keeps']).
verbo('permitir', 'allow', ['permito', 'permites', 'permite', 'permitimos', 'permitís', 'permiten'], ['allow', 'allows']).
verbo('evitar', 'avoid', ['evito', 'evitas', 'evita', 'evitamos', 'evitáis', 'evitan'], ['avoid','avoids']).
verbo('elegir', 'choose', ['elijo', 'eliges', 'elige', 'elegimos', 'elegís', 'eligen'], ['choose', 'chooses']).
verbo('decidir', 'decide', ['decido', 'decides', 'decide', 'decidimos', 'decidís', 'deciden'], ['decide', 'decides']).

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

adjetivo('frío', 'cold', 'masculino, singular).
adjetivo('fríos', 'cold', 'masculino, plural).
adjetivo('fría', 'cold', 'femenino, singular).
adjetivo('frías', 'cold', 'femenino, plural).

adjetivo('cálido', 'warm', 'masculino, singular).
adjetivo('cálidos', 'warm', 'masculino, plural).
adjetivo('cálida', 'warm', 'femenino, singular).
adjetivo('cálidas', 'warm', 'femenino, plural).

adjetivo('fresco', 'cool', 'masculino, singular).
adjetivo('frescos', 'cool', 'masculino, plural).
adjetivo('fresca', 'cool', 'femenino, singular).
adjetivo('frescas', 'cool', 'femenino, plural).

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