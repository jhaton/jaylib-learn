(use jaylib)

(def screen-width 960)
(def screen-height 540)
(def player-radius 24)
(def player-speed 240)

(defn update-player!
  [player]
  (def sprinting? (key-down? :left-shift))
  (def speed (if sprinting? (* 2 player-speed) player-speed))
  (def dt (get-frame-time))
  (def dx (- (if (key-down? :right) 1 0)
             (if (key-down? :left) 1 0)))
  (def dy (- (if (key-down? :down) 1 0)
             (if (key-down? :up) 1 0)))
  (put player 0
       (utils/clamp (+ (get player 0) (* dx speed dt))
                    player-radius
                    (- screen-width player-radius)))
  (put player 1
       (utils/clamp (+ (get player 1) (* dy speed dt))
                    player-radius
                    (- screen-height player-radius)))
  sprinting?)

(defn draw
  [player sprinting?]
  (def circle-color (if sprinting? :yellow :red))
  (begin-drawing)
  (clear-background :black)
  (draw-circle-v player player-radius circle-color)
  (draw-text "Move with the arrow keys" 20 20 20 :white)
  (draw-fps 20 50)
  (end-drawing))

(defn main
  [&]
  (init-window screen-width screen-height "Janet + Jaylib")
  (defer (close-window)
    (set-target-fps 60)
    (def player @[(/ screen-width 2) (/ screen-height 2)])
    (while (not (window-should-close))
      (def sprinting? (update-player! player))
      (draw player sprinting?))))
