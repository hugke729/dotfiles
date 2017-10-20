alias bam='../../../tools/genmake2 -mods=../code -of=../../../tools/build_options/linux_amd64_gfortran | tail -10; make depend | tail -10; make | tail -10'
alias bammpi='../../../tools/genmake2 -mods=../code -mpi -of=../../../tools/build_options/linux_amd64_gfortran | tail -10; make depend | tail -10; make | tail -10'
alias md='make depend'
alias lT='l T*.data'
alias nt='l T*.data | wc -l'
alias rmmd='rm *.meta; rm *.data'
alias rmnc='rm *.nc'
alias vis='vim STDOUT.0000'
alias vie='vim STDERR.0000'
alias gluemnc=='python2 /home/hugke729/MITgcm66h/utils/python/MITgcmutils/scripts/gluemncbig'

# Copy all files needed for open_mdsdataset to work
copy_gridfiles() {
    scp parallel:/global/scratch/hugke729/"$@"/{Depth,DRC,DRF,DXC,DXG,DYC,DYG,hFacC,hFacS,hFacW,PHrefC,PHrefF,RAC,RAW,RAZ,RC,RF,XC,XG,YC,YG}{.meta,.data} .
}

genmake2 () {
    if [[ $PWD = */code ]]; then
        echo "No! You're in code directory, not build"
    else
        /home/hugke729/mitgcm/tools/genmake2 "$@" \
            -rootdir=/home/hugke729/mitgcm \
            -of=/home/hugke729/mitgcm/tools/build_options/linux_amd64_gfortran \
            -mods=../code
    fi
}

