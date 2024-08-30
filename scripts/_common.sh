#!/bin/bash

#=================================================
# COMMON VARIABLES AND CUSTOM HELPERS
#=================================================

_install_phantomjs() {
    source_dir="$install_dir/phantomjs/source"
    destdir="$install_dir/phantomjs"
    ynh_setup_source --dest_dir="$source_dir" --source_id="phantomjs"

    pushd "$source_dir"
        ynh_hide_warnings env PREFIX="$destdir" ./configure
        ynh_hide_warnings make -j "$(nproc)"
        ynh_hide_warnings make install
    popd
    ynh_safe_rm "$source_dir"
}
