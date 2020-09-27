Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BD527A055
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Sep 2020 11:45:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BzgkN1JSszDqNJ
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Sep 2020 19:45:32 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bzg515tZCzDqQC
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Sep 2020 19:16:37 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4Bzg4s5GH8z9vCy5;
 Sun, 27 Sep 2020 11:16:29 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id HzZ8L1hhp6PK; Sun, 27 Sep 2020 11:16:29 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Bzg4s4Nzdz9vCxw;
 Sun, 27 Sep 2020 11:16:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1EECB8B771;
 Sun, 27 Sep 2020 11:16:34 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 0gESLihRXxUC; Sun, 27 Sep 2020 11:16:34 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BEF378B75B;
 Sun, 27 Sep 2020 11:16:33 +0200 (CEST)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 9C92365DE8; Sun, 27 Sep 2020 09:16:33 +0000 (UTC)
Message-Id: <f8bfd6812c3e3678b1cdb4d55a52f9eb022b40d3.1601197618.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1601197618.git.christophe.leroy@csgroup.eu>
References: <cover.1601197618.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v1 16/30] powerpc/vdso: Retrieve sigtramp offsets at buildtime
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Sun, 27 Sep 2020 09:16:33 +0000 (UTC)
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

This is copied from arm64.

Instead of using runtime generated signal trampoline offsets,
get offsets at buildtime.

If the said trampoline doesn't exist, build will fail. So no
need to check whether the trampoline exists or not in the VDSO.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/Makefile                          | 15 +++++++++++++++
 arch/powerpc/include/asm/vdso.h                | 12 ++++++++++++
 arch/powerpc/kernel/signal_32.c                |  8 ++++----
 arch/powerpc/kernel/signal_64.c                |  4 ++--
 arch/powerpc/kernel/vdso32/Makefile            |  8 ++++++++
 arch/powerpc/kernel/vdso32/gen_vdso_offsets.sh | 16 ++++++++++++++++
 arch/powerpc/kernel/vdso32/vdso32.lds.S        |  6 ++++++
 arch/powerpc/kernel/vdso64/Makefile            |  8 ++++++++
 arch/powerpc/kernel/vdso64/gen_vdso_offsets.sh | 16 ++++++++++++++++
 arch/powerpc/kernel/vdso64/vdso64.lds.S        |  5 +++++
 arch/powerpc/perf/callchain_32.c               |  8 ++++----
 arch/powerpc/perf/callchain_64.c               |  4 ++--
 12 files changed, 98 insertions(+), 12 deletions(-)
 create mode 100755 arch/powerpc/kernel/vdso32/gen_vdso_offsets.sh
 create mode 100755 arch/powerpc/kernel/vdso64/gen_vdso_offsets.sh

diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index 4f932044939e..2b432a62d6a2 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -410,6 +410,21 @@ install:
 archclean:
 	$(Q)$(MAKE) $(clean)=$(boot)
 
+ifeq ($(KBUILD_EXTMOD),)
+# We need to generate vdso-offsets.h before compiling certain files in kernel/.
+# In order to do that, we should use the archprepare target, but we can't since
+# asm-offsets.h is included in some files used to generate vdso-offsets.h, and
+# asm-offsets.h is built in prepare0, for which archprepare is a dependency.
+# Therefore we need to generate the header after prepare0 has been made, hence
+# this hack.
+prepare: vdso_prepare
+vdso_prepare: prepare0
+	$(if $(CONFIG_VDSO32),$(Q)$(MAKE) \
+		$(build)=arch/powerpc/kernel/vdso32 include/generated/vdso32-offsets.h)
+	$(if $(CONFIG_PPC64),$(Q)$(MAKE) \
+		$(build)=arch/powerpc/kernel/vdso64 include/generated/vdso64-offsets.h)
+endif
+
 archprepare: checkbin
 
 archheaders:
diff --git a/arch/powerpc/include/asm/vdso.h b/arch/powerpc/include/asm/vdso.h
index 2ff884853f97..f5257b7f17d0 100644
--- a/arch/powerpc/include/asm/vdso.h
+++ b/arch/powerpc/include/asm/vdso.h
@@ -15,6 +15,18 @@
 
 #ifndef __ASSEMBLY__
 
+#ifdef CONFIG_PPC64
+#include <generated/vdso64-offsets.h>
+#endif
+
+#ifdef CONFIG_VDSO32
+#include <generated/vdso32-offsets.h>
+#endif
+
+#define VDSO64_SYMBOL(base, name) ((unsigned long)(base) + (vdso64_offset_##name))
+
+#define VDSO32_SYMBOL(base, name) ((unsigned long)(base) + (vdso32_offset_##name))
+
 /* Offsets relative to thread->vdso_base */
 extern unsigned long vdso64_rt_sigtramp;
 extern unsigned long vdso32_sigtramp;
diff --git a/arch/powerpc/kernel/signal_32.c b/arch/powerpc/kernel/signal_32.c
index 4dcc5e2659ce..e6f8afe1d12c 100644
--- a/arch/powerpc/kernel/signal_32.c
+++ b/arch/powerpc/kernel/signal_32.c
@@ -785,9 +785,9 @@ int handle_rt_signal32(struct ksignal *ksig, sigset_t *oldset,
 	/* Save user registers on the stack */
 	frame = &rt_sf->uc.uc_mcontext;
 	addr = frame;
-	if (vdso32_rt_sigtramp && tsk->mm->context.vdso) {
+	if (tsk->mm->context.vdso) {
 		sigret = 0;
-		tramp = (unsigned long)tsk->mm->context.vdso + vdso32_rt_sigtramp;
+		tramp = VDSO32_SYMBOL(tsk->mm->context.vdso, sigtramp_rt32);
 	} else {
 		sigret = __NR_rt_sigreturn;
 		tramp = (unsigned long) frame->tramp;
@@ -1247,9 +1247,9 @@ int handle_signal32(struct ksignal *ksig, sigset_t *oldset,
 	    || __put_user(ksig->sig, &sc->signal))
 		goto badframe;
 
-	if (vdso32_sigtramp && tsk->mm->context.vdso) {
+	if (tsk->mm->context.vdso) {
 		sigret = 0;
-		tramp = (unsigned long)tsk->mm->context.vdso + vdso32_sigtramp;
+		tramp = VDSO32_SYMBOL(tsk->mm->context.vdso, sigtramp32);
 	} else {
 		sigret = __NR_sigreturn;
 		tramp = (unsigned long) frame->mctx.tramp;
diff --git a/arch/powerpc/kernel/signal_64.c b/arch/powerpc/kernel/signal_64.c
index 80ad09c8bc14..d29f529a4658 100644
--- a/arch/powerpc/kernel/signal_64.c
+++ b/arch/powerpc/kernel/signal_64.c
@@ -864,8 +864,8 @@ int handle_rt_signal64(struct ksignal *ksig, sigset_t *set,
 	tsk->thread.fp_state.fpscr = 0;
 
 	/* Set up to return from userspace. */
-	if (vdso64_rt_sigtramp && tsk->mm->context.vdso) {
-		regs->nip = (unsigned long)tsk->mm->context.vdso + vdso64_rt_sigtramp;
+	if (tsk->mm->context.vdso) {
+		regs->nip = VDSO64_SYMBOL(tsk->mm->context.vdso, sigtramp_rt64);
 	} else {
 		err |= setup_trampoline(__NR_rt_sigreturn, &frame->tramp[0]);
 		if (err)
diff --git a/arch/powerpc/kernel/vdso32/Makefile b/arch/powerpc/kernel/vdso32/Makefile
index 0923e5f10257..7f69fa94c898 100644
--- a/arch/powerpc/kernel/vdso32/Makefile
+++ b/arch/powerpc/kernel/vdso32/Makefile
@@ -63,6 +63,14 @@ $(obj-vdso32): %.o: %.S FORCE
 $(obj)/vgettimeofday.o: %.o: %.c FORCE
 	$(call if_changed_dep,vdso32cc)
 
+# Generate VDSO offsets using helper script
+gen-vdsosym := $(srctree)/$(src)/gen_vdso_offsets.sh
+quiet_cmd_vdsosym = VDSOSYM $@
+      cmd_vdsosym = $(NM) $< | $(gen-vdsosym) | LC_ALL=C sort > $@
+
+include/generated/vdso32-offsets.h: $(obj)/vdso32.so.dbg FORCE
+	$(call if_changed,vdsosym)
+
 # actual build commands
 quiet_cmd_vdso32ld_and_check = VDSO32L $@
       cmd_vdso32ld_and_check = $(VDSOCC) $(c_flags) $(CC32FLAGS) -o $@ -Wl,-T$(filter %.lds,$^) $(filter %.o,$^) ; $(cmd_vdso_check)
diff --git a/arch/powerpc/kernel/vdso32/gen_vdso_offsets.sh b/arch/powerpc/kernel/vdso32/gen_vdso_offsets.sh
new file mode 100755
index 000000000000..c7b54a5dcd3e
--- /dev/null
+++ b/arch/powerpc/kernel/vdso32/gen_vdso_offsets.sh
@@ -0,0 +1,16 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+
+#
+# Match symbols in the DSO that look like VDSO_*; produce a header file
+# of constant offsets into the shared object.
+#
+# Doing this inside the Makefile will break the $(filter-out) function,
+# causing Kbuild to rebuild the vdso-offsets header file every time.
+#
+# Author: Will Deacon <will.deacon@arm.com
+#
+
+LC_ALL=C
+sed -n -e 's/^00*/0/' -e \
+'s/^\([0-9a-fA-F]*\) . VDSO_\([a-zA-Z0-9_]*\)$/\#define vdso32_offset_\2\t0x\1/p'
diff --git a/arch/powerpc/kernel/vdso32/vdso32.lds.S b/arch/powerpc/kernel/vdso32/vdso32.lds.S
index c96b5141738e..a4494a998f58 100644
--- a/arch/powerpc/kernel/vdso32/vdso32.lds.S
+++ b/arch/powerpc/kernel/vdso32/vdso32.lds.S
@@ -165,3 +165,9 @@ VERSION
 	local: *;
 	};
 }
+
+/*
+ * Make the sigreturn code visible to the kernel.
+ */
+VDSO_sigtramp32		= __kernel_sigtramp32;
+VDSO_sigtramp_rt32	= __kernel_sigtramp_rt32;
diff --git a/arch/powerpc/kernel/vdso64/Makefile b/arch/powerpc/kernel/vdso64/Makefile
index 99752f27df3f..8f4814365afb 100644
--- a/arch/powerpc/kernel/vdso64/Makefile
+++ b/arch/powerpc/kernel/vdso64/Makefile
@@ -42,6 +42,14 @@ $(obj)/vdso64_wrapper.o : $(obj)/vdso64.so.dbg
 $(obj)/vdso64.so.dbg: $(src)/vdso64.lds $(obj-vdso64) $(obj)/vgettimeofday.o FORCE
 	$(call if_changed,vdso64ld_and_check)
 
+# Generate VDSO offsets using helper script
+gen-vdsosym := $(srctree)/$(src)/gen_vdso_offsets.sh
+quiet_cmd_vdsosym = VDSOSYM $@
+      cmd_vdsosym = $(NM) $< | $(gen-vdsosym) | LC_ALL=C sort > $@
+
+include/generated/vdso64-offsets.h: $(obj)/vdso64.so.dbg FORCE
+	$(call if_changed,vdsosym)
+
 # actual build commands
 quiet_cmd_vdso64ld_and_check = VDSO64L $@
       cmd_vdso64ld_and_check = $(CC) $(c_flags) -o $@ -Wl,-T$(filter %.lds,$^) $(filter %.o,$^); $(cmd_vdso_check)
diff --git a/arch/powerpc/kernel/vdso64/gen_vdso_offsets.sh b/arch/powerpc/kernel/vdso64/gen_vdso_offsets.sh
new file mode 100755
index 000000000000..4bf15ffd5933
--- /dev/null
+++ b/arch/powerpc/kernel/vdso64/gen_vdso_offsets.sh
@@ -0,0 +1,16 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+
+#
+# Match symbols in the DSO that look like VDSO_*; produce a header file
+# of constant offsets into the shared object.
+#
+# Doing this inside the Makefile will break the $(filter-out) function,
+# causing Kbuild to rebuild the vdso-offsets header file every time.
+#
+# Author: Will Deacon <will.deacon@arm.com
+#
+
+LC_ALL=C
+sed -n -e 's/^00*/0/' -e \
+'s/^\([0-9a-fA-F]*\) . VDSO_\([a-zA-Z0-9_]*\)$/\#define vdso64_offset_\2\t0x\1/p'
diff --git a/arch/powerpc/kernel/vdso64/vdso64.lds.S b/arch/powerpc/kernel/vdso64/vdso64.lds.S
index aa5b924683c5..2113bf79ccda 100644
--- a/arch/powerpc/kernel/vdso64/vdso64.lds.S
+++ b/arch/powerpc/kernel/vdso64/vdso64.lds.S
@@ -159,3 +159,8 @@ VERSION
 	local: *;
 	};
 }
+
+/*
+ * Make the sigreturn code visible to the kernel.
+ */
+VDSO_sigtramp_rt64	= __kernel_sigtramp_rt64;
diff --git a/arch/powerpc/perf/callchain_32.c b/arch/powerpc/perf/callchain_32.c
index b32e94047fb9..b83c47b7947f 100644
--- a/arch/powerpc/perf/callchain_32.c
+++ b/arch/powerpc/perf/callchain_32.c
@@ -59,8 +59,8 @@ static int is_sigreturn_32_address(unsigned int nip, unsigned int fp)
 {
 	if (nip == fp + offsetof(struct signal_frame_32, mctx.mc_pad))
 		return 1;
-	if (vdso32_sigtramp && current->mm->context.vdso &&
-	    nip == (unsigned long)current->mm->context.vdso + vdso32_sigtramp)
+	if (current->mm->context.vdso &&
+	    nip == VDSO32_SYMBOL(current->mm->context.vdso, sigtramp32))
 		return 1;
 	return 0;
 }
@@ -70,8 +70,8 @@ static int is_rt_sigreturn_32_address(unsigned int nip, unsigned int fp)
 	if (nip == fp + offsetof(struct rt_signal_frame_32,
 				 uc.uc_mcontext.mc_pad))
 		return 1;
-	if (vdso32_rt_sigtramp && current->mm->context.vdso &&
-	    nip == (unsigned long)current->mm->context.vdso + vdso32_rt_sigtramp)
+	if (current->mm->context.vdso &&
+	    nip == VDSO32_SYMBOL(current->mm->context.vdso, sigtramp_rt32))
 		return 1;
 	return 0;
 }
diff --git a/arch/powerpc/perf/callchain_64.c b/arch/powerpc/perf/callchain_64.c
index c4dfe3c2702b..eb640b19093a 100644
--- a/arch/powerpc/perf/callchain_64.c
+++ b/arch/powerpc/perf/callchain_64.c
@@ -67,8 +67,8 @@ static int is_sigreturn_64_address(unsigned long nip, unsigned long fp)
 {
 	if (nip == fp + offsetof(struct signal_frame_64, tramp))
 		return 1;
-	if (vdso64_rt_sigtramp && current->mm->context.vdso &&
-	    nip == (unsigned long)current->mm->context.vdso + vdso64_rt_sigtramp)
+	if (current->mm->context.vdso &&
+	    nip == VDSO64_SYMBOL(current->mm->context.vdso, sigtramp_rt64))
 		return 1;
 	return 0;
 }
-- 
2.25.0

