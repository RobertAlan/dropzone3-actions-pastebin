# Dropzone Action Info
# Name: Pastebin
# Description: Pastebin Tool
# Handles: Text
# Events: Clicked, Dragged
# Creator: Robert
# URL: adlab.com
# Version: 1.0
# RunsSandboxed: Yes
# MinDropzoneVersion: 3.0

 
def dragged
	$dz.begin("Sending text to pastebin...")
	$dz.determinate(false)

	data = $items[0]
	#format = getFormat()
	$dz.finish("Pastebin URL Copied!")		
	$dz.url(getPastebinUrl(data))
end
 
def clicked
	$dz.begin("Sending text to pastebin...")
	$dz.determinate(false)
		
	
	data = readClipboard()
	#format = getFormat()
	$dz.finish("Pastebin URL Copied!")		
	$dz.url(getPastebinUrl(data))
end

def readClipboard
	IO.popen('pbpaste') {|clipboard| clipboard.read}
end

def getPastebinUrl(data)
        require 'net/http'
	r = Net::HTTP.post_form(URI.parse("http://pastebin.com/api/api_post.php"),
                                         {
                                         	"api_dev_key" => "",
                                          	"api_option" => "paste",
										  	"api_paste_code" => data,
										  	"api_paste_private" => "1",
										  	"api_paste_expire_date" => "1M",
										 }
										  )
	r.body
end
