Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AF16B603C2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jul 2019 12:05:41 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45g9TG509zzDqfH
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jul 2019 20:05:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (mailfrom) smtp.mailfrom=socionext.com
 (client-ip=210.131.2.75; helo=conuserg-08.nifty.com;
 envelope-from=yamada.masahiro@socionext.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="signature verification failed" (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.b="G5mHWkqQ"; 
 dkim-atps=neutral
Received: from conuserg-08.nifty.com (conuserg-08.nifty.com [210.131.2.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45g9Pv2ZlTzDq6k
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Jul 2019 20:02:42 +1000 (AEST)
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp
 [153.142.97.92]) (authenticated)
 by conuserg-08.nifty.com with ESMTP id x65A1j3M018855;
 Fri, 5 Jul 2019 19:01:46 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com x65A1j3M018855
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1562320908;
 bh=c40ebdQGyZ/hZreWO45KBSfAn6dKspavgReY8ujfFGE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=G5mHWkqQk66xKntbKGNRpKasDoMOcuLlCrRWOrvZ3NQXVq6RXSHit8Mv0fYBgh6Ot
 kuUGKXiXI7LRGxqjwyqAEGDmfpldBTPjdwhBLW5Wo0stUrrWdJTmH++IhfNRZpk0Dy
 PH/GaQveKnPu0xaZnsgD5FWvhhQ1IdLPv0cNVZZyG2yYx9Fj0X1n7z9RG5laoknOH8
 i+gkq9kdv5OAL2nHWLd+mapqIa4TQK6S9GOHPLjeSts+o9KbSU+8stJzMiJnUAxEQh
 cdHvgU6dvlaVFHrtqnsgREfe337E+aE2ZkpuXYsDuiVBc0b6SmJQi6qyyyybknAGv7
 DZnUK0j2cXY6g==
X-Nifty-SrcIP: [153.142.97.92]
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v3 2/2] powerpc/boot: pass CONFIG options in a simpler and
 more robust way
Date: Fri,  5 Jul 2019 19:01:44 +0900
Message-Id: <20190705100144.28785-2-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190705100144.28785-1-yamada.masahiro@socionext.com>
References: <20190705100144.28785-1-yamada.masahiro@socionext.com>
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
Cc: Rob Herring <robh@kernel.org>,
 "Rodrigo R. Galvao" <rosattig@linux.vnet.ibm.com>,
 linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>,
 Oliver O'Halloran <oohall@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit 5e9dcb6188a4 ("powerpc/boot: Expose Kconfig symbols to wrapper")
was wrong, but commit e41b93a6be57 ("powerpc/boot: Fix build failures
with -j 1") was also wrong.

The correct dependency is:

  $(obj)/serial.o: $(obj)/autoconf.h

However, I do not see the reason why we need to copy autoconf.h to
arch/power/boot/. Nor do I see consistency in the way of passing
CONFIG options.

decompress.c references CONFIG_KERNEL_GZIP and CONFIG_KERNEL_XZ, which
are passed via the command line.

serial.c includes autoconf.h to reference a couple of CONFIG options,
but this is fragile because we often forget to include "autoconf.h"
from source files.

In fact, it is already broken.

ppc_asm.h references CONFIG_PPC_8xx, but utils.S is not given any way
to access CONFIG options. So, CONFIG_PPC_8xx is never defined here.

Pass $(LINUXINCLUDE) to make sure CONFIG options are accessible from
all .c and .S files in arch/powerpc/boot/.

I also removed the -traditional flag to make include/linux/kconfig.h
work. This flag makes the preprocessor imitate the behavior of the
pre-standard C compiler, but I do not understand why it is necessary.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v3: None
Changes in v2:
  - reword commit log

 arch/powerpc/boot/.gitignore |  2 --
 arch/powerpc/boot/Makefile   | 14 +++-----------
 arch/powerpc/boot/serial.c   |  1 -
 3 files changed, 3 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/boot/.gitignore b/arch/powerpc/boot/.gitignore
index 32034a0cc554..6610665fcf5e 100644
--- a/arch/powerpc/boot/.gitignore
+++ b/arch/powerpc/boot/.gitignore
@@ -44,5 +44,3 @@ fdt_sw.c
 fdt_wip.c
 libfdt.h
 libfdt_internal.h
-autoconf.h
-
diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
index 73d1f3562978..b8a82be2af2a 100644
--- a/arch/powerpc/boot/Makefile
+++ b/arch/powerpc/boot/Makefile
@@ -20,9 +20,6 @@
 
 all: $(obj)/zImage
 
-compress-$(CONFIG_KERNEL_GZIP) := CONFIG_KERNEL_GZIP
-compress-$(CONFIG_KERNEL_XZ)   := CONFIG_KERNEL_XZ
-
 ifdef CROSS32_COMPILE
     BOOTCC := $(CROSS32_COMPILE)gcc
     BOOTAR := $(CROSS32_COMPILE)ar
@@ -34,7 +31,7 @@ endif
 BOOTCFLAGS    := -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs \
 		 -fno-strict-aliasing -O2 -msoft-float -mno-altivec -mno-vsx \
 		 -pipe -fomit-frame-pointer -fno-builtin -fPIC -nostdinc \
-		 -D$(compress-y)
+		 $(LINUXINCLUDE)
 
 ifdef CONFIG_PPC64_BOOT_WRAPPER
 BOOTCFLAGS	+= -m64
@@ -51,7 +48,7 @@ BOOTCFLAGS	+= -mlittle-endian
 BOOTCFLAGS	+= $(call cc-option,-mabi=elfv2)
 endif
 
-BOOTAFLAGS	:= -D__ASSEMBLY__ $(BOOTCFLAGS) -traditional -nostdinc
+BOOTAFLAGS	:= -D__ASSEMBLY__ $(BOOTCFLAGS) -nostdinc
 
 BOOTARFLAGS	:= -cr$(KBUILD_ARFLAGS)
 
@@ -202,14 +199,9 @@ $(obj)/empty.c:
 $(obj)/zImage.coff.lds $(obj)/zImage.ps3.lds : $(obj)/%: $(srctree)/$(src)/%.S
 	$(Q)cp $< $@
 
-$(srctree)/$(src)/serial.c: $(obj)/autoconf.h
-
-$(obj)/autoconf.h: $(obj)/%: $(objtree)/include/generated/%
-	$(Q)cp $< $@
-
 clean-files := $(zlib-) $(zlibheader-) $(zliblinuxheader-) \
 		$(zlib-decomp-) $(libfdt) $(libfdtheader) \
-		autoconf.h empty.c zImage.coff.lds zImage.ps3.lds zImage.lds
+		empty.c zImage.coff.lds zImage.ps3.lds zImage.lds
 
 quiet_cmd_bootcc = BOOTCC  $@
       cmd_bootcc = $(BOOTCC) -Wp,-MD,$(depfile) $(BOOTCFLAGS) -c -o $@ $<
diff --git a/arch/powerpc/boot/serial.c b/arch/powerpc/boot/serial.c
index b0491b8c0199..9457863147f9 100644
--- a/arch/powerpc/boot/serial.c
+++ b/arch/powerpc/boot/serial.c
@@ -18,7 +18,6 @@
 #include "stdio.h"
 #include "io.h"
 #include "ops.h"
-#include "autoconf.h"
 
 static int serial_open(void)
 {
-- 
2.17.1

