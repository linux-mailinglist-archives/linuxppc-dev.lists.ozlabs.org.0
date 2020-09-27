Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CC727A01E
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Sep 2020 11:26:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BzgJD6CpzzDqTN
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Sep 2020 19:26:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bzg4p70RVzDqPy
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Sep 2020 19:16:23 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4Bzg4Z1P4Qz9vCxy;
 Sun, 27 Sep 2020 11:16:14 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id hDJ0AZbD-3PR; Sun, 27 Sep 2020 11:16:14 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Bzg4Z0c29z9vCxw;
 Sun, 27 Sep 2020 11:16:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9317B8B771;
 Sun, 27 Sep 2020 11:16:18 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 8c0Jz_9UktG3; Sun, 27 Sep 2020 11:16:18 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3E3EA8B75B;
 Sun, 27 Sep 2020 11:16:18 +0200 (CEST)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 1A40965DE8; Sun, 27 Sep 2020 09:16:18 +0000 (UTC)
Message-Id: <5986ca25be44fe6e9790486304507f240077d8c4.1601197618.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1601197618.git.christophe.leroy@csgroup.eu>
References: <cover.1601197618.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v1 01/30] powerpc/vdso: Stripped VDSO is not needed, don't
 build it
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Sun, 27 Sep 2020 09:16:18 +0000 (UTC)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Since commit 24b659a13866 ("powerpc: Use unstripped VDSO image for
more accurate profiling data"), only the unstripped VDSO image
has been used.

Partially revert commit 8150caad0226 ("[POWERPC] powerpc vDSO: install
unstripped copies on disk") to avoid building the stripped version.

And the unstripped version in $(MODLIB)/vdso/ is not required
anymore as it is the one embedded in the kernel image.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/Makefile               |  9 ---------
 arch/powerpc/kernel/vdso32/Makefile | 19 ++-----------------
 arch/powerpc/kernel/vdso64/Makefile | 19 ++-----------------
 3 files changed, 4 insertions(+), 43 deletions(-)

diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index 3e8da9cf2eb9..4f932044939e 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -407,15 +407,6 @@ PHONY += install
 install:
 	$(Q)$(MAKE) $(build)=$(boot) install
 
-PHONY += vdso_install
-vdso_install:
-ifdef CONFIG_PPC64
-	$(Q)$(MAKE) $(build)=arch/$(ARCH)/kernel/vdso64 $@
-endif
-ifdef CONFIG_VDSO32
-	$(Q)$(MAKE) $(build)=arch/$(ARCH)/kernel/vdso32 $@
-endif
-
 archclean:
 	$(Q)$(MAKE) $(clean)=$(boot)
 
diff --git a/arch/powerpc/kernel/vdso32/Makefile b/arch/powerpc/kernel/vdso32/Makefile
index b46c21ed9316..0923e5f10257 100644
--- a/arch/powerpc/kernel/vdso32/Makefile
+++ b/arch/powerpc/kernel/vdso32/Makefile
@@ -34,7 +34,7 @@ CC32FLAGS += -m32
 KBUILD_CFLAGS := $(filter-out -mcmodel=medium,$(KBUILD_CFLAGS))
 endif
 
-targets := $(obj-vdso32) vdso32.so vdso32.so.dbg
+targets := $(obj-vdso32) vdso32.so.dbg
 obj-vdso32 := $(addprefix $(obj)/, $(obj-vdso32))
 
 GCOV_PROFILE := n
@@ -51,17 +51,12 @@ extra-y += vdso32.lds
 CPPFLAGS_vdso32.lds += -P -C -Upowerpc
 
 # Force dependency (incbin is bad)
-$(obj)/vdso32_wrapper.o : $(obj)/vdso32.so
+$(obj)/vdso32_wrapper.o : $(obj)/vdso32.so.dbg
 
 # link rule for the .so file, .lds has to be first
 $(obj)/vdso32.so.dbg: $(src)/vdso32.lds $(obj-vdso32) $(obj)/vgettimeofday.o FORCE
 	$(call if_changed,vdso32ld_and_check)
 
-# strip rule for the .so file
-$(obj)/%.so: OBJCOPYFLAGS := -S
-$(obj)/%.so: $(obj)/%.so.dbg FORCE
-	$(call if_changed,objcopy)
-
 # assembly rules for the .S files
 $(obj-vdso32): %.o: %.S FORCE
 	$(call if_changed_dep,vdso32as)
@@ -75,13 +70,3 @@ quiet_cmd_vdso32as = VDSO32A $@
       cmd_vdso32as = $(VDSOCC) $(a_flags) $(CC32FLAGS) -c -o $@ $<
 quiet_cmd_vdso32cc = VDSO32C $@
       cmd_vdso32cc = $(VDSOCC) $(c_flags) $(CC32FLAGS) -c -o $@ $<
-
-# install commands for the unstripped file
-quiet_cmd_vdso_install = INSTALL $@
-      cmd_vdso_install = cp $(obj)/$@.dbg $(MODLIB)/vdso/$@
-
-vdso32.so: $(obj)/vdso32.so.dbg
-	@mkdir -p $(MODLIB)/vdso
-	$(call cmd,vdso_install)
-
-vdso_install: vdso32.so
diff --git a/arch/powerpc/kernel/vdso64/Makefile b/arch/powerpc/kernel/vdso64/Makefile
index b8eeebea12c3..99752f27df3f 100644
--- a/arch/powerpc/kernel/vdso64/Makefile
+++ b/arch/powerpc/kernel/vdso64/Makefile
@@ -17,7 +17,7 @@ endif
 
 # Build rules
 
-targets := $(obj-vdso64) vdso64.so vdso64.so.dbg
+targets := $(obj-vdso64) vdso64.so.dbg
 obj-vdso64 := $(addprefix $(obj)/, $(obj-vdso64))
 
 GCOV_PROFILE := n
@@ -36,27 +36,12 @@ CPPFLAGS_vdso64.lds += -P -C -U$(ARCH)
 $(obj)/vgettimeofday.o: %.o: %.c FORCE
 
 # Force dependency (incbin is bad)
-$(obj)/vdso64_wrapper.o : $(obj)/vdso64.so
+$(obj)/vdso64_wrapper.o : $(obj)/vdso64.so.dbg
 
 # link rule for the .so file, .lds has to be first
 $(obj)/vdso64.so.dbg: $(src)/vdso64.lds $(obj-vdso64) $(obj)/vgettimeofday.o FORCE
 	$(call if_changed,vdso64ld_and_check)
 
-# strip rule for the .so file
-$(obj)/%.so: OBJCOPYFLAGS := -S
-$(obj)/%.so: $(obj)/%.so.dbg FORCE
-	$(call if_changed,objcopy)
-
 # actual build commands
 quiet_cmd_vdso64ld_and_check = VDSO64L $@
       cmd_vdso64ld_and_check = $(CC) $(c_flags) -o $@ -Wl,-T$(filter %.lds,$^) $(filter %.o,$^); $(cmd_vdso_check)
-
-# install commands for the unstripped file
-quiet_cmd_vdso_install = INSTALL $@
-      cmd_vdso_install = cp $(obj)/$@.dbg $(MODLIB)/vdso/$@
-
-vdso64.so: $(obj)/vdso64.so.dbg
-	@mkdir -p $(MODLIB)/vdso
-	$(call cmd,vdso_install)
-
-vdso_install: vdso64.so
-- 
2.25.0

