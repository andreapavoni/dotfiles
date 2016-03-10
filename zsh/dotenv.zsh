function load_dotenv() {
  if [ -r $PWD/.env ]; then
    source $PWD/.env
  fi
}

if [[ -n "$ZSH_VERSION" ]]; then
  if [[ ! "$preexec_functions" == *load_dotenv* ]]; then
    preexec_functions+=("load_dotenv")
  fi
elif [[ -n "$BASH_VERSION" ]]; then
  trap '[[ "$BASH_COMMAND" != "$PROMPT_COMMAND" ]] && load_dotenv' DEBUG
fi
