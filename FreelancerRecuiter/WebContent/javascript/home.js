document.getElementById("jobseeker").addEventListener('click', setCandidateLogin);
document.getElementById("recruiter").addEventListener('click', setRecruiterLogin);

let isRecruiter=0;

import {LoginForm} from './Forms.js';

function setCandidateLogin() {
	isRecruiter=0;
	console.log("CandidateLogin");
	LoginForm();
}

function setRecruiterLogin() {
	isRecruiter=1;
	console.log("RecruiterLogin");
	LoginForm();
}

export {isRecruiter};