# 1. Describe block is grouping associated tests
describe 'Test1' {
    
    # 2. It block is a single test case
    it 'should pass' {
        $true | Should be $true
    }

    # 3. context block is used to group tests with a specific context
    context 'Math tests' {
        it '1 + 1 should equal 2' {
            (1 + 1) | Should be 2
        }

        it '2 * 2 should equal 4' {
            (2 * 2) | Should be 4
        }
    }

    context 'String matching' {
        it 'should match the string' {
            'Hello World' | Should match 'Hello'
        }

        it 'should not match the string' {
            'Hello World' | Should match 'World'
        }

        it 'should contain the substring' {
            'Hello World' | Should not match 'Goodbye'
        }

        it 'should not contain the substring' {
            'Hello World' | Should match '^Hello'
        }

        it 'should start with the substring' {
            'Hello World' | Should not match '^Goodbye'
        }

        it 'should not start with the substring' {
            'Hello World' | Should match 'World$'
        }

        it 'should end with the substring' {
            'Hello World' | Should not match 'Goodbye$'
        }

        it 'should not end with the substring' {
            'Hello World' | Should belike 'Hello*'
        }

        it 'should be like the string' {
            'Hello World' | Should not belike 'Goodbye*'
        }

        it 'should not be like the string' {
            'Hello World' | Should not belike 'Goodbye*'
        }
    }

    context 'AAA pattern' {
        it 'should follow the AAA pattern' {
            # Arrange
            $expected = 4

            # Act
            $result = 2 + 2

            # Assert
            $result | Should be $expected
        }
    }
}
