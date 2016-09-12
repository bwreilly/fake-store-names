## What

Create your own cannabis store/processor/farm name based on existing ones.

## How

With the generate functions:

```python
from .generate import new_store
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
