use aiken/transaction.{ScriptContext, Transaction}
use lib/types.{Farm, CropType, MeasurementUnit, FarmStatus, FarmRedeemer}


pub fn prepare_farm_registration(
  farmer_address: ByteArray,
  farm_name: ByteArray,
  location: ByteArray,
  size: Int,
  unit: MeasurementUnit,
  crops: List<CropType>,
  status: FarmStatus,
  current_time: Int,
) -> Farm {
  Farm {
    farmer_address: farmer_address,
    farm_name: farm_name,
    location: location,
    size: size,
    unit: unit,
    crops: crops,
    status: status,
    registration_date: current_time,
  }
}


pub fn prepare_farm_update(
  existing_farm: Farm,
  new_status: FarmStatus,
  new_crops: List<CropType>,
) -> Farm {
  Farm {
    farmer_address: existing_farm.farmer_address,
    farm_name: existing_farm.farm_name,
    location: existing_farm.location,
    size: existing_farm.size,
    unit: existing_farm.unit,
    crops: new_crops,
    status: new_status,
    registration_date: existing_farm.registration_date,
  }
}