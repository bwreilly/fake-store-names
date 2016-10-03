import markovify


# TODO: mix in hip hop titles
# e.g., I LIKE BIG BUDS AND I CANNOT LIE

STORE_FILE = "data/stores.txt"
PROCESSOR_FILE = "data/processors.txt"
FARM_FILE = "data/farms.txt"

OVERLAP_RATIO = 0.50
OVERLAP_TOTAL = 2

def model(file_name):
    with open(file_name) as f:
        text = f.read()
    model = markovify.NewlineText(text, state_size=1)
    return model

def new_store(**kwargs):
    m = model(STORE_FILE)
    defaults = dict(max_overlap_ratio=OVERLAP_RATIO, max_overlap_count=OVERLAP_TOTAL)
    defaults.update(kwargs)
    return m.make_short_sentence(100, tries=50, **kwargs)

def new_processor(**kwargs):
    m = model(PROCESSOR_FILE)
    defaults = dict(max_overlap_ratio=OVERLAP_RATIO, max_overlap_count=OVERLAP_TOTAL)
    defaults.update(kwargs)
    return m.make_short_sentence(100, tries=50, **kwargs)

def new_farm(**kwargs):
    m = model(FARM_FILE)
    defaults = dict(max_overlap_ratio=OVERLAP_RATIO, max_overlap_count=OVERLAP_TOTAL)
    defaults.update(kwargs)
    return m.make_short_sentence(100, tries=50, **kwargs)

def new_firm(weights=None):
    models = [
        model(STORE_FILE),
        model(PROCESSOR_FILE),
        model(FARM_FILE),
    ]
    m = markovify.combine(models, weights)
    return m.make_short_sentence(100, tries=50)
