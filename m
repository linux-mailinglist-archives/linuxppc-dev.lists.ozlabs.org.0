Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B59CDE06C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2019 12:21:15 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44t1091mWWzDqPG
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2019 20:21:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44t0Lw5HVFzDqPb
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Apr 2019 19:52:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="JHUwb3nI"; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 44t0Lw2x28z8tDC
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Apr 2019 19:52:24 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 44t0Lw123qz9s70; Mon, 29 Apr 2019 19:52:24 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linuxfoundation.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="JHUwb3nI"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 44t0Lt5bCDz9sCJ
 for <linuxppc-dev@ozlabs.org>; Mon, 29 Apr 2019 19:52:22 +1000 (AEST)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C66E620449;
 Mon, 29 Apr 2019 09:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556531541;
 bh=A+Y/pcw62qhBPyAVHZQoAerX67/4/apJZK8MDsjI/5Y=;
 h=Subject:To:Cc:From:Date:In-Reply-To:From;
 b=JHUwb3nIegqhItOdSOIYjCGDE7do8brmlTFrNT7UqhwqPaeBw0HSgIt/YIBH3t5kE
 w65PqVYNiLBJ1K4rbYlx3Y7+IQz9avqkSgnogXuNAn4GwRKlWgL2NqTKMUDVL7Un0j
 8AexKyAUTdQweKIJvMe622WQPKgPgyBFWyXwONek=
Subject: Patch "powerpc: Add security feature flags for Spectre/Meltdown" has
 been added to the 4.4-stable tree
To: christophe.leroy@c-s.fr, diana.craciun@nxp.com, gregkh@linuxfoundation.org,
 linuxppc-dev@ozlabs.org, mpe@ellerman.id.au, msuchanek@suse.de,
 npiggin@gmail.com
From: <gregkh@linuxfoundation.org>
Date: Mon, 29 Apr 2019 11:51:24 +0200
In-Reply-To: <20190421142037.21881-12-mpe@ellerman.id.au>
Message-ID: <1556531484152164@kroah.com>
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

    powerpc: Add security feature flags for Spectre/Meltdown

to the 4.4-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     powerpc-add-security-feature-flags-for-spectre-meltdown.patch
and it can be found in the queue-4.4 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From foo@baz Mon 29 Apr 2019 11:38:37 AM CEST
From: Michael Ellerman <mpe@ellerman.id.au>
Date: Mon, 22 Apr 2019 00:19:56 +1000
Subject: powerpc: Add security feature flags for Spectre/Meltdown
To: stable@vger.kernel.org, gregkh@linuxfoundation.org
Cc: linuxppc-dev@ozlabs.org, diana.craciun@nxp.com, msuchanek@suse.de, npiggin@gmail.com, christophe.leroy@c-s.fr
Message-ID: <20190421142037.21881-12-mpe@ellerman.id.au>

From: Michael Ellerman <mpe@ellerman.id.au>

commit 9a868f634349e62922c226834aa23e3d1329ae7f upstream.

This commit adds security feature flags to reflect the settings we
receive from firmware regarding Spectre/Meltdown mitigations.

The feature names reflect the names we are given by firmware on bare
metal machines. See the hostboot source for details.

Arguably these could be firmware features, but that then requires them
to be read early in boot so they're available prior to asm feature
patching, but we don't actually want to use them for patching. We may
also want to dynamically update them in future, which would be
incompatible with the way firmware features work (at the moment at
least). So for now just make them separate flags.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/powerpc/include/asm/security_features.h |   65 +++++++++++++++++++++++++++
 arch/powerpc/kernel/Makefile                 |    2 
 arch/powerpc/kernel/security.c               |   15 ++++++
 3 files changed, 81 insertions(+), 1 deletion(-)
 create mode 100644 arch/powerpc/include/asm/security_features.h
 create mode 100644 arch/powerpc/kernel/security.c

--- /dev/null
+++ b/arch/powerpc/include/asm/security_features.h
@@ -0,0 +1,65 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Security related feature bit definitions.
+ *
+ * Copyright 2018, Michael Ellerman, IBM Corporation.
+ */
+
+#ifndef _ASM_POWERPC_SECURITY_FEATURES_H
+#define _ASM_POWERPC_SECURITY_FEATURES_H
+
+
+extern unsigned long powerpc_security_features;
+
+static inline void security_ftr_set(unsigned long feature)
+{
+	powerpc_security_features |= feature;
+}
+
+static inline void security_ftr_clear(unsigned long feature)
+{
+	powerpc_security_features &= ~feature;
+}
+
+static inline bool security_ftr_enabled(unsigned long feature)
+{
+	return !!(powerpc_security_features & feature);
+}
+
+
+// Features indicating support for Spectre/Meltdown mitigations
+
+// The L1-D cache can be flushed with ori r30,r30,0
+#define SEC_FTR_L1D_FLUSH_ORI30		0x0000000000000001ull
+
+// The L1-D cache can be flushed with mtspr 882,r0 (aka SPRN_TRIG2)
+#define SEC_FTR_L1D_FLUSH_TRIG2		0x0000000000000002ull
+
+// ori r31,r31,0 acts as a speculation barrier
+#define SEC_FTR_SPEC_BAR_ORI31		0x0000000000000004ull
+
+// Speculation past bctr is disabled
+#define SEC_FTR_BCCTRL_SERIALISED	0x0000000000000008ull
+
+// Entries in L1-D are private to a SMT thread
+#define SEC_FTR_L1D_THREAD_PRIV		0x0000000000000010ull
+
+// Indirect branch prediction cache disabled
+#define SEC_FTR_COUNT_CACHE_DISABLED	0x0000000000000020ull
+
+
+// Features indicating need for Spectre/Meltdown mitigations
+
+// The L1-D cache should be flushed on MSR[HV] 1->0 transition (hypervisor to guest)
+#define SEC_FTR_L1D_FLUSH_HV		0x0000000000000040ull
+
+// The L1-D cache should be flushed on MSR[PR] 0->1 transition (kernel to userspace)
+#define SEC_FTR_L1D_FLUSH_PR		0x0000000000000080ull
+
+// A speculation barrier should be used for bounds checks (Spectre variant 1)
+#define SEC_FTR_BNDS_CHK_SPEC_BAR	0x0000000000000100ull
+
+// Firmware configuration indicates user favours security over performance
+#define SEC_FTR_FAVOUR_SECURITY		0x0000000000000200ull
+
+#endif /* _ASM_POWERPC_SECURITY_FEATURES_H */
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -40,7 +40,7 @@ obj-$(CONFIG_PPC64)		+= setup_64.o sys_p
 obj-$(CONFIG_VDSO32)		+= vdso32/
 obj-$(CONFIG_HAVE_HW_BREAKPOINT)	+= hw_breakpoint.o
 obj-$(CONFIG_PPC_BOOK3S_64)	+= cpu_setup_ppc970.o cpu_setup_pa6t.o
-obj-$(CONFIG_PPC_BOOK3S_64)	+= cpu_setup_power.o
+obj-$(CONFIG_PPC_BOOK3S_64)	+= cpu_setup_power.o security.o
 obj-$(CONFIG_PPC_BOOK3S_64)	+= mce.o mce_power.o
 obj64-$(CONFIG_RELOCATABLE)	+= reloc_64.o
 obj-$(CONFIG_PPC_BOOK3E_64)	+= exceptions-64e.o idle_book3e.o
--- /dev/null
+++ b/arch/powerpc/kernel/security.c
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0+
+//
+// Security related flags and so on.
+//
+// Copyright 2018, Michael Ellerman, IBM Corporation.
+
+#include <linux/kernel.h>
+#include <asm/security_features.h>
+
+
+unsigned long powerpc_security_features __read_mostly = \
+	SEC_FTR_L1D_FLUSH_HV | \
+	SEC_FTR_L1D_FLUSH_PR | \
+	SEC_FTR_BNDS_CHK_SPEC_BAR | \
+	SEC_FTR_FAVOUR_SECURITY;


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
