function bw-unlock --wraps bw --description 'auto export BW_SESSION for bw unlock'
  set -gx BW_SESSION (echo (bw unlock) | sed -E 's/.*env:BW_SESSION="([^"]+)".*/\1/')
end
