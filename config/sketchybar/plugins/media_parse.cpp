#include <iostream>
#include "json.hpp"
using json = nlohmann::json;

int MAXLEN = 52;

void truncate_print(std::string input, int maxlen) {
	if (input.length() > maxlen) {
		std::cout << input.substr(0, MAXLEN) + "..." << "\n";
	}
	else if (input.length() == 0) {
		std::cout << "_" << "\n";
	}
	else {
		std::cout << input << "\n";
	}
}

int main(int argc, char *argv[]) {
	std::string Data;
	// to get a string of the json input since there are spaces
	for (int i = 0; i < argc - 1; i++) {
		std::string this_argv = argv[i+1];
		Data += this_argv + " ";
	}
	json Doc{json::parse(Data)};

	std::string state = Doc["state"];
	std::string title = Doc["title"];
	std::string album = Doc["album"];
	std::string artist = Doc["artist"];
	std::string app = Doc["app"];
			
	truncate_print(state, MAXLEN);
	truncate_print(title, MAXLEN);
	truncate_print(album, MAXLEN);
	truncate_print(artist, MAXLEN);
	truncate_print(app, MAXLEN);
}


