#include "fmm_c.h"

#if FMM_MAXNMULTIPOLES > 8
const fmm_float_t fmmec_0d_p09[] = {
#include "include/fmmec_0d_p09.h"
};

const fmm_float_t *get_fmmec_0d_p09()
{
  return fmmec_0d_p09;
}
#endif

