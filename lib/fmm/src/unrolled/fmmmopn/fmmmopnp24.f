#include "../../fmm.h"
c
#if FMM_MAXNMULTIPOLES > 23 && defined(FMM_UNROLLED)
      subroutine fmmmop24(q,x,y,z,rsq,g,h,rmop,imop)
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
      s = h(   8)*z
      rmop(  56) = s*rmop(  46)-g(  37)*rsq*rmop(  37)
      imop(  56) = zero
      rmop(  57) = s*rmop(  47)-g(  38)*rsq*rmop(  38)
      imop(  57) = s*imop(  47)-g(  38)*rsq*imop(  38)
      rmop(  58) = s*rmop(  48)-g(  39)*rsq*rmop(  39)
      imop(  58) = s*imop(  48)-g(  39)*rsq*imop(  39)
      rmop(  59) = s*rmop(  49)-g(  40)*rsq*rmop(  40)
      imop(  59) = s*imop(  49)-g(  40)*rsq*imop(  40)
      rmop(  60) = s*rmop(  50)-g(  41)*rsq*rmop(  41)
      imop(  60) = s*imop(  50)-g(  41)*rsq*imop(  41)
      rmop(  61) = s*rmop(  51)-g(  42)*rsq*rmop(  42)
      imop(  61) = s*imop(  51)-g(  42)*rsq*imop(  42)
      rmop(  62) = s*rmop(  52)-g(  43)*rsq*rmop(  43)
      imop(  62) = s*imop(  52)-g(  43)*rsq*imop(  43)
      rmop(  63) = s*rmop(  53)-g(  44)*rsq*rmop(  44)
      imop(  63) = s*imop(  53)-g(  44)*rsq*imop(  44)
      rmop(  64) = s*rmop(  54)-g(  45)*rsq*rmop(  45)
      imop(  64) = s*imop(  54)-g(  45)*rsq*imop(  45)
      rmop(  65) = s*rmop(  55)
      imop(  65) = s*imop(  55)
      rmop(  66) = h(   8)*(x*rmop(  55)-y*imop(  55))
      imop(  66) = h(   8)*(x*imop(  55)+y*rmop(  55))
      s = h(   9)*z
      rmop(  67) = s*rmop(  56)-g(  46)*rsq*rmop(  46)
      imop(  67) = zero
      rmop(  68) = s*rmop(  57)-g(  47)*rsq*rmop(  47)
      imop(  68) = s*imop(  57)-g(  47)*rsq*imop(  47)
      rmop(  69) = s*rmop(  58)-g(  48)*rsq*rmop(  48)
      imop(  69) = s*imop(  58)-g(  48)*rsq*imop(  48)
      rmop(  70) = s*rmop(  59)-g(  49)*rsq*rmop(  49)
      imop(  70) = s*imop(  59)-g(  49)*rsq*imop(  49)
      rmop(  71) = s*rmop(  60)-g(  50)*rsq*rmop(  50)
      imop(  71) = s*imop(  60)-g(  50)*rsq*imop(  50)
      rmop(  72) = s*rmop(  61)-g(  51)*rsq*rmop(  51)
      imop(  72) = s*imop(  61)-g(  51)*rsq*imop(  51)
      rmop(  73) = s*rmop(  62)-g(  52)*rsq*rmop(  52)
      imop(  73) = s*imop(  62)-g(  52)*rsq*imop(  52)
      rmop(  74) = s*rmop(  63)-g(  53)*rsq*rmop(  53)
      imop(  74) = s*imop(  63)-g(  53)*rsq*imop(  53)
      rmop(  75) = s*rmop(  64)-g(  54)*rsq*rmop(  54)
      imop(  75) = s*imop(  64)-g(  54)*rsq*imop(  54)
      rmop(  76) = s*rmop(  65)-g(  55)*rsq*rmop(  55)
      imop(  76) = s*imop(  65)-g(  55)*rsq*imop(  55)
      rmop(  77) = s*rmop(  66)
      imop(  77) = s*imop(  66)
      rmop(  78) = h(   9)*(x*rmop(  66)-y*imop(  66))
      imop(  78) = h(   9)*(x*imop(  66)+y*rmop(  66))
      s = h(  10)*z
      rmop(  79) = s*rmop(  67)-g(  56)*rsq*rmop(  56)
      imop(  79) = zero
      rmop(  80) = s*rmop(  68)-g(  57)*rsq*rmop(  57)
      imop(  80) = s*imop(  68)-g(  57)*rsq*imop(  57)
      rmop(  81) = s*rmop(  69)-g(  58)*rsq*rmop(  58)
      imop(  81) = s*imop(  69)-g(  58)*rsq*imop(  58)
      rmop(  82) = s*rmop(  70)-g(  59)*rsq*rmop(  59)
      imop(  82) = s*imop(  70)-g(  59)*rsq*imop(  59)
      rmop(  83) = s*rmop(  71)-g(  60)*rsq*rmop(  60)
      imop(  83) = s*imop(  71)-g(  60)*rsq*imop(  60)
      rmop(  84) = s*rmop(  72)-g(  61)*rsq*rmop(  61)
      imop(  84) = s*imop(  72)-g(  61)*rsq*imop(  61)
      rmop(  85) = s*rmop(  73)-g(  62)*rsq*rmop(  62)
      imop(  85) = s*imop(  73)-g(  62)*rsq*imop(  62)
      rmop(  86) = s*rmop(  74)-g(  63)*rsq*rmop(  63)
      imop(  86) = s*imop(  74)-g(  63)*rsq*imop(  63)
      rmop(  87) = s*rmop(  75)-g(  64)*rsq*rmop(  64)
      imop(  87) = s*imop(  75)-g(  64)*rsq*imop(  64)
      rmop(  88) = s*rmop(  76)-g(  65)*rsq*rmop(  65)
      imop(  88) = s*imop(  76)-g(  65)*rsq*imop(  65)
      rmop(  89) = s*rmop(  77)-g(  66)*rsq*rmop(  66)
      imop(  89) = s*imop(  77)-g(  66)*rsq*imop(  66)
      rmop(  90) = s*rmop(  78)
      imop(  90) = s*imop(  78)
      rmop(  91) = h(  10)*(x*rmop(  78)-y*imop(  78))
      imop(  91) = h(  10)*(x*imop(  78)+y*rmop(  78))
      s = h(  11)*z
      rmop(  92) = s*rmop(  79)-g(  67)*rsq*rmop(  67)
      imop(  92) = zero
      rmop(  93) = s*rmop(  80)-g(  68)*rsq*rmop(  68)
      imop(  93) = s*imop(  80)-g(  68)*rsq*imop(  68)
      rmop(  94) = s*rmop(  81)-g(  69)*rsq*rmop(  69)
      imop(  94) = s*imop(  81)-g(  69)*rsq*imop(  69)
      rmop(  95) = s*rmop(  82)-g(  70)*rsq*rmop(  70)
      imop(  95) = s*imop(  82)-g(  70)*rsq*imop(  70)
      rmop(  96) = s*rmop(  83)-g(  71)*rsq*rmop(  71)
      imop(  96) = s*imop(  83)-g(  71)*rsq*imop(  71)
      rmop(  97) = s*rmop(  84)-g(  72)*rsq*rmop(  72)
      imop(  97) = s*imop(  84)-g(  72)*rsq*imop(  72)
      rmop(  98) = s*rmop(  85)-g(  73)*rsq*rmop(  73)
      imop(  98) = s*imop(  85)-g(  73)*rsq*imop(  73)
      rmop(  99) = s*rmop(  86)-g(  74)*rsq*rmop(  74)
      imop(  99) = s*imop(  86)-g(  74)*rsq*imop(  74)
      rmop( 100) = s*rmop(  87)-g(  75)*rsq*rmop(  75)
      imop( 100) = s*imop(  87)-g(  75)*rsq*imop(  75)
      rmop( 101) = s*rmop(  88)-g(  76)*rsq*rmop(  76)
      imop( 101) = s*imop(  88)-g(  76)*rsq*imop(  76)
      rmop( 102) = s*rmop(  89)-g(  77)*rsq*rmop(  77)
      imop( 102) = s*imop(  89)-g(  77)*rsq*imop(  77)
      rmop( 103) = s*rmop(  90)-g(  78)*rsq*rmop(  78)
      imop( 103) = s*imop(  90)-g(  78)*rsq*imop(  78)
      rmop( 104) = s*rmop(  91)
      imop( 104) = s*imop(  91)
      rmop( 105) = h(  11)*(x*rmop(  91)-y*imop(  91))
      imop( 105) = h(  11)*(x*imop(  91)+y*rmop(  91))
      s = h(  12)*z
      rmop( 106) = s*rmop(  92)-g(  79)*rsq*rmop(  79)
      imop( 106) = zero
      rmop( 107) = s*rmop(  93)-g(  80)*rsq*rmop(  80)
      imop( 107) = s*imop(  93)-g(  80)*rsq*imop(  80)
      rmop( 108) = s*rmop(  94)-g(  81)*rsq*rmop(  81)
      imop( 108) = s*imop(  94)-g(  81)*rsq*imop(  81)
      rmop( 109) = s*rmop(  95)-g(  82)*rsq*rmop(  82)
      imop( 109) = s*imop(  95)-g(  82)*rsq*imop(  82)
      rmop( 110) = s*rmop(  96)-g(  83)*rsq*rmop(  83)
      imop( 110) = s*imop(  96)-g(  83)*rsq*imop(  83)
      rmop( 111) = s*rmop(  97)-g(  84)*rsq*rmop(  84)
      imop( 111) = s*imop(  97)-g(  84)*rsq*imop(  84)
      rmop( 112) = s*rmop(  98)-g(  85)*rsq*rmop(  85)
      imop( 112) = s*imop(  98)-g(  85)*rsq*imop(  85)
      rmop( 113) = s*rmop(  99)-g(  86)*rsq*rmop(  86)
      imop( 113) = s*imop(  99)-g(  86)*rsq*imop(  86)
      rmop( 114) = s*rmop( 100)-g(  87)*rsq*rmop(  87)
      imop( 114) = s*imop( 100)-g(  87)*rsq*imop(  87)
      rmop( 115) = s*rmop( 101)-g(  88)*rsq*rmop(  88)
      imop( 115) = s*imop( 101)-g(  88)*rsq*imop(  88)
      rmop( 116) = s*rmop( 102)-g(  89)*rsq*rmop(  89)
      imop( 116) = s*imop( 102)-g(  89)*rsq*imop(  89)
      rmop( 117) = s*rmop( 103)-g(  90)*rsq*rmop(  90)
      imop( 117) = s*imop( 103)-g(  90)*rsq*imop(  90)
      rmop( 118) = s*rmop( 104)-g(  91)*rsq*rmop(  91)
      imop( 118) = s*imop( 104)-g(  91)*rsq*imop(  91)
      rmop( 119) = s*rmop( 105)
      imop( 119) = s*imop( 105)
      rmop( 120) = h(  12)*(x*rmop( 105)-y*imop( 105))
      imop( 120) = h(  12)*(x*imop( 105)+y*rmop( 105))
      s = h(  13)*z
      rmop( 121) = s*rmop( 106)-g(  92)*rsq*rmop(  92)
      imop( 121) = zero
      rmop( 122) = s*rmop( 107)-g(  93)*rsq*rmop(  93)
      imop( 122) = s*imop( 107)-g(  93)*rsq*imop(  93)
      rmop( 123) = s*rmop( 108)-g(  94)*rsq*rmop(  94)
      imop( 123) = s*imop( 108)-g(  94)*rsq*imop(  94)
      rmop( 124) = s*rmop( 109)-g(  95)*rsq*rmop(  95)
      imop( 124) = s*imop( 109)-g(  95)*rsq*imop(  95)
      rmop( 125) = s*rmop( 110)-g(  96)*rsq*rmop(  96)
      imop( 125) = s*imop( 110)-g(  96)*rsq*imop(  96)
      rmop( 126) = s*rmop( 111)-g(  97)*rsq*rmop(  97)
      imop( 126) = s*imop( 111)-g(  97)*rsq*imop(  97)
      rmop( 127) = s*rmop( 112)-g(  98)*rsq*rmop(  98)
      imop( 127) = s*imop( 112)-g(  98)*rsq*imop(  98)
      rmop( 128) = s*rmop( 113)-g(  99)*rsq*rmop(  99)
      imop( 128) = s*imop( 113)-g(  99)*rsq*imop(  99)
      rmop( 129) = s*rmop( 114)-g( 100)*rsq*rmop( 100)
      imop( 129) = s*imop( 114)-g( 100)*rsq*imop( 100)
      rmop( 130) = s*rmop( 115)-g( 101)*rsq*rmop( 101)
      imop( 130) = s*imop( 115)-g( 101)*rsq*imop( 101)
      rmop( 131) = s*rmop( 116)-g( 102)*rsq*rmop( 102)
      imop( 131) = s*imop( 116)-g( 102)*rsq*imop( 102)
      rmop( 132) = s*rmop( 117)-g( 103)*rsq*rmop( 103)
      imop( 132) = s*imop( 117)-g( 103)*rsq*imop( 103)
      rmop( 133) = s*rmop( 118)-g( 104)*rsq*rmop( 104)
      imop( 133) = s*imop( 118)-g( 104)*rsq*imop( 104)
      rmop( 134) = s*rmop( 119)-g( 105)*rsq*rmop( 105)
      imop( 134) = s*imop( 119)-g( 105)*rsq*imop( 105)
      rmop( 135) = s*rmop( 120)
      imop( 135) = s*imop( 120)
      rmop( 136) = h(  13)*(x*rmop( 120)-y*imop( 120))
      imop( 136) = h(  13)*(x*imop( 120)+y*rmop( 120))
      s = h(  14)*z
      rmop( 137) = s*rmop( 121)-g( 106)*rsq*rmop( 106)
      imop( 137) = zero
      rmop( 138) = s*rmop( 122)-g( 107)*rsq*rmop( 107)
      imop( 138) = s*imop( 122)-g( 107)*rsq*imop( 107)
      rmop( 139) = s*rmop( 123)-g( 108)*rsq*rmop( 108)
      imop( 139) = s*imop( 123)-g( 108)*rsq*imop( 108)
      rmop( 140) = s*rmop( 124)-g( 109)*rsq*rmop( 109)
      imop( 140) = s*imop( 124)-g( 109)*rsq*imop( 109)
      rmop( 141) = s*rmop( 125)-g( 110)*rsq*rmop( 110)
      imop( 141) = s*imop( 125)-g( 110)*rsq*imop( 110)
      rmop( 142) = s*rmop( 126)-g( 111)*rsq*rmop( 111)
      imop( 142) = s*imop( 126)-g( 111)*rsq*imop( 111)
      rmop( 143) = s*rmop( 127)-g( 112)*rsq*rmop( 112)
      imop( 143) = s*imop( 127)-g( 112)*rsq*imop( 112)
      rmop( 144) = s*rmop( 128)-g( 113)*rsq*rmop( 113)
      imop( 144) = s*imop( 128)-g( 113)*rsq*imop( 113)
      rmop( 145) = s*rmop( 129)-g( 114)*rsq*rmop( 114)
      imop( 145) = s*imop( 129)-g( 114)*rsq*imop( 114)
      rmop( 146) = s*rmop( 130)-g( 115)*rsq*rmop( 115)
      imop( 146) = s*imop( 130)-g( 115)*rsq*imop( 115)
      rmop( 147) = s*rmop( 131)-g( 116)*rsq*rmop( 116)
      imop( 147) = s*imop( 131)-g( 116)*rsq*imop( 116)
      rmop( 148) = s*rmop( 132)-g( 117)*rsq*rmop( 117)
      imop( 148) = s*imop( 132)-g( 117)*rsq*imop( 117)
      rmop( 149) = s*rmop( 133)-g( 118)*rsq*rmop( 118)
      imop( 149) = s*imop( 133)-g( 118)*rsq*imop( 118)
      rmop( 150) = s*rmop( 134)-g( 119)*rsq*rmop( 119)
      imop( 150) = s*imop( 134)-g( 119)*rsq*imop( 119)
      rmop( 151) = s*rmop( 135)-g( 120)*rsq*rmop( 120)
      imop( 151) = s*imop( 135)-g( 120)*rsq*imop( 120)
      rmop( 152) = s*rmop( 136)
      imop( 152) = s*imop( 136)
      rmop( 153) = h(  14)*(x*rmop( 136)-y*imop( 136))
      imop( 153) = h(  14)*(x*imop( 136)+y*rmop( 136))
      s = h(  15)*z
      rmop( 154) = s*rmop( 137)-g( 121)*rsq*rmop( 121)
      imop( 154) = zero
      rmop( 155) = s*rmop( 138)-g( 122)*rsq*rmop( 122)
      imop( 155) = s*imop( 138)-g( 122)*rsq*imop( 122)
      rmop( 156) = s*rmop( 139)-g( 123)*rsq*rmop( 123)
      imop( 156) = s*imop( 139)-g( 123)*rsq*imop( 123)
      rmop( 157) = s*rmop( 140)-g( 124)*rsq*rmop( 124)
      imop( 157) = s*imop( 140)-g( 124)*rsq*imop( 124)
      rmop( 158) = s*rmop( 141)-g( 125)*rsq*rmop( 125)
      imop( 158) = s*imop( 141)-g( 125)*rsq*imop( 125)
      rmop( 159) = s*rmop( 142)-g( 126)*rsq*rmop( 126)
      imop( 159) = s*imop( 142)-g( 126)*rsq*imop( 126)
      rmop( 160) = s*rmop( 143)-g( 127)*rsq*rmop( 127)
      imop( 160) = s*imop( 143)-g( 127)*rsq*imop( 127)
      rmop( 161) = s*rmop( 144)-g( 128)*rsq*rmop( 128)
      imop( 161) = s*imop( 144)-g( 128)*rsq*imop( 128)
      rmop( 162) = s*rmop( 145)-g( 129)*rsq*rmop( 129)
      imop( 162) = s*imop( 145)-g( 129)*rsq*imop( 129)
      rmop( 163) = s*rmop( 146)-g( 130)*rsq*rmop( 130)
      imop( 163) = s*imop( 146)-g( 130)*rsq*imop( 130)
      rmop( 164) = s*rmop( 147)-g( 131)*rsq*rmop( 131)
      imop( 164) = s*imop( 147)-g( 131)*rsq*imop( 131)
      rmop( 165) = s*rmop( 148)-g( 132)*rsq*rmop( 132)
      imop( 165) = s*imop( 148)-g( 132)*rsq*imop( 132)
      rmop( 166) = s*rmop( 149)-g( 133)*rsq*rmop( 133)
      imop( 166) = s*imop( 149)-g( 133)*rsq*imop( 133)
      rmop( 167) = s*rmop( 150)-g( 134)*rsq*rmop( 134)
      imop( 167) = s*imop( 150)-g( 134)*rsq*imop( 134)
      rmop( 168) = s*rmop( 151)-g( 135)*rsq*rmop( 135)
      imop( 168) = s*imop( 151)-g( 135)*rsq*imop( 135)
      rmop( 169) = s*rmop( 152)-g( 136)*rsq*rmop( 136)
      imop( 169) = s*imop( 152)-g( 136)*rsq*imop( 136)
      rmop( 170) = s*rmop( 153)
      imop( 170) = s*imop( 153)
      rmop( 171) = h(  15)*(x*rmop( 153)-y*imop( 153))
      imop( 171) = h(  15)*(x*imop( 153)+y*rmop( 153))
      s = h(  16)*z
      rmop( 172) = s*rmop( 154)-g( 137)*rsq*rmop( 137)
      imop( 172) = zero
      rmop( 173) = s*rmop( 155)-g( 138)*rsq*rmop( 138)
      imop( 173) = s*imop( 155)-g( 138)*rsq*imop( 138)
      rmop( 174) = s*rmop( 156)-g( 139)*rsq*rmop( 139)
      imop( 174) = s*imop( 156)-g( 139)*rsq*imop( 139)
      rmop( 175) = s*rmop( 157)-g( 140)*rsq*rmop( 140)
      imop( 175) = s*imop( 157)-g( 140)*rsq*imop( 140)
      rmop( 176) = s*rmop( 158)-g( 141)*rsq*rmop( 141)
      imop( 176) = s*imop( 158)-g( 141)*rsq*imop( 141)
      rmop( 177) = s*rmop( 159)-g( 142)*rsq*rmop( 142)
      imop( 177) = s*imop( 159)-g( 142)*rsq*imop( 142)
      rmop( 178) = s*rmop( 160)-g( 143)*rsq*rmop( 143)
      imop( 178) = s*imop( 160)-g( 143)*rsq*imop( 143)
      rmop( 179) = s*rmop( 161)-g( 144)*rsq*rmop( 144)
      imop( 179) = s*imop( 161)-g( 144)*rsq*imop( 144)
      rmop( 180) = s*rmop( 162)-g( 145)*rsq*rmop( 145)
      imop( 180) = s*imop( 162)-g( 145)*rsq*imop( 145)
      rmop( 181) = s*rmop( 163)-g( 146)*rsq*rmop( 146)
      imop( 181) = s*imop( 163)-g( 146)*rsq*imop( 146)
      rmop( 182) = s*rmop( 164)-g( 147)*rsq*rmop( 147)
      imop( 182) = s*imop( 164)-g( 147)*rsq*imop( 147)
      rmop( 183) = s*rmop( 165)-g( 148)*rsq*rmop( 148)
      imop( 183) = s*imop( 165)-g( 148)*rsq*imop( 148)
      rmop( 184) = s*rmop( 166)-g( 149)*rsq*rmop( 149)
      imop( 184) = s*imop( 166)-g( 149)*rsq*imop( 149)
      rmop( 185) = s*rmop( 167)-g( 150)*rsq*rmop( 150)
      imop( 185) = s*imop( 167)-g( 150)*rsq*imop( 150)
      rmop( 186) = s*rmop( 168)-g( 151)*rsq*rmop( 151)
      imop( 186) = s*imop( 168)-g( 151)*rsq*imop( 151)
      rmop( 187) = s*rmop( 169)-g( 152)*rsq*rmop( 152)
      imop( 187) = s*imop( 169)-g( 152)*rsq*imop( 152)
      rmop( 188) = s*rmop( 170)-g( 153)*rsq*rmop( 153)
      imop( 188) = s*imop( 170)-g( 153)*rsq*imop( 153)
      rmop( 189) = s*rmop( 171)
      imop( 189) = s*imop( 171)
      rmop( 190) = h(  16)*(x*rmop( 171)-y*imop( 171))
      imop( 190) = h(  16)*(x*imop( 171)+y*rmop( 171))
      s = h(  17)*z
      rmop( 191) = s*rmop( 172)-g( 154)*rsq*rmop( 154)
      imop( 191) = zero
      rmop( 192) = s*rmop( 173)-g( 155)*rsq*rmop( 155)
      imop( 192) = s*imop( 173)-g( 155)*rsq*imop( 155)
      rmop( 193) = s*rmop( 174)-g( 156)*rsq*rmop( 156)
      imop( 193) = s*imop( 174)-g( 156)*rsq*imop( 156)
      rmop( 194) = s*rmop( 175)-g( 157)*rsq*rmop( 157)
      imop( 194) = s*imop( 175)-g( 157)*rsq*imop( 157)
      rmop( 195) = s*rmop( 176)-g( 158)*rsq*rmop( 158)
      imop( 195) = s*imop( 176)-g( 158)*rsq*imop( 158)
      rmop( 196) = s*rmop( 177)-g( 159)*rsq*rmop( 159)
      imop( 196) = s*imop( 177)-g( 159)*rsq*imop( 159)
      rmop( 197) = s*rmop( 178)-g( 160)*rsq*rmop( 160)
      imop( 197) = s*imop( 178)-g( 160)*rsq*imop( 160)
      rmop( 198) = s*rmop( 179)-g( 161)*rsq*rmop( 161)
      imop( 198) = s*imop( 179)-g( 161)*rsq*imop( 161)
      rmop( 199) = s*rmop( 180)-g( 162)*rsq*rmop( 162)
      imop( 199) = s*imop( 180)-g( 162)*rsq*imop( 162)
      rmop( 200) = s*rmop( 181)-g( 163)*rsq*rmop( 163)
      imop( 200) = s*imop( 181)-g( 163)*rsq*imop( 163)
      rmop( 201) = s*rmop( 182)-g( 164)*rsq*rmop( 164)
      imop( 201) = s*imop( 182)-g( 164)*rsq*imop( 164)
      rmop( 202) = s*rmop( 183)-g( 165)*rsq*rmop( 165)
      imop( 202) = s*imop( 183)-g( 165)*rsq*imop( 165)
      rmop( 203) = s*rmop( 184)-g( 166)*rsq*rmop( 166)
      imop( 203) = s*imop( 184)-g( 166)*rsq*imop( 166)
      rmop( 204) = s*rmop( 185)-g( 167)*rsq*rmop( 167)
      imop( 204) = s*imop( 185)-g( 167)*rsq*imop( 167)
      rmop( 205) = s*rmop( 186)-g( 168)*rsq*rmop( 168)
      imop( 205) = s*imop( 186)-g( 168)*rsq*imop( 168)
      rmop( 206) = s*rmop( 187)-g( 169)*rsq*rmop( 169)
      imop( 206) = s*imop( 187)-g( 169)*rsq*imop( 169)
      rmop( 207) = s*rmop( 188)-g( 170)*rsq*rmop( 170)
      imop( 207) = s*imop( 188)-g( 170)*rsq*imop( 170)
      rmop( 208) = s*rmop( 189)-g( 171)*rsq*rmop( 171)
      imop( 208) = s*imop( 189)-g( 171)*rsq*imop( 171)
      rmop( 209) = s*rmop( 190)
      imop( 209) = s*imop( 190)
      rmop( 210) = h(  17)*(x*rmop( 190)-y*imop( 190))
      imop( 210) = h(  17)*(x*imop( 190)+y*rmop( 190))
      s = h(  18)*z
      rmop( 211) = s*rmop( 191)-g( 172)*rsq*rmop( 172)
      imop( 211) = zero
      rmop( 212) = s*rmop( 192)-g( 173)*rsq*rmop( 173)
      imop( 212) = s*imop( 192)-g( 173)*rsq*imop( 173)
      rmop( 213) = s*rmop( 193)-g( 174)*rsq*rmop( 174)
      imop( 213) = s*imop( 193)-g( 174)*rsq*imop( 174)
      rmop( 214) = s*rmop( 194)-g( 175)*rsq*rmop( 175)
      imop( 214) = s*imop( 194)-g( 175)*rsq*imop( 175)
      rmop( 215) = s*rmop( 195)-g( 176)*rsq*rmop( 176)
      imop( 215) = s*imop( 195)-g( 176)*rsq*imop( 176)
      rmop( 216) = s*rmop( 196)-g( 177)*rsq*rmop( 177)
      imop( 216) = s*imop( 196)-g( 177)*rsq*imop( 177)
      rmop( 217) = s*rmop( 197)-g( 178)*rsq*rmop( 178)
      imop( 217) = s*imop( 197)-g( 178)*rsq*imop( 178)
      rmop( 218) = s*rmop( 198)-g( 179)*rsq*rmop( 179)
      imop( 218) = s*imop( 198)-g( 179)*rsq*imop( 179)
      rmop( 219) = s*rmop( 199)-g( 180)*rsq*rmop( 180)
      imop( 219) = s*imop( 199)-g( 180)*rsq*imop( 180)
      rmop( 220) = s*rmop( 200)-g( 181)*rsq*rmop( 181)
      imop( 220) = s*imop( 200)-g( 181)*rsq*imop( 181)
      rmop( 221) = s*rmop( 201)-g( 182)*rsq*rmop( 182)
      imop( 221) = s*imop( 201)-g( 182)*rsq*imop( 182)
      rmop( 222) = s*rmop( 202)-g( 183)*rsq*rmop( 183)
      imop( 222) = s*imop( 202)-g( 183)*rsq*imop( 183)
      rmop( 223) = s*rmop( 203)-g( 184)*rsq*rmop( 184)
      imop( 223) = s*imop( 203)-g( 184)*rsq*imop( 184)
      rmop( 224) = s*rmop( 204)-g( 185)*rsq*rmop( 185)
      imop( 224) = s*imop( 204)-g( 185)*rsq*imop( 185)
      rmop( 225) = s*rmop( 205)-g( 186)*rsq*rmop( 186)
      imop( 225) = s*imop( 205)-g( 186)*rsq*imop( 186)
      rmop( 226) = s*rmop( 206)-g( 187)*rsq*rmop( 187)
      imop( 226) = s*imop( 206)-g( 187)*rsq*imop( 187)
      rmop( 227) = s*rmop( 207)-g( 188)*rsq*rmop( 188)
      imop( 227) = s*imop( 207)-g( 188)*rsq*imop( 188)
      rmop( 228) = s*rmop( 208)-g( 189)*rsq*rmop( 189)
      imop( 228) = s*imop( 208)-g( 189)*rsq*imop( 189)
      rmop( 229) = s*rmop( 209)-g( 190)*rsq*rmop( 190)
      imop( 229) = s*imop( 209)-g( 190)*rsq*imop( 190)
      rmop( 230) = s*rmop( 210)
      imop( 230) = s*imop( 210)
      rmop( 231) = h(  18)*(x*rmop( 210)-y*imop( 210))
      imop( 231) = h(  18)*(x*imop( 210)+y*rmop( 210))
      s = h(  19)*z
      rmop( 232) = s*rmop( 211)-g( 191)*rsq*rmop( 191)
      imop( 232) = zero
      rmop( 233) = s*rmop( 212)-g( 192)*rsq*rmop( 192)
      imop( 233) = s*imop( 212)-g( 192)*rsq*imop( 192)
      rmop( 234) = s*rmop( 213)-g( 193)*rsq*rmop( 193)
      imop( 234) = s*imop( 213)-g( 193)*rsq*imop( 193)
      rmop( 235) = s*rmop( 214)-g( 194)*rsq*rmop( 194)
      imop( 235) = s*imop( 214)-g( 194)*rsq*imop( 194)
      rmop( 236) = s*rmop( 215)-g( 195)*rsq*rmop( 195)
      imop( 236) = s*imop( 215)-g( 195)*rsq*imop( 195)
      rmop( 237) = s*rmop( 216)-g( 196)*rsq*rmop( 196)
      imop( 237) = s*imop( 216)-g( 196)*rsq*imop( 196)
      rmop( 238) = s*rmop( 217)-g( 197)*rsq*rmop( 197)
      imop( 238) = s*imop( 217)-g( 197)*rsq*imop( 197)
      rmop( 239) = s*rmop( 218)-g( 198)*rsq*rmop( 198)
      imop( 239) = s*imop( 218)-g( 198)*rsq*imop( 198)
      rmop( 240) = s*rmop( 219)-g( 199)*rsq*rmop( 199)
      imop( 240) = s*imop( 219)-g( 199)*rsq*imop( 199)
      rmop( 241) = s*rmop( 220)-g( 200)*rsq*rmop( 200)
      imop( 241) = s*imop( 220)-g( 200)*rsq*imop( 200)
      rmop( 242) = s*rmop( 221)-g( 201)*rsq*rmop( 201)
      imop( 242) = s*imop( 221)-g( 201)*rsq*imop( 201)
      rmop( 243) = s*rmop( 222)-g( 202)*rsq*rmop( 202)
      imop( 243) = s*imop( 222)-g( 202)*rsq*imop( 202)
      rmop( 244) = s*rmop( 223)-g( 203)*rsq*rmop( 203)
      imop( 244) = s*imop( 223)-g( 203)*rsq*imop( 203)
      rmop( 245) = s*rmop( 224)-g( 204)*rsq*rmop( 204)
      imop( 245) = s*imop( 224)-g( 204)*rsq*imop( 204)
      rmop( 246) = s*rmop( 225)-g( 205)*rsq*rmop( 205)
      imop( 246) = s*imop( 225)-g( 205)*rsq*imop( 205)
      rmop( 247) = s*rmop( 226)-g( 206)*rsq*rmop( 206)
      imop( 247) = s*imop( 226)-g( 206)*rsq*imop( 206)
      rmop( 248) = s*rmop( 227)-g( 207)*rsq*rmop( 207)
      imop( 248) = s*imop( 227)-g( 207)*rsq*imop( 207)
      rmop( 249) = s*rmop( 228)-g( 208)*rsq*rmop( 208)
      imop( 249) = s*imop( 228)-g( 208)*rsq*imop( 208)
      rmop( 250) = s*rmop( 229)-g( 209)*rsq*rmop( 209)
      imop( 250) = s*imop( 229)-g( 209)*rsq*imop( 209)
      rmop( 251) = s*rmop( 230)-g( 210)*rsq*rmop( 210)
      imop( 251) = s*imop( 230)-g( 210)*rsq*imop( 210)
      rmop( 252) = s*rmop( 231)
      imop( 252) = s*imop( 231)
      rmop( 253) = h(  19)*(x*rmop( 231)-y*imop( 231))
      imop( 253) = h(  19)*(x*imop( 231)+y*rmop( 231))
      s = h(  20)*z
      rmop( 254) = s*rmop( 232)-g( 211)*rsq*rmop( 211)
      imop( 254) = zero
      rmop( 255) = s*rmop( 233)-g( 212)*rsq*rmop( 212)
      imop( 255) = s*imop( 233)-g( 212)*rsq*imop( 212)
      rmop( 256) = s*rmop( 234)-g( 213)*rsq*rmop( 213)
      imop( 256) = s*imop( 234)-g( 213)*rsq*imop( 213)
      rmop( 257) = s*rmop( 235)-g( 214)*rsq*rmop( 214)
      imop( 257) = s*imop( 235)-g( 214)*rsq*imop( 214)
      rmop( 258) = s*rmop( 236)-g( 215)*rsq*rmop( 215)
      imop( 258) = s*imop( 236)-g( 215)*rsq*imop( 215)
      rmop( 259) = s*rmop( 237)-g( 216)*rsq*rmop( 216)
      imop( 259) = s*imop( 237)-g( 216)*rsq*imop( 216)
      rmop( 260) = s*rmop( 238)-g( 217)*rsq*rmop( 217)
      imop( 260) = s*imop( 238)-g( 217)*rsq*imop( 217)
      rmop( 261) = s*rmop( 239)-g( 218)*rsq*rmop( 218)
      imop( 261) = s*imop( 239)-g( 218)*rsq*imop( 218)
      rmop( 262) = s*rmop( 240)-g( 219)*rsq*rmop( 219)
      imop( 262) = s*imop( 240)-g( 219)*rsq*imop( 219)
      rmop( 263) = s*rmop( 241)-g( 220)*rsq*rmop( 220)
      imop( 263) = s*imop( 241)-g( 220)*rsq*imop( 220)
      rmop( 264) = s*rmop( 242)-g( 221)*rsq*rmop( 221)
      imop( 264) = s*imop( 242)-g( 221)*rsq*imop( 221)
      rmop( 265) = s*rmop( 243)-g( 222)*rsq*rmop( 222)
      imop( 265) = s*imop( 243)-g( 222)*rsq*imop( 222)
      rmop( 266) = s*rmop( 244)-g( 223)*rsq*rmop( 223)
      imop( 266) = s*imop( 244)-g( 223)*rsq*imop( 223)
      rmop( 267) = s*rmop( 245)-g( 224)*rsq*rmop( 224)
      imop( 267) = s*imop( 245)-g( 224)*rsq*imop( 224)
      rmop( 268) = s*rmop( 246)-g( 225)*rsq*rmop( 225)
      imop( 268) = s*imop( 246)-g( 225)*rsq*imop( 225)
      rmop( 269) = s*rmop( 247)-g( 226)*rsq*rmop( 226)
      imop( 269) = s*imop( 247)-g( 226)*rsq*imop( 226)
      rmop( 270) = s*rmop( 248)-g( 227)*rsq*rmop( 227)
      imop( 270) = s*imop( 248)-g( 227)*rsq*imop( 227)
      rmop( 271) = s*rmop( 249)-g( 228)*rsq*rmop( 228)
      imop( 271) = s*imop( 249)-g( 228)*rsq*imop( 228)
      rmop( 272) = s*rmop( 250)-g( 229)*rsq*rmop( 229)
      imop( 272) = s*imop( 250)-g( 229)*rsq*imop( 229)
      rmop( 273) = s*rmop( 251)-g( 230)*rsq*rmop( 230)
      imop( 273) = s*imop( 251)-g( 230)*rsq*imop( 230)
      rmop( 274) = s*rmop( 252)-g( 231)*rsq*rmop( 231)
      imop( 274) = s*imop( 252)-g( 231)*rsq*imop( 231)
      rmop( 275) = s*rmop( 253)
      imop( 275) = s*imop( 253)
      rmop( 276) = h(  20)*(x*rmop( 253)-y*imop( 253))
      imop( 276) = h(  20)*(x*imop( 253)+y*rmop( 253))
      s = h(  21)*z
      rmop( 277) = s*rmop( 254)-g( 232)*rsq*rmop( 232)
      imop( 277) = zero
      rmop( 278) = s*rmop( 255)-g( 233)*rsq*rmop( 233)
      imop( 278) = s*imop( 255)-g( 233)*rsq*imop( 233)
      rmop( 279) = s*rmop( 256)-g( 234)*rsq*rmop( 234)
      imop( 279) = s*imop( 256)-g( 234)*rsq*imop( 234)
      rmop( 280) = s*rmop( 257)-g( 235)*rsq*rmop( 235)
      imop( 280) = s*imop( 257)-g( 235)*rsq*imop( 235)
      rmop( 281) = s*rmop( 258)-g( 236)*rsq*rmop( 236)
      imop( 281) = s*imop( 258)-g( 236)*rsq*imop( 236)
      rmop( 282) = s*rmop( 259)-g( 237)*rsq*rmop( 237)
      imop( 282) = s*imop( 259)-g( 237)*rsq*imop( 237)
      rmop( 283) = s*rmop( 260)-g( 238)*rsq*rmop( 238)
      imop( 283) = s*imop( 260)-g( 238)*rsq*imop( 238)
      rmop( 284) = s*rmop( 261)-g( 239)*rsq*rmop( 239)
      imop( 284) = s*imop( 261)-g( 239)*rsq*imop( 239)
      rmop( 285) = s*rmop( 262)-g( 240)*rsq*rmop( 240)
      imop( 285) = s*imop( 262)-g( 240)*rsq*imop( 240)
      rmop( 286) = s*rmop( 263)-g( 241)*rsq*rmop( 241)
      imop( 286) = s*imop( 263)-g( 241)*rsq*imop( 241)
      rmop( 287) = s*rmop( 264)-g( 242)*rsq*rmop( 242)
      imop( 287) = s*imop( 264)-g( 242)*rsq*imop( 242)
      rmop( 288) = s*rmop( 265)-g( 243)*rsq*rmop( 243)
      imop( 288) = s*imop( 265)-g( 243)*rsq*imop( 243)
      rmop( 289) = s*rmop( 266)-g( 244)*rsq*rmop( 244)
      imop( 289) = s*imop( 266)-g( 244)*rsq*imop( 244)
      rmop( 290) = s*rmop( 267)-g( 245)*rsq*rmop( 245)
      imop( 290) = s*imop( 267)-g( 245)*rsq*imop( 245)
      rmop( 291) = s*rmop( 268)-g( 246)*rsq*rmop( 246)
      imop( 291) = s*imop( 268)-g( 246)*rsq*imop( 246)
      rmop( 292) = s*rmop( 269)-g( 247)*rsq*rmop( 247)
      imop( 292) = s*imop( 269)-g( 247)*rsq*imop( 247)
      rmop( 293) = s*rmop( 270)-g( 248)*rsq*rmop( 248)
      imop( 293) = s*imop( 270)-g( 248)*rsq*imop( 248)
      rmop( 294) = s*rmop( 271)-g( 249)*rsq*rmop( 249)
      imop( 294) = s*imop( 271)-g( 249)*rsq*imop( 249)
      rmop( 295) = s*rmop( 272)-g( 250)*rsq*rmop( 250)
      imop( 295) = s*imop( 272)-g( 250)*rsq*imop( 250)
      rmop( 296) = s*rmop( 273)-g( 251)*rsq*rmop( 251)
      imop( 296) = s*imop( 273)-g( 251)*rsq*imop( 251)
      rmop( 297) = s*rmop( 274)-g( 252)*rsq*rmop( 252)
      imop( 297) = s*imop( 274)-g( 252)*rsq*imop( 252)
      rmop( 298) = s*rmop( 275)-g( 253)*rsq*rmop( 253)
      imop( 298) = s*imop( 275)-g( 253)*rsq*imop( 253)
      rmop( 299) = s*rmop( 276)
      imop( 299) = s*imop( 276)
      rmop( 300) = h(  21)*(x*rmop( 276)-y*imop( 276))
      imop( 300) = h(  21)*(x*imop( 276)+y*rmop( 276))
      s = h(  22)*z
      rmop( 301) = s*rmop( 277)-g( 254)*rsq*rmop( 254)
      imop( 301) = zero
      rmop( 302) = s*rmop( 278)-g( 255)*rsq*rmop( 255)
      imop( 302) = s*imop( 278)-g( 255)*rsq*imop( 255)
      rmop( 303) = s*rmop( 279)-g( 256)*rsq*rmop( 256)
      imop( 303) = s*imop( 279)-g( 256)*rsq*imop( 256)
      rmop( 304) = s*rmop( 280)-g( 257)*rsq*rmop( 257)
      imop( 304) = s*imop( 280)-g( 257)*rsq*imop( 257)
      rmop( 305) = s*rmop( 281)-g( 258)*rsq*rmop( 258)
      imop( 305) = s*imop( 281)-g( 258)*rsq*imop( 258)
      rmop( 306) = s*rmop( 282)-g( 259)*rsq*rmop( 259)
      imop( 306) = s*imop( 282)-g( 259)*rsq*imop( 259)
      rmop( 307) = s*rmop( 283)-g( 260)*rsq*rmop( 260)
      imop( 307) = s*imop( 283)-g( 260)*rsq*imop( 260)
      rmop( 308) = s*rmop( 284)-g( 261)*rsq*rmop( 261)
      imop( 308) = s*imop( 284)-g( 261)*rsq*imop( 261)
      rmop( 309) = s*rmop( 285)-g( 262)*rsq*rmop( 262)
      imop( 309) = s*imop( 285)-g( 262)*rsq*imop( 262)
      rmop( 310) = s*rmop( 286)-g( 263)*rsq*rmop( 263)
      imop( 310) = s*imop( 286)-g( 263)*rsq*imop( 263)
      rmop( 311) = s*rmop( 287)-g( 264)*rsq*rmop( 264)
      imop( 311) = s*imop( 287)-g( 264)*rsq*imop( 264)
      rmop( 312) = s*rmop( 288)-g( 265)*rsq*rmop( 265)
      imop( 312) = s*imop( 288)-g( 265)*rsq*imop( 265)
      rmop( 313) = s*rmop( 289)-g( 266)*rsq*rmop( 266)
      imop( 313) = s*imop( 289)-g( 266)*rsq*imop( 266)
      rmop( 314) = s*rmop( 290)-g( 267)*rsq*rmop( 267)
      imop( 314) = s*imop( 290)-g( 267)*rsq*imop( 267)
      rmop( 315) = s*rmop( 291)-g( 268)*rsq*rmop( 268)
      imop( 315) = s*imop( 291)-g( 268)*rsq*imop( 268)
      rmop( 316) = s*rmop( 292)-g( 269)*rsq*rmop( 269)
      imop( 316) = s*imop( 292)-g( 269)*rsq*imop( 269)
      rmop( 317) = s*rmop( 293)-g( 270)*rsq*rmop( 270)
      imop( 317) = s*imop( 293)-g( 270)*rsq*imop( 270)
      rmop( 318) = s*rmop( 294)-g( 271)*rsq*rmop( 271)
      imop( 318) = s*imop( 294)-g( 271)*rsq*imop( 271)
      rmop( 319) = s*rmop( 295)-g( 272)*rsq*rmop( 272)
      imop( 319) = s*imop( 295)-g( 272)*rsq*imop( 272)
      rmop( 320) = s*rmop( 296)-g( 273)*rsq*rmop( 273)
      imop( 320) = s*imop( 296)-g( 273)*rsq*imop( 273)
      rmop( 321) = s*rmop( 297)-g( 274)*rsq*rmop( 274)
      imop( 321) = s*imop( 297)-g( 274)*rsq*imop( 274)
      rmop( 322) = s*rmop( 298)-g( 275)*rsq*rmop( 275)
      imop( 322) = s*imop( 298)-g( 275)*rsq*imop( 275)
      rmop( 323) = s*rmop( 299)-g( 276)*rsq*rmop( 276)
      imop( 323) = s*imop( 299)-g( 276)*rsq*imop( 276)
      rmop( 324) = s*rmop( 300)
      imop( 324) = s*imop( 300)
      rmop( 325) = h(  22)*(x*rmop( 300)-y*imop( 300))
      imop( 325) = h(  22)*(x*imop( 300)+y*rmop( 300))
      return
      end subroutine fmmmop24
#endif
