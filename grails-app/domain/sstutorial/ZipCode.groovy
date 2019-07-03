package sstutorial

class ZipCode {
    String zipCode

    static constraints = {
        zipCode(nullable:false, blank:false,validator:{zip, address ->
            //Check for 9 digit with - or 5 digit or just 9 digits
            if(zip ==~ /^(\d{5}-\d{4})|(\d{5})|(\d{9})$/) {
                return true
            }
            else {
                return "invalidZipFormat"
            }
        })
    }
}
