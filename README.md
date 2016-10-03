## What

Create your own cannabis store/processor/farm name based on existing ones.

## Development


### Api

Install:
Clone and

```bash
$ cd core
$ pip install -r requirements.txt
```

With the generate functions:

```python
from generate import new_store
new_store()  # -> "Some Fake Store Name"

```

As a `faker` factory, with `factory_boy`

```python
import factory
from providers import CannabisProvider

factory.Faker.add_provider(CannabisProvider)

class FirmFactory(factory.Factory):

    class Meta:
        model = Firm

    name = factory.Faker('store')
```

As a HTTP api

```bash
$ python server.py
```

### Frontend

Install Elm with `npm`

```bash
$ npm install -g elm
```

Then just run it with

```bash
$ cd web
$ elm reactor
```
