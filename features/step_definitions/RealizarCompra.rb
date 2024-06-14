Given('I am on the GMO') do
    visit 'https://demo.borland.com/gmopost/'
end

When('I click the button Enter GMO OnLine button') do
    find('body > form > div:nth-child(1) > center > table > tbody > tr > td:nth-child(1) > input[type=button]').click
end


When('I update the quantity of {string} to {string}') do |product_name, new_quantity|
    update_product_quantity(product_name, new_quantity)
end  

When('Click on the Place and orden Button') do  
    find('body > form > table > tbody > tr:nth-child(3) > td > div > center > table > tbody > tr > td > p > input[type=submit]:nth-child(2)').click
end

When('Click on the Reset form Button') do  
    find('body > form > table > tbody > tr:nth-child(3) > td > div > center > table > tbody > tr > td > p > input[type=reset]:nth-child(1)').click
end

When('I update the quantities of the following products:') do |table|
    table.hashes.each do |row|
        product_name = row['Product Name']
        quantity = row['Quantity']
        update_product_quantity(product_name, quantity)
    end
end

Then('the TotalAmount should be {string}') do |expected_total|
    # Encuentra la última fila de la tabla
    actual_total = find('body > form > table > tbody > tr:nth-child(1) > td > div > center > table > tbody > tr:last-child > td:nth-child(2)').text
        # Compara el valor total actual con el esperado
    if actual_total == expected_total
        puts "El valor del total es correcto: #{actual_total}"
    else
        puts "El valor del total es incorrecto. Se esperaba #{expected_total} pero se encontró #{actual_total}"
    end
end
Then('quantity of all the products must be :') do |table|
    table.hashes.each do |row|
        product_name = row['Product Name']
        quantity = row['Quantity']
        check_product_quantity(product_name, quantity)
    end
end
Then('I should see an alert {string}') do |expected_alert_text|
    # Espera a que la alerta aparezca
    page.driver.browser.switch_to.alert.text == expected_alert_text
    alert = page.driver.browser.switch_to.alert
    actual_alert_text = alert.text
    if actual_alert_text == expected_alert_text
        puts "El mensaje de la alerta es correcto: #{actual_alert_text}"
        alert.accept # O alert.dismiss si deseas rechazar la alerta
    else
        raise "El mensaje de la alerta es incorrecto. Se esperaba '#{expected_alert_text}' pero se encontró '#{actual_alert_text}'"
    end
end
def update_product_quantity(product_name, new_quantity)
counter = 2
    while counter < 7
        row_selector = "body > form > table > tbody > tr:nth-child(#{counter}) > td > div > center > table > tbody > tr"
        row = find(:css, row_selector, text: product_name)
        if row.visible?
            last_column_cell = row.find('td:last-child input[type="text"]')
            last_column_cell.click
            last_column_cell.set(new_quantity)
            break
        end
        counter += 1
    end
end
def check_product_quantity(product_name, quantity)
    counter = 2
        while counter < 7
            row_selector = "body > form > table > tbody > tr:nth-child(#{counter}) > td > div > center > table > tbody > tr"
            row = find(:css, row_selector, text: product_name)
            if row.visible?
                last_column_cell = row.find('td:last-child input[type="text"]')
                expect(last_column_cell.value).to eq(quantity)
                break
            end
            counter += 1
        end
end