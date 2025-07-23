;; This is an operating system configuration generated
;; by the graphical installer.
;;
;; Once installation is complete, you can learn and modify
;; this file to tweak the system configuration, and pass it
;; to the 'guix system reconfigure' command to effect your
;; changes.


;; Indicate which modules to import to access the variables
;; used in this configuration.
(use-modules (gnu))
(use-service-modules cups desktop networking ssh xorg)

(operating-system
  (locale "en_GB.utf8")
  (timezone "Europe/London")
  (keyboard-layout (keyboard-layout "gb"))
  (host-name "James")

  ;; The list of user accounts ('root' is implicit).
  (users (cons* (user-account
                  (name "James")
                  (comment "James")
                  (group "users")
                  (home-directory "/home/James")
                  (supplementary-groups '("wheel" "netdev" "audio" "video")))
                %base-user-accounts))

  ;; Packages installed system-wide.  Users can also install packages
  ;; under their own account: use 'guix search KEYWORD' to search
  ;; for packages and 'guix install PACKAGE' to install a package.
  (packages (append (map specification->package '("nss-certs" "emacs"))
                    %base-packages))

  ;; Below is the list of system services.  To search for available
  ;; services, run 'guix system search KEYWORD' in a terminal.
  (services
   (append (list (service gnome-desktop-service-type)
                 (set-xorg-configuration
                  (xorg-configuration (keyboard-layout keyboard-layout)))
		 (service openssh-service-type
			  (openssh-configuration)))

           ;; This is the default list of services we
           ;; are appending to.
           %desktop-services))
  (bootloader (bootloader-configuration
                (bootloader grub-bootloader)
                (targets (list "/dev/vda"))
                (keyboard-layout keyboard-layout)))
  (swap-devices (list (swap-space
                        (target (uuid
                                 "800f94d5-1524-43a5-8272-336bcd12ffa0")))))

  ;; The list of file systems that get "mounted".  The unique
  ;; file system identifiers there ("UUIDs") can be obtained
  ;; by running 'blkid' in a terminal.
  (file-systems (cons* (file-system
                         (mount-point "/")
                         (device (uuid
                                  "d43e3d0e-4edd-4ee6-ac0b-dc58658c3bb6"
                                  'ext4))
                         (type "ext4")) %base-file-systems)))
