function Start-Cluster {
    param($ClusterName)

    Write-Output "Starting cluster: $ClusterName"
}

# Simple test
describe 'Start-Cluster' {
    $result = Start-Cluster -ClusterName 'SERVER1'

    it 'should return the correct output' {
        $result | Should be "Starting cluster: SERVER1"
    }
}

# Mocking example
describe 'Start-ClusterMock' {
    mock -CommandName 'Write-Output' -MockWith {
        'Mocked Write-Output'
    }

    $result = Start-Cluster -ClusterName 'SERVER1'

    it 'should return the mocked output' {
        $result | Should be "Mocked Write-Output"
    }
}

describe 'Start-Cluster with scopes' {
    mock -CommandName 'Write-Output' -MockWith {
        'Mocked Write-Output'
    }

    $result = Start-Cluster -ClusterName 'SERVER1'

    it 'should return the mocked output' {
        $result | Should be "Mocked Write-Output"
    }

    context 'scope1' {
        mock -CommandName 'Write-Output' -MockWith { 'scope1' } # overrides the previous mock
        $result = Start-Cluster -ClusterName 'SERVER1'
        it 'should return the mocked output' { $result | Should be "scope1" }
    }

    context 'scope2' {
        mock -CommandName 'Write-Output' -MockWith { 'scope2' } # overrides the previous mock
        $result = Start-Cluster -ClusterName 'SERVER1'
        it 'should return the mocked output' { $result | Should be "scope2" }
    }
}

# The last mock wins in the same scope
describe 'Start-Cluster with multiple mocks in the same scope' {
    mock -CommandName 'Write-Output' -MockWith { 'scope1' }
    mock -CommandName 'Write-Output' -MockWith { 'scope2' } 

    $result = Start-Cluster -ClusterName 'SERVER1'

    it 'should return the mocked output' {
        $result | Should be "scope2"
    }
}