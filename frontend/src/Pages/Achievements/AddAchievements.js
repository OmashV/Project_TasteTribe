const uploadResponse = await axios.post('http://localhost:8080/api/achievements/upload', formData, {
    headers: {
        'Content-Type': 'multipart/form-data'
    },
    withCredentials: true  // Add this line
});