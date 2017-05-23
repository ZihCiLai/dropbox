# dropbox
Dropbox是目前雲端儲存市場中數一數二的平台,提供大量的免費空間,靈活的行銷策略,吸引了大量的User使用,現今用戶數應該比Google Drive還多。
同樣的,使用Dropbox於我們的App中,也可以帶來相當不錯的便利在開始進行程式碼的實作作業前:
1. 您需要先註冊一個Dropbox帳號,免費,若您還沒申請: https://www.dropbox.com 
2. 登入會員後您會需要於Dropbox的開發者首頁建立一個App: https://www.dropbox.com/developers/apps 
3. 建立App時, Dropbox將會要求您填入一些必要的資訊與設定:
4. 將建立成功畫面中的兩個重要資訊,分別是App Key 與App Secret記錄起來,後續將用於App中 

上述的步驟,僅是完成一個Development狀態的App而已,而且只 能限定被100個Dropbox帳號的User所使用,且需要跟Dropbox預先註冊這些帳號,若您打算此App要讓大眾使用的話,您需要申請成為Production 的狀態, Dropbox將做某些審核、試用並且符合他們的規範,通過後才可以開放 給所有人使用。  
 Dropbox資料 
1. Dropbox Platform developer guide (https://www.dropbox.com/developers/reference)
2. Develop branding guide (https://www.dropbox.com/developers/reference/branding-guide)  

### Pods
project 'HelloMyDropbox.xcodeproj'

\# Uncomment the next line to define a global platform for your project  
\# platform :ios, '9.0'  

target 'HelloMyDropbox' do
\# Uncomment the next line if you're using Swift or would like to use dynamic frameworks  
\# use_frameworks!  

\# Pods for HelloMyDropbox  
pod 'ObjectiveDropboxOfficial'  
end
