pragma solidity ^0.8.0;

contract Hospital {
    struct Doctor {
        uint256 id;
        string name;
        string specialty;
    }
    
    struct Patient {
        uint256 id;
        string name;
        uint256 age;
    }
    
    struct HealthRecord {
        uint256 patientId;
        string xray;
        string format;
    }
    
    mapping (uint256 => Doctor) public doctors;
    mapping (uint256 => Patient) public patients;
    mapping (uint256 => HealthRecord) public healthRecords;
    
    uint256 public nextDoctorId=1;
    uint256 public nextPatientId=1;
    uint256 public nextHealthRecordId=1;
    
    function createDoctor(string memory name, string memory specialty) public {
        doctors[nextDoctorId] = Doctor(nextDoctorId, name, specialty);
        nextDoctorId++;
    }
    
    function createPatient(string memory name, uint256 age) public {
        patients[nextPatientId] = Patient(nextPatientId, name, age);
        createHealthRecord(nextPatientId,'','');
        nextPatientId++;
    }
    
    function createHealthRecord(uint256 patientId, string memory xray,string memory format) public {
        healthRecords[patientId] = HealthRecord(patientId,xray,format);
        // nextHealthRecordId++;
    }
    
    function updateDoctor(uint256 id, string memory name, string memory specialty) public {
        doctors[id] = Doctor(id, name, specialty);
    }
    
    function updatePatient(uint256 id, string memory name, uint256 age) public {
        patients[id] = Patient(id, name, age);
    }
    
    function updateHealthRecord(uint256 patientId,string memory xray, string memory format) public {
        healthRecords[patientId] = HealthRecord(patientId, xray,format);
    }
    
    function deleteDoctor(uint256 id) public {
        delete doctors[id];
    }
    
    function deletePatient(uint256 id) public {
        delete patients[id];
        delete healthRecords[id];
    }
    
    function deleteHealthRecord(uint256 id) public {
        delete healthRecords[id];
    }
    
    function getXray(uint256 id) public view returns (string memory) {
        return healthRecords[id].xray;
    }
    
    function updateXray(uint256 id, string memory xray) public {
        healthRecords[id].xray = xray;
    }
}
