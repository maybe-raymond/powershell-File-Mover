$path = "/home/raymond/Desktop/"
$current_path = "${path}/example1/"
$destination_path ="${path}/example2/"
$file_name = "list.txt"


function Formating_and_Moving_Data{
		param (
			[string[]] $Names
		)

		foreach ($name in $Names) {
			if ($name  -match  "torchbrowser.com"){
				$current_name = $name
				$new_name = $name.Split("Watch")[1]
				$new_name =$new_name.Split("Online")[0]+".acc"
				echo $new_name
				echo $name
				Rename-Item -path $name -NewName $new_name
				Move-Item -path "${current_path}\${new_name}"  -Destination "${destination_path}${new_name}"
			}
		}
}


function main{
	new-Item -name $file_name -path $current_path
	Add-Content -path "${current_path}${file_name}" -value (Get-childItem -path $current_path)
	Formating_and_Moving_Data -Names(Get-content -path "${current_path}${file_name}")
	Remove-Item -path "${current_path}${file_name}"
}


main
