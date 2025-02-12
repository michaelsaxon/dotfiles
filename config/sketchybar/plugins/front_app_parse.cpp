#include <iostream>
#include "json.hpp"
using json = nlohmann::json;

int MAXLEN = 52;

int main(int argc, char *argv[]) {
	std::string Data;
	// to get a string of the json input since there are spaces
	for (int i = 0; i < argc - 1; i++) {
		std::string this_argv = argv[i+1];
		Data += this_argv + " ";
	}
	json Doc{json::parse(Data)};

	std::string app = Doc["app"];
	std::string title = Doc["title"];

	std::string out;
	out = app + ": " + title;
	
	if (out.length() > MAXLEN){
		std::cout << out.substr(0, MAXLEN) + "...";
	}
	else {
		std::cout << out;
	}
}


