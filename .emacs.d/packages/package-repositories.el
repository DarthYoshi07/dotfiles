;; Package Repositries:
(require 'package)
(add-to-list 'package-archives '("melpa" .  "https://melpa.org/packages/") t) ;; MELPA Repo gets added;
(add-to-list 'package-archives '("elpa" . "https://elpa.gnu.org/packages/") t) ;; ELPA Repo gets added;
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t) ;; Org repo gets added;
(package-initialize)
(package-refresh-contents)