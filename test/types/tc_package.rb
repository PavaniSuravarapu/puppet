if __FILE__ == $0
    $:.unshift '..'
    $:.unshift '../../lib'
    $blinkbase = "../../../../language/trunk"
end

require 'blink/type/package'
require 'test/unit'
require 'facter'

# $Id$

class TestPackagingType < Test::Unit::TestCase
    def test_listing
        platform = Facter["operatingsystem"].value
        type = nil
        case platform
        when "SunOS"
            type = "sunpkg"
        when "Linux"
            type = "dpkg"
        else
            type = :invalid
        end

        assert_nothing_raised() {
            Blink::Type::PackagingType[type].list
        }
    end
end

class TestPackageSource < Test::Unit::TestCase
    def test_filesource
        assert_equal(
            "/tmp/fakepackage",
            Blink::Type::PackageSource.get("file:///tmp/fakepackage")
        )
    end
end
