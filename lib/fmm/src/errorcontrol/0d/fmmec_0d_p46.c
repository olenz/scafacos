#include "fmm_c.h"

#if FMM_MAXNMULTIPOLES > 45
const fmm_float_t fmmec_0d_p46[] = {
#include "include/fmmec_0d_p46.h"
};

const fmm_float_t *get_fmmec_0d_p46()
{
  return fmmec_0d_p46;
}
#endif

