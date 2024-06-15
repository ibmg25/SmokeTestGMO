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
$global_variable=0
When('I update the quantities of the following products:') do |table|
    $global_variable=0
    table.hashes.each do |row|
        product_name = row['Product Name']
        quantity = row['Quantity']
        update_product_quantity(product_name, quantity)
        check_product_quantity_to_get_total(product_name , quantity)
        
    end
end

    
Then('I should see the correct {string} the correct {string} and the correct {string} and the total amount the sum:') do |expected_tax, expected_shipping, expected_subtotal|

    expected_total=$global_variable+($global_variable*0.05)+5

    expected_total = expected_total.round(2)

    product_total=find('body > form > table > tbody > tr:nth-child(1) > td > div > center > table > tbody > tr:nth-last-child(4) > td:nth-child(3)').text
    actual_tax =find('body > form > table > tbody > tr:nth-child(1) > td > div > center > table > tbody > tr:nth-last-child(3) > td:nth-child(2)').text
    actual_shipping = find('body > form > table > tbody > tr:nth-child(1) > td > div > center > table > tbody > tr:nth-last-child(2) > td:nth-child(2)').text
    actual_total = find('body > form > table > tbody > tr:nth-child(1) > td > div > center > table > tbody > tr:last-child > td:nth-child(2)').text

    numeric_string = actual_total.gsub(/[^\d.]/, '')
    actual_total = numeric_string.to_f
    if actual_total == expected_total
        puts "El valor total  del los productos es correcto: #{actual_total}"
    else
        puts "El valor del total es incorrecto. Se esperaba #{expected_total} pero se encontró #{actual_total}"
    end
    if actual_shipping == expected_shipping
        puts "El valor del envío es correcto: #{actual_shipping}"
    else
        puts "El valor del envío es incorrecto. Se esperaba #{expected_shipping} pero se encontró #{actual_shipping}"
    end

    if actual_tax == expected_tax
        puts "El valor del impuesto es correcto: #{actual_tax}"
    else
        puts "El valor del impuesto es incorrecto. Se esperaba #{expected_tax} pero se encontró #{actual_tax}"
    end

    if product_total == expected_subtotal
        puts "El valor del subtotal es correcto: #{product_total}"
    else
        puts "El valor del total es incorrecto. Se esperaba #{expected_subtotal} pero se encontró #{product_total}"
    end
end

Then('I should see an alert {string}') do |expected_alert_text|

    page.driver.browser.switch_to.alert.text == expected_alert_text
    alert = page.driver.browser.switch_to.alert
    actual_alert_text = alert.text
    if actual_alert_text == expected_alert_text
        puts "El mensaje de la alerta es correcto: #{actual_alert_text}"
        alert.accept 
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
def check_product_quantity_to_get_total(product_name,quantity)
    counter = 2
        while counter < 7
            row_selector = "body > form > table > tbody > tr:nth-child(#{counter}) > td > div > center > table > tbody > tr"
            row = find(:css, row_selector, text: product_name)
            if row.visible?
                total=row.find('td:nth-child(3)').text
                numeric_string = total.gsub(/[^\d.]/, '')
                total_float = numeric_string.to_f
                $global_variable=($global_variable) + (total_float*quantity.to_i)
                break
            end
            counter += 1
        end
end
