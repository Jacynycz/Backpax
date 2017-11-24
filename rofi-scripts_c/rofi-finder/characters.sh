#PUT THIS FILE IN ~/.local/share/rofi/finder.sh
#USE: rofi  -show find -modi find:~/.local/share/rofi/finder.sh
if [[ "$@" == *"--"* ]]
then
  QUERY=$@
  coproc ( echo -n "${QUERY% --*}" | xclip -selection clipboard)
  exec 1>&-
  exit;
else
  echo "< -- Menor que"
  echo "> -- Mayor que"
  echo "| -- Palo"
  echo "[ -- Abre corchete"
  echo "] -- Cierra corchete"
  echo "{ -- Abre llave"
  echo "} -- Cierra llave"
  echo "α -- Alfa"
  echo "β -- Beta"
  echo "γ -- Gamma"
  echo "δ -- Delta"
  echo "ε -- Epsilon"
  echo "θ -- Theta"
  echo "λ -- Lambda"
  echo "μ -- Mu | Mi"
  echo "π -- Pi"
  echo "ρ -- Rho"
  echo "σ -- Sigma"
  echo "φ -- Phi"
  echo "ω -- Omega"
  echo "² -- Al cuadrado"
  echo "³ -- Al cubo"
  echo "½ -- Un medio"
  echo "¼ -- Un cuarto"
  echo "¾ -- Tres cuartos"
  echo "☠ -- Calavera"
  echo "☢ -- Radioactivo"
  echo "☣ -- Biohazzard"
  echo "☭ -- Comunistas"
  echo "⚛ -- Atomo"
  echo "✡ -- Judios"
  echo "卐 -- Nazis"
  echo "࿗ -- Nazis puntitos"
  echo "☮ -- Paz"
fi
