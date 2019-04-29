Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B51CE040
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2019 12:07:07 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44t0gl6m9GzDqS7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2019 20:06:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44t0LQ24HtzDqP9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Apr 2019 19:51:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="MRhbteNP"; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 44t0LP6wBWz8tDC
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Apr 2019 19:51:57 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 44t0LP6Whnz9sCJ; Mon, 29 Apr 2019 19:51:57 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linuxfoundation.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="MRhbteNP"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 44t0LP2V47z9s70
 for <linuxppc-dev@ozlabs.org>; Mon, 29 Apr 2019 19:51:57 +1000 (AEST)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AAD5E206BF;
 Mon, 29 Apr 2019 09:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556531515;
 bh=UxHUAIJSYYn9tQHi6Yfpq7+r4p0rTzUmWUmC6JWUY10=;
 h=Subject:To:Cc:From:Date:In-Reply-To:From;
 b=MRhbteNPD/pSOBUBNEkWOEr0+YpB0VUo0fvKVDV+rd58isvkA6JRVMZuS9MpEKY8f
 ZmiMH+85ePuwGaZivao/qMUWCkba8QrzG643noTNQgor1x6CYhhjMxnrACzyp9XhFN
 W+bkIc4ErLB+y/a5mEVAHZqhXdG+7AA+fEh/8HbA=
Subject: Patch "powerpc/64s: Add support for software count cache flush" has
 been added to the 4.4-stable tree
To: christophe.leroy@c-s.fr, diana.craciun@nxp.com, gregkh@linuxfoundation.org,
 linuxppc-dev@ozlabs.org, mpe@ellerman.id.au, msuchanek@suse.de,
 npiggin@gmail.com
From: <gregkh@linuxfoundation.org>
Date: Mon, 29 Apr 2019 11:51:22 +0200
In-Reply-To: <20190421142037.21881-42-mpe@ellerman.id.au>
Message-ID: <155653148279149@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
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
Cc: stable-commits@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


This is a note to let you know that I've just added the patch titled

    powerpc/64s: Add support for software count cache flush

to the 4.4-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     powerpc-64s-add-support-for-software-count-cache-flush.patch
and it can be found in the queue-4.4 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From foo@baz Mon 29 Apr 2019 11:38:37 AM CEST
From: Michael Ellerman <mpe@ellerman.id.au>
Date: Mon, 22 Apr 2019 00:20:26 +1000
Subject: powerpc/64s: Add support for software count cache flush
To: stable@vger.kernel.org, gregkh@linuxfoundation.org
Cc: linuxppc-dev@ozlabs.org, diana.craciun@nxp.com, msuchanek@suse.de, npiggin@gmail.com, christophe.leroy@c-s.fr
Message-ID: <20190421142037.21881-42-mpe@ellerman.id.au>

From: Michael Ellerman <mpe@ellerman.id.au>

commit ee13cb249fabdff8b90aaff61add347749280087 upstream.

Some CPU revisions support a mode where the count cache needs to be
flushed by software on context switch. Additionally some revisions may
have a hardware accelerated flush, in which case the software flush
sequence can be shortened.

If we detect the appropriate flag from firmware we patch a branch
into _switch() which takes us to a count cache flush sequence.

That sequence in turn may be patched to return early if we detect that
the CPU supports accelerating the flush sequence in hardware.

Add debugfs support for reporting the state of the flush, as well as
runtime disabling it.

And modify the spectre_v2 sysfs file to report the state of the
software flush.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/powerpc/include/asm/asm-prototypes.h    |   21 +++++
 arch/powerpc/include/asm/security_features.h |    1 
 arch/powerpc/kernel/entry_64.S               |   54 ++++++++++++++
 arch/powerpc/kernel/security.c               |   98 +++++++++++++++++++++++++--
 4 files changed, 169 insertions(+), 5 deletions(-)
 create mode 100644 arch/powerpc/include/asm/asm-prototypes.h

--- /dev/null
+++ b/arch/powerpc/include/asm/asm-prototypes.h
@@ -0,0 +1,21 @@
+#ifndef _ASM_POWERPC_ASM_PROTOTYPES_H
+#define _ASM_POWERPC_ASM_PROTOTYPES_H
+/*
+ * This file is for prototypes of C functions that are only called
+ * from asm, and any associated variables.
+ *
+ * Copyright 2016, Daniel Axtens, IBM Corporation.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version 2
+ * of the License, or (at your option) any later version.
+ */
+
+/* Patch sites */
+extern s32 patch__call_flush_count_cache;
+extern s32 patch__flush_count_cache_return;
+
+extern long flush_count_cache;
+
+#endif /* _ASM_POWERPC_ASM_PROTOTYPES_H */
--- a/arch/powerpc/include/asm/security_features.h
+++ b/arch/powerpc/include/asm/security_features.h
@@ -22,6 +22,7 @@ enum stf_barrier_type {
 
 void setup_stf_barrier(void);
 void do_stf_barrier_fixups(enum stf_barrier_type types);
+void setup_count_cache_flush(void);
 
 static inline void security_ftr_set(unsigned long feature)
 {
--- a/arch/powerpc/kernel/entry_64.S
+++ b/arch/powerpc/kernel/entry_64.S
@@ -25,6 +25,7 @@
 #include <asm/page.h>
 #include <asm/mmu.h>
 #include <asm/thread_info.h>
+#include <asm/code-patching-asm.h>
 #include <asm/ppc_asm.h>
 #include <asm/asm-offsets.h>
 #include <asm/cputable.h>
@@ -450,6 +451,57 @@ _GLOBAL(ret_from_kernel_thread)
 	li	r3,0
 	b	.Lsyscall_exit
 
+#ifdef CONFIG_PPC_BOOK3S_64
+
+#define FLUSH_COUNT_CACHE	\
+1:	nop;			\
+	patch_site 1b, patch__call_flush_count_cache
+
+
+#define BCCTR_FLUSH	.long 0x4c400420
+
+.macro nops number
+	.rept \number
+	nop
+	.endr
+.endm
+
+.balign 32
+.global flush_count_cache
+flush_count_cache:
+	/* Save LR into r9 */
+	mflr	r9
+
+	.rept 64
+	bl	.+4
+	.endr
+	b	1f
+	nops	6
+
+	.balign 32
+	/* Restore LR */
+1:	mtlr	r9
+	li	r9,0x7fff
+	mtctr	r9
+
+	BCCTR_FLUSH
+
+2:	nop
+	patch_site 2b patch__flush_count_cache_return
+
+	nops	3
+
+	.rept 278
+	.balign 32
+	BCCTR_FLUSH
+	nops	7
+	.endr
+
+	blr
+#else
+#define FLUSH_COUNT_CACHE
+#endif /* CONFIG_PPC_BOOK3S_64 */
+
 /*
  * This routine switches between two different tasks.  The process
  * state of one is saved on its kernel stack.  Then the state
@@ -513,6 +565,8 @@ BEGIN_FTR_SECTION
 END_FTR_SECTION_IFSET(CPU_FTR_ARCH_207S)
 #endif
 
+	FLUSH_COUNT_CACHE
+
 #ifdef CONFIG_SMP
 	/* We need a sync somewhere here to make sure that if the
 	 * previous task gets rescheduled on another CPU, it sees all
--- a/arch/powerpc/kernel/security.c
+++ b/arch/powerpc/kernel/security.c
@@ -10,12 +10,21 @@
 #include <linux/seq_buf.h>
 
 #include <asm/debug.h>
+#include <asm/asm-prototypes.h>
+#include <asm/code-patching.h>
 #include <asm/security_features.h>
 #include <asm/setup.h>
 
 
 unsigned long powerpc_security_features __read_mostly = SEC_FTR_DEFAULT;
 
+enum count_cache_flush_type {
+	COUNT_CACHE_FLUSH_NONE	= 0x1,
+	COUNT_CACHE_FLUSH_SW	= 0x2,
+	COUNT_CACHE_FLUSH_HW	= 0x4,
+};
+static enum count_cache_flush_type count_cache_flush_type;
+
 bool barrier_nospec_enabled;
 static bool no_nospec;
 
@@ -160,17 +169,29 @@ ssize_t cpu_show_spectre_v2(struct devic
 	bcs = security_ftr_enabled(SEC_FTR_BCCTRL_SERIALISED);
 	ccd = security_ftr_enabled(SEC_FTR_COUNT_CACHE_DISABLED);
 
-	if (bcs || ccd) {
+	if (bcs || ccd || count_cache_flush_type != COUNT_CACHE_FLUSH_NONE) {
+		bool comma = false;
 		seq_buf_printf(&s, "Mitigation: ");
 
-		if (bcs)
+		if (bcs) {
 			seq_buf_printf(&s, "Indirect branch serialisation (kernel only)");
+			comma = true;
+		}
+
+		if (ccd) {
+			if (comma)
+				seq_buf_printf(&s, ", ");
+			seq_buf_printf(&s, "Indirect branch cache disabled");
+			comma = true;
+		}
 
-		if (bcs && ccd)
+		if (comma)
 			seq_buf_printf(&s, ", ");
 
-		if (ccd)
-			seq_buf_printf(&s, "Indirect branch cache disabled");
+		seq_buf_printf(&s, "Software count cache flush");
+
+		if (count_cache_flush_type == COUNT_CACHE_FLUSH_HW)
+			seq_buf_printf(&s, "(hardware accelerated)");
 	} else
 		seq_buf_printf(&s, "Vulnerable");
 
@@ -325,4 +346,71 @@ static __init int stf_barrier_debugfs_in
 }
 device_initcall(stf_barrier_debugfs_init);
 #endif /* CONFIG_DEBUG_FS */
+
+static void toggle_count_cache_flush(bool enable)
+{
+	if (!enable || !security_ftr_enabled(SEC_FTR_FLUSH_COUNT_CACHE)) {
+		patch_instruction_site(&patch__call_flush_count_cache, PPC_INST_NOP);
+		count_cache_flush_type = COUNT_CACHE_FLUSH_NONE;
+		pr_info("count-cache-flush: software flush disabled.\n");
+		return;
+	}
+
+	patch_branch_site(&patch__call_flush_count_cache,
+			  (u64)&flush_count_cache, BRANCH_SET_LINK);
+
+	if (!security_ftr_enabled(SEC_FTR_BCCTR_FLUSH_ASSIST)) {
+		count_cache_flush_type = COUNT_CACHE_FLUSH_SW;
+		pr_info("count-cache-flush: full software flush sequence enabled.\n");
+		return;
+	}
+
+	patch_instruction_site(&patch__flush_count_cache_return, PPC_INST_BLR);
+	count_cache_flush_type = COUNT_CACHE_FLUSH_HW;
+	pr_info("count-cache-flush: hardware assisted flush sequence enabled\n");
+}
+
+void setup_count_cache_flush(void)
+{
+	toggle_count_cache_flush(true);
+}
+
+#ifdef CONFIG_DEBUG_FS
+static int count_cache_flush_set(void *data, u64 val)
+{
+	bool enable;
+
+	if (val == 1)
+		enable = true;
+	else if (val == 0)
+		enable = false;
+	else
+		return -EINVAL;
+
+	toggle_count_cache_flush(enable);
+
+	return 0;
+}
+
+static int count_cache_flush_get(void *data, u64 *val)
+{
+	if (count_cache_flush_type == COUNT_CACHE_FLUSH_NONE)
+		*val = 0;
+	else
+		*val = 1;
+
+	return 0;
+}
+
+DEFINE_SIMPLE_ATTRIBUTE(fops_count_cache_flush, count_cache_flush_get,
+			count_cache_flush_set, "%llu\n");
+
+static __init int count_cache_flush_debugfs_init(void)
+{
+	debugfs_create_file("count_cache_flush", 0600, powerpc_debugfs_root,
+			    NULL, &fops_count_cache_flush);
+	return 0;
+}
+device_initcall(count_cache_flush_debugfs_init);
+#endif /* CONFIG_DEBUG_FS */
 #endif /* CONFIG_PPC_BOOK3S_64 */


Patches currently in stable-queue which might be from mpe@ellerman.id.au are

queue-4.4/powerpc-64s-add-support-for-a-store-forwarding-barrier-at-kernel-entry-exit.patch
queue-4.4/powerpc-64-make-stf-barrier-ppc_book3s_64-specific.patch
queue-4.4/powerpc-pseries-set-or-clear-security-feature-flags.patch
queue-4.4/powerpc-fsl-fix-spectre_v2-mitigations-reporting.patch
queue-4.4/powerpc-64s-patch-barrier_nospec-in-modules.patch
queue-4.4/powerpc-pseries-support-firmware-disable-of-rfi-flush.patch
queue-4.4/powerpc-rfi-flush-call-setup_rfi_flush-after-lpm-migration.patch
queue-4.4/powerpc-pseries-query-hypervisor-for-count-cache-flush-settings.patch
queue-4.4/powerpc-powernv-set-or-clear-security-feature-flags.patch
queue-4.4/powerpc-64s-add-support-for-software-count-cache-flush.patch
queue-4.4/powerpc64s-show-ori31-availability-in-spectre_v1-sysfs-file-not-v2.patch
queue-4.4/powerpc-fsl-flush-the-branch-predictor-at-each-kernel-entry-64bit.patch
queue-4.4/powerpc-fsl-update-spectre-v2-reporting.patch
queue-4.4/powerpc-64s-wire-up-cpu_show_spectre_v2.patch
queue-4.4/powerpc-64-make-meltdown-reporting-book3s-64-specific.patch
queue-4.4/powerpc-rfi-flush-make-it-possible-to-call-setup_rfi_flush-again.patch
queue-4.4/powerpc-64s-add-support-for-ori-barrier_nospec-patching.patch
queue-4.4/powerpc-use-barrier_nospec-in-copy_from_user.patch
queue-4.4/powerpc-64s-fix-section-mismatch-warnings-from-setup_rfi_flush.patch
queue-4.4/powerpc-avoid-code-patching-freed-init-sections.patch
queue-4.4/powerpc-fsl-add-macro-to-flush-the-branch-predictor.patch
queue-4.4/powerpc-xmon-add-rfi-flush-related-fields-to-paca-dump.patch
queue-4.4/powerpc-fsl-add-barrier_nospec-implementation-for-nxp-powerpc-book3e.patch
queue-4.4/powerpc-security-fix-spectre_v2-reporting.patch
queue-4.4/powerpc-add-security-feature-flags-for-spectre-meltdown.patch
queue-4.4/powerpc-powernv-use-the-security-flags-in-pnv_setup_rfi_flush.patch
queue-4.4/powerpc-64-disable-the-speculation-barrier-from-the-command-line.patch
queue-4.4/powerpc-fsl-fix-the-flush-of-branch-predictor.patch
queue-4.4/powerpc-pseries-use-the-security-flags-in-pseries_setup_rfi_flush.patch
queue-4.4/powerpc-64-add-config_ppc_barrier_nospec.patch
queue-4.4/powerpc-64s-move-cpu_show_meltdown.patch
queue-4.4/powerpc-64-use-barrier_nospec-in-syscall-entry.patch
queue-4.4/powerpc-fsl-add-nospectre_v2-command-line-argument.patch
queue-4.4/powerpc-64s-add-new-security-feature-flags-for-count-cache-flush.patch
queue-4.4/powerpc-fsl-add-infrastructure-to-fixup-branch-predictor-flush.patch
queue-4.4/powerpc-rfi-flush-differentiate-enabled-and-patched-flush-types.patch
queue-4.4/powerpc-64s-enhance-the-information-in-cpu_show_spectre_v1.patch
queue-4.4/powerpc-64-call-setup_barrier_nospec-from-setup_arch.patch
queue-4.4/powerpc-rfi-flush-always-enable-fallback-flush-on-pseries.patch
queue-4.4/powerpc-64s-improve-rfi-l1-d-cache-flush-fallback.patch
queue-4.4/powerpc-asm-add-a-patch_site-macro-helpers-for-patching-instructions.patch
queue-4.4/powerpc-pseries-add-new-h_get_cpu_characteristics-flags.patch
queue-4.4/powerpc-64s-enable-barrier_nospec-based-on-firmware-settings.patch
queue-4.4/powerpc-powernv-support-firmware-disable-of-rfi-flush.patch
queue-4.4/powerpc-rfi-flush-move-the-logic-to-avoid-a-redo-into-the-debugfs-code.patch
queue-4.4/powerpc-powernv-query-firmware-for-count-cache-flush-settings.patch
queue-4.4/powerpc-64s-wire-up-cpu_show_spectre_v1.patch
queue-4.4/powerpc-64s-add-barrier_nospec.patch
queue-4.4/powerpc-64s-enhance-the-information-in-cpu_show_meltdown.patch
queue-4.4/powerpc-move-default-security-feature-flags.patch
queue-4.4/powerpc-pseries-fix-clearing-of-security-feature-flags.patch
queue-4.4/powerpc-pseries-restore-default-security-feature-flags-on-setup.patch
