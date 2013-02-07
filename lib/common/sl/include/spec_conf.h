/*
 *  Copyright (C) 2011, 2012, 2013 Michael Hofmann
 *  
 *  This file is part of ScaFaCoS.
 *  
 *  ScaFaCoS is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU Lesser Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *  
 *  ScaFaCoS is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU Lesser Public License for more details.
 *  
 *  You should have received a copy of the GNU Lesser Public License
 *  along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *  

 *  
 *  SL - Sorting Library, michael <dot> hofmann <at> informatik <dot> tu-chemnitz <dot> de
 */


#ifndef __SPEC_CONF_H__
#define __SPEC_CONF_H__


#include "sl_common.h"

#define z_mpi_rank  SL_PROC_RANK

#define SP_RENAME

#ifdef SL_PREFIX
# define SP_PREFIX  SL_PREFIX
#endif

#include "spec_public_conf.h"

#define spint_fmt  sl_int_type_fmt
#define MPI_SPINT  sl_int_type_mpi

#define spec_elem_alloc_buf(_e_, _n_)  elements_alloc((_e_), (_n_), SLCM_ALL)
#define spec_elem_free_buf(_e_)        elements_free((_e_))

#define spec_elem_copy_type(_s_, _d_)  Z_NOP()

#define spec_elem_ncopy_at(_se_, _sat_, _de_, _dat_, _n_) \
  elem_ncopy_at((_se_), (_sat_), (_de_), (_dat_), (_n_))

#define spec_elem_alltoallv_db(_sb_, _sc_, _sd_, _rb_, _rc_, _rd_, _s_, _r_, _c_) \
  mpi_elements_alltoallv_db((_sb_), (_sc_), (_sd_), (_rb_), (_rc_), (_rd_), (_s_), (_r_), (_c_))

#define spec_elem_alltoallv_ip(_b_, _xb_, _sc_, _sd_, _rc_, _rd_, _s_, _r_, _c_) \
  mpi_elements_alltoallv_ip((_b_), (_xb_), (_sc_), (_sd_), (_rc_), (_rd_), (_s_), (_r_), (_c_))

#define spec_elem_alloc_rbuf(_e_)  ((_e_)->max_size <= 0)

/*#define SPEC_ERROR_FILE*/

#define SPEC_EXIT_SUCCESS  MPI_SUCCESS
#define SPEC_EXIT_FAILED   1

#ifdef MC_ALLTOALL_INT_2STEP_THRESHOLD
# define SPEC_MPI_ALLTOALL_2STEP_THRESHOLD  MC_ALLTOALL_INT_2STEP_THRESHOLD
#endif


#endif /* __SPEC_CONF_H__ */
