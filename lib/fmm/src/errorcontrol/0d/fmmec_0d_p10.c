#include "fmm_c.h"

#if FMM_MAXNMULTIPOLES > 9
const fmm_float_t fmmec_0d_p10[] = {
#include "include/fmmec_0d_p10.h"
};

const fmm_float_t *get_fmmec_0d_p10()
{
  return fmmec_0d_p10;
}
#endif

