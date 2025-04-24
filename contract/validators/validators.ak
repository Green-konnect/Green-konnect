use aiken/hash.{Blake2b_224, Hash}
use aiken/list
use aiken/transaction.{ScriptContext, Transaction}
use aiken/transaction/credential.{VerificationKey}
use types.{Farm, FarmRedeemer, FarmStatus}

// Validator function to handle farm registration
validator farm_registration(farm: Farm, redeemer: FarmRedeemer, ctx: ScriptContext) -> Bool {
  let tx = ctx.transaction
  
  // Check if the transaction is signed by the farmer
  let farmer_signed = list.any(
    tx.extra_signatories, 
    fn(signatory) { signatory == farm.farmer_address }
  )
  
  // Validate farm data
  let valid_farm_data = when redeemer is {
    // For new registration
    Register -> {
      // Farm name must not be empty
      let valid_name = bytearray_length(farm.farm_name) > 0
      
      // Size must be positive
      let valid_size = farm.size > 0
      
      // Location must not be empty
      let valid_location = bytearray_length(farm.location) > 0
      
      // Must have at least one crop
      let valid_crops = list.length(farm.crops) > 0
      
      valid_name && valid_size && valid_location && valid_crops
    }
    
    // For updating existing farm
    Update -> {
      // Simplified update validation - in a real scenario, you would
      // check the existing farm data from the UTxO and validate changes
      True
    }
  }
  
  // The transaction is valid if signed by the farmer and the farm data is valid
  farmer_signed && valid_farm_data
}

// Helper function to get bytearray length
fn bytearray_length(bytes: ByteArray) -> Int {
  // Implementation would depend on Aiken's standard library
  // For now, a simplified placeholder
  1
}