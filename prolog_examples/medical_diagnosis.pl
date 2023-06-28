% Facts about respiratory diseases
disease(asthma).
disease(bronchitis).
disease(pneumonia).

% Symptoms of respiratory diseases
symptom(patient1, shortness_of_breath).
symptom(patient1, wheezing).
symptom(patient2, cough).
symptom(patient2, chest_pain).
symptom(patient3, fever).
symptom(patient3, cough).
symptom(patient4, chest_pain).

% Treatment recommendations for respiratory diseases
treatment(asthma, inhalers).
treatment(bronchitis, antibiotics).
treatment(pneumonia, antibiotics).

% Rule: If a patient has shortness of breath and wheezing, it may indicate asthma
diagnosis(X, asthma) :-
    symptom(X, shortness_of_breath),
    symptom(X, wheezing).

% Rule: If a patient has a cough and chest pain, it may indicate bronchitis
diagnosis(X, bronchitis) :-
    symptom(X, cough),
    symptom(X, chest_pain).

% Rule: If a patient has a fever, cough, and chest pain, it may indicate pneumonia
diagnosis(X, pneumonia) :-
    symptom(X, fever),
    symptom(X, cough),
    symptom(X, chest_pain).


% To run the program
% ?- diagnosis(patient1, Disease).
% ?- treatment(Disease, Treatment).
