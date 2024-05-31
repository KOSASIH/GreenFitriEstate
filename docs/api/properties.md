# Properties API

## GET /api/properties

Retrieve a list of all properties.

### Response

* `200 OK`: A JSON array of property objects.

### Example

```bash
curl -X GET \
  http://localhost:8000/api/properties \
  -H 'Accept: application/json'
