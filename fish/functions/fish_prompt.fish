function fish_prompt
  set -l last_command_status $status
  set -l cwd (prompt_pwd)

  set -l normal_color     (set_color normal)
  set -l success_color    (set_color 8787FF)
  set -l error_color      (set_color red --bold)
  set -l directory_color  (set_color 0087D7)
  set -l last_color

  echo -n -s $directory_color $cwd $normal_color
  if test $last_command_status -eq 0
    set last_color $success_color
  else
    set last_color $error_color
  end
  echo -n -s $last_color " » " $normal_color
end
