const express = require('express')

const app = express()

app.use(express.json())

const router = express.Router()

router.get('/',(req,res)=>{
  res.status(200).json({msg:'success'})
})

app.use(router)

app.listen(3333,()=>{
  console.log("Hello nerd, I'm running on port 3333")
})