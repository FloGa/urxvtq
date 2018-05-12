# Changes in 0.3.0

-   Focus window before moving it

-   Use activate instead of focus

    This is recommended by xdotools, since it seems to be better supported
    by window managers.

-   Replace -z tests with !

-   Re-attach a detached session

    If the window is closed, the screen session is automatically detached.
    If a new window will be created, then it will re-attach the session,
    maybe detaching it beforehand or creating a new session.

    This also fixes a problem where there could be multiple instances of
    urxvtq. When a session is detached, the containing window will be closed
    automatically.

# Changes in 0.2.0

-   Call xdotool synchronously

    This ensures that the window operation is finished before continuing.

-   Support swapping with specified window

-   Remove needless call to wmctrl

    The remove-add-chain of maximized_horz causes a blank window an Awesome
    4.1. Thus, I removed the remove-call and hope that the add-call is
    enough.

-   Fix transparency

    The transparency will not be applyed properly if set *after* mapping the
    window.

-   Remove needless interactive flag

    If bash was called without parameters, it is interactive anyway.

-   Add support for a config file

    At the moment, it only supports transparency configuration, but can be
    extended in the future.

-   Set transparency quietly

# Changes in 0.1.2

-   Fix wrong variable name for replacement

# Changes in 0.1.1

-   Rename PREFIX variable with DESTDIR

    This matches Gentoo convention.

# Changes in 0.1.0

Initial release.
