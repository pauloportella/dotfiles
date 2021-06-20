# Defined in - @ line 1
function lightsOff --description alias\ lightsOff=curl\ -X\ PUT\ http://192.168.2.13:51224/characteristics\ \ --header\ \"Content-Type:Application/json\"\ --header\ \"authorization:\ 783-65-917\"\ --data\ \"\{\\\"characteristics\\\":\[\{\\\"aid\\\":2,\\\"iid\\\":10,\\\"value\\\":false\}\]\}\"
	curl -X PUT http://192.168.2.13:51224/characteristics  --header "Content-Type:Application/json" --header "authorization: 783-65-917" --data "{\"characteristics\":[{\"aid\":2,\"iid\":10,\"value\":false}]}" $argv;
end
