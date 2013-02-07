#include "../../fmm.h"
c
#if FMM_MAXNMULTIPOLES > 8 && defined(FMM_UNROLLED)
      subroutine fmmmop9(q,x,y,z,rsq,g,h,rmop,imop)
c
      use fmmkinds
c
      implicit none
c
      real(kind=fmm_real) q,x,y,z,rsq,g(0:*),h(0:*),rmop(*),imop(*),
     .zero,s
c
      rsq = rsq*rsq
      x = x*rsq
      y = y*rsq
      z = z*rsq
      zero = g(0)
      rmop(1) = q
      imop(1) = zero
      rmop(2) = z*rmop(1)
      imop(2) = zero
      rmop(3) = x*rmop(1)
      imop(3) = y*rmop(1)
      s = h(   0)*z
      rmop(   4) = s*rmop(   2)-g(   1)*rsq*rmop(   1)
      imop(   4) = zero
      rmop(   5) = s*rmop(   3)
      imop(   5) = s*imop(   3)
      rmop(   6) = h(   0)*(x*rmop(   3)-y*imop(   3))
      imop(   6) = h(   0)*(x*imop(   3)+y*rmop(   3))
      s = h(   1)*z
      rmop(   7) = s*rmop(   4)-g(   2)*rsq*rmop(   2)
      imop(   7) = zero
      rmop(   8) = s*rmop(   5)-g(   3)*rsq*rmop(   3)
      imop(   8) = s*imop(   5)-g(   3)*rsq*imop(   3)
      rmop(   9) = s*rmop(   6)
      imop(   9) = s*imop(   6)
      rmop(  10) = h(   1)*(x*rmop(   6)-y*imop(   6))
      imop(  10) = h(   1)*(x*imop(   6)+y*rmop(   6))
      s = h(   2)*z
      rmop(  11) = s*rmop(   7)-g(   4)*rsq*rmop(   4)
      imop(  11) = zero
      rmop(  12) = s*rmop(   8)-g(   5)*rsq*rmop(   5)
      imop(  12) = s*imop(   8)-g(   5)*rsq*imop(   5)
      rmop(  13) = s*rmop(   9)-g(   6)*rsq*rmop(   6)
      imop(  13) = s*imop(   9)-g(   6)*rsq*imop(   6)
      rmop(  14) = s*rmop(  10)
      imop(  14) = s*imop(  10)
      rmop(  15) = h(   2)*(x*rmop(  10)-y*imop(  10))
      imop(  15) = h(   2)*(x*imop(  10)+y*rmop(  10))
      s = h(   3)*z
      rmop(  16) = s*rmop(  11)-g(   7)*rsq*rmop(   7)
      imop(  16) = zero
      rmop(  17) = s*rmop(  12)-g(   8)*rsq*rmop(   8)
      imop(  17) = s*imop(  12)-g(   8)*rsq*imop(   8)
      rmop(  18) = s*rmop(  13)-g(   9)*rsq*rmop(   9)
      imop(  18) = s*imop(  13)-g(   9)*rsq*imop(   9)
      rmop(  19) = s*rmop(  14)-g(  10)*rsq*rmop(  10)
      imop(  19) = s*imop(  14)-g(  10)*rsq*imop(  10)
      rmop(  20) = s*rmop(  15)
      imop(  20) = s*imop(  15)
      rmop(  21) = h(   3)*(x*rmop(  15)-y*imop(  15))
      imop(  21) = h(   3)*(x*imop(  15)+y*rmop(  15))
      s = h(   4)*z
      rmop(  22) = s*rmop(  16)-g(  11)*rsq*rmop(  11)
      imop(  22) = zero
      rmop(  23) = s*rmop(  17)-g(  12)*rsq*rmop(  12)
      imop(  23) = s*imop(  17)-g(  12)*rsq*imop(  12)
      rmop(  24) = s*rmop(  18)-g(  13)*rsq*rmop(  13)
      imop(  24) = s*imop(  18)-g(  13)*rsq*imop(  13)
      rmop(  25) = s*rmop(  19)-g(  14)*rsq*rmop(  14)
      imop(  25) = s*imop(  19)-g(  14)*rsq*imop(  14)
      rmop(  26) = s*rmop(  20)-g(  15)*rsq*rmop(  15)
      imop(  26) = s*imop(  20)-g(  15)*rsq*imop(  15)
      rmop(  27) = s*rmop(  21)
      imop(  27) = s*imop(  21)
      rmop(  28) = h(   4)*(x*rmop(  21)-y*imop(  21))
      imop(  28) = h(   4)*(x*imop(  21)+y*rmop(  21))
      s = h(   5)*z
      rmop(  29) = s*rmop(  22)-g(  16)*rsq*rmop(  16)
      imop(  29) = zero
      rmop(  30) = s*rmop(  23)-g(  17)*rsq*rmop(  17)
      imop(  30) = s*imop(  23)-g(  17)*rsq*imop(  17)
      rmop(  31) = s*rmop(  24)-g(  18)*rsq*rmop(  18)
      imop(  31) = s*imop(  24)-g(  18)*rsq*imop(  18)
      rmop(  32) = s*rmop(  25)-g(  19)*rsq*rmop(  19)
      imop(  32) = s*imop(  25)-g(  19)*rsq*imop(  19)
      rmop(  33) = s*rmop(  26)-g(  20)*rsq*rmop(  20)
      imop(  33) = s*imop(  26)-g(  20)*rsq*imop(  20)
      rmop(  34) = s*rmop(  27)-g(  21)*rsq*rmop(  21)
      imop(  34) = s*imop(  27)-g(  21)*rsq*imop(  21)
      rmop(  35) = s*rmop(  28)
      imop(  35) = s*imop(  28)
      rmop(  36) = h(   5)*(x*rmop(  28)-y*imop(  28))
      imop(  36) = h(   5)*(x*imop(  28)+y*rmop(  28))
      s = h(   6)*z
      rmop(  37) = s*rmop(  29)-g(  22)*rsq*rmop(  22)
      imop(  37) = zero
      rmop(  38) = s*rmop(  30)-g(  23)*rsq*rmop(  23)
      imop(  38) = s*imop(  30)-g(  23)*rsq*imop(  23)
      rmop(  39) = s*rmop(  31)-g(  24)*rsq*rmop(  24)
      imop(  39) = s*imop(  31)-g(  24)*rsq*imop(  24)
      rmop(  40) = s*rmop(  32)-g(  25)*rsq*rmop(  25)
      imop(  40) = s*imop(  32)-g(  25)*rsq*imop(  25)
      rmop(  41) = s*rmop(  33)-g(  26)*rsq*rmop(  26)
      imop(  41) = s*imop(  33)-g(  26)*rsq*imop(  26)
      rmop(  42) = s*rmop(  34)-g(  27)*rsq*rmop(  27)
      imop(  42) = s*imop(  34)-g(  27)*rsq*imop(  27)
      rmop(  43) = s*rmop(  35)-g(  28)*rsq*rmop(  28)
      imop(  43) = s*imop(  35)-g(  28)*rsq*imop(  28)
      rmop(  44) = s*rmop(  36)
      imop(  44) = s*imop(  36)
      rmop(  45) = h(   6)*(x*rmop(  36)-y*imop(  36))
      imop(  45) = h(   6)*(x*imop(  36)+y*rmop(  36))
      s = h(   7)*z
      rmop(  46) = s*rmop(  37)-g(  29)*rsq*rmop(  29)
      imop(  46) = zero
      rmop(  47) = s*rmop(  38)-g(  30)*rsq*rmop(  30)
      imop(  47) = s*imop(  38)-g(  30)*rsq*imop(  30)
      rmop(  48) = s*rmop(  39)-g(  31)*rsq*rmop(  31)
      imop(  48) = s*imop(  39)-g(  31)*rsq*imop(  31)
      rmop(  49) = s*rmop(  40)-g(  32)*rsq*rmop(  32)
      imop(  49) = s*imop(  40)-g(  32)*rsq*imop(  32)
      rmop(  50) = s*rmop(  41)-g(  33)*rsq*rmop(  33)
      imop(  50) = s*imop(  41)-g(  33)*rsq*imop(  33)
      rmop(  51) = s*rmop(  42)-g(  34)*rsq*rmop(  34)
      imop(  51) = s*imop(  42)-g(  34)*rsq*imop(  34)
      rmop(  52) = s*rmop(  43)-g(  35)*rsq*rmop(  35)
      imop(  52) = s*imop(  43)-g(  35)*rsq*imop(  35)
      rmop(  53) = s*rmop(  44)-g(  36)*rsq*rmop(  36)
      imop(  53) = s*imop(  44)-g(  36)*rsq*imop(  36)
      rmop(  54) = s*rmop(  45)
      imop(  54) = s*imop(  45)
      rmop(  55) = h(   7)*(x*rmop(  45)-y*imop(  45))
      imop(  55) = h(   7)*(x*imop(  45)+y*rmop(  45))
      return
      end subroutine fmmmop9
#endif
