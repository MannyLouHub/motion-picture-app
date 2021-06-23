<template>
  <div class="container">
    <div class="d-flex justify-content-end">
      <b-button class="btn btn-success" v-b-modal.modal-1>Add</b-button>
    </div>
    <table class="table table-striped">
      <thead>
      <tr>
        <th> Name</th>
        <th> Description</th>
        <th> Release</th>
        <th> Actions</th>
      </tr>
      </thead>
      <tbody>
      <tr v-for="(item, index) in tableInfo" :key="index">
        <td v-if="item.editMode">
          <b-form-input v-model="item.name" maxlength="50"/>
        </td>
        <td v-if="!item.editMode"> {{ item.name }}</td>

        <td v-if="item.editMode">
          <b-form-textarea  v-model="item.description" maxlength="500"/>
        </td>
        <td v-if="!item.editMode"> {{ item.description }}</td>

        <td v-if="item.editMode">
          <b-form-input v-model="item.releaseYear" maxlength="4"/>
        </td>
        <td v-if="!item.editMode"> {{ item.releaseYear }} </td>

        <td>
          <div class="btn-group">
            <button class="btn btn-dark btn-sm" v-if="item.editMode" @click="saveEdit(item.id)">
              save
            </button>
            <button class="btn btn-dark btn-sm" v-if="!item.editMode" @click="toggleEdit(item.id)">
              edit
            </button>

            <button class="btn btn-light btn-sm" v-if="item.editMode" @click="cancelEdit(item.id)">
              cancel
            </button>

            <button class="btn btn-light btn-sm" v-if="!item.editMode" :id="item.id" @click="deletePost(item.id)">
              delete
            </button>
          </div>
        </td>

      </tr>
      </tbody>
    </table>
    <div>

      <b-modal id="modal-1" title="Add new movie"
               @ok="putPost($refs.name.value, $refs.description.value, $refs.release.value)">
        <div class="form-group">
          <div>
            <label for="name">Name</label>
            <b-form-input id="name" name="name" ref="name" maxlength="50"/>
          </div>
          <div>
            <label for="description">Description</label>
            <b-form-textarea  id="description" name="description" ref="description" maxlength="500"/>
          </div>
          <div>
            <label for="release">Release Year</label>
            <b-form-input id="release" name="release" ref="release" maxlength="4"/>
          </div>
        </div>
      </b-modal>
    </div>
  </div>
</template>

<script>


const items = [];
console.log(items);


export default {

  data() {
    return {
      tableInfo: [],
      temp: {},
    }
  },
  created() {
    this.getInfoDb();
  },
  methods: {
    async getInfoDb() {
      const response = await fetch('http://localhost:5000/MotionPicture')
      const data = await response.json();
      this.tableInfo = data.map(x => {
        x.editMode = false;
        return x;
      });
      console.log(data);
      // console.log('hello')
      // await tableData(data);
    },
    example(itemId) {
      console.log(itemId);
    },
    async deletePost(id) {
      const result = await fetch(`http://localhost:5000/MotionPicture?id=${id}`, {method: 'DELETE'})
      const data = await result.json();
      console.log('Delete Successful')
      if (data) {
        this.tableInfo = this.tableInfo.filter(x => x.id !== id);
      }
      console.log(data);
    },
    async putPost(name, description, releaseYear) {
      const result = await fetch(`http://localhost:5000/MotionPicture?&name=${name}&description=${description}&releaseYear=${releaseYear}`, {method: 'PUT'})
      const data = await result.json();
      console.log('Posted Successful')
      console.log(data);
      this.tableInfo.push(data);
      // console.log(name)
      // console.log(description)
      // console.log(releaseYear)
    },
    async updatePost(id, name, description, releaseYear) {
      const result = await fetch(`http://localhost:5000/MotionPicture?id=${id}&name=${name}&description=${description}&releaseYear=${releaseYear}`, {method: 'POST'})
      const data = await result.json();
      console.log('Updated Successful')
      console.log(data);
    },
    toggleEdit(id) {
      const record = this.tableInfo.find(x => x.id === id);
      this.temp[record.id] = {...record};
      record.editMode = true;
    },
    async saveEdit(id) {
      const record = this.tableInfo.find(x => x.id === id);
      await this.updatePost(record.id, record.name, record.description, record.releaseYear)
      record.editMode = false;
    },
    cancelEdit(id) {
      const record = this.tableInfo.find(x => x.id === id);
      Object.assign(record, this.temp[record.id]);
      record.editMode = false;
    },
  },
  name: "Table"
}
</script>

<style scoped>

</style>