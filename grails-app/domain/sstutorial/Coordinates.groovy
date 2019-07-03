package sstutorial

class Coordinates {
    BigDecimal latitude
    BigDecimal longitude

    static constraints = {
        latitude blank: false, nullable: true, validator: { val, obj, errors ->
            if ( val == null ) {
                return true
            }
            if (val < -90.0) {
                errors.rejectValue('latitude', 'range.toosmall')
                return false
            }
            if (val > 90.0) {
                errors.rejectValue('latitude', 'range.toobig')
                return false
            }
            true
        }

        longitude blank: false, nullable: true, validator: { val, obj, errors ->
            if ( val == null ) {
                return true
            }
            if (val < -180.0) {
                errors.rejectValue('longitude', 'range.toosmall')
                return false
            }
            if (val > 180.0) {
                errors.rejectValue('longitude', 'range.toobig')
                return false
            }
            true
        }
    }

    @Override
    String toString() {
        "Latitude: ${latitude}, Longitude: ${longitude}"
    }
}
