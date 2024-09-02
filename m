Return-Path: <linuxppc-dev+bounces-869-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB6D9686FE
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Sep 2024 14:05:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wy6rb4qPcz2yG9;
	Mon,  2 Sep 2024 22:05:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725278703;
	cv=none; b=hZ2DWeNZQfAfzwBZtczny3/nOxzIwIMCB3ICvx+F9ssGBHZRUVf+UgoV3gHCSOmtq6MEgWIsl+yhxpWm5dxMIweTRpxnVTM/mPmyV5t4o6TC6eP1u78PK+5CYmDNgSQ7mh1p1u/3//R8JDrXCBR4yMzFX/e/RQ4xWY6KwLI+pGu/QF2Ftxt4NZTsBBp/CrAHFV3ZmDyO6lu+fkYLaj+I916sfrY0t3O682YAK0zxN+1yrqdvHMw92SH16Bjtz7pznUJ5LnNPeFBqPiDGvh+aVhXsnkCvCccEjWNd0ctZhadMxfYcneaJCzpzMdzSXP5x75ehLDe4FNv7emEIvch2OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725278703; c=relaxed/relaxed;
	bh=DytUxfbmplaMrRHhl3qFQ+Z19NOu/EOZY8HpIR/7NxA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kc0DGvxGoZRrU9JOnMNU5Kt/oBcF28ik4f5pR7aZSSjjnDjhs1Mospd/y/ezbchdIoXcQqQqfvJ/T3bZuXVFTD789Zx24hTpvnf7XpWBmteqolKiKwY0jtrDDSVoBHAMKpUSj+pf6U06zHzxgfXCpltm9YnVlcIFPWdLaxw7yPSLqFPhG6uxvnHQ4ip2b4jLlRFcyQmqNChZ3Ecg3XTcjqgmskBtLvtCkJunYEQ4uySKeiPUQ+dySHMuc4qB7qGeEN9OUaO+bPVLScW4jRmrpkQItN3vSzkVhlhnzwujJMgBSwzTuFc1sJHYrJbrOFedQLA1nFkvmlbAsS56ZSvEcA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wy6rb2cp2z2xZK
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Sep 2024 22:05:03 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Wy6rK1XYXz9sS7;
	Mon,  2 Sep 2024 14:04:49 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vWRlH_ukOAsW; Mon,  2 Sep 2024 14:04:49 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Wy6rJ3gq4z9sST;
	Mon,  2 Sep 2024 14:04:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 6C5618B76D;
	Mon,  2 Sep 2024 14:04:48 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id o8-dVuryggej; Mon,  2 Sep 2024 14:04:48 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.234.167])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 70CC28B76C;
	Mon,  2 Sep 2024 14:04:47 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Andrew Morton <akpm@linux-foundation.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Shuah Khan <shuah@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kselftest@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-trace-kernel@vger.kernel.org,
	Adhemerval Zanella <adhemerval.zanella@linaro.org>,
	Xi Ruoyao <xry111@xry111.site>
Subject: [PATCH v4 3/5] powerpc/vdso: Refactor CFLAGS for CVDSO build
Date: Mon,  2 Sep 2024 14:04:40 +0200
Message-ID: <24633ee77bd106e18fb2e9ad8337163b7d947f85.1725278148.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1725278148.git.christophe.leroy@csgroup.eu>
References: <cover.1725278148.git.christophe.leroy@csgroup.eu>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725278679; l=4208; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=8uyRGNGCCgVJfGMmDTrx0v5vR/iTZQuTWlNxnOkFWq8=; b=eS83GpJpOm8j+Sc7Nob/z7Cl762msT2fzftS3kELig11iMQYgm64YvTOpdDkZOfK86blIJEzJ A63ui2c0qCfCyORSFyyLNWValmRYNBX3XknO6+HpQqd0HwBrn1wDCUp
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit

In order to avoid two much duplication when we add new VDSO
functionnalities in C like getrandom, refactor common CFLAGS.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v3: Also refactor removed flags
---
 arch/powerpc/kernel/vdso/Makefile | 32 +++++++++++++------------------
 1 file changed, 13 insertions(+), 19 deletions(-)

diff --git a/arch/powerpc/kernel/vdso/Makefile b/arch/powerpc/kernel/vdso/Makefile
index c07a425b8f78..67fe79d26fae 100644
--- a/arch/powerpc/kernel/vdso/Makefile
+++ b/arch/powerpc/kernel/vdso/Makefile
@@ -10,28 +10,11 @@ obj-vdso64 = sigtramp64-64.o gettimeofday-64.o datapage-64.o cacheflush-64.o not
 
 ifneq ($(c-gettimeofday-y),)
   CFLAGS_vgettimeofday-32.o += -include $(c-gettimeofday-y)
-  CFLAGS_vgettimeofday-32.o += $(DISABLE_LATENT_ENTROPY_PLUGIN)
-  CFLAGS_vgettimeofday-32.o += $(call cc-option, -fno-stack-protector)
-  CFLAGS_vgettimeofday-32.o += -DDISABLE_BRANCH_PROFILING
-  CFLAGS_vgettimeofday-32.o += -ffreestanding -fasynchronous-unwind-tables
-  CFLAGS_REMOVE_vgettimeofday-32.o = $(CC_FLAGS_FTRACE)
-  CFLAGS_REMOVE_vgettimeofday-32.o += -mcmodel=medium -mabi=elfv1 -mabi=elfv2 -mcall-aixdesc
-  # This flag is supported by clang for 64-bit but not 32-bit so it will cause
-  # an unused command line flag warning for this file.
-  ifdef CONFIG_CC_IS_CLANG
-  CFLAGS_REMOVE_vgettimeofday-32.o += -fno-stack-clash-protection
-  endif
-  CFLAGS_vgettimeofday-64.o += -include $(c-gettimeofday-y)
-  CFLAGS_vgettimeofday-64.o += $(DISABLE_LATENT_ENTROPY_PLUGIN)
-  CFLAGS_vgettimeofday-64.o += $(call cc-option, -fno-stack-protector)
-  CFLAGS_vgettimeofday-64.o += -DDISABLE_BRANCH_PROFILING
-  CFLAGS_vgettimeofday-64.o += -ffreestanding -fasynchronous-unwind-tables
-  CFLAGS_REMOVE_vgettimeofday-64.o = $(CC_FLAGS_FTRACE)
 # Go prior to 1.16.x assumes r30 is not clobbered by any VDSO code. That used to be true
 # by accident when the VDSO was hand-written asm code, but may not be now that the VDSO is
 # compiler generated. To avoid breaking Go tell GCC not to use r30. Impact on code
 # generation is minimal, it will just use r29 instead.
-  CFLAGS_vgettimeofday-64.o += $(call cc-option, -ffixed-r30)
+  CFLAGS_vgettimeofday-64.o += -include $(c-gettimeofday-y) $(call cc-option, -ffixed-r30)
 endif
 
 # Build rules
@@ -49,6 +32,11 @@ targets += $(obj-vdso64) vdso64.so.dbg vgettimeofday-64.o
 obj-vdso64 := $(addprefix $(obj)/, $(obj-vdso64))
 
 ccflags-y := -fno-common -fno-builtin
+ccflags-y += $(DISABLE_LATENT_ENTROPY_PLUGIN)
+ccflags-y += $(call cc-option, -fno-stack-protector)
+ccflags-y += -DDISABLE_BRANCH_PROFILING
+ccflags-y += -ffreestanding -fasynchronous-unwind-tables
+ccflags-remove-y := $(CC_FLAGS_FTRACE)
 ldflags-y := -Wl,--hash-style=both -nostdlib -shared -z noexecstack $(CLANG_FLAGS)
 ldflags-$(CONFIG_LD_IS_LLD) += $(call cc-option,--ld-path=$(LD),-fuse-ld=lld)
 ldflags-$(CONFIG_LD_ORPHAN_WARN) += -Wl,--orphan-handling=$(CONFIG_LD_ORPHAN_WARN_LEVEL)
@@ -57,6 +45,12 @@ ldflags-$(CONFIG_LD_ORPHAN_WARN) += -Wl,--orphan-handling=$(CONFIG_LD_ORPHAN_WAR
 ldflags-y += $(filter-out $(CC_AUTO_VAR_INIT_ZERO_ENABLER) $(CC_FLAGS_FTRACE) -Wa$(comma)%, $(KBUILD_CFLAGS))
 
 CC32FLAGS := -m32
+CC32FLAGSREMOVE := -mcmodel=medium -mabi=elfv1 -mabi=elfv2 -mcall-aixdesc
+  # This flag is supported by clang for 64-bit but not 32-bit so it will cause
+  # an unused command line flag warning for this file.
+ifdef CONFIG_CC_IS_CLANG
+CC32FLAGSREMOVE += -fno-stack-clash-protection
+endif
 LD32FLAGS := -Wl,-soname=linux-vdso32.so.1
 AS32FLAGS := -D__VDSO32__
 
@@ -105,7 +99,7 @@ quiet_cmd_vdso32ld_and_check = VDSO32L $@
 quiet_cmd_vdso32as = VDSO32A $@
       cmd_vdso32as = $(VDSOCC) $(a_flags) $(CC32FLAGS) $(AS32FLAGS) -c -o $@ $<
 quiet_cmd_vdso32cc = VDSO32C $@
-      cmd_vdso32cc = $(VDSOCC) $(c_flags) $(CC32FLAGS) -c -o $@ $<
+      cmd_vdso32cc = $(VDSOCC) $(filter-out $(CC32FLAGSREMOVE), $(c_flags)) $(CC32FLAGS) -c -o $@ $<
 
 quiet_cmd_vdso64ld_and_check = VDSO64L $@
       cmd_vdso64ld_and_check = $(VDSOCC) $(ldflags-y) $(LD64FLAGS) -o $@ -Wl,-T$(filter %.lds,$^) $(filter %.o,$^); $(cmd_vdso_check)
-- 
2.44.0


