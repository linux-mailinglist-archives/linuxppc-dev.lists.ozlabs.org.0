Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 637521B7FD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 May 2019 16:19:36 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 452jcj6Q27zDqCp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2019 00:19:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (mailfrom) smtp.mailfrom=socionext.com
 (client-ip=210.131.2.74; helo=conuserg-07.nifty.com;
 envelope-from=yamada.masahiro@socionext.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="signature verification failed" (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.b="nmqWqKhG"; 
 dkim-atps=neutral
Received: from conuserg-07.nifty.com (conuserg-07.nifty.com [210.131.2.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 452jZC0QgzzDqD5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2019 00:17:22 +1000 (AEST)
Received: from grover.flets-west.jp (softbank126125154139.bbtec.net
 [126.125.154.139]) (authenticated)
 by conuserg-07.nifty.com with ESMTP id x4DEGES6010361;
 Mon, 13 May 2019 23:16:14 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com x4DEGES6010361
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1557756976;
 bh=LMxxB6MsBZaCFjzGTXXA7vL2DRXZdMqpHQh+wQuX3DM=;
 h=From:To:Cc:Subject:Date:From;
 b=nmqWqKhG79rSVySlhkKLOV7QIXKyDOrbUESlr7MR9J6izTh/F4CMiztHeDXHUvBCu
 HC6OELamJErau14b3nv1kPJ946RTudKO6Tp2Frh14l89jvDvTdxRmMtOpUFoQUa8zj
 s/l97vNwRB5nodJEFFO1bgsSL8GyPE0ZEXbT6ycaeqXf1caa1weoFzlXO1vqdPK/Nb
 exKXywaLF8yx8Y4T328qztaUo2Pb1bHdvThjqiyU41VkmhcTT9jRBwaBRwifyWWFrM
 zZx0OZbZ5Y72BBnP8jg62mP8YkI5TNLDkXn2KK0npzAoyti9sOn1hGb0fBXRHme5Yy
 RwK9fxhzjzR0w==
X-Nifty-SrcIP: [126.125.154.139]
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2] powerpc/boot: pass CONFIG options in a simpler and more
 robust way
Date: Mon, 13 May 2019 23:16:04 +0900
Message-Id: <1557756964-13087-1-git-send-email-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.7.4
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
Cc: Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, Mark Greer <mgreer@animalcreek.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
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

Changes in v2:
 - reword commit log

 arch/powerpc/boot/.gitignore |  2 --
 arch/powerpc/boot/Makefile   | 14 +++-----------
 arch/powerpc/boot/serial.c   |  1 -
 3 files changed, 3 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/boot/.gitignore b/arch/powerpc/boot/.gitignore
index 32034a0c..6610665 100644
--- a/arch/powerpc/boot/.gitignore
+++ b/arch/powerpc/boot/.gitignore
@@ -44,5 +44,3 @@ fdt_sw.c
 fdt_wip.c
 libfdt.h
 libfdt_internal.h
-autoconf.h
-
diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
index 73d1f35..b8a82be 100644
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
index b0491b8..9457863 100644
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
2.7.4

