class DoctorPatientsController < ApplicationController


    def destroy
      doctor = Doctor.find(params[:id])
      doctor_patient = DoctorPatient.find_by(patient_id: params[:patient_id], doctor_id: doctor.id)
      doctor_patient.destroy

      redirect_to "/doctors/#{doctor.id}"
    end
end
