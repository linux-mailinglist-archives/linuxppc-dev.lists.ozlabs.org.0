Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12FDA40AD5A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Sep 2021 14:18:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H82S76Fxzz3cCV
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Sep 2021 22:18:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ejOik3o/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=ejOik3o/; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H82RX3JCZz2xfN
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Sep 2021 22:17:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1631621862;
 bh=ER1zaJmo3wlJcmgX8WEGviiv9gN35Bv4IB9ZZhgXY0g=;
 h=From:To:Cc:Subject:Date:From;
 b=ejOik3o/dWeok/rn686oIA1QFu2xEgf6h6rVDYnKXqR2OB5BNglQDl7f18cvfag14
 LnHq23/HeftV2cqtlzGyrcS/Fyr665NRHTaWSDzBtY+yoB7Wtrk1rCdPiCyx1cbH2E
 pnpuiXFXNnXi4tZqtziKA3avNaqpbj01eeZKa0sIvs6sV0Awj/TXCyHDfw/bTqLBbh
 CP2Lr8s0MYDi84KhDv0ieqBrKxXpfT7yViWzzg/uXAY2JzEeQ5IFK254BUWnMX5WYM
 xdzwjmBRiC9bOo3Hrcbswcj81PwZI703kLsI55GrhF7i0PwRHNNoy0zEgt5T8wYKXN
 UA50wThUK5ecw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4H82RT5pCMz9sVq;
 Tue, 14 Sep 2021 22:17:41 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: torvalds@linux-foundation.org
Subject: [PATCH] powerpc/boot: Fix build failure since GCC 4.9 removal
Date: Tue, 14 Sep 2021 22:17:23 +1000
Message-Id: <20210914121723.3756817-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Stephen reported that the build was broken since commit
6d2ef226f2f1 ("compiler_attributes.h: drop __has_attribute() support for
gcc4"), with errors such as:

  include/linux/compiler_attributes.h:296:5: warning: "__has_attribute" is not defined, evaluates to 0 [-Wundef]
    296 | #if __has_attribute(__warning__)
        |     ^~~~~~~~~~~~~~~
  make[2]: *** [arch/powerpc/boot/Makefile:225: arch/powerpc/boot/crt0.o] Error 1

But we expect __has_attribute() to always be defined now that we've
stopped using GCC 4.

Linus debugged it to the point of reading the GCC sources, and noticing
that the problem is that __has_attribute() is not defined when
preprocessing assembly files, which is what we're doing here.

Our assembly files don't include, or need, compiler_attributes.h, but
they are getting it unconditionally from the -include in BOOT_CFLAGS,
which is then added in its entirety to BOOT_AFLAGS.

That -include was added in commit 77433830ed16 ("powerpc: boot: include
compiler_attributes.h") so that we'd have "fallthrough" and other
attributes defined for the C files in arch/powerpc/boot. But it's not
needed for assembly files.

The minimal fix is to move the addition to BOOT_CFLAGS of -include
compiler_attributes.h until after we've copied BOOT_CFLAGS into
BOOT_AFLAGS. That avoids including compiler_attributes.h for asm files,
but makes no other change to BOOT_CFLAGS or BOOT_AFLAGS.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Debugged-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/boot/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)


This seemed safer as a minimal fix, rather than doing a more
comprehensive separation of CFLAGS/AFLAGS. We can do that in a future
patch.

It passed my usual build/boot tests, including booting the built zImage
on some real hardware, so this is good to go from my POV.

cheers

diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
index 6900d0ac2421..089ee3ea55c8 100644
--- a/arch/powerpc/boot/Makefile
+++ b/arch/powerpc/boot/Makefile
@@ -35,7 +35,6 @@ endif
 BOOTCFLAGS    := -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs \
 		 -fno-strict-aliasing -O2 -msoft-float -mno-altivec -mno-vsx \
 		 -pipe -fomit-frame-pointer -fno-builtin -fPIC -nostdinc \
-		 -include $(srctree)/include/linux/compiler_attributes.h \
 		 $(LINUXINCLUDE)
 
 ifdef CONFIG_PPC64_BOOT_WRAPPER
@@ -70,6 +69,7 @@ ifeq ($(call cc-option-yn, -fstack-protector),y)
 BOOTCFLAGS	+= -fno-stack-protector
 endif
 
+BOOTCFLAGS	+= -include $(srctree)/include/linux/compiler_attributes.h
 BOOTCFLAGS	+= -I$(objtree)/$(obj) -I$(srctree)/$(obj)
 
 DTC_FLAGS	?= -p 1024
-- 
2.25.1

