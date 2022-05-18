Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7431552BD8B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 16:27:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L3FgJ2zJXz3cDf
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 May 2022 00:27:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=h64CfWLn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L3Ffj4T8Pz3c1K
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 May 2022 00:26:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=h64CfWLn; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4L3Ffj3X8yz4xXn;
 Thu, 19 May 2022 00:26:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1652883997;
 bh=hwMCErkIOXv7XSecVpNDbKAAgMQDrUk9YOniBMytWfc=;
 h=From:To:Subject:Date:From;
 b=h64CfWLndlrGYLS+CvMjd+6jLcNL3vh4pwSTZ4U+7KiTzit8x9ZNniDzmE9t6Xrju
 czUFp7jg+VAF97weetVPLHgsxS12I1kbktrymM35d76BP5WKf7FXwn5ldcVjGy8S4f
 D7H1QnMrJ36r4/M5v4zL/VEmsZsYvmEuQYDWBD2vrjz06LptREwyN6XV3n+Y0Eyqql
 xjGSG6Di2fopcvkVF4VMY7oRkBgovapHAtO0VKxkN0TTVGIhs4GrmrxRrt+ppfH0Oq
 D1dK3kCafycblT2HrRtMOWM+ZV1krGswdLQrz8G/fyISfTc1WSSVxjXU8FeXH61oiu
 1iIalm5yHk96g==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc: Fix all occurences of "the the"
Date: Thu, 19 May 2022 00:26:29 +1000
Message-Id: <20220518142629.513007-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.35.3
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Rather than waiting for the bots to fix these one-by-one, fix all
occurences of "the the" throughout arch/powerpc.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/boot/wrapper                  | 2 +-
 arch/powerpc/kernel/eeh_pe.c               | 2 +-
 arch/powerpc/kernel/head_64.S              | 2 +-
 arch/powerpc/kernel/pci-common.c           | 2 +-
 arch/powerpc/kernel/smp.c                  | 2 +-
 arch/powerpc/kvm/book3s_64_entry.S         | 2 +-
 arch/powerpc/kvm/book3s_xive_native.c      | 2 +-
 arch/powerpc/mm/cacheflush.c               | 2 +-
 arch/powerpc/mm/pgtable.c                  | 2 +-
 arch/powerpc/platforms/52xx/mpc52xx_gpt.c  | 2 +-
 arch/powerpc/platforms/chrp/setup.c        | 2 +-
 arch/powerpc/platforms/powernv/pci-ioda.c  | 2 +-
 arch/powerpc/platforms/powernv/pci-sriov.c | 2 +-
 arch/powerpc/xmon/xmon.c                   | 2 +-
 14 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/boot/wrapper b/arch/powerpc/boot/wrapper
index 9184eda780fd..55978f32fa77 100755
--- a/arch/powerpc/boot/wrapper
+++ b/arch/powerpc/boot/wrapper
@@ -162,7 +162,7 @@ while [ "$#" -gt 0 ]; do
 	fi
 	;;
     --no-gzip)
-        # a "feature" of the the wrapper script is that it can be used outside
+        # a "feature" of the wrapper script is that it can be used outside
         # the kernel tree. So keeping this around for backwards compatibility.
         compression=
 	uboot_comp=none
diff --git a/arch/powerpc/kernel/eeh_pe.c b/arch/powerpc/kernel/eeh_pe.c
index d7a9cf376831..d2873d17d2b1 100644
--- a/arch/powerpc/kernel/eeh_pe.c
+++ b/arch/powerpc/kernel/eeh_pe.c
@@ -302,7 +302,7 @@ struct eeh_pe *eeh_pe_get(struct pci_controller *phb, int pe_no)
  * @new_pe_parent.
  *
  * If @new_pe_parent is NULL then the new PE will be inserted under
- * directly under the the PHB.
+ * directly under the PHB.
  */
 int eeh_pe_tree_insert(struct eeh_dev *edev, struct eeh_pe *new_pe_parent)
 {
diff --git a/arch/powerpc/kernel/head_64.S b/arch/powerpc/kernel/head_64.S
index f85660d054bd..d3eea633d11a 100644
--- a/arch/powerpc/kernel/head_64.S
+++ b/arch/powerpc/kernel/head_64.S
@@ -111,7 +111,7 @@ END_FTR_SECTION(0, 1)
 #ifdef CONFIG_RELOCATABLE
 	/* This flag is set to 1 by a loader if the kernel should run
 	 * at the loaded address instead of the linked address.  This
-	 * is used by kexec-tools to keep the the kdump kernel in the
+	 * is used by kexec-tools to keep the kdump kernel in the
 	 * crash_kernel region.  The loader is responsible for
 	 * observing the alignment requirement.
 	 */
diff --git a/arch/powerpc/kernel/pci-common.c b/arch/powerpc/kernel/pci-common.c
index 63ed90ba9f0b..068410cd54a3 100644
--- a/arch/powerpc/kernel/pci-common.c
+++ b/arch/powerpc/kernel/pci-common.c
@@ -42,7 +42,7 @@
 
 #include "../../../drivers/pci/pci.h"
 
-/* hose_spinlock protects accesses to the the phb_bitmap. */
+/* hose_spinlock protects accesses to the phb_bitmap. */
 static DEFINE_SPINLOCK(hose_spinlock);
 LIST_HEAD(hose_list);
 
diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 4335efcb3184..bcefab484ea6 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -874,7 +874,7 @@ static int parse_thread_groups(struct device_node *dn,
  * @tg : The thread-group structure of the CPU node which @cpu belongs
  *       to.
  *
- * Returns the index to tg->thread_list that points to the the start
+ * Returns the index to tg->thread_list that points to the start
  * of the thread_group that @cpu belongs to.
  *
  * Returns -1 if cpu doesn't belong to any of the groups pointed to by
diff --git a/arch/powerpc/kvm/book3s_64_entry.S b/arch/powerpc/kvm/book3s_64_entry.S
index e42d1c609e47..e43704547a1e 100644
--- a/arch/powerpc/kvm/book3s_64_entry.S
+++ b/arch/powerpc/kvm/book3s_64_entry.S
@@ -124,7 +124,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 
 /*
  * "Skip" interrupts are part of a trick KVM uses a with hash guests to load
- * the faulting instruction in guest memory from the the hypervisor without
+ * the faulting instruction in guest memory from the hypervisor without
  * walking page tables.
  *
  * When the guest takes a fault that requires the hypervisor to load the
diff --git a/arch/powerpc/kvm/book3s_xive_native.c b/arch/powerpc/kvm/book3s_xive_native.c
index f81ba6f84e72..5271c33fe79e 100644
--- a/arch/powerpc/kvm/book3s_xive_native.c
+++ b/arch/powerpc/kvm/book3s_xive_native.c
@@ -209,7 +209,7 @@ static int kvmppc_xive_native_reset_mapped(struct kvm *kvm, unsigned long irq)
 
 	/*
 	 * Clear the ESB pages of the IRQ number being mapped (or
-	 * unmapped) into the guest and let the the VM fault handler
+	 * unmapped) into the guest and let the VM fault handler
 	 * repopulate with the appropriate ESB pages (device or IC)
 	 */
 	pr_debug("clearing esb pages for girq 0x%lx\n", irq);
diff --git a/arch/powerpc/mm/cacheflush.c b/arch/powerpc/mm/cacheflush.c
index 63363787e000..0e9b4879c0f9 100644
--- a/arch/powerpc/mm/cacheflush.c
+++ b/arch/powerpc/mm/cacheflush.c
@@ -12,7 +12,7 @@ static inline bool flush_coherent_icache(void)
 	/*
 	 * For a snooping icache, we still need a dummy icbi to purge all the
 	 * prefetched instructions from the ifetch buffers. We also need a sync
-	 * before the icbi to order the the actual stores to memory that might
+	 * before the icbi to order the actual stores to memory that might
 	 * have modified instructions with the icbi.
 	 */
 	if (cpu_has_feature(CPU_FTR_COHERENT_ICACHE)) {
diff --git a/arch/powerpc/mm/pgtable.c b/arch/powerpc/mm/pgtable.c
index 6ec5a7dd7913..e6166b71d36d 100644
--- a/arch/powerpc/mm/pgtable.c
+++ b/arch/powerpc/mm/pgtable.c
@@ -351,7 +351,7 @@ EXPORT_SYMBOL_GPL(vmalloc_to_phys);
  * (4) hugepd pointer, _PAGE_PTE = 0 and bits [2..6] indicate size of table
  *
  * So long as we atomically load page table pointers we are safe against teardown,
- * we can follow the address down to the the page and take a ref on it.
+ * we can follow the address down to the page and take a ref on it.
  * This function need to be called with interrupts disabled. We use this variant
  * when we have MSR[EE] = 0 but the paca->irq_soft_mask = IRQS_ENABLED
  */
diff --git a/arch/powerpc/platforms/52xx/mpc52xx_gpt.c b/arch/powerpc/platforms/52xx/mpc52xx_gpt.c
index 60691b9a248c..968f5b727273 100644
--- a/arch/powerpc/platforms/52xx/mpc52xx_gpt.c
+++ b/arch/powerpc/platforms/52xx/mpc52xx_gpt.c
@@ -5,7 +5,7 @@
  * Copyright (c) 2009 Secret Lab Technologies Ltd.
  * Copyright (c) 2008 Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
  *
- * This file is a driver for the the General Purpose Timer (gpt) devices
+ * This file is a driver for the General Purpose Timer (gpt) devices
  * found on the MPC5200 SoC.  Each timer has an IO pin which can be used
  * for GPIO or can be used to raise interrupts.  The timer function can
  * be used independently from the IO pin, or it can be used to control
diff --git a/arch/powerpc/platforms/chrp/setup.c b/arch/powerpc/platforms/chrp/setup.c
index ef4c2b15f9dd..5d237da43b64 100644
--- a/arch/powerpc/platforms/chrp/setup.c
+++ b/arch/powerpc/platforms/chrp/setup.c
@@ -253,7 +253,7 @@ static void __noreturn briq_restart(char *cmd)
  * Per default, input/output-device points to the keyboard/screen
  * If no card is installed, the built-in serial port is used as a fallback.
  * But unfortunately, the firmware does not connect /chosen/{stdin,stdout}
- * the the built-in serial node. Instead, a /failsafe node is created.
+ * the built-in serial node. Instead, a /failsafe node is created.
  */
 static __init void chrp_init(void)
 {
diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index 6fbf265a0818..d9e16f8a652d 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -2384,7 +2384,7 @@ static void pnv_ioda_setup_pe_res(struct pnv_ioda_pe *pe,
 
 /*
  * This function is supposed to be called on basis of PE from top
- * to bottom style. So the the I/O or MMIO segment assigned to
+ * to bottom style. So the I/O or MMIO segment assigned to
  * parent PE could be overridden by its child PEs if necessary.
  */
 static void pnv_ioda_setup_pe_seg(struct pnv_ioda_pe *pe)
diff --git a/arch/powerpc/platforms/powernv/pci-sriov.c b/arch/powerpc/platforms/powernv/pci-sriov.c
index fe3d111b881c..7195133b26bb 100644
--- a/arch/powerpc/platforms/powernv/pci-sriov.c
+++ b/arch/powerpc/platforms/powernv/pci-sriov.c
@@ -22,7 +22,7 @@
  * have the same requirement.
  *
  * For a SR-IOV BAR things are a little more awkward since size and alignment
- * are not coupled. The alignment is set based on the the per-VF BAR size, but
+ * are not coupled. The alignment is set based on the per-VF BAR size, but
  * the total BAR area is: number-of-vfs * per-vf-size. The number of VFs
  * isn't necessarily a power of two, so neither is the total size. To fix that
  * we need to finesse (read: hack) the Linux BAR allocator so that it will
diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index 2b7e99697757..fff81c2300fa 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -372,7 +372,7 @@ static void write_ciabr(unsigned long ciabr)
  * set_ciabr() - set the CIABR
  * @addr:	The value to set.
  *
- * This function sets the correct privilege value into the the HW
+ * This function sets the correct privilege value into the HW
  * breakpoint address before writing it up in the CIABR register.
  */
 static void set_ciabr(unsigned long addr)
-- 
2.35.3

