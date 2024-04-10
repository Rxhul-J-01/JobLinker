function applyForJob(jobId) {
    
    alert("Applied for job with ID: " + jobId);
    
    
    var button = document.getElementById("applyButton-" + jobId);
    button.textContent = "Applied";
    
    
    button.classList.add("applied-button");
    
    button.disabled = true;
}

	const myModal = document.getElementById('myModal')
	const myInput = document.getElementById('myInput')
	
	myModal.addEventListener('shown.bs.modal', () => {
	  myInput.focus()
	})