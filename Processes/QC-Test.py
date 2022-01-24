import unittest
from selenium import webdriver
from robot.libraries.BuiltIn import BuiltIn
from selenium.webdriver.support.ui import WebDriverWait
import time
def LogIn():
    username='caesarstone.testing@gmail.com.api'
    password='2w3e4r5t6y'
    driver = webdriver.Chrome('chromedriver.exe')
    driver.get('https://caesarstone--cspartial.lightning.force.com/lightning/page/home')
    userinput=driver.find_element_by_id('username')
    userinput.send_keys(username)
    passinput = driver.find_element_by_id('password')
    passinput.send_keys(password)
    loginB=driver.find_element_by_id('Login')
    loginB.click()

    driver.get('https://caesarstone--cspartial.lightning.force.com/lightning/r/Contact/0035t000001byeFAAQ/view')
    time.sleep(10)

    driver.find_element_by_xpath('//*[@class="slds-button slds-button_icon-border-filled"]').click()
    driver.find_element_by_xpath('//*[text()="Log in to Experience as User"]').click()
    time.sleep(10)
    driver.find_element_by_xpath('(//*[@class="slds-button slds-button_brand"])[1]').click()
    time.sleep(20)
    driver.switch_to.frame(driver.find_element_by_xpath('//iframe[@class="canvasIframe"]'))





