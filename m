Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2435AB55F
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 17:38:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MK29p6xzNz3bmP
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Sep 2022 01:38:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=C9I/BnEE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=nathan@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=C9I/BnEE;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MK29643Knz2xHC
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Sep 2022 01:37:30 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id A6A96B82C49;
	Fri,  2 Sep 2022 15:37:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B224C433D6;
	Fri,  2 Sep 2022 15:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662133045;
	bh=b9T6gmVfxUcmggAVoTJ1ih3AzAqwEhHfPrMFlv0/fKg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C9I/BnEE77x7Oc0mRjjkTHjhJmKh7uf4I1Bg4nTpZMgbfMwQnJrcW2HseXCa9Ebpn
	 LCD74IhfnspSxYC1QZZCz3WMt5MBIBUVWSdZc+XgzizkYo+8wXw+PvAjDRXib3nA1C
	 gQ5X4YhvW2dmG9nhSEyuEBaWY3Fy/IhDo9aBX0ctgnvlOxvi7I9XeAyje3wyxjjMOg
	 rG96lDdEcqq5VEk8dH/TlAjNiRf/U4R14VMza6qJig1aZhxTO/4NQDZhINIjQqHxSY
	 X9+ZpIvLaTwCLrdkUqGrIyF3sntqLKWqY7Rcjb1GHW2/7llZj0YlVR31OAvbcitUcH
	 O2GdRA0EYeNTQ==
Date: Fri, 2 Sep 2022 08:37:23 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2 2/2] powerpc/math-emu: Remove -w build flag and fix
 warnings
Message-ID: <YxIjM/jdLajq4dFk@dev-arch.thelio-3990X>
References: <a7384eafc6a27aea15bdc9e8f9a12aac593fccb7.1662113301.git.christophe.leroy@csgroup.eu>
 <35c86b7ca823954c6cd593acc3690dc3748da9b1.1662113301.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <35c86b7ca823954c6cd593acc3690dc3748da9b1.1662113301.git.christophe.leroy@csgroup.eu>
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christophe,

On Fri, Sep 02, 2022 at 12:08:55PM +0200, Christophe Leroy wrote:
> As reported by Nathan, the module_init() macro was not taken into
> account because the header was missing. That means spe_mathemu_init()
> was never called.
> 
> This should have been detected by gcc at build time, but due to
> '-w' flag it went undetected.
> 
> Removing that flag leads to many warnings hence errors.
> 
> Fix those warnings then remove the -w flag.
> 
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Thanks for figuring out what was going on here! I took this patch for a
spin with clang and it has a few more errors around
-Wimplicit-fallthrough:

    arch/powerpc/math-emu/fctiw.c:18:2: error: unannotated fall-through between switch labels [-Werror,-Wimplicit-fallthrough]
            FP_TO_INT_D(r, B, 32, 1);
            ^
    ./include/math-emu/double.h:120:34: note: expanded from macro 'FP_TO_INT_D'
    #define FP_TO_INT_D(r,X,rsz,rsg)        _FP_TO_INT(D,2,r,X,rsz,rsg)
                                            ^
    ./include/math-emu/op-common.h:665:4: note: expanded from macro '_FP_TO_INT'
              case FP_CLS_ZERO:                                                     \
              ^
    arch/powerpc/math-emu/fctiw.c:18:2: error: unannotated fall-through between switch labels [-Werror,-Wimplicit-fallthrough]
    ./include/math-emu/double.h:120:34: note: expanded from macro 'FP_TO_INT_D'
    #define FP_TO_INT_D(r,X,rsz,rsg)        _FP_TO_INT(D,2,r,X,rsz,rsg)
                                            ^
    ./include/math-emu/op-common.h:671:4: note: expanded from macro '_FP_TO_INT'
              case FP_CLS_NAN:                                                      \
              ^
    2 errors generated.
    arch/powerpc/math-emu/fctiwz.c:23:2: error: unannotated fall-through between switch labels [-Werror,-Wimplicit-fallthrough]
            FP_TO_INT_D(r, B, 32, 1);
            ^
    ./include/math-emu/double.h:120:34: note: expanded from macro 'FP_TO_INT_D'
    #define FP_TO_INT_D(r,X,rsz,rsg)        _FP_TO_INT(D,2,r,X,rsz,rsg)
                                            ^
    ./include/math-emu/op-common.h:665:4: note: expanded from macro '_FP_TO_INT'
              case FP_CLS_ZERO:                                                     \
              ^
    arch/powerpc/math-emu/fctiwz.c:23:2: error: unannotated fall-through between switch labels [-Werror,-Wimplicit-fallthrough]
    ./include/math-emu/double.h:120:34: note: expanded from macro 'FP_TO_INT_D'
    #define FP_TO_INT_D(r,X,rsz,rsg)        _FP_TO_INT(D,2,r,X,rsz,rsg)
                                            ^
    ./include/math-emu/op-common.h:671:4: note: expanded from macro '_FP_TO_INT'
              case FP_CLS_NAN:                                                      \
              ^
    2 errors generated.
    make[3]: *** [scripts/Makefile.build:249: arch/powerpc/math-emu/fctiw.o] Error 1
    make[3]: *** [scripts/Makefile.build:249: arch/powerpc/math-emu/fctiwz.o] Error 1
    arch/powerpc/math-emu/math_efp.c:282:5: error: unannotated fall-through between switch labels [-Werror,-Wimplicit-fallthrough]
                                    FP_TO_INT_ROUND_S(vc.wp[1], SB, 32,
                                    ^
    ./include/math-emu/single.h:110:40: note: expanded from macro 'FP_TO_INT_ROUND_S'
    #define FP_TO_INT_ROUND_S(r,X,rsz,rsg)  _FP_TO_INT_ROUND(S,1,r,X,rsz,rsg)
                                            ^
    ./include/math-emu/op-common.h:770:4: note: expanded from macro '_FP_TO_INT_ROUND'
              case FP_CLS_NAN:                                                      \
              ^
    arch/powerpc/math-emu/math_efp.c:305:5: error: unannotated fall-through between switch labels [-Werror,-Wimplicit-fallthrough]
                                    FP_TO_INT_ROUND_S(vc.wp[1], SB, 32,
                                    ^
    ./include/math-emu/single.h:110:40: note: expanded from macro 'FP_TO_INT_ROUND_S'
    #define FP_TO_INT_ROUND_S(r,X,rsz,rsg)  _FP_TO_INT_ROUND(S,1,r,X,rsz,rsg)
                                            ^
    ./include/math-emu/op-common.h:770:4: note: expanded from macro '_FP_TO_INT_ROUND'
              case FP_CLS_NAN:                                                      \
              ^
    arch/powerpc/math-emu/math_efp.c:316:5: error: unannotated fall-through between switch labels [-Werror,-Wimplicit-fallthrough]
                                    FP_TO_INT_S(vc.wp[1], SB, 32,
                                    ^
    ./include/math-emu/single.h:109:34: note: expanded from macro 'FP_TO_INT_S'
    #define FP_TO_INT_S(r,X,rsz,rsg)        _FP_TO_INT(S,1,r,X,rsz,rsg)
                                            ^
    ./include/math-emu/op-common.h:665:4: note: expanded from macro '_FP_TO_INT'
              case FP_CLS_ZERO:                                                     \
              ^
    arch/powerpc/math-emu/math_efp.c:316:5: error: unannotated fall-through between switch labels [-Werror,-Wimplicit-fallthrough]
    ./include/math-emu/single.h:109:34: note: expanded from macro 'FP_TO_INT_S'
    #define FP_TO_INT_S(r,X,rsz,rsg)        _FP_TO_INT(S,1,r,X,rsz,rsg)
                                            ^
    ./include/math-emu/op-common.h:671:4: note: expanded from macro '_FP_TO_INT'
              case FP_CLS_NAN:                                                      \
              ^
    arch/powerpc/math-emu/math_efp.c:413:5: error: unannotated fall-through between switch labels [-Werror,-Wimplicit-fallthrough]
                                    FP_TO_INT_ROUND_D(vc.wp[1], DB, 32,
                                    ^
    ./include/math-emu/double.h:121:40: note: expanded from macro 'FP_TO_INT_ROUND_D'
    #define FP_TO_INT_ROUND_D(r,X,rsz,rsg)  _FP_TO_INT_ROUND(D,2,r,X,rsz,rsg)
                                            ^
    ./include/math-emu/op-common.h:770:4: note: expanded from macro '_FP_TO_INT_ROUND'
              case FP_CLS_NAN:                                                      \
              ^
    arch/powerpc/math-emu/math_efp.c:436:5: error: unannotated fall-through between switch labels [-Werror,-Wimplicit-fallthrough]
                                    FP_TO_INT_D(vc.dp[0], DB, 64,
                                    ^
    ./include/math-emu/double.h:120:34: note: expanded from macro 'FP_TO_INT_D'
    #define FP_TO_INT_D(r,X,rsz,rsg)        _FP_TO_INT(D,2,r,X,rsz,rsg)
                                            ^
    ./include/math-emu/op-common.h:665:4: note: expanded from macro '_FP_TO_INT'
              case FP_CLS_ZERO:                                                     \
              ^
    arch/powerpc/math-emu/math_efp.c:436:5: error: unannotated fall-through between switch labels [-Werror,-Wimplicit-fallthrough]
    ./include/math-emu/double.h:120:34: note: expanded from macro 'FP_TO_INT_D'
    #define FP_TO_INT_D(r,X,rsz,rsg)        _FP_TO_INT(D,2,r,X,rsz,rsg)
                                            ^
    ./include/math-emu/op-common.h:671:4: note: expanded from macro '_FP_TO_INT'
              case FP_CLS_NAN:                                                      \
              ^
    arch/powerpc/math-emu/math_efp.c:447:5: error: unannotated fall-through between switch labels [-Werror,-Wimplicit-fallthrough]
                                    FP_TO_INT_ROUND_D(vc.wp[1], DB, 32,
                                    ^
    ./include/math-emu/double.h:121:40: note: expanded from macro 'FP_TO_INT_ROUND_D'
    #define FP_TO_INT_ROUND_D(r,X,rsz,rsg)  _FP_TO_INT_ROUND(D,2,r,X,rsz,rsg)
                                            ^
    ./include/math-emu/op-common.h:770:4: note: expanded from macro '_FP_TO_INT_ROUND'
              case FP_CLS_NAN:                                                      \
              ^
    arch/powerpc/math-emu/math_efp.c:458:5: error: unannotated fall-through between switch labels [-Werror,-Wimplicit-fallthrough]
                                    FP_TO_INT_D(vc.wp[1], DB, 32,
                                    ^
    ./include/math-emu/double.h:120:34: note: expanded from macro 'FP_TO_INT_D'
    #define FP_TO_INT_D(r,X,rsz,rsg)        _FP_TO_INT(D,2,r,X,rsz,rsg)
                                            ^
    ./include/math-emu/op-common.h:665:4: note: expanded from macro '_FP_TO_INT'
              case FP_CLS_ZERO:                                                     \
              ^
    arch/powerpc/math-emu/math_efp.c:458:5: error: unannotated fall-through between switch labels [-Werror,-Wimplicit-fallthrough]
    ./include/math-emu/double.h:120:34: note: expanded from macro 'FP_TO_INT_D'
    #define FP_TO_INT_D(r,X,rsz,rsg)        _FP_TO_INT(D,2,r,X,rsz,rsg)
                                            ^
    ./include/math-emu/op-common.h:671:4: note: expanded from macro '_FP_TO_INT'
              case FP_CLS_NAN:                                                      \
              ^
    arch/powerpc/math-emu/math_efp.c:573:5: error: unannotated fall-through between switch labels [-Werror,-Wimplicit-fallthrough]
                                    FP_TO_INT_ROUND_S(vc.wp[0], SB0, 32,
                                    ^
    ./include/math-emu/single.h:110:40: note: expanded from macro 'FP_TO_INT_ROUND_S'
    #define FP_TO_INT_ROUND_S(r,X,rsz,rsg)  _FP_TO_INT_ROUND(S,1,r,X,rsz,rsg)
                                            ^
    ./include/math-emu/op-common.h:770:4: note: expanded from macro '_FP_TO_INT_ROUND'
              case FP_CLS_NAN:                                                      \
              ^
    arch/powerpc/math-emu/math_efp.c:581:5: error: unannotated fall-through between switch labels [-Werror,-Wimplicit-fallthrough]
                                    FP_TO_INT_ROUND_S(vc.wp[1], SB1, 32,
                                    ^
    ./include/math-emu/single.h:110:40: note: expanded from macro 'FP_TO_INT_ROUND_S'
    #define FP_TO_INT_ROUND_S(r,X,rsz,rsg)  _FP_TO_INT_ROUND(S,1,r,X,rsz,rsg)
                                            ^
    ./include/math-emu/op-common.h:770:4: note: expanded from macro '_FP_TO_INT_ROUND'
              case FP_CLS_NAN:                                                      \
              ^
    arch/powerpc/math-emu/math_efp.c:592:5: error: unannotated fall-through between switch labels [-Werror,-Wimplicit-fallthrough]
                                    FP_TO_INT_ROUND_S(vc.wp[0], SB0, 32,
                                    ^
    ./include/math-emu/single.h:110:40: note: expanded from macro 'FP_TO_INT_ROUND_S'
    #define FP_TO_INT_ROUND_S(r,X,rsz,rsg)  _FP_TO_INT_ROUND(S,1,r,X,rsz,rsg)
                                            ^
    ./include/math-emu/op-common.h:770:4: note: expanded from macro '_FP_TO_INT_ROUND'
              case FP_CLS_NAN:                                                      \
              ^
    arch/powerpc/math-emu/math_efp.c:599:5: error: unannotated fall-through between switch labels [-Werror,-Wimplicit-fallthrough]
                                    FP_TO_INT_ROUND_S(vc.wp[1], SB1, 32,
                                    ^
    ./include/math-emu/single.h:110:40: note: expanded from macro 'FP_TO_INT_ROUND_S'
    #define FP_TO_INT_ROUND_S(r,X,rsz,rsg)  _FP_TO_INT_ROUND(S,1,r,X,rsz,rsg)
                                            ^
    ./include/math-emu/op-common.h:770:4: note: expanded from macro '_FP_TO_INT_ROUND'
              case FP_CLS_NAN:                                                      \
              ^
    arch/powerpc/math-emu/math_efp.c:610:5: error: unannotated fall-through between switch labels [-Werror,-Wimplicit-fallthrough]
                                    FP_TO_INT_S(vc.wp[0], SB0, 32,
                                    ^
    ./include/math-emu/single.h:109:34: note: expanded from macro 'FP_TO_INT_S'
    #define FP_TO_INT_S(r,X,rsz,rsg)        _FP_TO_INT(S,1,r,X,rsz,rsg)
                                            ^
    ./include/math-emu/op-common.h:665:4: note: expanded from macro '_FP_TO_INT'
              case FP_CLS_ZERO:                                                     \
              ^
    arch/powerpc/math-emu/math_efp.c:610:5: error: unannotated fall-through between switch labels [-Werror,-Wimplicit-fallthrough]
    ./include/math-emu/single.h:109:34: note: expanded from macro 'FP_TO_INT_S'
    #define FP_TO_INT_S(r,X,rsz,rsg)        _FP_TO_INT(S,1,r,X,rsz,rsg)
                                            ^
    ./include/math-emu/op-common.h:671:4: note: expanded from macro '_FP_TO_INT'
              case FP_CLS_NAN:                                                      \
              ^
    arch/powerpc/math-emu/math_efp.c:617:5: error: unannotated fall-through between switch labels [-Werror,-Wimplicit-fallthrough]
                                    FP_TO_INT_S(vc.wp[1], SB1, 32,
                                    ^
    ./include/math-emu/single.h:109:34: note: expanded from macro 'FP_TO_INT_S'
    #define FP_TO_INT_S(r,X,rsz,rsg)        _FP_TO_INT(S,1,r,X,rsz,rsg)
                                            ^
    ./include/math-emu/op-common.h:665:4: note: expanded from macro '_FP_TO_INT'
              case FP_CLS_ZERO:                                                     \
              ^
    arch/powerpc/math-emu/math_efp.c:617:5: error: unannotated fall-through between switch labels [-Werror,-Wimplicit-fallthrough]
    ./include/math-emu/single.h:109:34: note: expanded from macro 'FP_TO_INT_S'
    #define FP_TO_INT_S(r,X,rsz,rsg)        _FP_TO_INT(S,1,r,X,rsz,rsg)
                                            ^
    ./include/math-emu/op-common.h:671:4: note: expanded from macro '_FP_TO_INT'
              case FP_CLS_NAN:                                                      \
              ^
    18 errors generated.

The following diff resolves it and does not introduce any new issues
with GCC. Would you mind squashing it in for a v2? With that:

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

Cheers,
Nathan

diff --git a/include/math-emu/op-common.h b/include/math-emu/op-common.h
index 4b57bbba588a..ae73a30bf1a0 100644
--- a/include/math-emu/op-common.h
+++ b/include/math-emu/op-common.h
@@ -662,12 +662,14 @@ do {									\
 	if (X##_e < 0)								\
 	  {									\
 	    FP_SET_EXCEPTION(FP_EX_INEXACT);					\
+	    fallthrough;							\
 	  case FP_CLS_ZERO:							\
 	    r = 0;								\
 	  }									\
 	else if (X##_e >= rsize - (rsigned > 0 || X##_s)			\
 		 || (!rsigned && X##_s))					\
 	  {	/* overflow */							\
+	  fallthrough;								\
 	  case FP_CLS_NAN:                                                      \
 	  case FP_CLS_INF:							\
 	    if (rsigned == 2)							\
@@ -767,6 +769,7 @@ do {									\
 	if (X##_e >= rsize - (rsigned > 0 || X##_s)				\
 	    || (!rsigned && X##_s))						\
 	  {	/* overflow */							\
+	  fallthrough;								\
 	  case FP_CLS_NAN:                                                      \
 	  case FP_CLS_INF:							\
 	    if (!rsigned)							\
