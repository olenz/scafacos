/*
  Copyright (C) 2011, 2012, 2013 Olaf Lenz, Rene Halver, Michael Hofmann
  
  This file is part of ScaFaCoS.
  
  ScaFaCoS is free software: you can redistribute it and/or modify
  it under the terms of the GNU Lesser Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  (at your option) any later version.
  
  ScaFaCoS is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU Lesser Public License for more details.
  
  You should have received a copy of the GNU Lesser Public License
  along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/


#ifndef __NEAR_H__
#define __NEAR_H__


#ifdef __cplusplus
extern "C" {
#endif


#include <mpi.h>

#include "common/gridsort/gridsort.h"


typedef fcs_float (*fcs_near_field_f)(const void *param, fcs_float dist);
typedef fcs_float (*fcs_near_potential_f)(const void *param, fcs_float dist);
typedef void (*fcs_near_field_potential_f)(const void *param, fcs_float dist, fcs_float *f, fcs_float *p);

typedef fcs_float (*fcs_near_field_3diff_f)(const void *param, fcs_float dist, fcs_float dx, fcs_float dy, fcs_float dz);
typedef fcs_float (*fcs_near_potential_3diff_f)(const void *param, fcs_float dist, fcs_float dx, fcs_float dy, fcs_float dz);
typedef void (*fcs_near_field_potential_3diff_f)(const void *param, fcs_float dist, fcs_float dx, fcs_float dy, fcs_float dz, fcs_float *f, fcs_float *p);

typedef void (*fcs_near_loop_f)(fcs_float *positions0, fcs_float *charges0, fcs_float *field0, fcs_float *potentials0, fcs_int start0, fcs_int size0,
                                fcs_float *positions1, fcs_float *charges1, fcs_int start1, fcs_int size1, fcs_float cutoff, const void *near_param);


/**
 * @brief near field solver object structure
 */
typedef struct _fcs_near_t
{
  fcs_near_field_f compute_field;
  fcs_near_potential_f compute_potential;
  fcs_near_field_potential_f compute_field_potential;

  fcs_near_field_3diff_f compute_field_3diff;
  fcs_near_potential_3diff_f compute_potential_3diff;
  fcs_near_field_potential_3diff_f compute_field_potential_3diff;

  fcs_near_loop_f compute_loop;

  fcs_float box_base[3], box_a[3], box_b[3], box_c[3];
  fcs_int periodicity[3];

  fcs_int nparticles;
  fcs_float *positions, *charges;
  fcs_gridsort_index_t *indices;
  fcs_float *field, *potentials;

  fcs_int nghosts;
  fcs_float *ghost_positions, *ghost_charges;
  fcs_gridsort_index_t *ghost_indices;

} fcs_near_t;


/**
 * @brief create near field solver object
 * @param near fcs_near_t* near field solver object
 */
void fcs_near_create(fcs_near_t *near);

/**
 * @brief destroy near field solver object
 * @param near fcs_near_t* near field solver object
 */
void fcs_near_destroy(fcs_near_t *near);

/**
 * @brief set callback function for field computations
 * @param near fcs_near_t near field solver object
 * @param compute_field fcs_near_field_f callback function for field computations
 */
void fcs_near_set_field(fcs_near_t *near, fcs_near_field_f compute_field);

/**
 * @brief set callback function for potential computations
 * @param near fcs_near_t near field solver object
 * @param compute_potential fcs_near_potential_f callback function for potential computations
 */
void fcs_near_set_potential(fcs_near_t *near, fcs_near_potential_f compute_potential);

/**
 * @brief set callback function for combined field and potential computations
 * @param near fcs_near_t near field solver object
 * @param compute_field_potential fcs_near_field_potential_f callback function for combined field and potential computations
 */
void fcs_near_set_field_potential(fcs_near_t *near, fcs_near_field_potential_f compute_field_potential);

/**
 * @brief set callback function for field computations based on x-, y-, and z-differences
 * @param near fcs_near_t near field solver object
 * @param compute_field_3diff fcs_near_field_3diff_f callback function for field computations
 */
void fcs_near_set_field_3diff(fcs_near_t *near, fcs_near_field_3diff_f compute_field_3diff);

/**
 * @brief set callback function for potential computations based on x-, y-, and z-differences
 * @param near fcs_near_t near field solver object
 * @param compute_potential_3diff fcs_near_potential_3diff_f callback function for potential computations
 */
void fcs_near_set_potential_3diff(fcs_near_t *near, fcs_near_potential_3diff_f compute_potential_3diff);

/**
 * @brief set callback function for combined field and potential computations based on x-, y-, and z-differences
 * @param near fcs_near_t near field solver object
 * @param compute_field_potential_3diff fcs_near_field_potential_3diff_f callback function for combined field and potential computations
 */
void fcs_near_set_field_potential_3diff(fcs_near_t *near, fcs_near_field_potential_3diff_f compute_field_potential_3diff);

/**
 * @brief set callback function for whole loop of computations (created with FCS_NEAR_LOOP* macros)
 * @param near fcs_near_t near field solver object
 * @param compute_loop fcs_near_loop_f callback function for whole loop of computations
 */
void fcs_near_set_loop(fcs_near_t *near, fcs_near_loop_f compute_loop);

/**
 * @brief set particle system properties
 * @param near fcs_near_t near field solver object
 * @param box_base fcs_float* origin of the system box
 * @param box_a fcs_float* 1st base vector of the system box
 * @param box_b fcs_float* 2nd base vector of the system box
 * @param box_c fcs_float* 3rd base vector of the system box
 * @param periodicity fcs_int* periodicity of the system, if NULL then periodicities of the (cartesian) communicator are used
 */
void fcs_near_set_system(fcs_near_t *near, fcs_float *box_base, fcs_float *box_a, fcs_float *box_b, fcs_float *box_c, fcs_int *periodicity);

/**
 * @brief set particle information
 * @param near fcs_near_t near field solver object
 * @param nparticles fcs_int local number of particles
 * @param positions fcs_float* array of particle positions
 * @param charges fcs_float* array of particle charges
 * @param indices fcs_gridsort_index_t* array of particle indices (created by gridsort or NULL)
 * @param field fcs_float* array of field values, computed near field values are added, can be NULL if not required
 * @param potentials fcs_float* array of potential values, computed near field values are added, can be NULL if not required
 */
void fcs_near_set_particles(fcs_near_t *near, fcs_int nparticles, fcs_float *positions, fcs_float *charges, fcs_gridsort_index_t *indices, fcs_float *field, fcs_float *potentials);

/**
 * @brief set ghost particle information
 * @param near fcs_near_t near field solver object
 * @param nghosts fcs_int local number of ghost particles
 * @param positions fcs_float* array of ghost particle positions
 * @param charges fcs_float* array of ghost particle charges
 * @param indices fcs_gridsort_index_t* array of ghost particle indices (created by gridsort)
 */
void fcs_near_set_ghosts(fcs_near_t *near, fcs_int nghosts, fcs_float *positions, fcs_float *charges, fcs_gridsort_index_t *indices);

/**
 * @brief compute near field interactions with the given "gridsorted" particles,
 * particle values (positions, charges, field, potentials and gridsort-indices) get rearranged!
 * @param near fcs_near_t* near field solver object
 * @param cutoff fcs_float cutoff range
 * @param compute_param void* parameter for field and/or potential functions
 * @param comm MPI_Comm MPI communicator to use, has to be Cartesian if periodicity was not set with fcs_near_set_system
 * @return fcs_int zero if successful, otherwise less than zero
 */
fcs_int fcs_near_compute(fcs_near_t *near,
                         fcs_float cutoff,
                         const void *compute_param,
                         MPI_Comm comm);

/**
 * @brief compute near field interactions with the given particles (particle order remains unchanged!)
 * @param near fcs_near_t* near field solver object
 * @param cutoff fcs_float cutoff range
 * @param compute_param void* parameter for field and/or potential functions
 * @param comm MPI_Comm MPI communicator to use, has to be Cartesian if periodicity was not set with fcs_near_set_system
 * @return fcs_int zero if successful, otherwise less than zero
 */
fcs_int fcs_near_field_solver(fcs_near_t *near,
                              fcs_float cutoff,
                              const void *compute_param,
                              MPI_Comm comm);


#define FCS_NEAR_LOOP_HEAD() \
  fcs_int i, j; \
  fcs_float d[3], r_ij, f, p, fx;

#define FCS_NEAR_LOOP_BODY_HEAD(_p0_, _i0_, _p1_, _i1_) \
  d[0] = (_p1_)[3 * (_i1_) + 0] - (_p0_)[3 * (_i0_) + 0]; \
  d[1] = (_p1_)[3 * (_i1_) + 1] - (_p0_)[3 * (_i0_) + 1]; \
  d[2] = (_p1_)[3 * (_i1_) + 2] - (_p0_)[3 * (_i0_) + 2]; \
  r_ij = fcs_sqrt(d[0] * d[0] + d[1] * d[1] + d[2] * d[2])

#define FCS_NEAR_LOOP_BODY_GET_FIELD(_f_, _nf_, _r_, _param_) \
  (_f_) = _nf_((_param_), (_r_))

#define FCS_NEAR_LOOP_BODY_GET_FIELD_3DIFF(_f_, _nf_, _r_, _dx_, _dy_, _dz_, _param_) \
  (_f_) = _nf_((_param_), (_r_), (_dx_), (_dy_), (_dz_))

#define FCS_NEAR_LOOP_BODY_GET_POTENTIAL(_p_, _np_, _r_, _param_) \
  (_p_) = _np_((_param_), (_r_))

#define FCS_NEAR_LOOP_BODY_GET_POTENTIAL_3DIFF(_p_, _np_, _r_, _dx_, _dy_, _dz_, _param_) \
  (_p_) = _np_((_param_), (_r_), (_dx_), (_dy_), (_dz_))

#define FCS_NEAR_LOOP_BODY_GET_FIELD_POTENTIAL(_f_, _p_, _nfp_, _r_, _param_) \
  _nfp_((_param_), (_r_), (_f_), (_p_))

#define FCS_NEAR_LOOP_BODY_GET_FIELD_POTENTIAL_3DIFF(_f_, _p_, _nfp_, _r_, _dx_, _dy_, _dz_, _param_) \
  _nfp_((_param_), (_r_), (_dx_), (_dy_), (_dz_), (_f_), (_p_))

#define FCS_NEAR_LOOP_BODY_ADD_FIELD(_f0_, _i_, _q_, _f_, _r_) \
  fx = (_f_) * (_q_) / (_r_); \
  (_f0_)[3 * (_i_) + 0] += fx * d[0]; \
  (_f0_)[3 * (_i_) + 1] += fx * d[1]; \
  (_f0_)[3 * (_i_) + 2] += fx * d[2]

#define FCS_NEAR_LOOP_BODY_ADD_POTENTIAL(_p0_, _i_, _q_, _p_) \
  (_p0_)[_i_] += (_p_) * (_q_)

#define FCS_NEAR_LOOP_BODY_F_P(_nf_, _np_) \
do { \
  if (positions1 == NULL || charges1 == NULL) { \
    for (i = start0; i < start0 + size0; ++i) \
    for (j = ((start0 == start1)?(i + 1):(start1)); j < start1 + size1; ++j) \
    { \
      FCS_NEAR_LOOP_BODY_HEAD(positions0, i, positions0, j); \
      if (r_ij > cutoff) continue; \
      FCS_NEAR_LOOP_BODY_GET_FIELD(f, _nf_, r_ij, near_param); \
      FCS_NEAR_LOOP_BODY_ADD_FIELD(field0, i, charges0[j], f, r_ij); \
      FCS_NEAR_LOOP_BODY_ADD_FIELD(field0, j, charges0[i], -f, r_ij); \
      FCS_NEAR_LOOP_BODY_GET_POTENTIAL(p, _np_, r_ij, near_param); \
      FCS_NEAR_LOOP_BODY_ADD_POTENTIAL(potentials0, i, charges0[j], p); \
      FCS_NEAR_LOOP_BODY_ADD_POTENTIAL(potentials0, j, charges0[i], p); \
    } \
  } else { \
    for (i = start0; i < start0 + size0; ++i) \
    for (j = start1; j < start1 + size1; ++j) \
    { \
      FCS_NEAR_LOOP_BODY_HEAD(positions0, i, positions1, j); \
      if (r_ij > cutoff) continue; \
      FCS_NEAR_LOOP_BODY_GET_FIELD(f, _nf_, r_ij, near_param); \
      FCS_NEAR_LOOP_BODY_ADD_FIELD(field0, i, charges1[j], f, r_ij); \
      FCS_NEAR_LOOP_BODY_GET_POTENTIAL(p, _np_, r_ij, near_param); \
      FCS_NEAR_LOOP_BODY_ADD_POTENTIAL(potentials0, i, charges1[j], p); \
    } \
  }\
} while (0)

#define FCS_NEAR_LOOP_BODY_F(_nf_) \
do { \
  if (positions1 == NULL || charges1 == NULL) { \
    for (i = start0; i < start0 + size0; ++i) \
    for (j = ((start0 == start1)?(i + 1):(start1)); j < start1 + size1; ++j) \
    { \
      FCS_NEAR_LOOP_BODY_HEAD(positions0, i, positions0, j); \
      if (r_ij > cutoff) continue; \
      FCS_NEAR_LOOP_BODY_GET_FIELD(f, _nf_, r_ij, near_param); \
      FCS_NEAR_LOOP_BODY_ADD_FIELD(field0, i, charges0[j], f, r_ij); \
      FCS_NEAR_LOOP_BODY_ADD_FIELD(field0, j, charges0[i], -f, r_ij); \
    } \
  } else { \
    for (i = start0; i < start0 + size0; ++i) \
    for (j = start1; j < start1 + size1; ++j) \
    { \
      FCS_NEAR_LOOP_BODY_HEAD(positions0, i, positions1, j); \
      if (r_ij > cutoff) continue; \
      FCS_NEAR_LOOP_BODY_GET_FIELD(f, _nf_, r_ij, near_param); \
      FCS_NEAR_LOOP_BODY_ADD_FIELD(field0, i, charges1[j], f, r_ij); \
    } \
  } \
} while (0)

#define FCS_NEAR_LOOP_BODY_P(_np_) \
do { \
  if (positions1 == NULL || charges1 == NULL) { \
    for (i = start0; i < start0 + size0; ++i) \
    for (j = ((start0 == start1)?(i + 1):(start1)); j < start1 + size1; ++j) \
    { \
      FCS_NEAR_LOOP_BODY_HEAD(positions0, i, positions0, j); \
      if (r_ij > cutoff) continue; \
      FCS_NEAR_LOOP_BODY_GET_POTENTIAL(p, _np_, r_ij, near_param); \
      FCS_NEAR_LOOP_BODY_ADD_POTENTIAL(potentials0, i, charges0[j], p); \
      FCS_NEAR_LOOP_BODY_ADD_POTENTIAL(potentials0, j, charges0[i], p); \
    } \
  } else { \
    for (i = start0; i < start0 + size0; ++i) \
    for (j = start1; j < start1 + size1; ++j) \
    { \
      FCS_NEAR_LOOP_BODY_HEAD(positions0, i, positions1, j); \
      if (r_ij > cutoff) continue; \
      FCS_NEAR_LOOP_BODY_GET_POTENTIAL(p, _np_, r_ij, near_param); \
      FCS_NEAR_LOOP_BODY_ADD_POTENTIAL(potentials0, i, charges1[j], p); \
    } \
  } \
} while (0)

#define FCS_NEAR_LOOP_BODY_FP(_nfp_) \
do { \
  if (positions1 == NULL || charges1 == NULL) { \
    for (i = start0; i < start0 + size0; ++i) \
    for (j = ((start0 == start1)?(i + 1):(start1)); j < start1 + size1; ++j) \
    { \
      FCS_NEAR_LOOP_BODY_HEAD(positions0, i, positions0, j); \
      if (r_ij > cutoff) continue; \
      FCS_NEAR_LOOP_BODY_GET_FIELD_POTENTIAL(&f, &p, _nfp_, r_ij, near_param); \
      FCS_NEAR_LOOP_BODY_ADD_FIELD(field0, i, charges0[j], f, r_ij); \
      FCS_NEAR_LOOP_BODY_ADD_FIELD(field0, j, charges0[i], -f, r_ij); \
      FCS_NEAR_LOOP_BODY_ADD_POTENTIAL(potentials0, i, charges0[j], p); \
      FCS_NEAR_LOOP_BODY_ADD_POTENTIAL(potentials0, j, charges0[i], p); \
    } \
  } else { \
    for (i = start0; i < start0 + size0; ++i) \
    for (j = start1; j < start1 + size1; ++j) \
    { \
      FCS_NEAR_LOOP_BODY_HEAD(positions0, i, positions1, j); \
      if (r_ij > cutoff) continue; \
      FCS_NEAR_LOOP_BODY_GET_FIELD_POTENTIAL(&f, &p, _nfp_, r_ij, near_param); \
      FCS_NEAR_LOOP_BODY_ADD_FIELD(field0, i, charges1[j], f, r_ij); \
      FCS_NEAR_LOOP_BODY_ADD_POTENTIAL(potentials0, i, charges1[j], p); \
    } \
  } \
} while (0)

#define FCS_NEAR_LOOP_BODY_FP_F(_nfp_) \
do { \
  if (positions1 == NULL || charges1 == NULL) { \
    for (i = start0; i < start0 + size0; ++i) \
    for (j = ((start0 == start1)?(i + 1):(start1)); j < start1 + size1; ++j) \
    { \
      FCS_NEAR_LOOP_BODY_HEAD(positions0, i, positions0, j); \
      if (r_ij > cutoff) continue; \
      FCS_NEAR_LOOP_BODY_GET_FIELD_POTENTIAL(&f, &p, _nfp_, r_ij, near_param); \
      FCS_NEAR_LOOP_BODY_ADD_FIELD(field0, i, charges0[j], f, r_ij); \
      FCS_NEAR_LOOP_BODY_ADD_FIELD(field0, j, charges0[i], -f, r_ij); \
    } \
  } else { \
    for (i = start0; i < start0 + size0; ++i) \
    for (j = start1; j < start1 + size1; ++j) \
    { \
      FCS_NEAR_LOOP_BODY_HEAD(positions0, i, positions1, j); \
      if (r_ij > cutoff) continue; \
      FCS_NEAR_LOOP_BODY_GET_FIELD_POTENTIAL(&f, &p, _nfp_, r_ij, near_param); \
      FCS_NEAR_LOOP_BODY_ADD_FIELD(field0, i, charges1[j], f, r_ij); \
    } \
  } \
} while (0)

#define FCS_NEAR_LOOP_BODY_FP_P(_nfp_) \
do { \
  if (positions1 == NULL || charges1 == NULL) { \
    for (i = start0; i < start0 + size0; ++i) \
    for (j = ((start0 == start1)?(i + 1):(start1)); j < start1 + size1; ++j) \
    { \
      FCS_NEAR_LOOP_BODY_HEAD(positions0, i, positions0, j); \
      if (r_ij > cutoff) continue; \
      FCS_NEAR_LOOP_BODY_GET_FIELD_POTENTIAL(&f, &p, _nfp_, r_ij, near_param); \
      FCS_NEAR_LOOP_BODY_ADD_POTENTIAL(potentials0, i, charges0[j], p); \
      FCS_NEAR_LOOP_BODY_ADD_POTENTIAL(potentials0, j, charges0[i], p); \
    } \
  } else { \
    for (i = start0; i < start0 + size0; ++i) \
    for (j = start1; j < start1 + size1; ++j) \
    { \
      FCS_NEAR_LOOP_BODY_HEAD(positions0, i, positions1, j); \
      if (r_ij > cutoff) continue; \
      FCS_NEAR_LOOP_BODY_GET_FIELD_POTENTIAL(&f, &p, _nfp_, r_ij, near_param); \
      FCS_NEAR_LOOP_BODY_ADD_POTENTIAL(potentials0, i, charges1[j], p); \
    } \
  } \
} while (0)

#define FCS_NEAR_LOOP_BODY_3DIFF_F_P(_nf_, _np_) \
do { \
  if (positions1 == NULL || charges1 == NULL) { \
    for (i = start0; i < start0 + size0; ++i) \
    for (j = ((start0 == start1)?(i + 1):(start1)); j < start1 + size1; ++j) \
    { \
      FCS_NEAR_LOOP_BODY_HEAD(positions0, i, positions0, j); \
      if (r_ij > cutoff) continue; \
      FCS_NEAR_LOOP_BODY_GET_FIELD_3DIFF(f, _nf_, r_ij, d[0], d[1], d[2], near_param); \
      FCS_NEAR_LOOP_BODY_ADD_FIELD(field0, i, charges0[j], f, r_ij); \
      FCS_NEAR_LOOP_BODY_ADD_FIELD(field0, j, charges0[i], -f, r_ij); \
      FCS_NEAR_LOOP_BODY_GET_POTENTIAL_3DIFF(p, _np_, r_ij, d[0], d[1], d[2], near_param); \
      FCS_NEAR_LOOP_BODY_ADD_POTENTIAL(potentials0, i, charges0[j], p); \
      FCS_NEAR_LOOP_BODY_ADD_POTENTIAL(potentials0, j, charges0[i], p); \
    } \
  } else { \
    for (i = start0; i < start0 + size0; ++i) \
    for (j = start1; j < start1 + size1; ++j) \
    { \
      FCS_NEAR_LOOP_BODY_HEAD(positions0, i, positions1, j); \
      if (r_ij > cutoff) continue; \
      FCS_NEAR_LOOP_BODY_GET_FIELD_3DIFF(f, _nf_, r_ij, d[0], d[1], d[2], near_param); \
      FCS_NEAR_LOOP_BODY_ADD_FIELD(field0, i, charges1[j], f, r_ij); \
      FCS_NEAR_LOOP_BODY_GET_POTENTIAL_3DIFF(p, _np_, r_ij, d[0], d[1], d[2], near_param); \
      FCS_NEAR_LOOP_BODY_ADD_POTENTIAL(potentials0, i, charges1[j], p); \
    } \
  }\
} while (0)

#define FCS_NEAR_LOOP_BODY_3DIFF_F(_nf_) \
do { \
  if (positions1 == NULL || charges1 == NULL) { \
    for (i = start0; i < start0 + size0; ++i) \
    for (j = ((start0 == start1)?(i + 1):(start1)); j < start1 + size1; ++j) \
    { \
      FCS_NEAR_LOOP_BODY_HEAD(positions0, i, positions0, j); \
      if (r_ij > cutoff) continue; \
      FCS_NEAR_LOOP_BODY_GET_FIELD_3DIFF(f, _nf_, r_ij, d[0], d[1], d[2], near_param); \
      FCS_NEAR_LOOP_BODY_ADD_FIELD(field0, i, charges0[j], f, r_ij); \
      FCS_NEAR_LOOP_BODY_ADD_FIELD(field0, j, charges0[i], -f, r_ij); \
    } \
  } else { \
    for (i = start0; i < start0 + size0; ++i) \
    for (j = start1; j < start1 + size1; ++j) \
    { \
      FCS_NEAR_LOOP_BODY_HEAD(positions0, i, positions1, j); \
      if (r_ij > cutoff) continue; \
      FCS_NEAR_LOOP_BODY_GET_FIELD_3DIFF(f, _nf_, r_ij, d[0], d[1], d[2], near_param); \
      FCS_NEAR_LOOP_BODY_ADD_FIELD(field0, i, charges1[j], f, r_ij); \
    } \
  } \
} while (0)

#define FCS_NEAR_LOOP_BODY_3DIFF_P(_np_) \
do { \
  if (positions1 == NULL || charges1 == NULL) { \
    for (i = start0; i < start0 + size0; ++i) \
    for (j = ((start0 == start1)?(i + 1):(start1)); j < start1 + size1; ++j) \
    { \
      FCS_NEAR_LOOP_BODY_HEAD(positions0, i, positions0, j); \
      if (r_ij > cutoff) continue; \
      FCS_NEAR_LOOP_BODY_GET_POTENTIAL_3DIFF(p, _np_, r_ij, d[0], d[1], d[2], near_param); \
      FCS_NEAR_LOOP_BODY_ADD_POTENTIAL(potentials0, i, charges0[j], p); \
      FCS_NEAR_LOOP_BODY_ADD_POTENTIAL(potentials0, j, charges0[i], p); \
    } \
  } else { \
    for (i = start0; i < start0 + size0; ++i) \
    for (j = start1; j < start1 + size1; ++j) \
    { \
      FCS_NEAR_LOOP_BODY_HEAD(positions0, i, positions1, j); \
      if (r_ij > cutoff) continue; \
      FCS_NEAR_LOOP_BODY_GET_POTENTIAL_3DIFF(p, _np_, r_ij, d[0], d[1], d[2], near_param); \
      FCS_NEAR_LOOP_BODY_ADD_POTENTIAL(potentials0, i, charges1[j], p); \
    } \
  } \
} while (0)

#define FCS_NEAR_LOOP_BODY_3DIFF_FP(_nfp_) \
do { \
  if (positions1 == NULL || charges1 == NULL) { \
    for (i = start0; i < start0 + size0; ++i) \
    for (j = ((start0 == start1)?(i + 1):(start1)); j < start1 + size1; ++j) \
    { \
      FCS_NEAR_LOOP_BODY_HEAD(positions0, i, positions0, j); \
      if (r_ij > cutoff) continue; \
      FCS_NEAR_LOOP_BODY_GET_FIELD_POTENTIAL_3DIFF(&f, &p, _nfp_, r_ij, d[0], d[1], d[2], near_param); \
      FCS_NEAR_LOOP_BODY_ADD_FIELD(field0, i, charges0[j], f, r_ij); \
      FCS_NEAR_LOOP_BODY_ADD_FIELD(field0, j, charges0[i], -f, r_ij); \
      FCS_NEAR_LOOP_BODY_ADD_POTENTIAL(potentials0, i, charges0[j], p); \
      FCS_NEAR_LOOP_BODY_ADD_POTENTIAL(potentials0, j, charges0[i], p); \
    } \
  } else { \
    for (i = start0; i < start0 + size0; ++i) \
    for (j = start1; j < start1 + size1; ++j) \
    { \
      FCS_NEAR_LOOP_BODY_HEAD(positions0, i, positions1, j); \
      if (r_ij > cutoff) continue; \
      FCS_NEAR_LOOP_BODY_GET_FIELD_POTENTIAL_3DIFF(&f, &p, _nfp_, r_ij, d[0], d[1], d[2], near_param); \
      FCS_NEAR_LOOP_BODY_ADD_FIELD(field0, i, charges1[j], f, r_ij); \
      FCS_NEAR_LOOP_BODY_ADD_POTENTIAL(potentials0, i, charges1[j], p); \
    } \
  } \
} while (0)

#define FCS_NEAR_LOOP_BODY_3DIFF_FP_F(_nfp_) \
do { \
  if (positions1 == NULL || charges1 == NULL) { \
    for (i = start0; i < start0 + size0; ++i) \
    for (j = ((start0 == start1)?(i + 1):(start1)); j < start1 + size1; ++j) \
    { \
      FCS_NEAR_LOOP_BODY_HEAD(positions0, i, positions0, j); \
      if (r_ij > cutoff) continue; \
      FCS_NEAR_LOOP_BODY_GET_FIELD_POTENTIAL_3DIFF(&f, &p, _nfp_, r_ij, d[0], d[1], d[2], near_param); \
      FCS_NEAR_LOOP_BODY_ADD_FIELD(field0, i, charges0[j], f, r_ij); \
      FCS_NEAR_LOOP_BODY_ADD_FIELD(field0, j, charges0[i], -f, r_ij); \
    } \
  } else { \
    for (i = start0; i < start0 + size0; ++i) \
    for (j = start1; j < start1 + size1; ++j) \
    { \
      FCS_NEAR_LOOP_BODY_HEAD(positions0, i, positions1, j); \
      if (r_ij > cutoff) continue; \
      FCS_NEAR_LOOP_BODY_GET_FIELD_POTENTIAL_3DIFF(&f, &p, _nfp_, r_ij, d[0], d[1], d[2], near_param); \
      FCS_NEAR_LOOP_BODY_ADD_FIELD(field0, i, charges1[j], f, r_ij); \
    } \
  } \
} while (0)

#define FCS_NEAR_LOOP_BODY_3DIFF_FP_P(_nfp_) \
do { \
  if (positions1 == NULL || charges1 == NULL) { \
    for (i = start0; i < start0 + size0; ++i) \
    for (j = ((start0 == start1)?(i + 1):(start1)); j < start1 + size1; ++j) \
    { \
      FCS_NEAR_LOOP_BODY_HEAD(positions0, i, positions0, j); \
      if (r_ij > cutoff) continue; \
      FCS_NEAR_LOOP_BODY_GET_FIELD_POTENTIAL_3DIFF(&f, &p, _nfp_, r_ij, d[0], d[1], d[2], near_param); \
      FCS_NEAR_LOOP_BODY_ADD_POTENTIAL(potentials0, i, charges0[j], p); \
      FCS_NEAR_LOOP_BODY_ADD_POTENTIAL(potentials0, j, charges0[i], p); \
    } \
  } else { \
    for (i = start0; i < start0 + size0; ++i) \
    for (j = start1; j < start1 + size1; ++j) \
    { \
      FCS_NEAR_LOOP_BODY_HEAD(positions0, i, positions1, j); \
      if (r_ij > cutoff) continue; \
      FCS_NEAR_LOOP_BODY_GET_FIELD_POTENTIAL_3DIFF(&f, &p, _nfp_, r_ij, d[0], d[1], d[2], near_param); \
      FCS_NEAR_LOOP_BODY_ADD_POTENTIAL(potentials0, i, charges1[j], p); \
    } \
  } \
} while (0)

/**
 * @brief create loop callback function for field and potential computations
 * @param _id_ name name of the loop callback function
 * @param _nf_ name name of the function for field computations (type fcs_near_field_f)
 * @param _np_ name name of the function for potential computations (type fcs_near_potential_f)
 */
#define FCS_NEAR_LOOP_F_P(_id_, _nf_, _np_) \
void _id_(fcs_float *positions0, fcs_float *charges0, fcs_float *field0, fcs_float *potentials0, fcs_int start0, fcs_int size0, fcs_float *positions1, fcs_float *charges1, fcs_int start1, fcs_int size1, fcs_float cutoff, const void *near_param) \
{ \
  FCS_NEAR_LOOP_HEAD(); \
\
  if (field0 && potentials0)         FCS_NEAR_LOOP_BODY_F_P(_nf_, _np_); \
  if (field0 && potentials0 == NULL) FCS_NEAR_LOOP_BODY_F(_nf_); \
  if (field0 == NULL && potentials0) FCS_NEAR_LOOP_BODY_P(_np_); \
}

/**
 * @brief create loop callback function for field computations
 * @param _id_ name name of the loop callback function
 * @param _nf_ name name of the function for field computations (type fcs_near_field_f)
 */
#define FCS_NEAR_LOOP_F(_id_, _nf_) \
void _id_(fcs_float *positions0, fcs_float *charges0, fcs_float *field0, fcs_float *potentials0, fcs_int start0, fcs_int size0, fcs_float *positions1, fcs_float *charges1, fcs_int start1, fcs_int size1, fcs_float cutoff, const void *near_param) \
{ \
  FCS_NEAR_LOOP_HEAD(); \
\
  if (field) FCS_NEAR_LOOP_BODY_F(_nf_); \
}

/**
 * @brief create loop callback function for potential computations
 * @param _id_ name name of the loop callback function
 * @param _np_ name name of the function for potential computations (type fcs_near_potential_f)
 */
#define FCS_NEAR_LOOP_P(_id_, _np_) \
void _id_(fcs_float *positions0, fcs_float *charges0, fcs_float *field0, fcs_float *potentials0, fcs_int start0, fcs_int size0, fcs_float *positions1, fcs_float *charges1, fcs_int start1, fcs_int size1, fcs_float cutoff, const void *near_param) \
{ \
  FCS_NEAR_LOOP_HEAD(); \
\
  if (potentials0) FCS_NEAR_LOOP_BODY_P(_np_); \
}

/**
 * @brief create loop callback function for field and potential computations
 * @param _id_ name name of the loop callback function
 * @param _nfp_ name name of the function for combined field and potential computations (type fcs_near_field_potential_f)
 */
#define FCS_NEAR_LOOP_FP(_id_, _nfp_) \
void _id_(fcs_float *positions0, fcs_float *charges0, fcs_float *field0, fcs_float *potentials0, fcs_int start0, fcs_int size0, fcs_float *positions1, fcs_float *charges1, fcs_int start1, fcs_int size1, fcs_float cutoff, const void *near_param) \
{ \
  FCS_NEAR_LOOP_HEAD(); \
\
  if (field0 && potentials0)         FCS_NEAR_LOOP_BODY_FP(_nfp_); \
  if (field0 && potentials0 == NULL) FCS_NEAR_LOOP_BODY_FP_F(_nfp_); \
  if (field0 == NULL && potentials0) FCS_NEAR_LOOP_BODY_FP_P(_nfp_); \
}

/**
 * @brief create loop callback function for field and potential computations,
 * uses macro FCS_NEAR_LOOP2_FIELD for field computations and macro FCS_NEAR_LOOP2_POTENTIAL for potential computations
 * @param _id_ name name of the loop callback function
 */
#define FCS_NEAR_LOOP2_F_P(_id_)  FCS_NEAR_LOOP_F_P(_id_, FCS_NEAR_LOOP2_FIELD, FCS_NEAR_LOOP2_POTENTIAL)

/**
 * @brief create loop callback function for field computations,
 * uses macro FCS_NEAR_LOOP2_FIELD for field computations
 * @param _id_ name name of the loop callback function
 */
#define FCS_NEAR_LOOP2_F(_id_)  FCS_NEAR_LOOP_F(_id_, FCS_NEAR_LOOP2_FIELD)

/**
 * @brief create loop callback function for potential computations,
 * uses macro FCS_NEAR_LOOP2_POTENTIAL for potential computations
 * @param _id_ name name of the loop callback function
 */
#define FCS_NEAR_LOOP2_P(_id_)  FCS_NEAR_LOOP_P(_id_, FCS_NEAR_LOOP2_POTENTIAL)

/**
 * @brief create loop callback function for combined field and potential computations,
 * uses macro FCS_NEAR_LOOP2_FIELD_POTENTIAL for combined field and potential computations
 * @param _id_ name name of the loop callback function
 */
#define FCS_NEAR_LOOP2_FP(_id_)  FCS_NEAR_LOOP_FP(_id_, FCS_NEAR_LOOP2_FIELD_POTENTIAL)

/**
 * @brief create loop callback function for field and potential computations based on x-, y-, and z-differences
 * @param _id_ name name of the loop callback function
 * @param _nf_ name name of the function for field computations (type fcs_near_field_3diff_f)
 * @param _np_ name name of the function for potential computations (type fcs_near_potential_3diff_f)
 */
#define FCS_NEAR_LOOP_3DIFF_F_P(_id_, _nf_, _np_) \
void _id_(fcs_float *positions0, fcs_float *charges0, fcs_float *field0, fcs_float *potentials0, fcs_int start0, fcs_int size0, fcs_float *positions1, fcs_float *charges1, fcs_int start1, fcs_int size1, fcs_float cutoff, const void *near_param) \
{ \
  FCS_NEAR_LOOP_HEAD(); \
\
  if (field0 && potentials0)         FCS_NEAR_LOOP_BODY_3DIFF_F_P(_nf_, _np_); \
  if (field0 && potentials0 == NULL) FCS_NEAR_LOOP_BODY_3DIFF_F(_nf_); \
  if (field0 == NULL && potentials0) FCS_NEAR_LOOP_BODY_3DIFF_P(_np_); \
}

/**
 * @brief create loop callback function for field computations based on x-, y-, and z-differences
 * @param _id_ name name of the loop callback function
 * @param _nf_ name name of the function for field computations (type fcs_near_field_f)
 */
#define FCS_NEAR_LOOP_3DIFF_F(_id_, _nf_) \
void _id_(fcs_float *positions0, fcs_float *charges0, fcs_float *field0, fcs_float *potentials0, fcs_int start0, fcs_int size0, fcs_float *positions1, fcs_float *charges1, fcs_int start1, fcs_int size1, fcs_float cutoff, const void *near_param) \
{ \
  FCS_NEAR_LOOP_HEAD(); \
\
  if (field) FCS_NEAR_LOOP_BODY_F(_nf_); \
}

/**
 * @brief create loop callback function for potential computations based on x-, y-, and z-differences
 * @param _id_ name name of the loop callback function
 * @param _np_ name name of the function for potential computations (type fcs_near_potential_f)
 */
#define FCS_NEAR_LOOP_3DIFF_P(_id_, _np_) \
void _id_(fcs_float *positions0, fcs_float *charges0, fcs_float *field0, fcs_float *potentials0, fcs_int start0, fcs_int size0, fcs_float *positions1, fcs_float *charges1, fcs_int start1, fcs_int size1, fcs_float cutoff, const void *near_param) \
{ \
  FCS_NEAR_LOOP_HEAD(); \
\
  if (potentials0) FCS_NEAR_LOOP_BODY_3DIFF_P(_np_); \
}

/**
 * @brief create loop callback function for field and potential computations based on x-, y-, and z-differences
 * @param _id_ name name of the loop callback function
 * @param _nfp_ name name of the function for combined field and potential computations (type fcs_near_field_potential_f)
 */
#define FCS_NEAR_LOOP_3DIFF_FP(_id_, _nfp_) \
void _id_(fcs_float *positions0, fcs_float *charges0, fcs_float *field0, fcs_float *potentials0, fcs_int start0, fcs_int size0, fcs_float *positions1, fcs_float *charges1, fcs_int start1, fcs_int size1, fcs_float cutoff, const void *near_param) \
{ \
  FCS_NEAR_LOOP_HEAD(); \
\
  if (field0 && potentials0)         FCS_NEAR_LOOP_BODY_3DIFF_FP(_nfp_); \
  if (field0 && potentials0 == NULL) FCS_NEAR_LOOP_BODY_3DIFF_FP_F(_nfp_); \
  if (field0 == NULL && potentials0) FCS_NEAR_LOOP_BODY_3DIFF_FP_P(_nfp_); \
}

/**
 * @brief create loop callback function for field and potential computations based on x-, y-, and z-differences,
 * uses macro FCS_NEAR_LOOP2_FIELD_3DIFF for field computations and macro FCS_NEAR_LOOP2_POTENTIAL_3DIFF for potential computations
 * @param _id_ name name of the loop callback function
 */
#define FCS_NEAR_LOOP2_3DIFF_F_P(_id_)  FCS_NEAR_LOOP_3DIFF_F_P(_id_, FCS_NEAR_LOOP2_FIELD_3DIFF, FCS_NEAR_LOOP2_POTENTIAL_3DIFF)

/**
 * @brief create loop callback function for field computations based on x-, y-, and z-differences,
 * uses macro FCS_NEAR_LOOP2_FIELD_3DIFF for field computations
 * @param _id_ name name of the loop callback function
 */
#define FCS_NEAR_LOOP2_3DIFF_F(_id_)  FCS_NEAR_LOOP_3DIFF_F(_id_, FCS_NEAR_LOOP2_FIELD_3DIFF)

/**
 * @brief create loop callback function for potential computations based on x-, y-, and z-differences,
 * uses macro FCS_NEAR_LOOP2_POTENTIAL_3DIFF for potential computations
 * @param _id_ name name of the loop callback function
 */
#define FCS_NEAR_LOOP2_3DIFF_P(_id_)  FCS_NEAR_LOOP_3DIFF_P(_id_, FCS_NEAR_LOOP2_POTENTIAL_3DIFF)

/**
 * @brief create loop callback function for combined field and potential computations based on x-, y-, and z-differences,
 * uses macro FCS_NEAR_LOOP2_FIELD_POTENTIAL_3DIFF for combined field and potential computations
 * @param _id_ name name of the loop callback function
 */
#define FCS_NEAR_LOOP2_3DIFF_FP(_id_)  FCS_NEAR_LOOP_3DIFF_FP(_id_, FCS_NEAR_LOOP2_FIELD_POTENTIAL_3DIFF)


#ifdef __cplusplus
}
#endif


#endif /* __NEAR_H__ */
