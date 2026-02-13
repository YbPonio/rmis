<template>
    <div class="card flex flex-wrap gap-6 items-center justify-between">
        <FileUpload ref="fileupload" mode="basic" accept="image/*,application/pdf" :maxFileSize="500000000" />
        <Button label="Upload" @click="upload" severity="secondary" />
    </div>
</template>

<script setup>
import axios from 'axios';
import { useToast } from 'primevue';
import { ref } from 'vue';

let fileupload = ref(null);
let toast = useToast();

async function upload() {
    try {
        let formData = new FormData();
        formData.append('file', fileupload.value.files[0]);
        await axios.post('/document/upload', formData);
        toast.add({ severity: 'info', summary: 'Success', detail: 'File Uploaded', life: 3000 });
    } catch (error) {
        toast.add({ severity: 'error', summary: 'Error', detail: 'File Upload Failed', life: 3000 });
    }
}
</script>

<style lang="scss" scoped></style>
