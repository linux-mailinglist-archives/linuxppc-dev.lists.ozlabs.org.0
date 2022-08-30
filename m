Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9315A6CCF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 21:10:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MHH2G6Pd4z3c4K
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Aug 2022 05:10:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256 header.s=dec2015msa header.b=c5L6Tcp9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=softfail (domain owner discourages use of this host) smtp.mailfrom=kernel.org (client-ip=210.131.2.78; helo=conuserg-11.nifty.com; envelope-from=masahiroy@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256 header.s=dec2015msa header.b=c5L6Tcp9;
	dkim-atps=neutral
Received: from conuserg-11.nifty.com (conuserg-11.nifty.com [210.131.2.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MHH110vG7z3bl4
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Aug 2022 05:09:24 +1000 (AEST)
Received: from grover.sesame (133-32-182-133.west.xps.vectant.ne.jp [133.32.182.133]) (authenticated)
	by conuserg-11.nifty.com with ESMTP id 27UJ8ZDM014149;
	Wed, 31 Aug 2022 04:08:36 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com 27UJ8ZDM014149
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1661886516;
	bh=t6DIbr1IDWpT0lqcKO3t7PGRcyr9N1NHL0EgAGmnfbA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=c5L6Tcp9xyYkrBi2N0bkaidBeq2lHcIOWncoXMDzNLVc9vAvKt7GOCjYcOxy+EKGd
	 KoVN0wcbRvZaWaaBnf5/T0ZuH7cv6g0J2ClDzfGMFsJ/FpJW0byn9A17A0paX1NrQ3
	 nJoEuHhnE4wtiOkK3y99dqMgwfNGW7h5T7sXFVoKYieB4DufV5W3x5cRb1j9Lnwqwm
	 k7+n7GmLHJqI23M7xbcW/wQPx2PTc0wG7LwjtG4uCpOV553Z1QsDhdnI6xwjkpwvaa
	 3ZBxTsAGPzIh/z6FrHtJRVWtddmfnR6WP6jjg11YwJXy31MzunwBqM9xBtz1D/A79z
	 slz6SgdtEj3Jg==
X-Nifty-SrcIP: [133.32.182.133]
From: Masahiro Yamada <masahiroy@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/2] powerpc: remove old code for binutils < 2.25
Date: Wed, 31 Aug 2022 04:08:11 +0900
Message-Id: <20220830190811.323760-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220830190811.323760-1-masahiroy@kernel.org>
References: <20220830190811.323760-1-masahiroy@kernel.org>
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
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The minimum supported version of binutils has been raised to 2.25.1.
Drop the old code.

PPC is the last user of ld-ifversion. With all the callers removed,
the macro definition in scripts/Makefile.compiler can go away.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/powerpc/Makefile     | 21 ---------------------
 arch/powerpc/lib/Makefile |  8 --------
 scripts/Makefile.compiler |  4 ----
 3 files changed, 33 deletions(-)

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
-- 
2.34.1

