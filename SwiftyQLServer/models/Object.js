import mongoose, { Schema } from 'mongoose'

export default mongoose.model('Object', new Schema({
  name: String
}))
