# Check for available updates
$updates = Get-WindowsUpdate -MicrosoftUpdate -Category 'Updates'

# Filter for Cumulative Updates
$cumulativeUpdates = $updates | Where-Object { $_.Title -like '*Cumulative Update*' }

# Install the latest Cumulative Update
if ($cumulativeUpdates.Count -gt 0) {
    $latestCumulativeUpdate = $cumulativeUpdates | Sort-Object -Property Date -Descending | Select-Object -First 1
    Install-WindowsUpdate -KBArticleID $latestCumulativeUpdate.KnowledgebaseArticles[0].ArticleID -AcceptAll -Confirm:$false
}
else {
    Write-Host "No Cumulative Updates found."
}