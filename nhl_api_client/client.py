from typing import Optional

import requests


class NHLApiClient:
    _http_session: Optional[requests.Session] = None

    def __enter__(self):
        with requests.Session() as session:
            self._http_session = session
            yield self

    def __exit__(self, exc_type, exc_value, exc_traceback):
        pass
