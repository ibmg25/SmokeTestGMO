Given('I am on the GMO homepage') do
    visit 'https://demo.borland.com/gmopost/'
end

Given('I enter to product catalog') do
    find('body > form > div:nth-child(1) > center > table > tbody > tr > td:nth-child(1) > input[type=button]').click
end

Given('I place an order') do
    fill_in 'QTY_TENTS', with: 1
    find('body > form > table > tbody > tr:nth-child(3) > td > div > center > table > tbody > tr > td > p > input[type=submit]:nth-child(2)').click
end

Given('I proceed with order') do
    find('body > form > table > tbody > tr:nth-child(3) > td > p > input[type=submit]').click
end
  
When('I fill in the Bill To section with the following details:') do |table|
    details = table.rows_hash
    fill_in 'billName', with: details['Name']
    fill_in 'billAddress', with: details['Address']
    fill_in 'billCity', with: details['City']
    fill_in 'billState', with: details['State']
    fill_in 'billZipCode', with: details['Zip'] 
    fill_in 'billPhone', with: details['Phone']
    fill_in 'billEmail', with: details['E-mail']
end

When('I select {string} from the Credit Card combo box') do |card_type|
    select card_type, from: 'CardType'
end

When('I enter {string} as the Card Number') do |card_number|
    fill_in 'CardNumber', with: card_number
end

When('I enter {string} as the Expiration date') do |expiration_date|
    fill_in 'CardDate', with: expiration_date
end

When('I check the Same as Bill To checkbox') do
    check 'shipSameAsBill'
end

When('I click Place the Order button') do
    find('body > form > table > tbody > tr:nth-child(3) > td:nth-child(3) > input[type=submit]').click
end

Then('the order should be accepted') do
    expected_text = find('body > h4 > font').text
    expect(expected_text).to eq('Thank you for shopping with Green Mountain Outpost')
end

Then('I should see an alert with the message {string}') do |expected_message|
    alert = page.driver.browser.switch_to.alert
    actual_message = alert.text
    expect(actual_message).to eq(expected_message)
    alert.accept
end
