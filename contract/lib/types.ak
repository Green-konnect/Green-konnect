
pub type MeasurementUnit {
  Hectare
  Acre
  SquareMeter
}

pub type FarmStatus {
  Active
  InDevelopment
  Inactive
}

pub type Farm {
  farmer_address: ByteArray,       
  farm_name: ByteArray,           
  location: ByteArray,             
  size: Int,                   
  unit: MeasurementUnit,         
  crops: List<ByteArray>,       
  status: FarmStatus,             
  registration_date: Int,      
}


pub type FarmRedeemer {
  Register
  Update
}