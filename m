Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 035B85A38D6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Aug 2022 18:43:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MFMvd6pwgz3bcc
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Aug 2022 02:43:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256 header.s=dec2015msa header.b=wow0twov;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=softfail (domain owner discourages use of this host) smtp.mailfrom=kernel.org (client-ip=210.131.2.78; helo=conuserg-11.nifty.com; envelope-from=masahiroy@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256 header.s=dec2015msa header.b=wow0twov;
	dkim-atps=neutral
Received: from conuserg-11.nifty.com (conuserg-11.nifty.com [210.131.2.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MFMty3Lssz30Ly
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Aug 2022 02:42:34 +1000 (AEST)
Received: from localhost.localdomain (133-32-182-133.west.xps.vectant.ne.jp [133.32.182.133]) (authenticated)
	by conuserg-11.nifty.com with ESMTP id 27RGfBPI000611;
	Sun, 28 Aug 2022 01:41:12 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com 27RGfBPI000611
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1661618473;
	bh=+GhN5QiWk8VZrsPB7KRVM8ziElAEYMkGxB8N3aqbfbA=;
	h=From:To:Cc:Subject:Date:From;
	b=wow0twov1tOYfhfBWw3b+32Zrm/G3bdf9F7iFroPW/Z6t0so1GOsdJXwBfs3ovRM9
	 7WRVpZuCLVm+8mx5OiE57OGePMReAnAsUp2hUhH15ybhqWrfyjh0Coawe5jgqKJW1H
	 13KMbG8bkA6YoQ/m3kDNbF1lkRtD3SyhiBAKzQBibFpl0tNwLs0O6fkUbejiXPthqE
	 WHTGpbRnkWJ9i4oACKbUzmbl0q9c0ZuS4+/Ps14O7b1ZTxc43XugUsz5gGPY3pxRAw
	 LVG1/EBV7B9JOCktDqG35C5IqSJgUr4T2cBX/u+8xRh/KX0F7ZEirwZPAGo3VquVou
	 Abyatq9iw6TKQ==
X-Nifty-SrcIP: [133.32.182.133]
From: Masahiro Yamada <masahiroy@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc: clean up binutils version check
Date: Sun, 28 Aug 2022 01:40:56 +0900
Message-Id: <20220827164056.3365356-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.34.1
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
Cc: Nathan Chancellor <nathan@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Kees Cook <keescook@chromium.org>, linux-kbuild@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, Alexey Dobriyan <adobriyan@gmail.com>, Heiko Carstens <hca@linux.ibm.com>, Ard Biesheuvel <ardb@kernel.org>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The checkbin in arch/powerpc/Makefile errors out if ld <= 2.24.
So, the requirement on PPC is binutils >= 2.25. It is cleaner to
specify it in scripts/min-tool-version.sh. If binutils < 2.25 is
used, the toolchain check will fail in the Kconfig stage going
forward.

Since binutils >= 2.25 is already required, another version test
for --save-restore-funcs on PPC64 is always met.

PPC is the last user of ld-ifversion. With all the callers removed,
the macro definition in scripts/Makefile.compiler can go away.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/powerpc/Makefile       | 21 ---------------------
 arch/powerpc/lib/Makefile   |  8 --------
 scripts/Makefile.compiler   |  4 ----
 scripts/min-tool-version.sh |  8 +++++++-
 4 files changed, 7 insertions(+), 34 deletions(-)

diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index 02742facf895..fb607758eeca 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -46,13 +46,7 @@ UTS_MACHINE := $(subst $(space),,$(machine-y))
 ifdef CONFIG_PPC32
 KBUILD_LDFLAGS_MODULE += arch/powerpc/lib/crtsavres.o
 else
-ifeq ($(call ld-ifversion, -ge, 22500, y),y)
-# Have the linker provide sfpr if possible.
-# There is a corresponding test in arch/powerpc/lib/Makefile
 KBUILD_LDFLAGS_MODULE += --save-restore-funcs
-else
-KBUILD_LDFLAGS_MODULE += arch/powerpc/lib/crtsavres.o
-endif
 endif
 
 ifdef CONFIG_CPU_LITTLE_ENDIAN
@@ -395,8 +389,6 @@ vdso_prepare: prepare0
 		$(build)=arch/powerpc/kernel/vdso include/generated/vdso64-offsets.h)
 endif
 
-archprepare: checkbin
-
 archheaders:
 	$(Q)$(MAKE) $(build)=arch/powerpc/kernel/syscalls all
 
@@ -411,16 +403,3 @@ else
 	$(eval KBUILD_CFLAGS += -mstack-protector-guard-offset=$(shell awk '{if ($$2 == "TASK_CANARY") print $$3;}' include/generated/asm-offsets.h))
 endif
 endif
-
-PHONY += checkbin
-# Check toolchain versions:
-# - gcc-4.6 is the minimum kernel-wide version so nothing required.
-checkbin:
-	@if test "x${CONFIG_LD_IS_LLD}" != "xy" -a \
-		"x$(call ld-ifversion, -le, 22400, y)" = "xy" ; then \
-		echo -n '*** binutils 2.24 miscompiles weak symbols ' ; \
-		echo 'in some circumstances.' ; \
-		echo    '*** binutils 2.23 do not define the TOC symbol ' ; \
-		echo -n '*** Please use a different binutils version.' ; \
-		false ; \
-	fi
diff --git a/arch/powerpc/lib/Makefile b/arch/powerpc/lib/Makefile
index 8560c912186d..5eb3971ccb9c 100644
--- a/arch/powerpc/lib/Makefile
+++ b/arch/powerpc/lib/Makefile
@@ -38,14 +38,6 @@ obj-$(CONFIG_PPC32)	+= div64.o copy_32.o crtsavres.o
 
 obj-$(CONFIG_FUNCTION_ERROR_INJECTION)	+= error-inject.o
 
-# See corresponding test in arch/powerpc/Makefile
-# 64-bit linker creates .sfpr on demand for final link (vmlinux),
-# so it is only needed for modules, and only for older linkers which
-# do not support --save-restore-funcs
-ifeq ($(call ld-ifversion, -lt, 22500, y),y)
-extra-$(CONFIG_PPC64)	+= crtsavres.o
-endif
-
 obj-$(CONFIG_PPC_BOOK3S_64) += copyuser_power7.o copypage_power7.o \
 			       memcpy_power7.o restart_table.o
 
diff --git a/scripts/Makefile.compiler b/scripts/Makefile.compiler
index 94d0d40cddb3..63e7d79dd877 100644
--- a/scripts/Makefile.compiler
+++ b/scripts/Makefile.compiler
@@ -68,7 +68,3 @@ cc-ifversion = $(shell [ $(CONFIG_GCC_VERSION)0 $(1) $(2)000 ] && echo $(3) || e
 # ld-option
 # Usage: KBUILD_LDFLAGS += $(call ld-option, -X, -Y)
 ld-option = $(call try-run, $(LD) $(KBUILD_LDFLAGS) $(1) -v,$(1),$(2),$(3))
-
-# ld-ifversion
-# Usage:  $(call ld-ifversion, -ge, 22252, y)
-ld-ifversion = $(shell [ $(CONFIG_LD_VERSION)0 $(1) $(2)0 ] && echo $(3) || echo $(4))
diff --git a/scripts/min-tool-version.sh b/scripts/min-tool-version.sh
index 250925aab101..7df9f2150ea1 100755
--- a/scripts/min-tool-version.sh
+++ b/scripts/min-tool-version.sh
@@ -14,7 +14,13 @@ fi
 
 case "$1" in
 binutils)
-	echo 2.23.0
+	if [ "$SRCARCH" = powerpc ]; then
+		# binutils 2.24 miscompiles weak symbols in some circumstances
+		# binutils 2.23 do not define the TOC symbol
+		echo 2.25.0
+	else
+		echo 2.23.0
+	fi
 	;;
 gcc)
 	echo 5.1.0
-- 
2.34.1

