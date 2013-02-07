#include "../../fmm.h"
c
#if FMM_MAXNMULTIPOLES > 23 && defined(FMM_UNROLLED)
      subroutine fmmoop24(xyzfrom,xyzto,f,g,h,roop,ioop)
c
      use fmmkinds
c
      implicit none
c
      real(kind=fmm_real) xyzfrom(*),xyzto(*),f(0:*),g(0:*),h(0:*),
     .roop(*),ioop(*),
     .one,zero,x,y,z,rsq,s
c
      one = f(0)
      zero = g(0)
      x = xyzfrom(1)-xyzto(1)
      y = xyzfrom(2)-xyzto(2)
      z = xyzfrom(3)-xyzto(3)
      rsq = x*x+y*y+z*z
      roop(   1) = one
      ioop(   1) = zero
      roop(   2) = z*roop(1)
      ioop(   2) = zero
      roop(   3) = f(1)*(x*roop(1))
      ioop(   3) = -f(1)*(y*roop(1))
      roop(   4) = g(   1)*((h(   0)*z)*roop(   2)-rsq*roop(   1))
      ioop(   4) = zero
      roop(   5) = z*roop(   3)
      ioop(   5) = z*ioop(   3)
      roop(   6) = f(   2)*(x*roop(   3)+y*ioop(   3))
      ioop(   6) = f(   2)*(x*ioop(   3)-y*roop(   3))
      s = h(   1)*z
      roop(   7) = g(   2)*(s*roop(   4)-rsq*roop(   2))
      ioop(   7) = zero
      roop(   8) = g(   3)*(s*roop(   5)-rsq*roop(   3))
      ioop(   8) = g(   3)*(s*ioop(   5)-rsq*ioop(   3))
      roop(   9) = z*roop(   6)
      ioop(   9) = z*ioop(   6)
      roop(  10) = f(   3)*(x*roop(   6)+y*ioop(   6))
      ioop(  10) = f(   3)*(x*ioop(   6)-y*roop(   6))
      s = h(   2)*z
      roop(  11) = g(   4)*(s*roop(   7)-rsq*roop(   4))
      ioop(  11) = zero
      roop(  12) = g(   5)*(s*roop(   8)-rsq*roop(   5))
      ioop(  12) = g(   5)*(s*ioop(   8)-rsq*ioop(   5))
      roop(  13) = g(   6)*(s*roop(   9)-rsq*roop(   6))
      ioop(  13) = g(   6)*(s*ioop(   9)-rsq*ioop(   6))
      roop(  14) = z*roop(  10)
      ioop(  14) = z*ioop(  10)
      roop(  15) = f(   4)*(x*roop(  10)+y*ioop(  10))
      ioop(  15) = f(   4)*(x*ioop(  10)-y*roop(  10))
      s = h(   3)*z
      roop(  16) = g(   7)*(s*roop(  11)-rsq*roop(   7))
      ioop(  16) = zero
      roop(  17) = g(   8)*(s*roop(  12)-rsq*roop(   8))
      ioop(  17) = g(   8)*(s*ioop(  12)-rsq*ioop(   8))
      roop(  18) = g(   9)*(s*roop(  13)-rsq*roop(   9))
      ioop(  18) = g(   9)*(s*ioop(  13)-rsq*ioop(   9))
      roop(  19) = g(  10)*(s*roop(  14)-rsq*roop(  10))
      ioop(  19) = g(  10)*(s*ioop(  14)-rsq*ioop(  10))
      roop(  20) = z*roop(  15)
      ioop(  20) = z*ioop(  15)
      roop(  21) = f(   5)*(x*roop(  15)+y*ioop(  15))
      ioop(  21) = f(   5)*(x*ioop(  15)-y*roop(  15))
      s = h(   4)*z
      roop(  22) = g(  11)*(s*roop(  16)-rsq*roop(  11))
      ioop(  22) = zero
      roop(  23) = g(  12)*(s*roop(  17)-rsq*roop(  12))
      ioop(  23) = g(  12)*(s*ioop(  17)-rsq*ioop(  12))
      roop(  24) = g(  13)*(s*roop(  18)-rsq*roop(  13))
      ioop(  24) = g(  13)*(s*ioop(  18)-rsq*ioop(  13))
      roop(  25) = g(  14)*(s*roop(  19)-rsq*roop(  14))
      ioop(  25) = g(  14)*(s*ioop(  19)-rsq*ioop(  14))
      roop(  26) = g(  15)*(s*roop(  20)-rsq*roop(  15))
      ioop(  26) = g(  15)*(s*ioop(  20)-rsq*ioop(  15))
      roop(  27) = z*roop(  21)
      ioop(  27) = z*ioop(  21)
      roop(  28) = f(   6)*(x*roop(  21)+y*ioop(  21))
      ioop(  28) = f(   6)*(x*ioop(  21)-y*roop(  21))
      s = h(   5)*z
      roop(  29) = g(  16)*(s*roop(  22)-rsq*roop(  16))
      ioop(  29) = zero
      roop(  30) = g(  17)*(s*roop(  23)-rsq*roop(  17))
      ioop(  30) = g(  17)*(s*ioop(  23)-rsq*ioop(  17))
      roop(  31) = g(  18)*(s*roop(  24)-rsq*roop(  18))
      ioop(  31) = g(  18)*(s*ioop(  24)-rsq*ioop(  18))
      roop(  32) = g(  19)*(s*roop(  25)-rsq*roop(  19))
      ioop(  32) = g(  19)*(s*ioop(  25)-rsq*ioop(  19))
      roop(  33) = g(  20)*(s*roop(  26)-rsq*roop(  20))
      ioop(  33) = g(  20)*(s*ioop(  26)-rsq*ioop(  20))
      roop(  34) = g(  21)*(s*roop(  27)-rsq*roop(  21))
      ioop(  34) = g(  21)*(s*ioop(  27)-rsq*ioop(  21))
      roop(  35) = z*roop(  28)
      ioop(  35) = z*ioop(  28)
      roop(  36) = f(   7)*(x*roop(  28)+y*ioop(  28))
      ioop(  36) = f(   7)*(x*ioop(  28)-y*roop(  28))
      s = h(   6)*z
      roop(  37) = g(  22)*(s*roop(  29)-rsq*roop(  22))
      ioop(  37) = zero
      roop(  38) = g(  23)*(s*roop(  30)-rsq*roop(  23))
      ioop(  38) = g(  23)*(s*ioop(  30)-rsq*ioop(  23))
      roop(  39) = g(  24)*(s*roop(  31)-rsq*roop(  24))
      ioop(  39) = g(  24)*(s*ioop(  31)-rsq*ioop(  24))
      roop(  40) = g(  25)*(s*roop(  32)-rsq*roop(  25))
      ioop(  40) = g(  25)*(s*ioop(  32)-rsq*ioop(  25))
      roop(  41) = g(  26)*(s*roop(  33)-rsq*roop(  26))
      ioop(  41) = g(  26)*(s*ioop(  33)-rsq*ioop(  26))
      roop(  42) = g(  27)*(s*roop(  34)-rsq*roop(  27))
      ioop(  42) = g(  27)*(s*ioop(  34)-rsq*ioop(  27))
      roop(  43) = g(  28)*(s*roop(  35)-rsq*roop(  28))
      ioop(  43) = g(  28)*(s*ioop(  35)-rsq*ioop(  28))
      roop(  44) = z*roop(  36)
      ioop(  44) = z*ioop(  36)
      roop(  45) = f(   8)*(x*roop(  36)+y*ioop(  36))
      ioop(  45) = f(   8)*(x*ioop(  36)-y*roop(  36))
      s = h(   7)*z
      roop(  46) = g(  29)*(s*roop(  37)-rsq*roop(  29))
      ioop(  46) = zero
      roop(  47) = g(  30)*(s*roop(  38)-rsq*roop(  30))
      ioop(  47) = g(  30)*(s*ioop(  38)-rsq*ioop(  30))
      roop(  48) = g(  31)*(s*roop(  39)-rsq*roop(  31))
      ioop(  48) = g(  31)*(s*ioop(  39)-rsq*ioop(  31))
      roop(  49) = g(  32)*(s*roop(  40)-rsq*roop(  32))
      ioop(  49) = g(  32)*(s*ioop(  40)-rsq*ioop(  32))
      roop(  50) = g(  33)*(s*roop(  41)-rsq*roop(  33))
      ioop(  50) = g(  33)*(s*ioop(  41)-rsq*ioop(  33))
      roop(  51) = g(  34)*(s*roop(  42)-rsq*roop(  34))
      ioop(  51) = g(  34)*(s*ioop(  42)-rsq*ioop(  34))
      roop(  52) = g(  35)*(s*roop(  43)-rsq*roop(  35))
      ioop(  52) = g(  35)*(s*ioop(  43)-rsq*ioop(  35))
      roop(  53) = g(  36)*(s*roop(  44)-rsq*roop(  36))
      ioop(  53) = g(  36)*(s*ioop(  44)-rsq*ioop(  36))
      roop(  54) = z*roop(  45)
      ioop(  54) = z*ioop(  45)
      roop(  55) = f(   9)*(x*roop(  45)+y*ioop(  45))
      ioop(  55) = f(   9)*(x*ioop(  45)-y*roop(  45))
      s = h(   8)*z
      roop(  56) = g(  37)*(s*roop(  46)-rsq*roop(  37))
      ioop(  56) = zero
      roop(  57) = g(  38)*(s*roop(  47)-rsq*roop(  38))
      ioop(  57) = g(  38)*(s*ioop(  47)-rsq*ioop(  38))
      roop(  58) = g(  39)*(s*roop(  48)-rsq*roop(  39))
      ioop(  58) = g(  39)*(s*ioop(  48)-rsq*ioop(  39))
      roop(  59) = g(  40)*(s*roop(  49)-rsq*roop(  40))
      ioop(  59) = g(  40)*(s*ioop(  49)-rsq*ioop(  40))
      roop(  60) = g(  41)*(s*roop(  50)-rsq*roop(  41))
      ioop(  60) = g(  41)*(s*ioop(  50)-rsq*ioop(  41))
      roop(  61) = g(  42)*(s*roop(  51)-rsq*roop(  42))
      ioop(  61) = g(  42)*(s*ioop(  51)-rsq*ioop(  42))
      roop(  62) = g(  43)*(s*roop(  52)-rsq*roop(  43))
      ioop(  62) = g(  43)*(s*ioop(  52)-rsq*ioop(  43))
      roop(  63) = g(  44)*(s*roop(  53)-rsq*roop(  44))
      ioop(  63) = g(  44)*(s*ioop(  53)-rsq*ioop(  44))
      roop(  64) = g(  45)*(s*roop(  54)-rsq*roop(  45))
      ioop(  64) = g(  45)*(s*ioop(  54)-rsq*ioop(  45))
      roop(  65) = z*roop(  55)
      ioop(  65) = z*ioop(  55)
      roop(  66) = f(  10)*(x*roop(  55)+y*ioop(  55))
      ioop(  66) = f(  10)*(x*ioop(  55)-y*roop(  55))
      s = h(   9)*z
      roop(  67) = g(  46)*(s*roop(  56)-rsq*roop(  46))
      ioop(  67) = zero
      roop(  68) = g(  47)*(s*roop(  57)-rsq*roop(  47))
      ioop(  68) = g(  47)*(s*ioop(  57)-rsq*ioop(  47))
      roop(  69) = g(  48)*(s*roop(  58)-rsq*roop(  48))
      ioop(  69) = g(  48)*(s*ioop(  58)-rsq*ioop(  48))
      roop(  70) = g(  49)*(s*roop(  59)-rsq*roop(  49))
      ioop(  70) = g(  49)*(s*ioop(  59)-rsq*ioop(  49))
      roop(  71) = g(  50)*(s*roop(  60)-rsq*roop(  50))
      ioop(  71) = g(  50)*(s*ioop(  60)-rsq*ioop(  50))
      roop(  72) = g(  51)*(s*roop(  61)-rsq*roop(  51))
      ioop(  72) = g(  51)*(s*ioop(  61)-rsq*ioop(  51))
      roop(  73) = g(  52)*(s*roop(  62)-rsq*roop(  52))
      ioop(  73) = g(  52)*(s*ioop(  62)-rsq*ioop(  52))
      roop(  74) = g(  53)*(s*roop(  63)-rsq*roop(  53))
      ioop(  74) = g(  53)*(s*ioop(  63)-rsq*ioop(  53))
      roop(  75) = g(  54)*(s*roop(  64)-rsq*roop(  54))
      ioop(  75) = g(  54)*(s*ioop(  64)-rsq*ioop(  54))
      roop(  76) = g(  55)*(s*roop(  65)-rsq*roop(  55))
      ioop(  76) = g(  55)*(s*ioop(  65)-rsq*ioop(  55))
      roop(  77) = z*roop(  66)
      ioop(  77) = z*ioop(  66)
      roop(  78) = f(  11)*(x*roop(  66)+y*ioop(  66))
      ioop(  78) = f(  11)*(x*ioop(  66)-y*roop(  66))
      s = h(  10)*z
      roop(  79) = g(  56)*(s*roop(  67)-rsq*roop(  56))
      ioop(  79) = zero
      roop(  80) = g(  57)*(s*roop(  68)-rsq*roop(  57))
      ioop(  80) = g(  57)*(s*ioop(  68)-rsq*ioop(  57))
      roop(  81) = g(  58)*(s*roop(  69)-rsq*roop(  58))
      ioop(  81) = g(  58)*(s*ioop(  69)-rsq*ioop(  58))
      roop(  82) = g(  59)*(s*roop(  70)-rsq*roop(  59))
      ioop(  82) = g(  59)*(s*ioop(  70)-rsq*ioop(  59))
      roop(  83) = g(  60)*(s*roop(  71)-rsq*roop(  60))
      ioop(  83) = g(  60)*(s*ioop(  71)-rsq*ioop(  60))
      roop(  84) = g(  61)*(s*roop(  72)-rsq*roop(  61))
      ioop(  84) = g(  61)*(s*ioop(  72)-rsq*ioop(  61))
      roop(  85) = g(  62)*(s*roop(  73)-rsq*roop(  62))
      ioop(  85) = g(  62)*(s*ioop(  73)-rsq*ioop(  62))
      roop(  86) = g(  63)*(s*roop(  74)-rsq*roop(  63))
      ioop(  86) = g(  63)*(s*ioop(  74)-rsq*ioop(  63))
      roop(  87) = g(  64)*(s*roop(  75)-rsq*roop(  64))
      ioop(  87) = g(  64)*(s*ioop(  75)-rsq*ioop(  64))
      roop(  88) = g(  65)*(s*roop(  76)-rsq*roop(  65))
      ioop(  88) = g(  65)*(s*ioop(  76)-rsq*ioop(  65))
      roop(  89) = g(  66)*(s*roop(  77)-rsq*roop(  66))
      ioop(  89) = g(  66)*(s*ioop(  77)-rsq*ioop(  66))
      roop(  90) = z*roop(  78)
      ioop(  90) = z*ioop(  78)
      roop(  91) = f(  12)*(x*roop(  78)+y*ioop(  78))
      ioop(  91) = f(  12)*(x*ioop(  78)-y*roop(  78))
      s = h(  11)*z
      roop(  92) = g(  67)*(s*roop(  79)-rsq*roop(  67))
      ioop(  92) = zero
      roop(  93) = g(  68)*(s*roop(  80)-rsq*roop(  68))
      ioop(  93) = g(  68)*(s*ioop(  80)-rsq*ioop(  68))
      roop(  94) = g(  69)*(s*roop(  81)-rsq*roop(  69))
      ioop(  94) = g(  69)*(s*ioop(  81)-rsq*ioop(  69))
      roop(  95) = g(  70)*(s*roop(  82)-rsq*roop(  70))
      ioop(  95) = g(  70)*(s*ioop(  82)-rsq*ioop(  70))
      roop(  96) = g(  71)*(s*roop(  83)-rsq*roop(  71))
      ioop(  96) = g(  71)*(s*ioop(  83)-rsq*ioop(  71))
      roop(  97) = g(  72)*(s*roop(  84)-rsq*roop(  72))
      ioop(  97) = g(  72)*(s*ioop(  84)-rsq*ioop(  72))
      roop(  98) = g(  73)*(s*roop(  85)-rsq*roop(  73))
      ioop(  98) = g(  73)*(s*ioop(  85)-rsq*ioop(  73))
      roop(  99) = g(  74)*(s*roop(  86)-rsq*roop(  74))
      ioop(  99) = g(  74)*(s*ioop(  86)-rsq*ioop(  74))
      roop( 100) = g(  75)*(s*roop(  87)-rsq*roop(  75))
      ioop( 100) = g(  75)*(s*ioop(  87)-rsq*ioop(  75))
      roop( 101) = g(  76)*(s*roop(  88)-rsq*roop(  76))
      ioop( 101) = g(  76)*(s*ioop(  88)-rsq*ioop(  76))
      roop( 102) = g(  77)*(s*roop(  89)-rsq*roop(  77))
      ioop( 102) = g(  77)*(s*ioop(  89)-rsq*ioop(  77))
      roop( 103) = g(  78)*(s*roop(  90)-rsq*roop(  78))
      ioop( 103) = g(  78)*(s*ioop(  90)-rsq*ioop(  78))
      roop( 104) = z*roop(  91)
      ioop( 104) = z*ioop(  91)
      roop( 105) = f(  13)*(x*roop(  91)+y*ioop(  91))
      ioop( 105) = f(  13)*(x*ioop(  91)-y*roop(  91))
      s = h(  12)*z
      roop( 106) = g(  79)*(s*roop(  92)-rsq*roop(  79))
      ioop( 106) = zero
      roop( 107) = g(  80)*(s*roop(  93)-rsq*roop(  80))
      ioop( 107) = g(  80)*(s*ioop(  93)-rsq*ioop(  80))
      roop( 108) = g(  81)*(s*roop(  94)-rsq*roop(  81))
      ioop( 108) = g(  81)*(s*ioop(  94)-rsq*ioop(  81))
      roop( 109) = g(  82)*(s*roop(  95)-rsq*roop(  82))
      ioop( 109) = g(  82)*(s*ioop(  95)-rsq*ioop(  82))
      roop( 110) = g(  83)*(s*roop(  96)-rsq*roop(  83))
      ioop( 110) = g(  83)*(s*ioop(  96)-rsq*ioop(  83))
      roop( 111) = g(  84)*(s*roop(  97)-rsq*roop(  84))
      ioop( 111) = g(  84)*(s*ioop(  97)-rsq*ioop(  84))
      roop( 112) = g(  85)*(s*roop(  98)-rsq*roop(  85))
      ioop( 112) = g(  85)*(s*ioop(  98)-rsq*ioop(  85))
      roop( 113) = g(  86)*(s*roop(  99)-rsq*roop(  86))
      ioop( 113) = g(  86)*(s*ioop(  99)-rsq*ioop(  86))
      roop( 114) = g(  87)*(s*roop( 100)-rsq*roop(  87))
      ioop( 114) = g(  87)*(s*ioop( 100)-rsq*ioop(  87))
      roop( 115) = g(  88)*(s*roop( 101)-rsq*roop(  88))
      ioop( 115) = g(  88)*(s*ioop( 101)-rsq*ioop(  88))
      roop( 116) = g(  89)*(s*roop( 102)-rsq*roop(  89))
      ioop( 116) = g(  89)*(s*ioop( 102)-rsq*ioop(  89))
      roop( 117) = g(  90)*(s*roop( 103)-rsq*roop(  90))
      ioop( 117) = g(  90)*(s*ioop( 103)-rsq*ioop(  90))
      roop( 118) = g(  91)*(s*roop( 104)-rsq*roop(  91))
      ioop( 118) = g(  91)*(s*ioop( 104)-rsq*ioop(  91))
      roop( 119) = z*roop( 105)
      ioop( 119) = z*ioop( 105)
      roop( 120) = f(  14)*(x*roop( 105)+y*ioop( 105))
      ioop( 120) = f(  14)*(x*ioop( 105)-y*roop( 105))
      s = h(  13)*z
      roop( 121) = g(  92)*(s*roop( 106)-rsq*roop(  92))
      ioop( 121) = zero
      roop( 122) = g(  93)*(s*roop( 107)-rsq*roop(  93))
      ioop( 122) = g(  93)*(s*ioop( 107)-rsq*ioop(  93))
      roop( 123) = g(  94)*(s*roop( 108)-rsq*roop(  94))
      ioop( 123) = g(  94)*(s*ioop( 108)-rsq*ioop(  94))
      roop( 124) = g(  95)*(s*roop( 109)-rsq*roop(  95))
      ioop( 124) = g(  95)*(s*ioop( 109)-rsq*ioop(  95))
      roop( 125) = g(  96)*(s*roop( 110)-rsq*roop(  96))
      ioop( 125) = g(  96)*(s*ioop( 110)-rsq*ioop(  96))
      roop( 126) = g(  97)*(s*roop( 111)-rsq*roop(  97))
      ioop( 126) = g(  97)*(s*ioop( 111)-rsq*ioop(  97))
      roop( 127) = g(  98)*(s*roop( 112)-rsq*roop(  98))
      ioop( 127) = g(  98)*(s*ioop( 112)-rsq*ioop(  98))
      roop( 128) = g(  99)*(s*roop( 113)-rsq*roop(  99))
      ioop( 128) = g(  99)*(s*ioop( 113)-rsq*ioop(  99))
      roop( 129) = g( 100)*(s*roop( 114)-rsq*roop( 100))
      ioop( 129) = g( 100)*(s*ioop( 114)-rsq*ioop( 100))
      roop( 130) = g( 101)*(s*roop( 115)-rsq*roop( 101))
      ioop( 130) = g( 101)*(s*ioop( 115)-rsq*ioop( 101))
      roop( 131) = g( 102)*(s*roop( 116)-rsq*roop( 102))
      ioop( 131) = g( 102)*(s*ioop( 116)-rsq*ioop( 102))
      roop( 132) = g( 103)*(s*roop( 117)-rsq*roop( 103))
      ioop( 132) = g( 103)*(s*ioop( 117)-rsq*ioop( 103))
      roop( 133) = g( 104)*(s*roop( 118)-rsq*roop( 104))
      ioop( 133) = g( 104)*(s*ioop( 118)-rsq*ioop( 104))
      roop( 134) = g( 105)*(s*roop( 119)-rsq*roop( 105))
      ioop( 134) = g( 105)*(s*ioop( 119)-rsq*ioop( 105))
      roop( 135) = z*roop( 120)
      ioop( 135) = z*ioop( 120)
      roop( 136) = f(  15)*(x*roop( 120)+y*ioop( 120))
      ioop( 136) = f(  15)*(x*ioop( 120)-y*roop( 120))
      s = h(  14)*z
      roop( 137) = g( 106)*(s*roop( 121)-rsq*roop( 106))
      ioop( 137) = zero
      roop( 138) = g( 107)*(s*roop( 122)-rsq*roop( 107))
      ioop( 138) = g( 107)*(s*ioop( 122)-rsq*ioop( 107))
      roop( 139) = g( 108)*(s*roop( 123)-rsq*roop( 108))
      ioop( 139) = g( 108)*(s*ioop( 123)-rsq*ioop( 108))
      roop( 140) = g( 109)*(s*roop( 124)-rsq*roop( 109))
      ioop( 140) = g( 109)*(s*ioop( 124)-rsq*ioop( 109))
      roop( 141) = g( 110)*(s*roop( 125)-rsq*roop( 110))
      ioop( 141) = g( 110)*(s*ioop( 125)-rsq*ioop( 110))
      roop( 142) = g( 111)*(s*roop( 126)-rsq*roop( 111))
      ioop( 142) = g( 111)*(s*ioop( 126)-rsq*ioop( 111))
      roop( 143) = g( 112)*(s*roop( 127)-rsq*roop( 112))
      ioop( 143) = g( 112)*(s*ioop( 127)-rsq*ioop( 112))
      roop( 144) = g( 113)*(s*roop( 128)-rsq*roop( 113))
      ioop( 144) = g( 113)*(s*ioop( 128)-rsq*ioop( 113))
      roop( 145) = g( 114)*(s*roop( 129)-rsq*roop( 114))
      ioop( 145) = g( 114)*(s*ioop( 129)-rsq*ioop( 114))
      roop( 146) = g( 115)*(s*roop( 130)-rsq*roop( 115))
      ioop( 146) = g( 115)*(s*ioop( 130)-rsq*ioop( 115))
      roop( 147) = g( 116)*(s*roop( 131)-rsq*roop( 116))
      ioop( 147) = g( 116)*(s*ioop( 131)-rsq*ioop( 116))
      roop( 148) = g( 117)*(s*roop( 132)-rsq*roop( 117))
      ioop( 148) = g( 117)*(s*ioop( 132)-rsq*ioop( 117))
      roop( 149) = g( 118)*(s*roop( 133)-rsq*roop( 118))
      ioop( 149) = g( 118)*(s*ioop( 133)-rsq*ioop( 118))
      roop( 150) = g( 119)*(s*roop( 134)-rsq*roop( 119))
      ioop( 150) = g( 119)*(s*ioop( 134)-rsq*ioop( 119))
      roop( 151) = g( 120)*(s*roop( 135)-rsq*roop( 120))
      ioop( 151) = g( 120)*(s*ioop( 135)-rsq*ioop( 120))
      roop( 152) = z*roop( 136)
      ioop( 152) = z*ioop( 136)
      roop( 153) = f(  16)*(x*roop( 136)+y*ioop( 136))
      ioop( 153) = f(  16)*(x*ioop( 136)-y*roop( 136))
      s = h(  15)*z
      roop( 154) = g( 121)*(s*roop( 137)-rsq*roop( 121))
      ioop( 154) = zero
      roop( 155) = g( 122)*(s*roop( 138)-rsq*roop( 122))
      ioop( 155) = g( 122)*(s*ioop( 138)-rsq*ioop( 122))
      roop( 156) = g( 123)*(s*roop( 139)-rsq*roop( 123))
      ioop( 156) = g( 123)*(s*ioop( 139)-rsq*ioop( 123))
      roop( 157) = g( 124)*(s*roop( 140)-rsq*roop( 124))
      ioop( 157) = g( 124)*(s*ioop( 140)-rsq*ioop( 124))
      roop( 158) = g( 125)*(s*roop( 141)-rsq*roop( 125))
      ioop( 158) = g( 125)*(s*ioop( 141)-rsq*ioop( 125))
      roop( 159) = g( 126)*(s*roop( 142)-rsq*roop( 126))
      ioop( 159) = g( 126)*(s*ioop( 142)-rsq*ioop( 126))
      roop( 160) = g( 127)*(s*roop( 143)-rsq*roop( 127))
      ioop( 160) = g( 127)*(s*ioop( 143)-rsq*ioop( 127))
      roop( 161) = g( 128)*(s*roop( 144)-rsq*roop( 128))
      ioop( 161) = g( 128)*(s*ioop( 144)-rsq*ioop( 128))
      roop( 162) = g( 129)*(s*roop( 145)-rsq*roop( 129))
      ioop( 162) = g( 129)*(s*ioop( 145)-rsq*ioop( 129))
      roop( 163) = g( 130)*(s*roop( 146)-rsq*roop( 130))
      ioop( 163) = g( 130)*(s*ioop( 146)-rsq*ioop( 130))
      roop( 164) = g( 131)*(s*roop( 147)-rsq*roop( 131))
      ioop( 164) = g( 131)*(s*ioop( 147)-rsq*ioop( 131))
      roop( 165) = g( 132)*(s*roop( 148)-rsq*roop( 132))
      ioop( 165) = g( 132)*(s*ioop( 148)-rsq*ioop( 132))
      roop( 166) = g( 133)*(s*roop( 149)-rsq*roop( 133))
      ioop( 166) = g( 133)*(s*ioop( 149)-rsq*ioop( 133))
      roop( 167) = g( 134)*(s*roop( 150)-rsq*roop( 134))
      ioop( 167) = g( 134)*(s*ioop( 150)-rsq*ioop( 134))
      roop( 168) = g( 135)*(s*roop( 151)-rsq*roop( 135))
      ioop( 168) = g( 135)*(s*ioop( 151)-rsq*ioop( 135))
      roop( 169) = g( 136)*(s*roop( 152)-rsq*roop( 136))
      ioop( 169) = g( 136)*(s*ioop( 152)-rsq*ioop( 136))
      roop( 170) = z*roop( 153)
      ioop( 170) = z*ioop( 153)
      roop( 171) = f(  17)*(x*roop( 153)+y*ioop( 153))
      ioop( 171) = f(  17)*(x*ioop( 153)-y*roop( 153))
      s = h(  16)*z
      roop( 172) = g( 137)*(s*roop( 154)-rsq*roop( 137))
      ioop( 172) = zero
      roop( 173) = g( 138)*(s*roop( 155)-rsq*roop( 138))
      ioop( 173) = g( 138)*(s*ioop( 155)-rsq*ioop( 138))
      roop( 174) = g( 139)*(s*roop( 156)-rsq*roop( 139))
      ioop( 174) = g( 139)*(s*ioop( 156)-rsq*ioop( 139))
      roop( 175) = g( 140)*(s*roop( 157)-rsq*roop( 140))
      ioop( 175) = g( 140)*(s*ioop( 157)-rsq*ioop( 140))
      roop( 176) = g( 141)*(s*roop( 158)-rsq*roop( 141))
      ioop( 176) = g( 141)*(s*ioop( 158)-rsq*ioop( 141))
      roop( 177) = g( 142)*(s*roop( 159)-rsq*roop( 142))
      ioop( 177) = g( 142)*(s*ioop( 159)-rsq*ioop( 142))
      roop( 178) = g( 143)*(s*roop( 160)-rsq*roop( 143))
      ioop( 178) = g( 143)*(s*ioop( 160)-rsq*ioop( 143))
      roop( 179) = g( 144)*(s*roop( 161)-rsq*roop( 144))
      ioop( 179) = g( 144)*(s*ioop( 161)-rsq*ioop( 144))
      roop( 180) = g( 145)*(s*roop( 162)-rsq*roop( 145))
      ioop( 180) = g( 145)*(s*ioop( 162)-rsq*ioop( 145))
      roop( 181) = g( 146)*(s*roop( 163)-rsq*roop( 146))
      ioop( 181) = g( 146)*(s*ioop( 163)-rsq*ioop( 146))
      roop( 182) = g( 147)*(s*roop( 164)-rsq*roop( 147))
      ioop( 182) = g( 147)*(s*ioop( 164)-rsq*ioop( 147))
      roop( 183) = g( 148)*(s*roop( 165)-rsq*roop( 148))
      ioop( 183) = g( 148)*(s*ioop( 165)-rsq*ioop( 148))
      roop( 184) = g( 149)*(s*roop( 166)-rsq*roop( 149))
      ioop( 184) = g( 149)*(s*ioop( 166)-rsq*ioop( 149))
      roop( 185) = g( 150)*(s*roop( 167)-rsq*roop( 150))
      ioop( 185) = g( 150)*(s*ioop( 167)-rsq*ioop( 150))
      roop( 186) = g( 151)*(s*roop( 168)-rsq*roop( 151))
      ioop( 186) = g( 151)*(s*ioop( 168)-rsq*ioop( 151))
      roop( 187) = g( 152)*(s*roop( 169)-rsq*roop( 152))
      ioop( 187) = g( 152)*(s*ioop( 169)-rsq*ioop( 152))
      roop( 188) = g( 153)*(s*roop( 170)-rsq*roop( 153))
      ioop( 188) = g( 153)*(s*ioop( 170)-rsq*ioop( 153))
      roop( 189) = z*roop( 171)
      ioop( 189) = z*ioop( 171)
      roop( 190) = f(  18)*(x*roop( 171)+y*ioop( 171))
      ioop( 190) = f(  18)*(x*ioop( 171)-y*roop( 171))
      s = h(  17)*z
      roop( 191) = g( 154)*(s*roop( 172)-rsq*roop( 154))
      ioop( 191) = zero
      roop( 192) = g( 155)*(s*roop( 173)-rsq*roop( 155))
      ioop( 192) = g( 155)*(s*ioop( 173)-rsq*ioop( 155))
      roop( 193) = g( 156)*(s*roop( 174)-rsq*roop( 156))
      ioop( 193) = g( 156)*(s*ioop( 174)-rsq*ioop( 156))
      roop( 194) = g( 157)*(s*roop( 175)-rsq*roop( 157))
      ioop( 194) = g( 157)*(s*ioop( 175)-rsq*ioop( 157))
      roop( 195) = g( 158)*(s*roop( 176)-rsq*roop( 158))
      ioop( 195) = g( 158)*(s*ioop( 176)-rsq*ioop( 158))
      roop( 196) = g( 159)*(s*roop( 177)-rsq*roop( 159))
      ioop( 196) = g( 159)*(s*ioop( 177)-rsq*ioop( 159))
      roop( 197) = g( 160)*(s*roop( 178)-rsq*roop( 160))
      ioop( 197) = g( 160)*(s*ioop( 178)-rsq*ioop( 160))
      roop( 198) = g( 161)*(s*roop( 179)-rsq*roop( 161))
      ioop( 198) = g( 161)*(s*ioop( 179)-rsq*ioop( 161))
      roop( 199) = g( 162)*(s*roop( 180)-rsq*roop( 162))
      ioop( 199) = g( 162)*(s*ioop( 180)-rsq*ioop( 162))
      roop( 200) = g( 163)*(s*roop( 181)-rsq*roop( 163))
      ioop( 200) = g( 163)*(s*ioop( 181)-rsq*ioop( 163))
      roop( 201) = g( 164)*(s*roop( 182)-rsq*roop( 164))
      ioop( 201) = g( 164)*(s*ioop( 182)-rsq*ioop( 164))
      roop( 202) = g( 165)*(s*roop( 183)-rsq*roop( 165))
      ioop( 202) = g( 165)*(s*ioop( 183)-rsq*ioop( 165))
      roop( 203) = g( 166)*(s*roop( 184)-rsq*roop( 166))
      ioop( 203) = g( 166)*(s*ioop( 184)-rsq*ioop( 166))
      roop( 204) = g( 167)*(s*roop( 185)-rsq*roop( 167))
      ioop( 204) = g( 167)*(s*ioop( 185)-rsq*ioop( 167))
      roop( 205) = g( 168)*(s*roop( 186)-rsq*roop( 168))
      ioop( 205) = g( 168)*(s*ioop( 186)-rsq*ioop( 168))
      roop( 206) = g( 169)*(s*roop( 187)-rsq*roop( 169))
      ioop( 206) = g( 169)*(s*ioop( 187)-rsq*ioop( 169))
      roop( 207) = g( 170)*(s*roop( 188)-rsq*roop( 170))
      ioop( 207) = g( 170)*(s*ioop( 188)-rsq*ioop( 170))
      roop( 208) = g( 171)*(s*roop( 189)-rsq*roop( 171))
      ioop( 208) = g( 171)*(s*ioop( 189)-rsq*ioop( 171))
      roop( 209) = z*roop( 190)
      ioop( 209) = z*ioop( 190)
      roop( 210) = f(  19)*(x*roop( 190)+y*ioop( 190))
      ioop( 210) = f(  19)*(x*ioop( 190)-y*roop( 190))
      s = h(  18)*z
      roop( 211) = g( 172)*(s*roop( 191)-rsq*roop( 172))
      ioop( 211) = zero
      roop( 212) = g( 173)*(s*roop( 192)-rsq*roop( 173))
      ioop( 212) = g( 173)*(s*ioop( 192)-rsq*ioop( 173))
      roop( 213) = g( 174)*(s*roop( 193)-rsq*roop( 174))
      ioop( 213) = g( 174)*(s*ioop( 193)-rsq*ioop( 174))
      roop( 214) = g( 175)*(s*roop( 194)-rsq*roop( 175))
      ioop( 214) = g( 175)*(s*ioop( 194)-rsq*ioop( 175))
      roop( 215) = g( 176)*(s*roop( 195)-rsq*roop( 176))
      ioop( 215) = g( 176)*(s*ioop( 195)-rsq*ioop( 176))
      roop( 216) = g( 177)*(s*roop( 196)-rsq*roop( 177))
      ioop( 216) = g( 177)*(s*ioop( 196)-rsq*ioop( 177))
      roop( 217) = g( 178)*(s*roop( 197)-rsq*roop( 178))
      ioop( 217) = g( 178)*(s*ioop( 197)-rsq*ioop( 178))
      roop( 218) = g( 179)*(s*roop( 198)-rsq*roop( 179))
      ioop( 218) = g( 179)*(s*ioop( 198)-rsq*ioop( 179))
      roop( 219) = g( 180)*(s*roop( 199)-rsq*roop( 180))
      ioop( 219) = g( 180)*(s*ioop( 199)-rsq*ioop( 180))
      roop( 220) = g( 181)*(s*roop( 200)-rsq*roop( 181))
      ioop( 220) = g( 181)*(s*ioop( 200)-rsq*ioop( 181))
      roop( 221) = g( 182)*(s*roop( 201)-rsq*roop( 182))
      ioop( 221) = g( 182)*(s*ioop( 201)-rsq*ioop( 182))
      roop( 222) = g( 183)*(s*roop( 202)-rsq*roop( 183))
      ioop( 222) = g( 183)*(s*ioop( 202)-rsq*ioop( 183))
      roop( 223) = g( 184)*(s*roop( 203)-rsq*roop( 184))
      ioop( 223) = g( 184)*(s*ioop( 203)-rsq*ioop( 184))
      roop( 224) = g( 185)*(s*roop( 204)-rsq*roop( 185))
      ioop( 224) = g( 185)*(s*ioop( 204)-rsq*ioop( 185))
      roop( 225) = g( 186)*(s*roop( 205)-rsq*roop( 186))
      ioop( 225) = g( 186)*(s*ioop( 205)-rsq*ioop( 186))
      roop( 226) = g( 187)*(s*roop( 206)-rsq*roop( 187))
      ioop( 226) = g( 187)*(s*ioop( 206)-rsq*ioop( 187))
      roop( 227) = g( 188)*(s*roop( 207)-rsq*roop( 188))
      ioop( 227) = g( 188)*(s*ioop( 207)-rsq*ioop( 188))
      roop( 228) = g( 189)*(s*roop( 208)-rsq*roop( 189))
      ioop( 228) = g( 189)*(s*ioop( 208)-rsq*ioop( 189))
      roop( 229) = g( 190)*(s*roop( 209)-rsq*roop( 190))
      ioop( 229) = g( 190)*(s*ioop( 209)-rsq*ioop( 190))
      roop( 230) = z*roop( 210)
      ioop( 230) = z*ioop( 210)
      roop( 231) = f(  20)*(x*roop( 210)+y*ioop( 210))
      ioop( 231) = f(  20)*(x*ioop( 210)-y*roop( 210))
      s = h(  19)*z
      roop( 232) = g( 191)*(s*roop( 211)-rsq*roop( 191))
      ioop( 232) = zero
      roop( 233) = g( 192)*(s*roop( 212)-rsq*roop( 192))
      ioop( 233) = g( 192)*(s*ioop( 212)-rsq*ioop( 192))
      roop( 234) = g( 193)*(s*roop( 213)-rsq*roop( 193))
      ioop( 234) = g( 193)*(s*ioop( 213)-rsq*ioop( 193))
      roop( 235) = g( 194)*(s*roop( 214)-rsq*roop( 194))
      ioop( 235) = g( 194)*(s*ioop( 214)-rsq*ioop( 194))
      roop( 236) = g( 195)*(s*roop( 215)-rsq*roop( 195))
      ioop( 236) = g( 195)*(s*ioop( 215)-rsq*ioop( 195))
      roop( 237) = g( 196)*(s*roop( 216)-rsq*roop( 196))
      ioop( 237) = g( 196)*(s*ioop( 216)-rsq*ioop( 196))
      roop( 238) = g( 197)*(s*roop( 217)-rsq*roop( 197))
      ioop( 238) = g( 197)*(s*ioop( 217)-rsq*ioop( 197))
      roop( 239) = g( 198)*(s*roop( 218)-rsq*roop( 198))
      ioop( 239) = g( 198)*(s*ioop( 218)-rsq*ioop( 198))
      roop( 240) = g( 199)*(s*roop( 219)-rsq*roop( 199))
      ioop( 240) = g( 199)*(s*ioop( 219)-rsq*ioop( 199))
      roop( 241) = g( 200)*(s*roop( 220)-rsq*roop( 200))
      ioop( 241) = g( 200)*(s*ioop( 220)-rsq*ioop( 200))
      roop( 242) = g( 201)*(s*roop( 221)-rsq*roop( 201))
      ioop( 242) = g( 201)*(s*ioop( 221)-rsq*ioop( 201))
      roop( 243) = g( 202)*(s*roop( 222)-rsq*roop( 202))
      ioop( 243) = g( 202)*(s*ioop( 222)-rsq*ioop( 202))
      roop( 244) = g( 203)*(s*roop( 223)-rsq*roop( 203))
      ioop( 244) = g( 203)*(s*ioop( 223)-rsq*ioop( 203))
      roop( 245) = g( 204)*(s*roop( 224)-rsq*roop( 204))
      ioop( 245) = g( 204)*(s*ioop( 224)-rsq*ioop( 204))
      roop( 246) = g( 205)*(s*roop( 225)-rsq*roop( 205))
      ioop( 246) = g( 205)*(s*ioop( 225)-rsq*ioop( 205))
      roop( 247) = g( 206)*(s*roop( 226)-rsq*roop( 206))
      ioop( 247) = g( 206)*(s*ioop( 226)-rsq*ioop( 206))
      roop( 248) = g( 207)*(s*roop( 227)-rsq*roop( 207))
      ioop( 248) = g( 207)*(s*ioop( 227)-rsq*ioop( 207))
      roop( 249) = g( 208)*(s*roop( 228)-rsq*roop( 208))
      ioop( 249) = g( 208)*(s*ioop( 228)-rsq*ioop( 208))
      roop( 250) = g( 209)*(s*roop( 229)-rsq*roop( 209))
      ioop( 250) = g( 209)*(s*ioop( 229)-rsq*ioop( 209))
      roop( 251) = g( 210)*(s*roop( 230)-rsq*roop( 210))
      ioop( 251) = g( 210)*(s*ioop( 230)-rsq*ioop( 210))
      roop( 252) = z*roop( 231)
      ioop( 252) = z*ioop( 231)
      roop( 253) = f(  21)*(x*roop( 231)+y*ioop( 231))
      ioop( 253) = f(  21)*(x*ioop( 231)-y*roop( 231))
      s = h(  20)*z
      roop( 254) = g( 211)*(s*roop( 232)-rsq*roop( 211))
      ioop( 254) = zero
      roop( 255) = g( 212)*(s*roop( 233)-rsq*roop( 212))
      ioop( 255) = g( 212)*(s*ioop( 233)-rsq*ioop( 212))
      roop( 256) = g( 213)*(s*roop( 234)-rsq*roop( 213))
      ioop( 256) = g( 213)*(s*ioop( 234)-rsq*ioop( 213))
      roop( 257) = g( 214)*(s*roop( 235)-rsq*roop( 214))
      ioop( 257) = g( 214)*(s*ioop( 235)-rsq*ioop( 214))
      roop( 258) = g( 215)*(s*roop( 236)-rsq*roop( 215))
      ioop( 258) = g( 215)*(s*ioop( 236)-rsq*ioop( 215))
      roop( 259) = g( 216)*(s*roop( 237)-rsq*roop( 216))
      ioop( 259) = g( 216)*(s*ioop( 237)-rsq*ioop( 216))
      roop( 260) = g( 217)*(s*roop( 238)-rsq*roop( 217))
      ioop( 260) = g( 217)*(s*ioop( 238)-rsq*ioop( 217))
      roop( 261) = g( 218)*(s*roop( 239)-rsq*roop( 218))
      ioop( 261) = g( 218)*(s*ioop( 239)-rsq*ioop( 218))
      roop( 262) = g( 219)*(s*roop( 240)-rsq*roop( 219))
      ioop( 262) = g( 219)*(s*ioop( 240)-rsq*ioop( 219))
      roop( 263) = g( 220)*(s*roop( 241)-rsq*roop( 220))
      ioop( 263) = g( 220)*(s*ioop( 241)-rsq*ioop( 220))
      roop( 264) = g( 221)*(s*roop( 242)-rsq*roop( 221))
      ioop( 264) = g( 221)*(s*ioop( 242)-rsq*ioop( 221))
      roop( 265) = g( 222)*(s*roop( 243)-rsq*roop( 222))
      ioop( 265) = g( 222)*(s*ioop( 243)-rsq*ioop( 222))
      roop( 266) = g( 223)*(s*roop( 244)-rsq*roop( 223))
      ioop( 266) = g( 223)*(s*ioop( 244)-rsq*ioop( 223))
      roop( 267) = g( 224)*(s*roop( 245)-rsq*roop( 224))
      ioop( 267) = g( 224)*(s*ioop( 245)-rsq*ioop( 224))
      roop( 268) = g( 225)*(s*roop( 246)-rsq*roop( 225))
      ioop( 268) = g( 225)*(s*ioop( 246)-rsq*ioop( 225))
      roop( 269) = g( 226)*(s*roop( 247)-rsq*roop( 226))
      ioop( 269) = g( 226)*(s*ioop( 247)-rsq*ioop( 226))
      roop( 270) = g( 227)*(s*roop( 248)-rsq*roop( 227))
      ioop( 270) = g( 227)*(s*ioop( 248)-rsq*ioop( 227))
      roop( 271) = g( 228)*(s*roop( 249)-rsq*roop( 228))
      ioop( 271) = g( 228)*(s*ioop( 249)-rsq*ioop( 228))
      roop( 272) = g( 229)*(s*roop( 250)-rsq*roop( 229))
      ioop( 272) = g( 229)*(s*ioop( 250)-rsq*ioop( 229))
      roop( 273) = g( 230)*(s*roop( 251)-rsq*roop( 230))
      ioop( 273) = g( 230)*(s*ioop( 251)-rsq*ioop( 230))
      roop( 274) = g( 231)*(s*roop( 252)-rsq*roop( 231))
      ioop( 274) = g( 231)*(s*ioop( 252)-rsq*ioop( 231))
      roop( 275) = z*roop( 253)
      ioop( 275) = z*ioop( 253)
      roop( 276) = f(  22)*(x*roop( 253)+y*ioop( 253))
      ioop( 276) = f(  22)*(x*ioop( 253)-y*roop( 253))
      s = h(  21)*z
      roop( 277) = g( 232)*(s*roop( 254)-rsq*roop( 232))
      ioop( 277) = zero
      roop( 278) = g( 233)*(s*roop( 255)-rsq*roop( 233))
      ioop( 278) = g( 233)*(s*ioop( 255)-rsq*ioop( 233))
      roop( 279) = g( 234)*(s*roop( 256)-rsq*roop( 234))
      ioop( 279) = g( 234)*(s*ioop( 256)-rsq*ioop( 234))
      roop( 280) = g( 235)*(s*roop( 257)-rsq*roop( 235))
      ioop( 280) = g( 235)*(s*ioop( 257)-rsq*ioop( 235))
      roop( 281) = g( 236)*(s*roop( 258)-rsq*roop( 236))
      ioop( 281) = g( 236)*(s*ioop( 258)-rsq*ioop( 236))
      roop( 282) = g( 237)*(s*roop( 259)-rsq*roop( 237))
      ioop( 282) = g( 237)*(s*ioop( 259)-rsq*ioop( 237))
      roop( 283) = g( 238)*(s*roop( 260)-rsq*roop( 238))
      ioop( 283) = g( 238)*(s*ioop( 260)-rsq*ioop( 238))
      roop( 284) = g( 239)*(s*roop( 261)-rsq*roop( 239))
      ioop( 284) = g( 239)*(s*ioop( 261)-rsq*ioop( 239))
      roop( 285) = g( 240)*(s*roop( 262)-rsq*roop( 240))
      ioop( 285) = g( 240)*(s*ioop( 262)-rsq*ioop( 240))
      roop( 286) = g( 241)*(s*roop( 263)-rsq*roop( 241))
      ioop( 286) = g( 241)*(s*ioop( 263)-rsq*ioop( 241))
      roop( 287) = g( 242)*(s*roop( 264)-rsq*roop( 242))
      ioop( 287) = g( 242)*(s*ioop( 264)-rsq*ioop( 242))
      roop( 288) = g( 243)*(s*roop( 265)-rsq*roop( 243))
      ioop( 288) = g( 243)*(s*ioop( 265)-rsq*ioop( 243))
      roop( 289) = g( 244)*(s*roop( 266)-rsq*roop( 244))
      ioop( 289) = g( 244)*(s*ioop( 266)-rsq*ioop( 244))
      roop( 290) = g( 245)*(s*roop( 267)-rsq*roop( 245))
      ioop( 290) = g( 245)*(s*ioop( 267)-rsq*ioop( 245))
      roop( 291) = g( 246)*(s*roop( 268)-rsq*roop( 246))
      ioop( 291) = g( 246)*(s*ioop( 268)-rsq*ioop( 246))
      roop( 292) = g( 247)*(s*roop( 269)-rsq*roop( 247))
      ioop( 292) = g( 247)*(s*ioop( 269)-rsq*ioop( 247))
      roop( 293) = g( 248)*(s*roop( 270)-rsq*roop( 248))
      ioop( 293) = g( 248)*(s*ioop( 270)-rsq*ioop( 248))
      roop( 294) = g( 249)*(s*roop( 271)-rsq*roop( 249))
      ioop( 294) = g( 249)*(s*ioop( 271)-rsq*ioop( 249))
      roop( 295) = g( 250)*(s*roop( 272)-rsq*roop( 250))
      ioop( 295) = g( 250)*(s*ioop( 272)-rsq*ioop( 250))
      roop( 296) = g( 251)*(s*roop( 273)-rsq*roop( 251))
      ioop( 296) = g( 251)*(s*ioop( 273)-rsq*ioop( 251))
      roop( 297) = g( 252)*(s*roop( 274)-rsq*roop( 252))
      ioop( 297) = g( 252)*(s*ioop( 274)-rsq*ioop( 252))
      roop( 298) = g( 253)*(s*roop( 275)-rsq*roop( 253))
      ioop( 298) = g( 253)*(s*ioop( 275)-rsq*ioop( 253))
      roop( 299) = z*roop( 276)
      ioop( 299) = z*ioop( 276)
      roop( 300) = f(  23)*(x*roop( 276)+y*ioop( 276))
      ioop( 300) = f(  23)*(x*ioop( 276)-y*roop( 276))
      s = h(  22)*z
      roop( 301) = g( 254)*(s*roop( 277)-rsq*roop( 254))
      ioop( 301) = zero
      roop( 302) = g( 255)*(s*roop( 278)-rsq*roop( 255))
      ioop( 302) = g( 255)*(s*ioop( 278)-rsq*ioop( 255))
      roop( 303) = g( 256)*(s*roop( 279)-rsq*roop( 256))
      ioop( 303) = g( 256)*(s*ioop( 279)-rsq*ioop( 256))
      roop( 304) = g( 257)*(s*roop( 280)-rsq*roop( 257))
      ioop( 304) = g( 257)*(s*ioop( 280)-rsq*ioop( 257))
      roop( 305) = g( 258)*(s*roop( 281)-rsq*roop( 258))
      ioop( 305) = g( 258)*(s*ioop( 281)-rsq*ioop( 258))
      roop( 306) = g( 259)*(s*roop( 282)-rsq*roop( 259))
      ioop( 306) = g( 259)*(s*ioop( 282)-rsq*ioop( 259))
      roop( 307) = g( 260)*(s*roop( 283)-rsq*roop( 260))
      ioop( 307) = g( 260)*(s*ioop( 283)-rsq*ioop( 260))
      roop( 308) = g( 261)*(s*roop( 284)-rsq*roop( 261))
      ioop( 308) = g( 261)*(s*ioop( 284)-rsq*ioop( 261))
      roop( 309) = g( 262)*(s*roop( 285)-rsq*roop( 262))
      ioop( 309) = g( 262)*(s*ioop( 285)-rsq*ioop( 262))
      roop( 310) = g( 263)*(s*roop( 286)-rsq*roop( 263))
      ioop( 310) = g( 263)*(s*ioop( 286)-rsq*ioop( 263))
      roop( 311) = g( 264)*(s*roop( 287)-rsq*roop( 264))
      ioop( 311) = g( 264)*(s*ioop( 287)-rsq*ioop( 264))
      roop( 312) = g( 265)*(s*roop( 288)-rsq*roop( 265))
      ioop( 312) = g( 265)*(s*ioop( 288)-rsq*ioop( 265))
      roop( 313) = g( 266)*(s*roop( 289)-rsq*roop( 266))
      ioop( 313) = g( 266)*(s*ioop( 289)-rsq*ioop( 266))
      roop( 314) = g( 267)*(s*roop( 290)-rsq*roop( 267))
      ioop( 314) = g( 267)*(s*ioop( 290)-rsq*ioop( 267))
      roop( 315) = g( 268)*(s*roop( 291)-rsq*roop( 268))
      ioop( 315) = g( 268)*(s*ioop( 291)-rsq*ioop( 268))
      roop( 316) = g( 269)*(s*roop( 292)-rsq*roop( 269))
      ioop( 316) = g( 269)*(s*ioop( 292)-rsq*ioop( 269))
      roop( 317) = g( 270)*(s*roop( 293)-rsq*roop( 270))
      ioop( 317) = g( 270)*(s*ioop( 293)-rsq*ioop( 270))
      roop( 318) = g( 271)*(s*roop( 294)-rsq*roop( 271))
      ioop( 318) = g( 271)*(s*ioop( 294)-rsq*ioop( 271))
      roop( 319) = g( 272)*(s*roop( 295)-rsq*roop( 272))
      ioop( 319) = g( 272)*(s*ioop( 295)-rsq*ioop( 272))
      roop( 320) = g( 273)*(s*roop( 296)-rsq*roop( 273))
      ioop( 320) = g( 273)*(s*ioop( 296)-rsq*ioop( 273))
      roop( 321) = g( 274)*(s*roop( 297)-rsq*roop( 274))
      ioop( 321) = g( 274)*(s*ioop( 297)-rsq*ioop( 274))
      roop( 322) = g( 275)*(s*roop( 298)-rsq*roop( 275))
      ioop( 322) = g( 275)*(s*ioop( 298)-rsq*ioop( 275))
      roop( 323) = g( 276)*(s*roop( 299)-rsq*roop( 276))
      ioop( 323) = g( 276)*(s*ioop( 299)-rsq*ioop( 276))
      roop( 324) = z*roop( 300)
      ioop( 324) = z*ioop( 300)
      roop( 325) = f(  24)*(x*roop( 300)+y*ioop( 300))
      ioop( 325) = f(  24)*(x*ioop( 300)-y*roop( 300))
      return
      end subroutine fmmoop24
#endif
