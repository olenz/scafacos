#include "fmm_c.h"

#if FMM_ERRORCONTROL_STAGE > 0
#  if FMM_MAXNMULTIPOLES > 11
   const fmm_float_t fmmec_2d_p12[] = {
#  include "include/fmmec_2d_p12.h"
   };

   const fmm_float_t *get_fmmec_2d_p12()
   {
     return fmmec_2d_p12;
   }
#  endif
#endif
