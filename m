Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 485281B4E0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 May 2019 13:26:15 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 452dmh49MkzDqQW
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 May 2019 21:26:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (mailfrom) smtp.mailfrom=socionext.com
 (client-ip=210.131.2.77; helo=conuserg-10.nifty.com;
 envelope-from=yamada.masahiro@socionext.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="signature verification failed" (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.b="qSvI060C"; 
 dkim-atps=neutral
Received: from conuserg-10.nifty.com (conuserg-10.nifty.com [210.131.2.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 452dkY14stzDqVF
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 May 2019 21:24:20 +1000 (AEST)
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp
 [153.142.97.92]) (authenticated)
 by conuserg-10.nifty.com with ESMTP id x4DBMtr3032513;
 Mon, 13 May 2019 20:22:56 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com x4DBMtr3032513
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1557746576;
 bh=EU/CK6RIzPKe+JRQJjURxe4pIo5LQHgjibXAtioSisQ=;
 h=From:To:Cc:Subject:Date:From;
 b=qSvI060CSPYmLRBCA4iRYFXdm9PWeqD3oF7SUtVayRcD6QY7sg1HjCzEmcLXYdpA/
 pjAw6StN5Mki/36nrnQLctAkGlx8ZwKhEzR+E74nxnnV2FJnMuwzZxks42K/aDQnVU
 qIq3z/2Q5MFnAPGuqxgTCOSFPpSqdsP4X7SSL6c/TVkgCWBc5u5ou3E8TYP3rsU+RI
 pOIf4h2MHLJIF1cCM3Ej4ZmJIfQ160kAncurfUDxkAa4Oa69jjytLRDVX/j9CI61ek
 bIesGFYqfWEiXqJWs8vwtVpXfclw0mLdmEK0guUbLor/VOmvn7cmiygyPHG751OOe4
 VTu5fprP9SDuw==
X-Nifty-SrcIP: [153.142.97.92]
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc/boot: fix broken way to pass CONFIG options
Date: Mon, 13 May 2019 20:22:54 +0900
Message-Id: <20190513112254.22534-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
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
 linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 Mark Greer <mgreer@animalcreek.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Oliver O'Halloran <oohall@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit 5e9dcb6188a4 ("powerpc/boot: Expose Kconfig symbols to wrapper")
was wrong, but commit e41b93a6be57 ("powerpc/boot: Fix build failures
with -j 1") was also wrong.

Check-in source files never ever depend on build artifacts.

The correct dependency is:

  $(obj)/serial.o: $(obj)/autoconf.h

However, copying autoconf.h to arch/power/boot/ is questionable
in the first place.

arch/powerpc/Makefile adopted multiple ways to pass CONFIG options.

arch/powerpc/boot/decompress.c references CONFIG_KERNEL_GZIP and
CONFIG_KERNEL_XZ, which are passed via the command line.

arch/powerpc/boot/serial.c includes the copied autoconf.h to
reference a couple of CONFIG options.

Do not do this.

We should have already learned that including autoconf.h from each
source file is really fragile.

In fact, it is already broken.

arch/powerpc/boot/ppc_asm.h references CONFIG_PPC_8xx, but
arch/powerpc/boot/utils.S is not given any way to access CONFIG
options. So, CONFIG_PPC_8xx is never defined here.

Just pass $(LINUXINCLUDE) and remove all broken code.

I also removed the -traditional flag to make include/linux/kconfig.h
work. I do not understand why it needs to imitate the behavior of
pre-standard C preprocessors.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

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

