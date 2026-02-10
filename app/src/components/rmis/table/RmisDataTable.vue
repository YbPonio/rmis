<template>
    <DataTable class="border border-gray-200 rounded-lg overflow-hidden">
        <Column header="Document Type"></Column>
        <Column header="Date Issued"></Column>
        <Column header="Document Series"></Column>
        <Column header="Document Number"></Column>
        <Column header="Origin"></Column>
        <Column header="Effectivity"></Column>
        <Column header="Date Received"></Column>
        <Column></Column>
    </DataTable>

    <div class="card flex flex-wrap gap-6 items-center justify-between">
        <FileUpload ref="fileupload" mode="basic" name="demo[]" url="/api/upload" accept="image/*,application/pdf" :maxFileSize="1000000" @upload="onUpload" />
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
        const formData = new FormData();
        formData.append('file', fileupload.value.files[0]);
        await axios.post('/document/upload', formData);
        toast.add({ severity: 'info', summary: 'Success', detail: 'File Uploaded', life: 3000 });
    } catch (error) {
        toast.add({ severity: 'error', summary: 'Error', detail: 'File Upload Failed', life: 3000 });
    }
}

function onUpload() {
    toast.add({ severity: 'info', summary: 'Success', detail: 'File Uploaded', life: 3000 });
}
</script>

<style lang="scss" scoped></style>
