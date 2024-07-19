from datetime import datetime
from firebase_functions import https_fn, options, firestore_fn
from firebase_admin import initialize_app, firestore

initialize_app()

@https_fn.on_request(timeout_sec=300, memory=options.MemoryOption.GB_1)
def send_message(req: https_fn.Request) -> https_fn.Response:
    word = req.args.get("word")
    if not word:
        return https_fn.Response("No context provided", status=400)
    
    db = firestore.client()
    db.collection("messages").add({
        "text": word,
        "type": "word",
        "createdBy": "user",
        "timestamp": datetime.now()
        })
    return https_fn.Response("success")

@firestore_fn.on_document_created(document="messages/{message_id}", timeout_sec=300, memory=options.MemoryOption.GB_1)
def create_story(event: firestore_fn.DocumentSnapshot | None) -> None:
    if event.data is None:
        return
    
    if event.data.get("createdBy") == "user":
        word = event.data.get("text")

        story_message = get_story(word)

        db = firestore.client()
        db.collection("messages").add({
            "text": story_message,
            "type": "story",
            "createdBy": "app",
            "timestamp": datetime.now()
            })

def get_story(word: str) -> str:
    if word == "perro":
        return "El perro callejero, huesos salientes y ojos tristes, buscaba comida entre escombros. Una niña, de la mano de su madre, lo vio y le ofreció un trozo de pan. El perro, con la cola moviéndose lentamente, aceptó el gesto con gratitud, encontrando un destello de esperanza en aquel acto de bondad."
    elif word == "astronauta":
        return "El astronauta flotaba en la vastedad del espacio, mirando la Tierra como una joya brillante. Su nave había perdido contacto; era su última misión. Recordó a su familia, sus sueños, y sonrió. Se sentía en paz, sabiendo que había explorado lo desconocido y dejado una huella en las estrellas."
    else:
        return "En la ciudad nocturna, neón parpadeante y calles llenas de historias entrelazadas, un solitario músico callejero tocaba su guitarra bajo la luz de un farol. Los transeúntes apresurados apenas lo notaban, pero su melodía resonaba en el corazón de aquellos que se detenían a escuchar entre el bullicio urbano."