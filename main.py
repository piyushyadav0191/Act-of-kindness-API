from fastapi import FastAPI
from model import kindness_model
from db import kindness
import random

app = FastAPI()

@app.get("/random")
async def random_compliment():
    return random.choice(kindness.acts)

@app.get("/create-act")
async def create_act(act: kindness_model.ActOfKindness):
    kindness.acts.append(act.act)
    return act.act

@app.put("/update-act/{act_id}")
def update_act(act_id, updated_data):
  for i, act in enumerate(kindness):
    if act["id"] == id:
      kindness[i] = {**act, **updated_data}  
      return kindness[i]
  return None 