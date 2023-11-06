--Ejemplo insertar en Destinos
INSERT INTO `destinos`(`nombre`, `descripcion`, `imagen`, `precio`) 
VALUES (
    'Barcelona',
    '{
        "Header": 
            ["Descubre la magia de Barcelona","Arquitectura Impresionante","Cultura y Arte en cada rincón"], 
        "Text": 
            ["Bienvenido a Barcelona, la joya mediterránea de España que cautiva a viajeros con su mezcla única de arquitectura deslumbrante, cultura vibrante y playas bañadas por el sol. Esta ciudad cosmopolita es una fusión de pasado y presente, donde las callejuelas estrechas del Barrio Gótico y los modernos rascacielos se entrelazan en una danza armoniosa.","Barcelona es famosa por su arquitectura innovadora, encabezada por las obras maestras de Antoni Gaudí. La Sagrada Familia, una catedral en constante evolución, te dejará boquiabierto con sus intrincados detalles y su majestuosidad sin igual. Pasea por el Parque Güell y siente cómo te envuelve la creatividad de Gaudí en cada esquina.", "Sumérgete en la rica cultura catalana explorando los museos de renombre mundial como el Museo Picasso y el Museo Nacional de Arte de Cataluña. Las calles están impregnadas de arte callejero vibrante y el ambiente artístico es palpable en cada esquina."]
    }',
    '["barcelona.jpg", "barcelona1.jpg", "barcelona2.jpg"]', 
    90.6);

INSERT INTO `destinos`(
    `nombre`,
    `descripcion`,
    `imagen`,
    `precio`
)
VALUES(
    'Budapest',
    '{
        "Header" :
         ["Descubre la magia de Budapest","Arquitectura Impresionante","Cultura y Arte en cada rincón"],
          "Text": ["Bienvenido a Budapest, la joya mediterránea de España que cautiva a viajeros con su mezcla única de arquitectura deslumbrante, cultura vibrante y playas bañadas por el sol. Esta ciudad cosmopolita es una fusión de pasado y presente, donde las callejuelas estrechas del Barrio Gótico y los modernos rascacielos se entrelazan en una danza armoniosa.","Budapest es famosa por su arquitectura innovadora, encabezada por las obras maestras de Antoni Gaudí. La Sagrada Familia, una catedral en constante evolución, te dejará boquiabierto con sus intrincados detalles y su majestuosidad sin igual. Pasea por el Parque Güell y siente cómo te envuelve la creatividad de Gaudí en cada esquina.", "Sumérgete en la rica cultura catalana explorando los museos de renombre mundial como el Museo Picasso y el Museo Nacional de Arte de Cataluña. Las calles están impregnadas de arte callejero vibrante y el ambiente artístico es palpable en cada esquina."]
    }',
    '["budapest.jpg", "budapest1.jpg", "budapest2.jpg"]',
    105.79);

INSERT INTO `destinos`(
    `nombre`,
    `descripcion`,
    `imagen`,
    `precio`
)
VALUES(
    'Londres',
    '{
        "Header" :
         ["Descubre la Esencia de Londres","Patrimonio Arquitectónico Emblemático","La Diversidad que Define la Ciudad"],
          "Text": ["Bienvenido a Londres, la capital del Reino Unido y una de las ciudades más fascinantes del mundo. Esta metrópolis multicultural te seducirá con su rica historia, impresionante arquitectura y una energía vibrante que la convierte en un lugar único.","Londres es un crisol de estilos arquitectónicos que van desde la majestuosidad de la Torre de Londres hasta la modernidad de la Torre Shard. Pasea por el Palacio de Buckingham y maravíllate con su elegancia real, o adéntrate en el pasado en el imponente Museo Británico. La silueta de la ciudad está marcada por la fusión de lo antiguo y lo contemporáneo.", "Londres es un crisol de culturas y etnias que se refleja en su cocina, su música y su ambiente. Desde los mercados callejeros de Camden hasta los restaurantes de renombre internacional en Covent Garden, la oferta gastronómica es tan variada como los propios londinenses. Sumérgete en la rica mezcla de influencias que hacen de esta ciudad un lugar verdaderamente cosmopolita."]
    }',
    '["londres.jpg", "londres2.jpg", "londres3.jpg"]',
    97.65);

INSERT INTO `destinos`(
    `nombre`,
    `descripcion`,
    `imagen`,
    `precio`
)
VALUES(
    'Ibiza',
    '{
        "Header" :
         ["Explora el Encanto de Ibiza","Playas Paradisíacas y Atardeceres Inolvidables","Vida Nocturna en Constante Ebullición"],
          "Text": ["¡Bienvenido a Ibiza, la isla balear que te invita a vivir una experiencia única en el Mediterráneo! Con su mezcla de playas idílicas, vida nocturna vibrante y paisajes naturales impresionantes, Ibiza es un destino que cautiva a todos los que la visitan.","Ibiza es famosa por sus playas de aguas cristalinas y arenas blancas. Desde la animada playa de Bora Bora hasta las calas tranquilas como Cala Conta, cada rincón de la costa te invita a relajarte y disfrutar del sol mediterráneo. No te pierdas los mágicos atardeceres en lugares como Café del Mar, donde el cielo se tiñe de tonos cálidos y la música crea una atmósfera única.", "Ibiza es conocida como la capital mundial de la música electrónica y su vida nocturna es legendaria. Los clubes como Pacha, Amnesia y Ushuaïa atraen a DJs de renombre internacional y crean una experiencia única en la pista de baile. Las fiestas en la playa y los eventos exclusivos te sumergen en un ambiente de energía contagiosa que hace que la noche se convierta en una experiencia inolvidable."]
    }',
    '["ibiza.jpg", "ibiza2.jpg", "ibiza3.jpg"]',
    65.99);

INSERT INTO `destinos`(
`nombre`,
`descripcion`,
`imagen`,
`precio`
)
VALUES(
    'Milán',
    '{
        "Header" :
         ["Descubre el Encanto de Milán","Diseño y Moda en Cada Rincón","Gastronomía y Experiencias Culinarias"],
          "Text": ["¡Bienvenido a Milán, la capital de la moda y el diseño en Italia! Esta ciudad cosmopolita te cautivará con su combinación de historia impresionante, alta cultura y una vibrante escena contemporánea.","Milán es conocida en todo el mundo como el epicentro de la moda y el diseño. Desde las boutiques de alta costura en Quadrilatero della Moda hasta los innovadores espacios de diseño en Zona Tortona, la ciudad respira creatividad y estilo. Explora el Museo del Diseño Triennale y descubre la evolución del diseño italiano a lo largo de los años.", "La cocina milanesa es una delicia para los amantes de la buena comida. Prueba el famoso risotto alla milanese, disfruta de un auténtico cotoletta alla milanese o date un capricho con un cannoli relleno de crema pastelera. Los mercados locales como el Mercado de la Vía Fauche ofrecen una amplia variedad de productos frescos y delicias culinarias."]
    }',
    '["milan.jpg", "milan2.jpg", "milan3.jpg"]',
    108.99);

INSERT INTO `destinos`(
`nombre`,
`descripcion`,
`imagen`,
`precio`
)
VALUES(
    'París',
    '{
        "Header" :
         ["Piérdete por las calles de París","Iconos Culturales y Arquitectura Emblemática","Jardines y Espacios Verdes Encantadores"],
          "Text": ["¡Bienvenido a París, la Ciudad de la Luz y la capital del amor! Esta ciudad icónica te seducirá con su rica historia, arte impresionante y una elegancia atemporal que la convierte en un destino verdaderamente inolvidable.","París es el hogar de algunos de los monumentos más reconocidos en el mundo. Desde la majestuosidad de la Torre Eiffel hasta la imponente Catedral de Notre-Dame, cada rincón de la ciudad respira historia y esplendor arquitectónico. Pasea por los encantadores bulevares parisinos y descubre la perfecta combinación de lo antiguo y lo moderno.", "París también es conocida por sus hermosos jardines y parques, como los Jardines de Luxemburgo y el Parque de Buttes-Chaumont. Estos oasis urbanos ofrecen un refugio de tranquilidad en medio de la ciudad, perfectos para relajarse y disfrutar de la naturaleza."]
    }',
    '["paris.jpg", "paris2.jpg", "paris3.jpg"]',
    132.75);