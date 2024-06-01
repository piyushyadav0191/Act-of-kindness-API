from typing import Optional
from pydantic import BaseModel


class ActOfKindness(BaseModel):
    id: int
    description: str
    category: Optional[str] = None

    class Config :
        orm_mode = True
        