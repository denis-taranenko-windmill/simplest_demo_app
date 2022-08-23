.PHONY: help, clean, format, generate

# Adding a help file. Example: https://gist.github.com/prwhite/8168133#gistcomment-1313022
help: ## This help dialog.
	@IFS=$$'\n' ; \
	help_lines=(`fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//'`); \
	for help_line in $${help_lines[@]}; do \
		IFS=$$'#' ; \
		help_split=($$help_line) ; \
		help_command=`echo $${help_split[0]} | sed -e 's/^ *//' -e 's/ *$$//'` ; \
		help_info=`echo $${help_split[2]} | sed -e 's/^ *//' -e 's/ *$$//'` ; \
		printf "%-30s %s\n" $$help_command $$help_info ; \
	done

clean:
	@echo "╠ Cleaning the project..."

	@echo "╠= Remove pubspeck.lock"
	rm -rf pubspec.lock

	@echo "╠= Remove ios/Podfile.lock"
	rm -rf ios/Podfile.lock

	lutter clean

format:
	@echo "╠ Formatting the code"
	dart format -l 100 --fix .

generate:
	@echo "╠ Run code generation"
	flutter pub run build_runner build --delete-conflicting-outputs
