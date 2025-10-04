SPACESHIP_PROMPT_ORDER=(
  time          # Time stampts section
  user          # Username section
  host          # Hostname section
  dir           # Current directory section
  git           # Git section (git_branch + git_status)
  package       # Package version
  python        # Python section
  venv          # virtualenv section
  exec_time     # Execution time
  line_sep      # Line break
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)

# USER
SPACESHIP_USER_PREFIX=""
SPACESHIP_USER_SUFFIX=""
SPACESHIP_USER_SHOW="always"
SPACESHIP_USER_COLOR="037"

# HOST
SPACESHIP_HOST_SHOW="always"
SPACESHIP_HOST_SHOW_FULL="true"
SPACESHIP_HOST_PREFIX="@"
SPACESHIP_HOST_SUFFIX=" "
SPACESHIP_HOST_COLOR="031"

# DIR
SPACESHIP_DIR_PREFIX=""
SPACESHIP_DIR_TRUNC="3"
SPACESHIP_DIR_COLOR="105"

# GIT
SPACESHIP_GIT_SYMBOL=""
SPACESHIP_GIT_BRANCH_PREFIX=""
SPACESHIP_GIT_PREFIX='git('
SPACESHIP_GIT_SUFFIX=") "
SPACESHIP_GIT_BRANCH_SUFFIX=""
SPACESHIP_GIT_STATUS_PREFIX=" "
SPACESHIP_GIT_STATUS_SUFFIX=""
SPACESHIP_GIT_BRANCH_COLOR="172"
SPACESHIP_GIT_STATUS_COLOR="196"

# PYTHON VIRTUALENV
SPACESHIP_VENV_GENERIC_NAMES=(virtualenv venv .venv)
SPACESHIP_VENV_SHOW="true"
SPACESHIP_VENV_PREFIX="py("
SPACESHIP_VENV_SUFFIX=")"
SPACESHIP_VENV_SYMBOL=""
SPACESHIP_VENV_COLOR="172"
