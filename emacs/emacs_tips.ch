= emacs_tips: |-
  === Effective .emacs ===
  
  
  --- Tip #0: Use Emacs 22 ------------------------------------------------------
  
  Emacs 22 is super stable. About half of my .emacs file (before I cleaned it up) was loading stuff that's now part of Emacs 22 and has autoloads.
  
  
  --- Tip #1: Never quit Emacs --------------------------------------------------
  
  Okay, this has nothing to do with your .emacs file, but I have to put it in here. Just because your .emacs file should load quickly doesn't imply that you should quit and restart all the time. Figure it out!
  
  
  --- Tip #2: (require 'cl) -----------------------------------------------------
  
  I put this at the top of my .emacs. It's a no-brainer. It adds in a ton of compatibility with CL, so that you can just use the CL functions you know and love (well, most of them, anyway), without a second thought.
  
  
  --- Tip #3: Never LOAD, never REQUIRE -----------------------------------------
  
== Your .emacs file shouldn't contain any calls to LOAD or REQUIRE (which are slow and often cause errors on startup). The only possible exceptions are loading files that contain nothing but autoloads (or similar stuff). How do you avoid loads and requires? First try removing each call to LOAD or REQUIRE to see if it's needed at all. Often (e.g., if you follow Tip #0) Emacs already has autoloads in place for the library already (e.g., "cc-mode"). For other libraries, where that's not true, put your own autoloads in your .emacs file. For example, rather than load slime in my .emacs (so I can bind the F1 key to SLIME-SELECTOR), instead I have:
  
  (autoload 'slime-selector "slime" t)
  
  The only call to LOAD in my .emacs file is for "erlang-start", but if you look inside the file you can see it contains only autoloads (and morally equivalent stuff). I also load the custom file, but that's different, see Tip #7. I don't have a single call to REQUIRE (beyond that mandated by Tip #2).
  
  
  --- Tip #4: Understand and use EVAL-AFTER-LOAD --------------------------------
  
== Another reason why you might have strewn needless REQUIRE and LOAD calls throughout your .emacs file is that you need to call a function from a specific library. For example, let's say you want to set your default SQL database type to MySQL:
  
  (sql-set-product 'mysql)
  
== If you put this in your .emacs, you'll get an error because the SQL library isn't loaded so SQL-SET-PRODUCT isn't yet defined. But before you add a LOAD or REQUIRE, stop! Instead do:
  
  (eval-after-load "sql"
  '(progn
  (sql-set-product 'mysql)
  ;; any other config specific to sql
  ))
  
  As the name suggests, this will defer calling that code until the SQL module is actually loaded. This saves startup time and prevents errors!
  
  --- Tip #5: Time your .emacs --------------------------------------------------
  
== You really ought to know how much time it's taking to load your .emacs file. Use the following in your .emacs:
  
  (defvar *emacs-load-start* (current-time))
  
  ;; rest of your .emacs goes here
  
  (message "My .emacs loaded in %ds" (destructuring-bind (hi lo ms) (current-time)
                               (- (+ hi lo) (+ (first *emacs-load-start*) (second *emacs-load-start*)))))
  
  After Emacs finishing initializing, you can switch to the *Messages* buffer and see how much of that time was taken by loading your .emacs. Mine now contributes less than one second!
  
  
  --- Tip #6: Set background colors ---------------------------------------------
  
== Don't just stand for the default colors! Set them to what you really want. In my case I want a reverse video effect:
  
  (set-background-color "black")
  (set-face-background 'default "black")
  (set-face-background 'region "black")
  (set-face-foreground 'default "white")
  (set-face-foreground 'region "gray60")
  (set-foreground-color "white")
  (set-cursor-color "red")
  
  
  --- Tip #7: Separate custom file ----------------------------------------------
  
== It's annoying to have your .emacs file modified by Emacs' "custom" library, especially if you check in your .emacs to a source code control system such as Subversion (which you should do) and synchronize it on multiple machines. Keep those customizations in a separate file:
  
  (setq custom-file "~/.emacs-custom.el")
  (load custom-file 'noerror)
  
  --- Tip #8: Move autosaves and backups to one place (from http://snarfed.org/space/gnu%20emacs%20backup%20files) ---------------------------
  
  ;; Put autosave files (ie #foo#) in one place, *not*
  ;; scattered all over the file system!
  (defvar autosave-dir
   (concat "/tmp/emacs_autosaves/" (user-login-name) "/"))
  (make-directory autosave-dir t)
  (setq auto-save-file-name-transforms `(("\\(?:[^/]*/\\)*\\(.*\\)" ,(concat autosave-dir "\\1") t)))
  
  ;; Put backup files (ie foo~) in one place too. (The backup-directory-alist
  ;; list contains regexp=>directory mappings; filenames matching a regexp are
  ;; backed up in the corresponding directory. Emacs will mkdir it if necessary.)
  (defvar backup-dir (concat "/tmp/emacs_backups/" (user-login-name) "/"))
  (setq backup-directory-alist (list (cons "." backup-dir)))
  
  === comments
  
  Well, LOADs and REQUIREs are often slow (and often accomplish nothing, since there are usually autoloads for "standard" functionality nowadays anyway) and also a source of errors. For example, I run Emacs on 5 different machines, and they don't all have the same libraries on them (I'm talking about the things that aren't part of the Emacs 22 distribution, of course). Using a combination of EVAL-AFTER-LOAD and AUTOLOAD instead of using LOAD means that unless I actually try to use features that aren't available on a particular machine, I won't get an error loading the library unless I actually try to use the feature.
  
  ---
  
  Thanks! After eval-after-load-ing everything I could, I nearly halved my emacs startup time!
  
  At some point I'll go back and move each library's config to its own file and just autoload all of those, but I have work to put off.
  
  ---
  
  
  -------------------------------------------------------------------------------
  SOURCE: http://a-nickels-worth.blogspot.com/2007/11/effective-emacs.html
  -------------------------------------------------------------------------------
