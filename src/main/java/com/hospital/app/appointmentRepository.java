package com.hospital.app;


import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

public interface appointmentRepository extends JpaRepository<appointment,Integer> {
	
	
	List<appointment> findByDoctorName(String doctorName);
	List<appointment> findByDoctorNameAndConfirmed(String doctorName,String confirmed);
	
	
	List<appointment> findByPatientName(String patientName);
	
	@Modifying 
	@Query("update appointment a set a.confirmed = ?1 where a.appointment_id = ?2")
	int setConfirmation(String confitmation, Integer id);
	

	@Modifying 
	@Query("update appointment a set a.prescription = ?1 where a.appointment_id = ?2")
	int setPrescription(String prescription, Integer id);
	
	@Query(value="select * from appointment a where a.appointment_date =?1 AND a.doctor_name =?2", nativeQuery=true)
	List<appointment> findByDate(String date,String doctorName);
	
	@Query(value="select * from appointment a where a.appointment_id =?1", nativeQuery=true)
	List<appointment> findByAppointment_Id(Integer id);
	
}
