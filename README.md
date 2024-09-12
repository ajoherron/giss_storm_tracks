# Setup 

cd mcms_tracker-4.1

bash

module load  anaconda/py3.9

module load  python/GEOSpyD/Min24.4.0-0_py3.12

cd tracker

python3 setup_g2l_v4.py build_ext --inplace

python3 setup_gcd_v4.py build_ext --inplace

python3 setup_rhumb_line_nav_v4.py build_ext --inplace

cp gcd_v4.cpython*.so gcd_v4.so

cp g2l_v4.cpython*.so g2l_v4.so

cp rhumb_line_nav_v4.cpython*.so rhumb_line_nav_v4.so

# Update defines.py

(Already taken care of for this repository)

- source_code_folder should point to mcms_tracker
  - ex: source_code_folder = '/home/jjonas/work_ana/STORM_TRACKS_NEW/giss_storm_tracks/mcms_tracker-4.1'
- main_folder_location should point to giss_storm_tracks
  - ex: main_folder_location = '/home/jjonas/work_ana/STORM_TRACKS_NEW/giss_storm_tracks/'
- Add the following lines for sample input data:
slp_data_directory = '/discover/nobackup/melling/debug_stormtracks/mcms_tracker-4.0/sample_inputs/slp/'
var_data_directory = '/discover/nobackup/melling/debug_stormtracks/mcms_tracker-4.0/sample_inputs/slp/'
topo_file = '/discover/nobackup/melling/debug_stormtracks/mcms_tracker-4.0/sample_inputs/topo/GISS_MCMS_Topography.nc'
model = 'E213F40oQ40'
over_write_years = [7550, 7550]

# Update main_create_dict.py

(Already taken care of for this repository)

Change: main_df = pd.read_csv(in_file, sep='\s+') Line 27

to:     main_df = pd.read_csv(in_file, sep=' ')

Change: if (mode(yy).mode[0] != i_year): Line 101

to:     if (mode(yy).mode != i_year):

Change: temp_yr_mode.append(mode(yy).mode[0]) Line 105

to:     temp_yr_mode.append(mode(yy).mode)

Change: temp_mon_mode.append(mode(mm).mode[0]) Line 112

to:     temp_mon_mode.append(mode(mm).mode)

# Run the script

python3 run_tracker.py
