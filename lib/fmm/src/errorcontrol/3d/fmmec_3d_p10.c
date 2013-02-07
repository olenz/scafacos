#include "fmm_c.h"

#if FMM_ERRORCONTROL_STAGE > 0
#  if FMM_MAXNMULTIPOLES > 9
   const fmm_float_t fmmec_3d_p10[] = {
#  include "include/fmmec_3d_p10.h"
   };

   const fmm_float_t *get_fmmec_3d_p10()
   {
     return fmmec_3d_p10;
   }
#  endif
#endif
