;******************** SIMPLE CONFIGURATION ***************
(require 'planner)


;(setq planner-project "Plans")

(when (and (locate-library "planner")
               (locate-library "muse"))
      (setq planner-project "WikiPlans")
      (setq planner-directory "~/DogDoc/Plans")
      (setq planner-default-page "TaskPool")
      ;; Tell muse about planner.  We use add-hook instead of
      ;; add-to-list because muse might not be loaded yet.
      (add-hook 'muse-project-alist
                (list planner-project
                      (list planner-directory
                            :default planner-default-page
                            :major-mode 'planner-mode
                            :visit-link 'planner-visit-link))))


(plan)
(setq planner-carry-tasks-forward t)


;***************** AUTOMATIC note-taking with Planner and Remember *******
(require 'remember-planner)
(setq remember-handler-functions '(remember-planner-append))
(setq remember-annotation-functions planner-annotation-functions)



;***************** BINDINGS *******************************************
(global-set-key (kbd "<f9> p") 'plan)
(global-set-key (kbd "<f9> t") 'planner-create-task-from-buffer)
(global-set-key (kbd "<f9> r") 'remember)
