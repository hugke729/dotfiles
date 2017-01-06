alias bam='../../../tools/genmake2 -mods=../code -of=../../../tools/build_options/linux_amd64_gfortran | tail -10; make depend | tail -10; make | tail -10'
alias md='make depend'
alias lT='l T*.data'
alias nt='l T*.data | wc -l'

# Copy all files needed for open_mdsdataset to work
copy_gridfiles() {
    scp parallel:/global/scratch/hugke729/"$@"/{Depth,DRC,DRF,DXC,DXG,DYC,DYG,hFacC,hFacS,hFacW,PHrefC,PHrefF,RAC,RAW,RAZ,RC,RF,XC,XG,YC,YG}{.meta,.data} .
}

