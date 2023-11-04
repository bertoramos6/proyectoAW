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
VALUES('Budapest','{"Header" : ["Descubre la magia de Budapest arcelona","Arquitectura Impresionante","Cultura y Arte en cada rincón"], "Text": ["Bienvenido a Budapest, la joya mediterránea de España que cautiva a viajeros con su mezcla única de arquitectura deslumbrante, cultura vibrante y playas bañadas por el sol. Esta ciudad cosmopolita es una fusión de pasado y presente, donde las callejuelas estrechas del Barrio Gótico y los modernos rascacielos se entrelazan en una danza armoniosa.","Budapest es famosa por su arquitectura innovadora, encabezada por las obras maestras de Antoni Gaudí. La Sagrada Familia, una catedral en constante evolución, te dejará boquiabierto con sus intrincados detalles y su majestuosidad sin igual. Pasea por el Parque Güell y siente cómo te envuelve la creatividad de Gaudí en cada esquina.", "Sumérgete en la rica cultura catalana explorando los museos de renombre mundial como el Museo Picasso y el Museo Nacional de Arte de Cataluña. Las calles están impregnadas de arte callejero vibrante y el ambiente artístico es palpable en cada esquina."]}','["budapest.jpg", "budapest1.jpg", "budapest2.jpg"]',105.79);