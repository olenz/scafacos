#include "fmm_c.h"

#if FMM_MAXNMULTIPOLES > 11
const fmm_float_t fmmec_0d_p12[] = {
#include "include/fmmec_0d_p12.h"
};

const fmm_float_t *get_fmmec_0d_p12()
{
  return fmmec_0d_p12;
}
#endif

