Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 770C8577F0A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Jul 2022 11:52:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LmchR3yV2z3c4W
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Jul 2022 19:52:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=b0my2ZDu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lmcgr1DPrz2xKw
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Jul 2022 19:52:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=b0my2ZDu;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Lmcgl6sc4z4xXD;
	Mon, 18 Jul 2022 19:52:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1658137924;
	bh=2LvJrxBicusYvjT5+8DN8it0CgPCdqPhM5Ht2cHBWCA=;
	h=From:To:Subject:Date:From;
	b=b0my2ZDuiGbBpXIYchQwH1AEL8lIQzVAHqXgUGT0l/7PNaj2w+NLTRgnLsT6yynGj
	 8eHacPDFZWmQ5W32rN8VA0WOJxKct2jtncRewvDAk61ZginquEx2gH3BoDBpqkPg7Z
	 //thcszHI6SRg0INRlgDngv+3PfGAsHUmV3LjhpN+PQuJF9x2Vp7+s6+E3ZLJcS2bx
	 76ATfRGY7hv/ZdNg3G841jWCDDE55dkiIxIzZYtrCs7ROKA4MKdNn93CDBddW2Stdv
	 wllqQ93ryaeM04QIvjasjiV6VYOkcXbOug/Z1D6IaMoBDUVlyM3Tr6RDR6ZIPgOhxD
	 6TXNXDTs22r2g==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc: Fix all occurences of duplicate words
Date: Mon, 18 Jul 2022 19:51:58 +1000
Message-Id: <20220718095158.326606-1-mpe@ellerman.id.au>
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Since commit 87c78b612f4f ("powerpc: Fix all occurences of "the the"")
fixed "the the", there's now a steady stream of patches fixing other
duplicate words.

Just fix them all at once, to save the overhead of dealing with
individual patches for each case.

This leaves a few cases of "that that", which in some contexts is
correct.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/crypto/aes-spe-glue.c           | 2 +-
 arch/powerpc/kernel/btext.c                  | 2 +-
 arch/powerpc/kernel/eeh_driver.c             | 2 +-
 arch/powerpc/kernel/exceptions-64s.S         | 2 +-
 arch/powerpc/kernel/pci-common.c             | 2 +-
 arch/powerpc/kernel/pci_dn.c                 | 2 +-
 arch/powerpc/kernel/ptrace/ptrace-vsx.c      | 2 +-
 arch/powerpc/kernel/trace/ftrace.c           | 6 +++---
 arch/powerpc/kernel/watchdog.c               | 2 +-
 arch/powerpc/kvm/book3s_hv.c                 | 2 +-
 arch/powerpc/mm/book3s64/hash_utils.c        | 2 +-
 arch/powerpc/platforms/4xx/cpm.c             | 2 +-
 arch/powerpc/platforms/powernv/vas-fault.c   | 2 +-
 arch/powerpc/platforms/pseries/eeh_pseries.c | 2 +-
 arch/powerpc/platforms/pseries/papr_scm.c    | 2 +-
 15 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/arch/powerpc/crypto/aes-spe-glue.c b/arch/powerpc/crypto/aes-spe-glue.c
index e8dfe9fb0266..efab78a3a8f6 100644
--- a/arch/powerpc/crypto/aes-spe-glue.c
+++ b/arch/powerpc/crypto/aes-spe-glue.c
@@ -28,7 +28,7 @@
  * instructions per clock cycle using one 32/64 bit unit (SU1) and one 32
  * bit unit (SU2). One of these can be a memory access that is executed via
  * a single load and store unit (LSU). XTS-AES-256 takes ~780 operations per
- * 16 byte block block or 25 cycles per byte. Thus 768 bytes of input data
+ * 16 byte block or 25 cycles per byte. Thus 768 bytes of input data
  * will need an estimated maximum of 20,000 cycles. Headroom for cache misses
  * included. Even with the low end model clocked at 667 MHz this equals to a
  * critical time window of less than 30us. The value has been chosen to
diff --git a/arch/powerpc/kernel/btext.c b/arch/powerpc/kernel/btext.c
index 8f69bb07e500..2769889219bf 100644
--- a/arch/powerpc/kernel/btext.c
+++ b/arch/powerpc/kernel/btext.c
@@ -73,7 +73,7 @@ static inline void rmci_maybe_off(void)
  * the display during identify_machine() and MMU_Init()
  *
  * The display is mapped to virtual address 0xD0000000, rather
- * than 1:1, because some some CHRP machines put the frame buffer
+ * than 1:1, because some CHRP machines put the frame buffer
  * in the region starting at 0xC0000000 (PAGE_OFFSET).
  * This mapping is temporary and will disappear as soon as the
  * setup done by MMU_Init() is applied.
diff --git a/arch/powerpc/kernel/eeh_driver.c b/arch/powerpc/kernel/eeh_driver.c
index 260273e56431..f279295179bd 100644
--- a/arch/powerpc/kernel/eeh_driver.c
+++ b/arch/powerpc/kernel/eeh_driver.c
@@ -750,7 +750,7 @@ static void eeh_pe_cleanup(struct eeh_pe *pe)
  * @pdev: pci_dev to check
  *
  * This function may return a false positive if we can't determine the slot's
- * presence state. This might happen for for PCIe slots if the PE containing
+ * presence state. This might happen for PCIe slots if the PE containing
  * the upstream bridge is also frozen, or the bridge is part of the same PE
  * as the device.
  *
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index b66dd6f775a4..3d0dc133a9ae 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -2779,7 +2779,7 @@ EXC_COMMON_BEGIN(soft_nmi_common)
 
 /*
  * An interrupt came in while soft-disabled. We set paca->irq_happened, then:
- * - If it was a decrementer interrupt, we bump the dec to max and and return.
+ * - If it was a decrementer interrupt, we bump the dec to max and return.
  * - If it was a doorbell we return immediately since doorbells are edge
  *   triggered and won't automatically refire.
  * - If it was a HMI we return immediately since we handled it in realmode
diff --git a/arch/powerpc/kernel/pci-common.c b/arch/powerpc/kernel/pci-common.c
index c87999289752..cbb912ee92fa 100644
--- a/arch/powerpc/kernel/pci-common.c
+++ b/arch/powerpc/kernel/pci-common.c
@@ -1088,7 +1088,7 @@ void pcibios_fixup_bus(struct pci_bus *bus)
 	 */
 	pci_read_bridge_bases(bus);
 
-	/* Now fixup the bus bus */
+	/* Now fixup the bus */
 	pcibios_setup_bus_self(bus);
 }
 EXPORT_SYMBOL(pcibios_fixup_bus);
diff --git a/arch/powerpc/kernel/pci_dn.c b/arch/powerpc/kernel/pci_dn.c
index 938ab8838ab5..7a35fc25a304 100644
--- a/arch/powerpc/kernel/pci_dn.c
+++ b/arch/powerpc/kernel/pci_dn.c
@@ -259,7 +259,7 @@ void remove_sriov_vf_pdns(struct pci_dev *pdev)
 			if (edev) {
 				/*
 				 * We allocate pci_dn's for the totalvfs count,
-				 * but only only the vfs that were activated
+				 * but only the vfs that were activated
 				 * have a configured PE.
 				 */
 				if (edev->pe)
diff --git a/arch/powerpc/kernel/ptrace/ptrace-vsx.c b/arch/powerpc/kernel/ptrace/ptrace-vsx.c
index 1da4303128ef..7df08004c47d 100644
--- a/arch/powerpc/kernel/ptrace/ptrace-vsx.c
+++ b/arch/powerpc/kernel/ptrace/ptrace-vsx.c
@@ -71,7 +71,7 @@ int fpr_set(struct task_struct *target, const struct user_regset *regset,
 }
 
 /*
- * Currently to set and and get all the vsx state, you need to call
+ * Currently to set and get all the vsx state, you need to call
  * the fp and VMX calls as well.  This only get/sets the lower 32
  * 128bit VSX registers.
  */
diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
index cab67b5120b9..cb158c32b50b 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -125,7 +125,7 @@ __ftrace_make_nop(struct module *mod,
 		return -EFAULT;
 	}
 
-	/* Make sure that that this is still a 24bit jump */
+	/* Make sure that this is still a 24bit jump */
 	if (!is_bl_op(op)) {
 		pr_err("Not expected bl: opcode is %08lx\n", ppc_inst_as_ulong(op));
 		return -EINVAL;
@@ -311,7 +311,7 @@ static int __ftrace_make_nop_kernel(struct dyn_ftrace *rec, unsigned long addr)
 		return -EFAULT;
 	}
 
-	/* Make sure that that this is still a 24bit jump */
+	/* Make sure that this is still a 24bit jump */
 	if (!is_bl_op(op)) {
 		pr_err("Not expected bl: opcode is %08lx\n", ppc_inst_as_ulong(op));
 		return -EINVAL;
@@ -564,7 +564,7 @@ __ftrace_modify_call(struct dyn_ftrace *rec, unsigned long old_addr,
 		return -EFAULT;
 	}
 
-	/* Make sure that that this is still a 24bit jump */
+	/* Make sure that this is still a 24bit jump */
 	if (!is_bl_op(op)) {
 		pr_err("Not expected bl: opcode is %08lx\n", ppc_inst_as_ulong(op));
 		return -EINVAL;
diff --git a/arch/powerpc/kernel/watchdog.c b/arch/powerpc/kernel/watchdog.c
index 7d28b9553654..dd882d00845d 100644
--- a/arch/powerpc/kernel/watchdog.c
+++ b/arch/powerpc/kernel/watchdog.c
@@ -353,7 +353,7 @@ static void watchdog_timer_interrupt(int cpu)
 	if (__wd_nmi_output && xchg(&__wd_nmi_output, 0)) {
 		/*
 		 * Something has called printk from NMI context. It might be
-		 * stuck, so this this triggers a flush that will get that
+		 * stuck, so this triggers a flush that will get that
 		 * printk output to the console.
 		 *
 		 * See wd_lockup_ipi.
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index c68883170a82..529b6c6895bf 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -5665,7 +5665,7 @@ static int kvmppc_clr_passthru_irq(struct kvm *kvm, int host_irq, int guest_gsi)
 	else
 		kvmppc_xics_clr_mapped(kvm, guest_gsi, pimap->mapped[i].r_hwirq);
 
-	/* invalidate the entry (what do do on error from the above ?) */
+	/* invalidate the entry (what to do on error from the above ?) */
 	pimap->mapped[i].r_hwirq = 0;
 
 	/*
diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index fc92613dc2bf..363a9447d63d 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -408,7 +408,7 @@ int htab_bolt_mapping(unsigned long vstart, unsigned long vend,
 					       ssize);
 		if (ret == -1) {
 			/*
-			 * Try to to keep bolted entries in primary.
+			 * Try to keep bolted entries in primary.
 			 * Remove non bolted entries and try insert again
 			 */
 			ret = mmu_hash_ops.hpte_remove(hpteg);
diff --git a/arch/powerpc/platforms/4xx/cpm.c b/arch/powerpc/platforms/4xx/cpm.c
index 1d3bc35ee1a7..182e12855c27 100644
--- a/arch/powerpc/platforms/4xx/cpm.c
+++ b/arch/powerpc/platforms/4xx/cpm.c
@@ -63,7 +63,7 @@ static unsigned int cpm_set(unsigned int cpm_reg, unsigned int mask)
 	 * known as class 1, 2 and 3. For class 1 units, they are
 	 * unconditionally put to sleep when the corresponding CPM bit is
 	 * set. For class 2 and 3 units this is not case; if they can be
-	 * put to to sleep, they will. Here we do not verify, we just
+	 * put to sleep, they will. Here we do not verify, we just
 	 * set them and expect them to eventually go off when they can.
 	 */
 	value = dcr_read(cpm.dcr_host, cpm.dcr_offset[cpm_reg]);
diff --git a/arch/powerpc/platforms/powernv/vas-fault.c b/arch/powerpc/platforms/powernv/vas-fault.c
index c1bfad56447d..2b47d5a86328 100644
--- a/arch/powerpc/platforms/powernv/vas-fault.c
+++ b/arch/powerpc/platforms/powernv/vas-fault.c
@@ -77,7 +77,7 @@ irqreturn_t vas_fault_thread_fn(int irq, void *data)
 	/*
 	 * VAS can interrupt with multiple page faults. So process all
 	 * valid CRBs within fault FIFO until reaches invalid CRB.
-	 * We use CCW[0] and pswid to validate validate CRBs:
+	 * We use CCW[0] and pswid to validate CRBs:
 	 *
 	 * CCW[0]	Reserved bit. When NX pastes CRB, CCW[0]=0
 	 *		OS sets this bit to 1 after reading CRB.
diff --git a/arch/powerpc/platforms/pseries/eeh_pseries.c b/arch/powerpc/platforms/pseries/eeh_pseries.c
index 1b0c901a6f3b..8e40ccac0f44 100644
--- a/arch/powerpc/platforms/pseries/eeh_pseries.c
+++ b/arch/powerpc/platforms/pseries/eeh_pseries.c
@@ -71,7 +71,7 @@ static void pseries_pcibios_bus_add_device(struct pci_dev *pdev)
 	if (pdev->is_virtfn) {
 		/*
 		 * FIXME: This really should be handled by choosing the right
-		 *        parent PE in in pseries_eeh_init_edev().
+		 *        parent PE in pseries_eeh_init_edev().
 		 */
 		struct eeh_pe *physfn_pe = pci_dev_to_eeh_dev(pdev->physfn)->pe;
 		struct eeh_dev *edev = pdn_to_eeh_dev(pdn);
diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
index 69f21d30394b..20f6ed813bff 100644
--- a/arch/powerpc/platforms/pseries/papr_scm.c
+++ b/arch/powerpc/platforms/pseries/papr_scm.c
@@ -29,7 +29,7 @@
 	 (1ul << ND_CMD_SET_CONFIG_DATA) | \
 	 (1ul << ND_CMD_CALL))
 
-/* DIMM health bitmap bitmap indicators */
+/* DIMM health bitmap indicators */
 /* SCM device is unable to persist memory contents */
 #define PAPR_PMEM_UNARMED                   (1ULL << (63 - 0))
 /* SCM device failed to persist memory contents */
-- 
2.35.3

