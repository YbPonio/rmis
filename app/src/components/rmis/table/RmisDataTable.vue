<template>
    <div class="flex flex-row gap-3 bg-red-100 p-4 mb-3">
        <IconField>
            <InputIcon class="pi pi-search" />
            <InputText  placeholder="Search" />
        </IconField>

        <div class="ml-auto">
            <Button icon="pi pi-plus" label="Upload" />
        </div>
    </div>

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
</template>

<script setup></script>

<style lang="scss" scoped></style>
