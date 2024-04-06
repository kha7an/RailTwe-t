// Функция для обработки изменения файла аватара
function handleAvatarChange(event) {
    const avatarFile = event.target.files[0];
    sessionStorage.setItem('avatar', avatarFile); // Сохраняем файл в sessionStorage
}

// Функция для отправки файла аватара на сервер
async function handleAvatarSubmit(event) {
    event.preventDefault();
    const avatarFile = sessionStorage.getItem('avatar');
    if (!avatarFile) return;

    const formData = new FormData();
    formData.append("avatar", avatarFile);

    try {
        const response = await fetch(`/users/${user.id}`, {
            method: "PATCH",
            body: formData,
        });

        if (response.ok) {
            console.log("Avatar uploaded successfully!");
        } else {
            console.error("Failed to upload avatar.");
        }
    } catch (error) {
        console.error("Error occurred while uploading avatar:", error);
    }
}
