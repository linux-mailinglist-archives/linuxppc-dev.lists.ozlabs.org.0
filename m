Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ED611515FF2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Apr 2022 20:58:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KrJY76fwsz3bmT
	for <lists+linuxppc-dev@lfdr.de>; Sun,  1 May 2022 04:58:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b=lVolmutP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=inria.fr (client-ip=192.134.164.83;
 helo=mail2-relais-roc.national.inria.fr; envelope-from=julia.lawall@inria.fr;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256
 header.s=dc header.b=lVolmutP; dkim-atps=neutral
X-Greylist: delayed 64 seconds by postgrey-1.36 at boromir;
 Sun, 01 May 2022 04:58:10 AEST
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KrJXL0xKRz3bZP
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  1 May 2022 04:58:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inria.fr; s=dc;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=grOdIriLcsbLskOTRR9j39G2z5ZR0A51q1KfJevMEpc=;
 b=lVolmutPRtcC027cTS90Gm8t3DaXWcRFE05SKSHeJq4rBNNQybUHEdPU
 ZtkbP4EYYJAsOloRWf4Ws1jZ2A7Nvp/n6RalNLQw65HR7X0vCD+WqeSQ7
 3jGYSMI349GdD+v54OUbPBdwsJfXRrPLrH8vu/nIkwUNItDOX1Lg1ifuN A=;
Authentication-Results: mail2-relais-roc.national.inria.fr;
 dkim=none (message not signed) header.i=none;
 spf=SoftFail smtp.mailfrom=Julia.Lawall@inria.fr;
 dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.91,188,1647298800"; d="scan'208";a="34082178"
Received: from i80.paris.inria.fr (HELO i80.paris.inria.fr.) ([128.93.90.48])
 by mail2-relais-roc.national.inria.fr with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2022 20:56:59 +0200
From: Julia Lawall <Julia.Lawall@inria.fr>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
Subject: [PATCH] powerpc: fix typos in comments
Date: Sat, 30 Apr 2022 20:56:54 +0200
Message-Id: <20220430185654.5855-1-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 2.20.1
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
Cc: linuxppc-dev@lists.ozlabs.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Various spelling mistakes in comments.
Detected with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 arch/powerpc/boot/cuboot-hotfoot.c                  |    2 +-
 arch/powerpc/crypto/aes-spe-glue.c                  |    2 +-
 arch/powerpc/kernel/cputable.c                      |    2 +-
 arch/powerpc/kernel/dawr.c                          |    2 +-
 arch/powerpc/kernel/eeh.c                           |    4 ++--
 arch/powerpc/kernel/eeh_event.c                     |    2 +-
 arch/powerpc/kernel/fadump.c                        |   10 +++++-----
 arch/powerpc/kernel/module_32.c                     |    2 +-
 arch/powerpc/kernel/module_64.c                     |    4 ++--
 arch/powerpc/kernel/pci-common.c                    |    2 +-
 arch/powerpc/kernel/pci_of_scan.c                   |    2 +-
 arch/powerpc/kernel/process.c                       |    4 ++--
 arch/powerpc/kernel/prom_init.c                     |    2 +-
 arch/powerpc/kernel/ptrace/ptrace-view.c            |    2 +-
 arch/powerpc/kernel/rtas_flash.c                    |    2 +-
 arch/powerpc/kernel/setup-common.c                  |    2 +-
 arch/powerpc/kernel/signal_64.c                     |    2 +-
 arch/powerpc/kernel/smp.c                           |    2 +-
 arch/powerpc/kernel/time.c                          |    4 ++--
 arch/powerpc/kernel/watchdog.c                      |    2 +-
 arch/powerpc/kexec/core_64.c                        |    2 +-
 arch/powerpc/kvm/book3s_64_mmu_hv.c                 |    2 +-
 arch/powerpc/kvm/book3s_64_vio_hv.c                 |    2 +-
 arch/powerpc/kvm/book3s_emulate.c                   |    2 +-
 arch/powerpc/kvm/book3s_hv_p9_entry.c               |    2 +-
 arch/powerpc/kvm/book3s_hv_uvmem.c                  |    2 +-
 arch/powerpc/kvm/book3s_pr.c                        |    2 +-
 arch/powerpc/kvm/book3s_xics.c                      |    2 +-
 arch/powerpc/kvm/book3s_xive.c                      |    6 +++---
 arch/powerpc/kvm/e500mc.c                           |    2 +-
 arch/powerpc/mm/book3s64/hash_pgtable.c             |    2 +-
 arch/powerpc/mm/book3s64/hash_utils.c               |    4 ++--
 arch/powerpc/mm/book3s64/pgtable.c                  |    2 +-
 arch/powerpc/mm/book3s64/radix_pgtable.c            |    2 +-
 arch/powerpc/mm/book3s64/radix_tlb.c                |    2 +-
 arch/powerpc/mm/book3s64/slb.c                      |    4 ++--
 arch/powerpc/mm/init_64.c                           |    4 ++--
 arch/powerpc/mm/nohash/book3e_hugetlbpage.c         |    2 +-
 arch/powerpc/mm/nohash/kaslr_booke.c                |    2 +-
 arch/powerpc/mm/pgtable-frag.c                      |    2 +-
 arch/powerpc/perf/8xx-pmu.c                         |    2 +-
 arch/powerpc/perf/core-book3s.c                     |    6 +++---
 arch/powerpc/perf/imc-pmu.c                         |    4 ++--
 arch/powerpc/perf/isa207-common.c                   |    6 +++---
 arch/powerpc/platforms/512x/clock-commonclk.c       |    2 +-
 arch/powerpc/platforms/512x/mpc512x_shared.c        |    2 +-
 arch/powerpc/platforms/52xx/mpc52xx_common.c        |    2 +-
 arch/powerpc/platforms/52xx/mpc52xx_gpt.c           |    2 +-
 arch/powerpc/platforms/52xx/mpc52xx_lpbfifo.c       |    2 +-
 arch/powerpc/platforms/85xx/mpc85xx_cds.c           |    2 +-
 arch/powerpc/platforms/86xx/gef_ppc9a.c             |    2 +-
 arch/powerpc/platforms/86xx/gef_sbc310.c            |    2 +-
 arch/powerpc/platforms/86xx/gef_sbc610.c            |    2 +-
 arch/powerpc/platforms/book3s/vas-api.c             |    2 +-
 arch/powerpc/platforms/cell/cbe_regs.c              |    2 +-
 arch/powerpc/platforms/cell/iommu.c                 |    2 +-
 arch/powerpc/platforms/cell/spider-pci.c            |    2 +-
 arch/powerpc/platforms/cell/spu_manage.c            |    2 +-
 arch/powerpc/platforms/powermac/low_i2c.c           |    2 +-
 arch/powerpc/platforms/powernv/eeh-powernv.c        |   10 +++++-----
 arch/powerpc/platforms/powernv/idle.c               |    4 ++--
 arch/powerpc/platforms/powernv/ocxl.c               |    2 +-
 arch/powerpc/platforms/powernv/opal-fadump.c        |    2 +-
 arch/powerpc/platforms/powernv/opal-lpc.c           |    2 +-
 arch/powerpc/platforms/powernv/opal-memory-errors.c |    2 +-
 arch/powerpc/platforms/powernv/pci-sriov.c          |    2 +-
 arch/powerpc/platforms/ps3/mm.c                     |    2 +-
 arch/powerpc/platforms/ps3/system-bus.c             |    2 +-
 arch/powerpc/platforms/pseries/eeh_pseries.c        |    2 +-
 arch/powerpc/platforms/pseries/iommu.c              |    2 +-
 arch/powerpc/platforms/pseries/setup.c              |    4 ++--
 arch/powerpc/platforms/pseries/vas-sysfs.c          |    2 +-
 arch/powerpc/platforms/pseries/vas.c                |    2 +-
 arch/powerpc/sysdev/fsl_lbc.c                       |    2 +-
 arch/powerpc/sysdev/fsl_pci.c                       |    2 +-
 arch/powerpc/sysdev/ge/ge_pic.c                     |    2 +-
 arch/powerpc/sysdev/mpic_msgr.c                     |    2 +-
 arch/powerpc/sysdev/mpic_msi.c                      |    2 +-
 arch/powerpc/sysdev/mpic_timer.c                    |    2 +-
 arch/powerpc/sysdev/mpic_u3msi.c                    |    2 +-
 arch/powerpc/sysdev/xive/native.c                   |    2 +-
 arch/powerpc/xmon/ppc-opc.c                         |    2 +-
 arch/powerpc/xmon/xmon.c                            |    2 +-
 83 files changed, 107 insertions(+), 107 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_64_mmu_hv.c b/arch/powerpc/kvm/book3s_64_mmu_hv.c
index 0aeb51738ca9..1137c4df726c 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_hv.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_hv.c
@@ -58,7 +58,7 @@ struct kvm_resize_hpt {
 	/* Possible values and their usage:
 	 *  <0     an error occurred during allocation,
 	 *  -EBUSY allocation is in the progress,
-	 *  0      allocation made successfuly.
+	 *  0      allocation made successfully.
 	 */
 	int error;
 
diff --git a/arch/powerpc/kvm/book3s_64_vio_hv.c b/arch/powerpc/kvm/book3s_64_vio_hv.c
index fdeda6a9cff4..fdcc7b287dd8 100644
--- a/arch/powerpc/kvm/book3s_64_vio_hv.c
+++ b/arch/powerpc/kvm/book3s_64_vio_hv.c
@@ -453,7 +453,7 @@ static long kvmppc_rm_ua_to_hpa(struct kvm_vcpu *vcpu, unsigned long mmu_seq,
 	 * we are doing this on secondary cpus and current task there
 	 * is not the hypervisor. Also this is safe against THP in the
 	 * host, because an IPI to primary thread will wait for the secondary
-	 * to exit which will agains result in the below page table walk
+	 * to exit which will again result in the below page table walk
 	 * to finish.
 	 */
 	/* an rmap lock won't make it safe. because that just ensure hash
diff --git a/arch/powerpc/kvm/book3s_emulate.c b/arch/powerpc/kvm/book3s_emulate.c
index fdb57be71aa6..5bbfb2eed127 100644
--- a/arch/powerpc/kvm/book3s_emulate.c
+++ b/arch/powerpc/kvm/book3s_emulate.c
@@ -268,7 +268,7 @@ int kvmppc_core_emulate_op_pr(struct kvm_vcpu *vcpu,
 
 			/*
 			 * add rules to fit in ISA specification regarding TM
-			 * state transistion in TM disable/Suspended state,
+			 * state transition in TM disable/Suspended state,
 			 * and target TM state is TM inactive(00) state. (the
 			 * change should be suppressed).
 			 */
diff --git a/arch/powerpc/kvm/book3s_hv_p9_entry.c b/arch/powerpc/kvm/book3s_hv_p9_entry.c
index a28e5b3daabd..ac38c1cad378 100644
--- a/arch/powerpc/kvm/book3s_hv_p9_entry.c
+++ b/arch/powerpc/kvm/book3s_hv_p9_entry.c
@@ -379,7 +379,7 @@ void restore_p9_host_os_sprs(struct kvm_vcpu *vcpu,
 {
 	/*
 	 * current->thread.xxx registers must all be restored to host
-	 * values before a potential context switch, othrewise the context
+	 * values before a potential context switch, otherwise the context
 	 * switch itself will overwrite current->thread.xxx with the values
 	 * from the guest SPRs.
 	 */
diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
index 45c993dd05f5..0f66f7fbfb80 100644
--- a/arch/powerpc/kvm/book3s_hv_uvmem.c
+++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
@@ -120,7 +120,7 @@ static DEFINE_SPINLOCK(kvmppc_uvmem_bitmap_lock);
  *	content is un-encrypted.
  *
  * (c) Normal - The GFN is a normal. The GFN is associated with
- *	a normal VM. The contents of the GFN is accesible to
+ *	a normal VM. The contents of the GFN is accessible to
  *	the Hypervisor. Its content is never encrypted.
  *
  * States of a VM.
diff --git a/arch/powerpc/kvm/book3s_pr.c b/arch/powerpc/kvm/book3s_pr.c
index 7bf9e6ca5c2d..d6abed6e51e6 100644
--- a/arch/powerpc/kvm/book3s_pr.c
+++ b/arch/powerpc/kvm/book3s_pr.c
@@ -1287,7 +1287,7 @@ int kvmppc_handle_exit_pr(struct kvm_vcpu *vcpu, unsigned int exit_nr)
 
 		/* Get last sc for papr */
 		if (vcpu->arch.papr_enabled) {
-			/* The sc instuction points SRR0 to the next inst */
+			/* The sc instruction points SRR0 to the next inst */
 			emul = kvmppc_get_last_inst(vcpu, INST_SC, &last_sc);
 			if (emul != EMULATE_DONE) {
 				kvmppc_set_pc(vcpu, kvmppc_get_pc(vcpu) - 4);
diff --git a/arch/powerpc/kvm/book3s_xics.c b/arch/powerpc/kvm/book3s_xics.c
index ab6d37d78c62..589a8f257120 100644
--- a/arch/powerpc/kvm/book3s_xics.c
+++ b/arch/powerpc/kvm/book3s_xics.c
@@ -462,7 +462,7 @@ static void icp_deliver_irq(struct kvmppc_xics *xics, struct kvmppc_icp *icp,
 	 * new guy. We cannot assume that the rejected interrupt is less
 	 * favored than the new one, and thus doesn't need to be delivered,
 	 * because by the time we exit icp_try_to_deliver() the target
-	 * processor may well have alrady consumed & completed it, and thus
+	 * processor may well have already consumed & completed it, and thus
 	 * the rejected interrupt might actually be already acceptable.
 	 */
 	if (icp_try_to_deliver(icp, new_irq, state->priority, &reject)) {
diff --git a/arch/powerpc/kvm/book3s_xive.c b/arch/powerpc/kvm/book3s_xive.c
index c0ce5531d9bc..24d434f1f012 100644
--- a/arch/powerpc/kvm/book3s_xive.c
+++ b/arch/powerpc/kvm/book3s_xive.c
@@ -124,7 +124,7 @@ void kvmppc_xive_push_vcpu(struct kvm_vcpu *vcpu)
 		 * interrupt might have fired and be on its way to the
 		 * host queue while we mask it, and if we unmask it
 		 * early enough (re-cede right away), there is a
-		 * theorical possibility that it fires again, thus
+		 * theoretical possibility that it fires again, thus
 		 * landing in the target queue more than once which is
 		 * a big no-no.
 		 *
@@ -622,7 +622,7 @@ static int xive_target_interrupt(struct kvm *kvm,
 
 /*
  * Targetting rules: In order to avoid losing track of
- * pending interrupts accross mask and unmask, which would
+ * pending interrupts across mask and unmask, which would
  * allow queue overflows, we implement the following rules:
  *
  *  - Unless it was never enabled (or we run out of capacity)
@@ -1073,7 +1073,7 @@ int kvmppc_xive_clr_mapped(struct kvm *kvm, unsigned long guest_irq,
 	/*
 	 * If old_p is set, the interrupt is pending, we switch it to
 	 * PQ=11. This will force a resend in the host so the interrupt
-	 * isn't lost to whatver host driver may pick it up
+	 * isn't lost to whatever host driver may pick it up
 	 */
 	if (state->old_p)
 		xive_vm_esb_load(state->pt_data, XIVE_ESB_SET_PQ_11);
diff --git a/arch/powerpc/kvm/e500mc.c b/arch/powerpc/kvm/e500mc.c
index fa0d8dbbe484..4ff1372e48d4 100644
--- a/arch/powerpc/kvm/e500mc.c
+++ b/arch/powerpc/kvm/e500mc.c
@@ -309,7 +309,7 @@ static int kvmppc_core_vcpu_create_e500mc(struct kvm_vcpu *vcpu)
 	BUILD_BUG_ON(offsetof(struct kvmppc_vcpu_e500, vcpu) != 0);
 	vcpu_e500 = to_e500(vcpu);
 
-	/* Invalid PIR value -- this LPID dosn't have valid state on any cpu */
+	/* Invalid PIR value -- this LPID doesn't have valid state on any cpu */
 	vcpu->arch.oldpir = 0xffffffff;
 
 	err = kvmppc_e500_tlb_init(vcpu_e500);
diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
index 28bb1e7263a6..ab316e155ea9 100644
--- a/arch/powerpc/kernel/eeh.c
+++ b/arch/powerpc/kernel/eeh.c
@@ -1329,7 +1329,7 @@ int eeh_pe_set_option(struct eeh_pe *pe, int option)
 
 	/*
 	 * EEH functionality could possibly be disabled, just
-	 * return error for the case. And the EEH functinality
+	 * return error for the case. And the EEH functionality
 	 * isn't expected to be disabled on one specific PE.
 	 */
 	switch (option) {
@@ -1804,7 +1804,7 @@ static int eeh_debugfs_break_device(struct pci_dev *pdev)
 	 *    PE freeze. Using the in_8() accessor skips the eeh detection hook
 	 *    so the freeze hook so the EEH Detection machinery won't be
 	 *    triggered here. This is to match the usual behaviour of EEH
-	 *    where the HW will asyncronously freeze a PE and it's up to
+	 *    where the HW will asynchronously freeze a PE and it's up to
 	 *    the kernel to notice and deal with it.
 	 *
 	 * 3. Turn Memory space back on. This is more important for VFs
diff --git a/arch/powerpc/kernel/eeh_event.c b/arch/powerpc/kernel/eeh_event.c
index a7a8dc182efb..c23a454af08a 100644
--- a/arch/powerpc/kernel/eeh_event.c
+++ b/arch/powerpc/kernel/eeh_event.c
@@ -143,7 +143,7 @@ int __eeh_send_failure_event(struct eeh_pe *pe)
 int eeh_send_failure_event(struct eeh_pe *pe)
 {
 	/*
-	 * If we've manually supressed recovery events via debugfs
+	 * If we've manually suppressed recovery events via debugfs
 	 * then just drop it on the floor.
 	 */
 	if (eeh_debugfs_no_recover) {
diff --git a/arch/powerpc/platforms/powernv/eeh-powernv.c b/arch/powerpc/platforms/powernv/eeh-powernv.c
index 89e22c460ebf..33f7b959c810 100644
--- a/arch/powerpc/platforms/powernv/eeh-powernv.c
+++ b/arch/powerpc/platforms/powernv/eeh-powernv.c
@@ -390,7 +390,7 @@ static struct eeh_dev *pnv_eeh_probe(struct pci_dev *pdev)
 	 * should be blocked until PE reset. MMIO access is dropped
 	 * by hardware certainly. In order to drop PCI config requests,
 	 * one more flag (EEH_PE_CFG_RESTRICTED) is introduced, which
-	 * will be checked in the backend for PE state retrival. If
+	 * will be checked in the backend for PE state retrieval. If
 	 * the PE becomes frozen for the first time and the flag has
 	 * been set for the PE, we will set EEH_PE_CFG_BLOCKED for
 	 * that PE to block its config space.
@@ -981,7 +981,7 @@ static int pnv_eeh_do_af_flr(struct pci_dn *pdn, int option)
 	case EEH_RESET_FUNDAMENTAL:
 		/*
 		 * Wait for Transaction Pending bit to clear. A word-aligned
-		 * test is used, so we use the conrol offset rather than status
+		 * test is used, so we use the control offset rather than status
 		 * and shift the test bit to match.
 		 */
 		pnv_eeh_wait_for_pending(pdn, "AF",
@@ -1048,7 +1048,7 @@ static int pnv_eeh_reset(struct eeh_pe *pe, int option)
 	 * frozen state during PE reset. However, the good idea here from
 	 * benh is to keep frozen state before we get PE reset done completely
 	 * (until BAR restore). With the frozen state, HW drops illegal IO
-	 * or MMIO access, which can incur recrusive frozen PE during PE
+	 * or MMIO access, which can incur recursive frozen PE during PE
 	 * reset. The side effect is that EEH core has to clear the frozen
 	 * state explicitly after BAR restore.
 	 */
@@ -1095,8 +1095,8 @@ static int pnv_eeh_reset(struct eeh_pe *pe, int option)
 	 * bus is behind a hotplug slot and it will use the slot provided
 	 * reset methods to prevent spurious hotplug events during the reset.
 	 *
-	 * Fundemental resets need to be handled internally to EEH since the
-	 * PCI core doesn't really have a concept of a fundemental reset,
+	 * Fundamental resets need to be handled internally to EEH since the
+	 * PCI core doesn't really have a concept of a fundamental reset,
 	 * mainly because there's no standard way to generate one. Only a
 	 * few devices require an FRESET so it should be fine.
 	 */
diff --git a/arch/powerpc/platforms/pseries/eeh_pseries.c b/arch/powerpc/platforms/pseries/eeh_pseries.c
index 09fafcf2d3a0..f0b2bca750da 100644
--- a/arch/powerpc/platforms/pseries/eeh_pseries.c
+++ b/arch/powerpc/platforms/pseries/eeh_pseries.c
@@ -510,7 +510,7 @@ static int pseries_eeh_set_option(struct eeh_pe *pe, int option)
 	int ret = 0;
 
 	/*
-	 * When we're enabling or disabling EEH functioality on
+	 * When we're enabling or disabling EEH functionality on
 	 * the particular PE, the PE config address is possibly
 	 * unavailable. Therefore, we have to figure it out from
 	 * the FDT node.
diff --git a/arch/powerpc/platforms/cell/cbe_regs.c b/arch/powerpc/platforms/cell/cbe_regs.c
index 1c4c53bec66c..03512a41bd7e 100644
--- a/arch/powerpc/platforms/cell/cbe_regs.c
+++ b/arch/powerpc/platforms/cell/cbe_regs.c
@@ -23,7 +23,7 @@
  * Current implementation uses "cpu" nodes. We build our own mapping
  * array of cpu numbers to cpu nodes locally for now to allow interrupt
  * time code to have a fast path rather than call of_get_cpu_node(). If
- * we implement cpu hotplug, we'll have to install an appropriate norifier
+ * we implement cpu hotplug, we'll have to install an appropriate notifier
  * in order to release references to the cpu going away
  */
 static struct cbe_regs_map
diff --git a/arch/powerpc/platforms/cell/iommu.c b/arch/powerpc/platforms/cell/iommu.c
index 25e726bf0172..3f141cf5e580 100644
--- a/arch/powerpc/platforms/cell/iommu.c
+++ b/arch/powerpc/platforms/cell/iommu.c
@@ -582,7 +582,7 @@ static int cell_of_bus_notify(struct notifier_block *nb, unsigned long action,
 {
 	struct device *dev = data;
 
-	/* We are only intereted in device addition */
+	/* We are only interested in device addition */
 	if (action != BUS_NOTIFY_ADD_DEVICE)
 		return 0;
 
diff --git a/arch/powerpc/platforms/cell/spider-pci.c b/arch/powerpc/platforms/cell/spider-pci.c
index a1c293f42a1f..3a2ea8376e32 100644
--- a/arch/powerpc/platforms/cell/spider-pci.c
+++ b/arch/powerpc/platforms/cell/spider-pci.c
@@ -81,7 +81,7 @@ static int __init spiderpci_pci_setup_chip(struct pci_controller *phb,
 	/*
 	 * On CellBlade, we can't know that which XDR memory is used by
 	 * kmalloc() to allocate dummy_page_va.
-	 * In order to imporve the performance, the XDR which is used to
+	 * In order to improve the performance, the XDR which is used to
 	 * allocate dummy_page_va is the nearest the spider-pci.
 	 * We have to select the CBE which is the nearest the spider-pci
 	 * to allocate memory from the best XDR, but I don't know that
diff --git a/arch/powerpc/platforms/cell/spu_manage.c b/arch/powerpc/platforms/cell/spu_manage.c
index ddf8742f09a3..080ed2d2c682 100644
--- a/arch/powerpc/platforms/cell/spu_manage.c
+++ b/arch/powerpc/platforms/cell/spu_manage.c
@@ -457,7 +457,7 @@ static void __init init_affinity_node(int cbe)
 
 		/*
 		 * Walk through each phandle in vicinity property of the spu
-		 * (tipically two vicinity phandles per spe node)
+		 * (typically two vicinity phandles per spe node)
 		 */
 		for (i = 0; i < (lenp / sizeof(phandle)); i++) {
 			if (vic_handles[i] == avoid_ph)
diff --git a/arch/powerpc/platforms/powermac/low_i2c.c b/arch/powerpc/platforms/powermac/low_i2c.c
index df89d916236d..9aded0188ce8 100644
--- a/arch/powerpc/platforms/powermac/low_i2c.c
+++ b/arch/powerpc/platforms/powermac/low_i2c.c
@@ -1472,7 +1472,7 @@ int __init pmac_i2c_init(void)
 	smu_i2c_probe();
 #endif
 
-	/* Now add plaform functions for some known devices */
+	/* Now add platform functions for some known devices */
 	pmac_i2c_devscan(pmac_i2c_dev_create);
 
 	return 0;
diff --git a/arch/powerpc/platforms/85xx/mpc85xx_cds.c b/arch/powerpc/platforms/85xx/mpc85xx_cds.c
index 5bd487030256..ad0b88ecfd0c 100644
--- a/arch/powerpc/platforms/85xx/mpc85xx_cds.c
+++ b/arch/powerpc/platforms/85xx/mpc85xx_cds.c
@@ -151,7 +151,7 @@ static void __init mpc85xx_cds_pci_irq_fixup(struct pci_dev *dev)
 		 */
 		case PCI_DEVICE_ID_VIA_82C586_2:
 		/* There are two USB controllers.
-		 * Identify them by functon number
+		 * Identify them by function number
 		 */
 			if (PCI_FUNC(dev->devfn) == 3)
 				dev->irq = 11;
diff --git a/arch/powerpc/crypto/aes-spe-glue.c b/arch/powerpc/crypto/aes-spe-glue.c
index c2b23b69d7b1..e8dfe9fb0266 100644
--- a/arch/powerpc/crypto/aes-spe-glue.c
+++ b/arch/powerpc/crypto/aes-spe-glue.c
@@ -404,7 +404,7 @@ static int ppc_xts_decrypt(struct skcipher_request *req)
 
 /*
  * Algorithm definitions. Disabling alignment (cra_alignmask=0) was chosen
- * because the e500 platform can handle unaligned reads/writes very efficently.
+ * because the e500 platform can handle unaligned reads/writes very efficiently.
  * This improves IPsec thoughput by another few percent. Additionally we assume
  * that AES context is always aligned to at least 8 bytes because it is created
  * with kmalloc() in the crypto infrastructure
diff --git a/arch/powerpc/platforms/ps3/mm.c b/arch/powerpc/platforms/ps3/mm.c
index 5ce924611b94..63ef61ed7597 100644
--- a/arch/powerpc/platforms/ps3/mm.c
+++ b/arch/powerpc/platforms/ps3/mm.c
@@ -364,7 +364,7 @@ static void  __maybe_unused _dma_dump_region(const struct ps3_dma_region *r,
  * @bus_addr: Starting ioc bus address of the area to map.
  * @len: Length in bytes of the area to map.
  * @link: A struct list_head used with struct ps3_dma_region.chunk_list, the
- * list of all chuncks owned by the region.
+ * list of all chunks owned by the region.
  *
  * This implementation uses a very simple dma page manager
  * based on the dma_chunk structure.  This scheme assumes
diff --git a/arch/powerpc/platforms/ps3/system-bus.c b/arch/powerpc/platforms/ps3/system-bus.c
index b637bf292047..2502e9b17df4 100644
--- a/arch/powerpc/platforms/ps3/system-bus.c
+++ b/arch/powerpc/platforms/ps3/system-bus.c
@@ -601,7 +601,7 @@ static dma_addr_t ps3_ioc0_map_page(struct device *_dev, struct page *page,
 		iopte_flag |= CBE_IOPTE_PP_W | CBE_IOPTE_SO_RW;
 		break;
 	default:
-		/* not happned */
+		/* not happened */
 		BUG();
 	}
 	result = ps3_dma_map(dev->d_region, (unsigned long)ptr, size,
diff --git a/arch/powerpc/platforms/512x/clock-commonclk.c b/arch/powerpc/platforms/512x/clock-commonclk.c
index 0b03d812baae..0652c7e69225 100644
--- a/arch/powerpc/platforms/512x/clock-commonclk.c
+++ b/arch/powerpc/platforms/512x/clock-commonclk.c
@@ -663,7 +663,7 @@ static void __init mpc512x_clk_setup_mclk(struct mclk_setup_data *entry, size_t
 	 *   the PSC/MSCAN/SPDIF (serial drivers et al) need the MCLK
 	 *   for their bitrate
 	 * - in the absence of "aliases" for clocks we need to create
-	 *   individial 'struct clk' items for whatever might get
+	 *   individual 'struct clk' items for whatever might get
 	 *   referenced or looked up, even if several of those items are
 	 *   identical from the logical POV (their rate value)
 	 * - for easier future maintenance and for better reflection of
diff --git a/arch/powerpc/platforms/512x/mpc512x_shared.c b/arch/powerpc/platforms/512x/mpc512x_shared.c
index e3411663edad..96d9cf49560d 100644
--- a/arch/powerpc/platforms/512x/mpc512x_shared.c
+++ b/arch/powerpc/platforms/512x/mpc512x_shared.c
@@ -289,7 +289,7 @@ static void __init mpc512x_setup_diu(void)
 
 	/*
 	 * We do not allocate and configure new area for bitmap buffer
-	 * because it would requere copying bitmap data (splash image)
+	 * because it would require copying bitmap data (splash image)
 	 * and so negatively affect boot time. Instead we reserve the
 	 * already configured frame buffer area so that it won't be
 	 * destroyed. The starting address of the area to reserve and
diff --git a/arch/powerpc/platforms/52xx/mpc52xx_common.c b/arch/powerpc/platforms/52xx/mpc52xx_common.c
index 565e3a83dc9e..60aa6015e284 100644
--- a/arch/powerpc/platforms/52xx/mpc52xx_common.c
+++ b/arch/powerpc/platforms/52xx/mpc52xx_common.c
@@ -308,7 +308,7 @@ int mpc5200_psc_ac97_gpio_reset(int psc_number)
 
 	spin_lock_irqsave(&gpio_lock, flags);
 
-	/* Reconfiure pin-muxing to gpio */
+	/* Reconfigure pin-muxing to gpio */
 	mux = in_be32(&simple_gpio->port_config);
 	out_be32(&simple_gpio->port_config, mux & (~gpio));
 
diff --git a/arch/powerpc/platforms/52xx/mpc52xx_gpt.c b/arch/powerpc/platforms/52xx/mpc52xx_gpt.c
index f862b48b4824..7252d992ca9f 100644
--- a/arch/powerpc/platforms/52xx/mpc52xx_gpt.c
+++ b/arch/powerpc/platforms/52xx/mpc52xx_gpt.c
@@ -398,7 +398,7 @@ static int mpc52xx_gpt_do_start(struct mpc52xx_gpt_priv *gpt, u64 period,
 		set |= MPC52xx_GPT_MODE_CONTINUOUS;
 
 	/* Determine the number of clocks in the requested period.  64 bit
-	 * arithmatic is done here to preserve the precision until the value
+	 * arithmetic is done here to preserve the precision until the value
 	 * is scaled back down into the u32 range.  Period is in 'ns', bus
 	 * frequency is in Hz. */
 	clocks = period * (u64)gpt->ipb_freq;
diff --git a/arch/powerpc/platforms/52xx/mpc52xx_lpbfifo.c b/arch/powerpc/platforms/52xx/mpc52xx_lpbfifo.c
index b91ebebd9ff2..54dfc63809d3 100644
--- a/arch/powerpc/platforms/52xx/mpc52xx_lpbfifo.c
+++ b/arch/powerpc/platforms/52xx/mpc52xx_lpbfifo.c
@@ -104,7 +104,7 @@ static void mpc52xx_lpbfifo_kick(struct mpc52xx_lpbfifo_request *req)
 		 *
 		 * Configure the watermarks so DMA will always complete correctly.
 		 * It may be worth experimenting with the ALARM value to see if
-		 * there is a performance impacit.  However, if it is wrong there
+		 * there is a performance impact.  However, if it is wrong there
 		 * is a risk of DMA not transferring the last chunk of data
 		 */
 		if (write) {
diff --git a/arch/powerpc/boot/cuboot-hotfoot.c b/arch/powerpc/boot/cuboot-hotfoot.c
index 888a6b9bfead..0e5532f855d6 100644
--- a/arch/powerpc/boot/cuboot-hotfoot.c
+++ b/arch/powerpc/boot/cuboot-hotfoot.c
@@ -70,7 +70,7 @@ static void hotfoot_fixups(void)
 
 		printf("Fixing devtree for 4M Flash\n");
 		
-		/* First fix up the base addresse */
+		/* First fix up the base address */
 		getprop(devp, "reg", regs, sizeof(regs));
 		regs[0] = 0;
 		regs[1] = 0xffc00000;
diff --git a/arch/powerpc/kernel/cputable.c b/arch/powerpc/kernel/cputable.c
index ae0fdef0ac11..2a271a6d6924 100644
--- a/arch/powerpc/kernel/cputable.c
+++ b/arch/powerpc/kernel/cputable.c
@@ -2025,7 +2025,7 @@ static struct cpu_spec * __init setup_cpu_spec(unsigned long offset,
 		 * oprofile_cpu_type already has a value, then we are
 		 * possibly overriding a real PVR with a logical one,
 		 * and, in that case, keep the current value for
-		 * oprofile_cpu_type. Futhermore, let's ensure that the
+		 * oprofile_cpu_type. Furthermore, let's ensure that the
 		 * fix for the PMAO bug is enabled on compatibility mode.
 		 */
 		if (old.oprofile_cpu_type != NULL) {
diff --git a/arch/powerpc/kernel/dawr.c b/arch/powerpc/kernel/dawr.c
index 64e423d2fe0f..30d4eca88d17 100644
--- a/arch/powerpc/kernel/dawr.c
+++ b/arch/powerpc/kernel/dawr.c
@@ -27,7 +27,7 @@ int set_dawr(int nr, struct arch_hw_breakpoint *brk)
 	dawrx |= (brk->type & (HW_BRK_TYPE_PRIV_ALL)) >> 3;
 	/*
 	 * DAWR length is stored in field MDR bits 48:53.  Matches range in
-	 * doublewords (64 bits) baised by -1 eg. 0b000000=1DW and
+	 * doublewords (64 bits) biased by -1 eg. 0b000000=1DW and
 	 * 0b111111=64DW.
 	 * brk->hw_len is in bytes.
 	 * This aligns up to double word size, shifts and does the bias.
diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index 4c09c6688ac6..2451fabe4d45 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -73,9 +73,9 @@ static struct cma *fadump_cma;
  * The total size of fadump reserved memory covers for boot memory size
  * + cpu data size + hpte size and metadata.
  * Initialize only the area equivalent to boot memory size for CMA use.
- * The reamining portion of fadump reserved memory will be not given
- * to CMA and pages for thoes will stay reserved. boot memory size is
- * aligned per CMA requirement to satisy cma_init_reserved_mem() call.
+ * The remaining portion of fadump reserved memory will be not given
+ * to CMA and pages for those will stay reserved. boot memory size is
+ * aligned per CMA requirement to satisfy cma_init_reserved_mem() call.
  * But for some reason even if it fails we still have the memory reservation
  * with us and we can still continue doing fadump.
  */
@@ -1661,8 +1661,8 @@ int __init setup_fadump(void)
 }
 /*
  * Use subsys_initcall_sync() here because there is dependency with
- * crash_save_vmcoreinfo_init(), which mush run first to ensure vmcoreinfo initialization
- * is done before regisering with f/w.
+ * crash_save_vmcoreinfo_init(), which must run first to ensure vmcoreinfo initialization
+ * is done before registering with f/w.
  */
 subsys_initcall_sync(setup_fadump);
 #else /* !CONFIG_PRESERVE_FA_DUMP */
diff --git a/arch/powerpc/kernel/module_32.c b/arch/powerpc/kernel/module_32.c
index a0432ef46967..e25b796682cc 100644
--- a/arch/powerpc/kernel/module_32.c
+++ b/arch/powerpc/kernel/module_32.c
@@ -99,7 +99,7 @@ static unsigned long get_plt_size(const Elf32_Ehdr *hdr,
 
 			/* Sort the relocation information based on a symbol and
 			 * addend key. This is a stable O(n*log n) complexity
-			 * alogrithm but it will reduce the complexity of
+			 * algorithm but it will reduce the complexity of
 			 * count_relocs() to linear complexity O(n)
 			 */
 			sort((void *)hdr + sechdrs[i].sh_offset,
diff --git a/arch/powerpc/kernel/module_64.c b/arch/powerpc/kernel/module_64.c
index 794720530442..2cce576edbc5 100644
--- a/arch/powerpc/kernel/module_64.c
+++ b/arch/powerpc/kernel/module_64.c
@@ -194,7 +194,7 @@ static unsigned long get_stubs_size(const Elf64_Ehdr *hdr,
 
 			/* Sort the relocation information based on a symbol and
 			 * addend key. This is a stable O(n*log n) complexity
-			 * alogrithm but it will reduce the complexity of
+			 * algorithm but it will reduce the complexity of
 			 * count_relocs() to linear complexity O(n)
 			 */
 			sort((void *)sechdrs[i].sh_addr,
@@ -361,7 +361,7 @@ static inline int create_ftrace_stub(struct ppc64_stub_entry *entry,
 	entry->jump[1] |= PPC_HA(reladdr);
 	entry->jump[2] |= PPC_LO(reladdr);
 
-	/* Eventhough we don't use funcdata in the stub, it's needed elsewhere. */
+	/* Even though we don't use funcdata in the stub, it's needed elsewhere. */
 	entry->funcdata = func_desc(addr);
 	entry->magic = STUB_MAGIC;
 
diff --git a/arch/powerpc/kernel/pci-common.c b/arch/powerpc/kernel/pci-common.c
index 8bc9cf62cd93..9a97a93bd11c 100644
--- a/arch/powerpc/kernel/pci-common.c
+++ b/arch/powerpc/kernel/pci-common.c
@@ -1688,7 +1688,7 @@ EXPORT_SYMBOL_GPL(pcibios_scan_phb);
 static void fixup_hide_host_resource_fsl(struct pci_dev *dev)
 {
 	int i, class = dev->class >> 8;
-	/* When configured as agent, programing interface = 1 */
+	/* When configured as agent, programming interface = 1 */
 	int prog_if = dev->class & 0xf;
 
 	if ((class == PCI_CLASS_PROCESSOR_POWERPC ||
diff --git a/arch/powerpc/kernel/pci_of_scan.c b/arch/powerpc/kernel/pci_of_scan.c
index c3024f104765..6f2b0cc1ddd6 100644
--- a/arch/powerpc/kernel/pci_of_scan.c
+++ b/arch/powerpc/kernel/pci_of_scan.c
@@ -244,7 +244,7 @@ EXPORT_SYMBOL(of_create_pci_dev);
  * @dev: pci_dev structure for the bridge
  *
  * of_scan_bus() calls this routine for each PCI bridge that it finds, and
- * this routine in turn call of_scan_bus() recusively to scan for more child
+ * this routine in turn call of_scan_bus() recursively to scan for more child
  * devices.
  */
 void of_scan_pci_bridge(struct pci_dev *dev)
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 984813a4d5dc..eeb2dff95f9a 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -307,7 +307,7 @@ static void __giveup_vsx(struct task_struct *tsk)
 	unsigned long msr = tsk->thread.regs->msr;
 
 	/*
-	 * We should never be ssetting MSR_VSX without also setting
+	 * We should never be setting MSR_VSX without also setting
 	 * MSR_FP and MSR_VEC
 	 */
 	WARN_ON((msr & MSR_VSX) && !((msr & MSR_FP) && (msr & MSR_VEC)));
@@ -645,7 +645,7 @@ static void do_break_handler(struct pt_regs *regs)
 		return;
 	}
 
-	/* Otherwise findout which DAWR caused exception and disable it. */
+	/* Otherwise find out which DAWR caused exception and disable it. */
 	wp_get_instr_detail(regs, &instr, &type, &size, &ea);
 
 	for (i = 0; i < nr_wp_slots(); i++) {
diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
index 0ac5faacc909..ace861ec4c4c 100644
--- a/arch/powerpc/kernel/prom_init.c
+++ b/arch/powerpc/kernel/prom_init.c
@@ -3416,7 +3416,7 @@ unsigned long __init prom_init(unsigned long r3, unsigned long r4,
 	 *
 	 * PowerMacs use a different mechanism to spin CPUs
 	 *
-	 * (This must be done after instanciating RTAS)
+	 * (This must be done after instantiating RTAS)
 	 */
 	if (of_platform != PLATFORM_POWERMAC)
 		prom_hold_cpus();
diff --git a/arch/powerpc/kernel/ptrace/ptrace-view.c b/arch/powerpc/kernel/ptrace/ptrace-view.c
index f15bc78caf71..076d867412c7 100644
--- a/arch/powerpc/kernel/ptrace/ptrace-view.c
+++ b/arch/powerpc/kernel/ptrace/ptrace-view.c
@@ -174,7 +174,7 @@ int ptrace_get_reg(struct task_struct *task, int regno, unsigned long *data)
 
 	/*
 	 * softe copies paca->irq_soft_mask variable state. Since irq_soft_mask is
-	 * no more used as a flag, lets force usr to alway see the softe value as 1
+	 * no more used as a flag, lets force usr to always see the softe value as 1
 	 * which means interrupts are not soft disabled.
 	 */
 	if (IS_ENABLED(CONFIG_PPC64) && regno == PT_SOFTE) {
diff --git a/arch/powerpc/kernel/rtas_flash.c b/arch/powerpc/kernel/rtas_flash.c
index a99179d83538..bc817a5619d6 100644
--- a/arch/powerpc/kernel/rtas_flash.c
+++ b/arch/powerpc/kernel/rtas_flash.c
@@ -120,7 +120,7 @@ static struct kmem_cache *flash_block_cache = NULL;
 /*
  * Local copy of the flash block list.
  *
- * The rtas_firmware_flash_list varable will be
+ * The rtas_firmware_flash_list variable will be
  * set once the data is fully read.
  *
  * For convenience as we build the list we use virtual addrs,
diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
index 518ae5aa9410..3acf2782acdf 100644
--- a/arch/powerpc/kernel/setup-common.c
+++ b/arch/powerpc/kernel/setup-common.c
@@ -279,7 +279,7 @@ static int show_cpuinfo(struct seq_file *m, void *v)
 			   proc_freq / 1000000, proc_freq % 1000000);
 
 	/* If we are a Freescale core do a simple check so
-	 * we dont have to keep adding cases in the future */
+	 * we don't have to keep adding cases in the future */
 	if (PVR_VER(pvr) & 0x8000) {
 		switch (PVR_VER(pvr)) {
 		case 0x8000:	/* 7441/7450/7451, Voyager */
diff --git a/arch/powerpc/kernel/signal_64.c b/arch/powerpc/kernel/signal_64.c
index 73d483b07ff3..858fc13b8c51 100644
--- a/arch/powerpc/kernel/signal_64.c
+++ b/arch/powerpc/kernel/signal_64.c
@@ -123,7 +123,7 @@ static long notrace __unsafe_setup_sigcontext(struct sigcontext __user *sc,
 #endif
 	struct pt_regs *regs = tsk->thread.regs;
 	unsigned long msr = regs->msr;
-	/* Force usr to alway see softe as 1 (interrupts enabled) */
+	/* Force usr to always see softe as 1 (interrupts enabled) */
 	unsigned long softe = 0x1;
 
 	BUG_ON(tsk != current);
diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 32156d98dfc8..32910af76a36 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -1102,7 +1102,7 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
 	DBG("smp_prepare_cpus\n");
 
 	/* 
-	 * setup_cpu may need to be called on the boot cpu. We havent
+	 * setup_cpu may need to be called on the boot cpu. We haven't
 	 * spun any cpus up but lets be paranoid.
 	 */
 	BUG_ON(boot_cpuid != smp_processor_id());
diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
index f80cce0e3899..4bf757ebe13d 100644
--- a/arch/powerpc/kernel/time.c
+++ b/arch/powerpc/kernel/time.c
@@ -829,7 +829,7 @@ static void __read_persistent_clock(struct timespec64 *ts)
 	static int first = 1;
 
 	ts->tv_nsec = 0;
-	/* XXX this is a litle fragile but will work okay in the short term */
+	/* XXX this is a little fragile but will work okay in the short term */
 	if (first) {
 		first = 0;
 		if (ppc_md.time_init)
@@ -974,7 +974,7 @@ void secondary_cpu_time_init(void)
 	 */
 	start_cpu_decrementer();
 
-	/* FIME: Should make unrelatred change to move snapshot_timebase
+	/* FIME: Should make unrelated change to move snapshot_timebase
 	 * call here ! */
 	register_decrementer_clockevent(smp_processor_id());
 }
diff --git a/arch/powerpc/kernel/watchdog.c b/arch/powerpc/kernel/watchdog.c
index 62937a077de7..5b9eb7640a15 100644
--- a/arch/powerpc/kernel/watchdog.c
+++ b/arch/powerpc/kernel/watchdog.c
@@ -56,7 +56,7 @@
  * solved by also having a SMP watchdog where all CPUs check all other
  * CPUs heartbeat.
  *
- * The SMP checker can detect lockups on other CPUs. A gobal "pending"
+ * The SMP checker can detect lockups on other CPUs. A global "pending"
  * cpumask is kept, containing all CPUs which enable the watchdog. Each
  * CPU clears their pending bit in their heartbeat timer. When the bitmask
  * becomes empty, the last CPU to clear its pending bit updates a global
diff --git a/arch/powerpc/kexec/core_64.c b/arch/powerpc/kexec/core_64.c
index 6cc7793b8420..c29c639551fe 100644
--- a/arch/powerpc/kexec/core_64.c
+++ b/arch/powerpc/kexec/core_64.c
@@ -406,7 +406,7 @@ static int __init export_htab_values(void)
 	if (!node)
 		return -ENODEV;
 
-	/* remove any stale propertys so ours can be found */
+	/* remove any stale properties so ours can be found */
 	of_remove_property(node, of_find_property(node, htab_base_prop.name, NULL));
 	of_remove_property(node, of_find_property(node, htab_size_prop.name, NULL));
 
diff --git a/arch/powerpc/mm/book3s64/hash_pgtable.c b/arch/powerpc/mm/book3s64/hash_pgtable.c
index 7ce8914992e3..2e0cad5817ba 100644
--- a/arch/powerpc/mm/book3s64/hash_pgtable.c
+++ b/arch/powerpc/mm/book3s64/hash_pgtable.c
@@ -377,7 +377,7 @@ int hash__has_transparent_hugepage(void)
 	if (mmu_psize_defs[MMU_PAGE_16M].shift != PMD_SHIFT)
 		return 0;
 	/*
-	 * We need to make sure that we support 16MB hugepage in a segement
+	 * We need to make sure that we support 16MB hugepage in a segment
 	 * with base page size 64K or 4K. We only enable THP with a PAGE_SIZE
 	 * of 64K.
 	 */
diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index 985cabdd7f67..5b69b271707e 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -1343,7 +1343,7 @@ static int subpage_protection(struct mm_struct *mm, unsigned long ea)
 	spp >>= 30 - 2 * ((ea >> 12) & 0xf);
 
 	/*
-	 * 0 -> full premission
+	 * 0 -> full permission
 	 * 1 -> Read only
 	 * 2 -> no access.
 	 * We return the flag that need to be cleared.
@@ -1664,7 +1664,7 @@ DEFINE_INTERRUPT_HANDLER(do_hash_fault)
 
 	err = hash_page_mm(mm, ea, access, TRAP(regs), flags);
 	if (unlikely(err < 0)) {
-		// failed to instert a hash PTE due to an hypervisor error
+		// failed to insert a hash PTE due to an hypervisor error
 		if (user_mode(regs)) {
 			if (IS_ENABLED(CONFIG_PPC_SUBPAGE_PROT) && err == -2)
 				_exception(SIGSEGV, regs, SEGV_ACCERR, ea);
diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
index 8b474ab32f67..7b9966402b25 100644
--- a/arch/powerpc/mm/book3s64/pgtable.c
+++ b/arch/powerpc/mm/book3s64/pgtable.c
@@ -332,7 +332,7 @@ static pmd_t *__alloc_for_pmdcache(struct mm_struct *mm)
 	spin_lock(&mm->page_table_lock);
 	/*
 	 * If we find pgtable_page set, we return
-	 * the allocated page with single fragement
+	 * the allocated page with single fragment
 	 * count.
 	 */
 	if (likely(!mm->context.pmd_frag)) {
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index def04631a74d..db2f3d193448 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -359,7 +359,7 @@ static void __init radix_init_pgtable(void)
 	if (!cpu_has_feature(CPU_FTR_HVMODE) &&
 			cpu_has_feature(CPU_FTR_P9_RADIX_PREFETCH_BUG)) {
 		/*
-		 * Older versions of KVM on these machines perfer if the
+		 * Older versions of KVM on these machines prefer if the
 		 * guest only uses the low 19 PID bits.
 		 */
 		mmu_pid_bits = 19;
diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3s64/radix_tlb.c
index 7724af19ed7e..dda51fef2d2e 100644
--- a/arch/powerpc/mm/book3s64/radix_tlb.c
+++ b/arch/powerpc/mm/book3s64/radix_tlb.c
@@ -397,7 +397,7 @@ static inline void _tlbie_pid(unsigned long pid, unsigned long ric)
 
 	/*
 	 * Workaround the fact that the "ric" argument to __tlbie_pid
-	 * must be a compile-time contraint to match the "i" constraint
+	 * must be a compile-time constraint to match the "i" constraint
 	 * in the asm statement.
 	 */
 	switch (ric) {
diff --git a/arch/powerpc/mm/book3s64/slb.c b/arch/powerpc/mm/book3s64/slb.c
index 81091b9587f6..6956f637a38c 100644
--- a/arch/powerpc/mm/book3s64/slb.c
+++ b/arch/powerpc/mm/book3s64/slb.c
@@ -347,7 +347,7 @@ void slb_setup_new_exec(void)
 	/*
 	 * We have no good place to clear the slb preload cache on exec,
 	 * flush_thread is about the earliest arch hook but that happens
-	 * after we switch to the mm and have aleady preloaded the SLBEs.
+	 * after we switch to the mm and have already preloaded the SLBEs.
 	 *
 	 * For the most part that's probably okay to use entries from the
 	 * previous exec, they will age out if unused. It may turn out to
@@ -615,7 +615,7 @@ static void slb_cache_update(unsigned long esid_data)
 	} else {
 		/*
 		 * Our cache is full and the current cache content strictly
-		 * doesn't indicate the active SLB conents. Bump the ptr
+		 * doesn't indicate the active SLB contents. Bump the ptr
 		 * so that switch_slb() will ignore the cache.
 		 */
 		local_paca->slb_cache_ptr = SLB_CACHE_ENTRIES + 1;
diff --git a/arch/powerpc/mm/init_64.c b/arch/powerpc/mm/init_64.c
index 83c0ee9fbf05..2e11952057f8 100644
--- a/arch/powerpc/mm/init_64.c
+++ b/arch/powerpc/mm/init_64.c
@@ -111,7 +111,7 @@ static int __meminit vmemmap_populated(unsigned long vmemmap_addr, int vmemmap_m
 }
 
 /*
- * vmemmap virtual address space management does not have a traditonal page
+ * vmemmap virtual address space management does not have a traditional page
  * table to track which virtual struct pages are backed by physical mapping.
  * The virtual to physical mappings are tracked in a simple linked list
  * format. 'vmemmap_list' maintains the entire vmemmap physical mapping at
@@ -128,7 +128,7 @@ static struct vmemmap_backing *next;
 
 /*
  * The same pointer 'next' tracks individual chunks inside the allocated
- * full page during the boot time and again tracks the freeed nodes during
+ * full page during the boot time and again tracks the freed nodes during
  * runtime. It is racy but it does not happen as they are separated by the
  * boot process. Will create problem if some how we have memory hotplug
  * operation during boot !!
diff --git a/arch/powerpc/mm/nohash/book3e_hugetlbpage.c b/arch/powerpc/mm/nohash/book3e_hugetlbpage.c
index 8b88be91b622..307ca919d393 100644
--- a/arch/powerpc/mm/nohash/book3e_hugetlbpage.c
+++ b/arch/powerpc/mm/nohash/book3e_hugetlbpage.c
@@ -142,7 +142,7 @@ book3e_hugetlb_preload(struct vm_area_struct *vma, unsigned long ea, pte_t pte)
 	tsize = shift - 10;
 	/*
 	 * We can't be interrupted while we're setting up the MAS
-	 * regusters or after we've confirmed that no tlb exists.
+	 * registers or after we've confirmed that no tlb exists.
 	 */
 	local_irq_save(flags);
 
diff --git a/arch/powerpc/mm/nohash/kaslr_booke.c b/arch/powerpc/mm/nohash/kaslr_booke.c
index 96c38f971603..636ec583d989 100644
--- a/arch/powerpc/mm/nohash/kaslr_booke.c
+++ b/arch/powerpc/mm/nohash/kaslr_booke.c
@@ -315,7 +315,7 @@ static unsigned long __init kaslr_choose_location(void *dt_ptr, phys_addr_t size
 	ram = map_mem_in_cams(ram, CONFIG_LOWMEM_CAM_NUM, true, true);
 	linear_sz = min_t(unsigned long, ram, SZ_512M);
 
-	/* If the linear size is smaller than 64M, do not randmize */
+	/* If the linear size is smaller than 64M, do not randomize */
 	if (linear_sz < SZ_64M)
 		return 0;
 
diff --git a/arch/powerpc/mm/pgtable-frag.c b/arch/powerpc/mm/pgtable-frag.c
index 97ae4935da79..20652daa1d7e 100644
--- a/arch/powerpc/mm/pgtable-frag.c
+++ b/arch/powerpc/mm/pgtable-frag.c
@@ -83,7 +83,7 @@ static pte_t *__alloc_for_ptecache(struct mm_struct *mm, int kernel)
 	spin_lock(&mm->page_table_lock);
 	/*
 	 * If we find pgtable_page set, we return
-	 * the allocated page with single fragement
+	 * the allocated page with single fragment
 	 * count.
 	 */
 	if (likely(!pte_frag_get(&mm->context))) {
diff --git a/arch/powerpc/perf/8xx-pmu.c b/arch/powerpc/perf/8xx-pmu.c
index 4738c4dbf567..308a2e40d7be 100644
--- a/arch/powerpc/perf/8xx-pmu.c
+++ b/arch/powerpc/perf/8xx-pmu.c
@@ -157,7 +157,7 @@ static void mpc8xx_pmu_del(struct perf_event *event, int flags)
 
 	mpc8xx_pmu_read(event);
 
-	/* If it was the last user, stop counting to avoid useles overhead */
+	/* If it was the last user, stop counting to avoid useless overhead */
 	switch (event_type(event)) {
 	case PERF_8xx_ID_CPU_CYCLES:
 		break;
diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
index b5b42cf0a703..140502a7fdf8 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -1142,7 +1142,7 @@ static u64 check_and_compute_delta(u64 prev, u64 val)
 	/*
 	 * POWER7 can roll back counter values, if the new value is smaller
 	 * than the previous value it will cause the delta and the counter to
-	 * have bogus values unless we rolled a counter over.  If a coutner is
+	 * have bogus values unless we rolled a counter over.  If a counter is
 	 * rolled back, it will be smaller, but within 256, which is the maximum
 	 * number of events to rollback at once.  If we detect a rollback
 	 * return 0.  This can lead to a small lack of precision in the
@@ -2057,7 +2057,7 @@ static int power_pmu_event_init(struct perf_event *event)
 	/*
 	 * PMU config registers have fields that are
 	 * reserved and some specific values for bit fields are reserved.
-	 * For ex., MMCRA[61:62] is Randome Sampling Mode (SM)
+	 * For ex., MMCRA[61:62] is Random Sampling Mode (SM)
 	 * and value of 0b11 to this field is reserved.
 	 * Check for invalid values in attr.config.
 	 */
@@ -2447,7 +2447,7 @@ static void __perf_event_interrupt(struct pt_regs *regs)
 	}
 
 	/*
-	 * During system wide profling or while specific CPU is monitored for an
+	 * During system wide profiling or while specific CPU is monitored for an
 	 * event, some corner cases could cause PMC to overflow in idle path. This
 	 * will trigger a PMI after waking up from idle. Since counter values are _not_
 	 * saved/restored in idle path, can lead to below "Can't find PMC" message.
diff --git a/arch/powerpc/perf/imc-pmu.c b/arch/powerpc/perf/imc-pmu.c
index 526d4b767534..498f1a2f7658 100644
--- a/arch/powerpc/perf/imc-pmu.c
+++ b/arch/powerpc/perf/imc-pmu.c
@@ -521,7 +521,7 @@ static int nest_imc_event_init(struct perf_event *event)
 
 	/*
 	 * Nest HW counter memory resides in a per-chip reserve-memory (HOMER).
-	 * Get the base memory addresss for this cpu.
+	 * Get the base memory address for this cpu.
 	 */
 	chip_id = cpu_to_chip_id(event->cpu);
 
@@ -674,7 +674,7 @@ static int ppc_core_imc_cpu_offline(unsigned int cpu)
 	/*
 	 * Check whether core_imc is registered. We could end up here
 	 * if the cpuhotplug callback registration fails. i.e, callback
-	 * invokes the offline path for all sucessfully registered cpus.
+	 * invokes the offline path for all successfully registered cpus.
 	 * At this stage, core_imc pmu will not be registered and we
 	 * should return here.
 	 *
diff --git a/arch/powerpc/perf/isa207-common.c b/arch/powerpc/perf/isa207-common.c
index a74d382ecbb7..839cc68212c1 100644
--- a/arch/powerpc/perf/isa207-common.c
+++ b/arch/powerpc/perf/isa207-common.c
@@ -82,11 +82,11 @@ static unsigned long sdar_mod_val(u64 event)
 static void mmcra_sdar_mode(u64 event, unsigned long *mmcra)
 {
 	/*
-	 * MMCRA[SDAR_MODE] specifices how the SDAR should be updated in
-	 * continous sampling mode.
+	 * MMCRA[SDAR_MODE] specifies how the SDAR should be updated in
+	 * continuous sampling mode.
 	 *
 	 * Incase of Power8:
-	 * MMCRA[SDAR_MODE] will be programmed as "0b01" for continous sampling
+	 * MMCRA[SDAR_MODE] will be programmed as "0b01" for continuous sampling
 	 * mode and will be un-changed when setting MMCRA[63] (Marked events).
 	 *
 	 * Incase of Power9/power10:
diff --git a/arch/powerpc/platforms/86xx/gef_ppc9a.c b/arch/powerpc/platforms/86xx/gef_ppc9a.c
index 44bbbc535e1d..884da08806ce 100644
--- a/arch/powerpc/platforms/86xx/gef_ppc9a.c
+++ b/arch/powerpc/platforms/86xx/gef_ppc9a.c
@@ -180,7 +180,7 @@ DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_NEC, PCI_DEVICE_ID_NEC_USB,
  *
  * This function is called to determine whether the BSP is compatible with the
  * supplied device-tree, which is assumed to be the correct one for the actual
- * board. It is expected thati, in the future, a kernel may support multiple
+ * board. It is expected that, in the future, a kernel may support multiple
  * boards.
  */
 static int __init gef_ppc9a_probe(void)
diff --git a/arch/powerpc/platforms/86xx/gef_sbc310.c b/arch/powerpc/platforms/86xx/gef_sbc310.c
index 46d6d3d4957a..baaf1ab07016 100644
--- a/arch/powerpc/platforms/86xx/gef_sbc310.c
+++ b/arch/powerpc/platforms/86xx/gef_sbc310.c
@@ -167,7 +167,7 @@ DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_NEC, PCI_DEVICE_ID_NEC_USB,
  *
  * This function is called to determine whether the BSP is compatible with the
  * supplied device-tree, which is assumed to be the correct one for the actual
- * board. It is expected thati, in the future, a kernel may support multiple
+ * board. It is expected that, in the future, a kernel may support multiple
  * boards.
  */
 static int __init gef_sbc310_probe(void)
diff --git a/arch/powerpc/platforms/86xx/gef_sbc610.c b/arch/powerpc/platforms/86xx/gef_sbc610.c
index acf2c6c3c1eb..120caf6af71d 100644
--- a/arch/powerpc/platforms/86xx/gef_sbc610.c
+++ b/arch/powerpc/platforms/86xx/gef_sbc610.c
@@ -157,7 +157,7 @@ DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_NEC, PCI_DEVICE_ID_NEC_USB,
  *
  * This function is called to determine whether the BSP is compatible with the
  * supplied device-tree, which is assumed to be the correct one for the actual
- * board. It is expected thati, in the future, a kernel may support multiple
+ * board. It is expected that, in the future, a kernel may support multiple
  * boards.
  */
 static int __init gef_sbc610_probe(void)
diff --git a/arch/powerpc/platforms/book3s/vas-api.c b/arch/powerpc/platforms/book3s/vas-api.c
index f9a1615b74da..c0799fb26b6d 100644
--- a/arch/powerpc/platforms/book3s/vas-api.c
+++ b/arch/powerpc/platforms/book3s/vas-api.c
@@ -30,7 +30,7 @@
  *
  * where "vas_copy" and "vas_paste" are defined in copy-paste.h.
  * copy/paste returns to the user space directly. So refer NX hardware
- * documententation for exact copy/paste usage and completion / error
+ * documentation for exact copy/paste usage and completion / error
  * conditions.
  */
 
diff --git a/arch/powerpc/platforms/powernv/idle.c b/arch/powerpc/platforms/powernv/idle.c
index a6677a111aca..6f94b808dd39 100644
--- a/arch/powerpc/platforms/powernv/idle.c
+++ b/arch/powerpc/platforms/powernv/idle.c
@@ -112,7 +112,7 @@ static int __init pnv_save_sprs_for_deep_states(void)
 			if (rc != 0)
 				return rc;
 
-			/* Only p8 needs to set extra HID regiters */
+			/* Only p8 needs to set extra HID registers */
 			if (!cpu_has_feature(CPU_FTR_ARCH_300)) {
 				uint64_t hid1_val = mfspr(SPRN_HID1);
 				uint64_t hid4_val = mfspr(SPRN_HID4);
@@ -1204,7 +1204,7 @@ static void __init pnv_arch300_idle_init(void)
 		 * The idle code does not deal with TB loss occurring
 		 * in a shallower state than SPR loss, so force it to
 		 * behave like SPRs are lost if TB is lost. POWER9 would
-		 * never encouter this, but a POWER8 core would if it
+		 * never encounter this, but a POWER8 core would if it
 		 * implemented the stop instruction. So this is for forward
 		 * compatibility.
 		 */
diff --git a/arch/powerpc/platforms/powernv/opal-fadump.c b/arch/powerpc/platforms/powernv/opal-fadump.c
index c8ad057c7221..a8da952610eb 100644
--- a/arch/powerpc/platforms/powernv/opal-fadump.c
+++ b/arch/powerpc/platforms/powernv/opal-fadump.c
@@ -202,7 +202,7 @@ static u64 opal_fadump_init_mem_struct(struct fw_dump *fadump_conf)
 	}
 
 	/*
-	 * Kernel metadata is passed to f/w and retrieved in capture kerenl.
+	 * Kernel metadata is passed to f/w and retrieved in capture kernel.
 	 * So, use it to save fadump header address instead of calculating it.
 	 */
 	opal_fdm->fadumphdr_addr = (opal_fdm->rgn[0].dest +
diff --git a/arch/powerpc/platforms/powernv/opal-lpc.c b/arch/powerpc/platforms/powernv/opal-lpc.c
index 5390c888db16..d129d6d45a50 100644
--- a/arch/powerpc/platforms/powernv/opal-lpc.c
+++ b/arch/powerpc/platforms/powernv/opal-lpc.c
@@ -197,7 +197,7 @@ static ssize_t lpc_debug_read(struct file *filp, char __user *ubuf,
 
 		/*
 		 * Select access size based on count and alignment and
-		 * access type. IO and MEM only support byte acceses,
+		 * access type. IO and MEM only support byte accesses,
 		 * FW supports all 3.
 		 */
 		len = 1;
diff --git a/arch/powerpc/platforms/powernv/opal-memory-errors.c b/arch/powerpc/platforms/powernv/opal-memory-errors.c
index 1e8e17df9ce8..a1754a28265d 100644
--- a/arch/powerpc/platforms/powernv/opal-memory-errors.c
+++ b/arch/powerpc/platforms/powernv/opal-memory-errors.c
@@ -82,7 +82,7 @@ static DECLARE_WORK(mem_error_work, mem_error_handler);
 
 /*
  * opal_memory_err_event - notifier handler that queues up the opal message
- * to be preocessed later.
+ * to be processed later.
  */
 static int opal_memory_err_event(struct notifier_block *nb,
 			  unsigned long msg_type, void *msg)
diff --git a/arch/powerpc/platforms/powernv/pci-sriov.c b/arch/powerpc/platforms/powernv/pci-sriov.c
index 04155aaaadb1..fe3d111b881c 100644
--- a/arch/powerpc/platforms/powernv/pci-sriov.c
+++ b/arch/powerpc/platforms/powernv/pci-sriov.c
@@ -699,7 +699,7 @@ static int pnv_pci_sriov_enable(struct pci_dev *pdev, u16 num_vfs)
 		return -ENOSPC;
 	}
 
-	/* allocate a contigious block of PEs for our VFs */
+	/* allocate a contiguous block of PEs for our VFs */
 	base_pe = pnv_ioda_alloc_pe(phb, num_vfs);
 	if (!base_pe) {
 		pci_err(pdev, "Unable to allocate PEs for %d VFs\n", num_vfs);
diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index 4d991cf840d9..7639e7355df2 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -1430,7 +1430,7 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 
 		pci->table_group->tables[1] = newtbl;
 
-		/* Keep default DMA window stuct if removed */
+		/* Keep default DMA window struct if removed */
 		if (default_win_removed) {
 			tbl->it_size = 0;
 			vfree(tbl->it_map);
diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platforms/pseries/setup.c
index 0f74b2284773..1a295350c403 100644
--- a/arch/powerpc/platforms/pseries/setup.c
+++ b/arch/powerpc/platforms/pseries/setup.c
@@ -658,7 +658,7 @@ static resource_size_t pseries_get_iov_fw_value(struct pci_dev *dev, int resno,
 	 */
 	num_res = of_read_number(&indexes[NUM_RES_PROPERTY], 1);
 	if (resno >= num_res)
-		return 0; /* or an errror */
+		return 0; /* or an error */
 
 	i = START_OF_ENTRIES + NEXT_ENTRY * resno;
 	switch (value) {
@@ -762,7 +762,7 @@ static void pseries_pci_fixup_iov_resources(struct pci_dev *pdev)
 
 	if (!pdev->is_physfn)
 		return;
-	/*Firmware must support open sriov otherwise dont configure*/
+	/*Firmware must support open sriov otherwise don't configure*/
 	indexes = of_get_property(dn, "ibm,open-sriov-vf-bar-info", NULL);
 	if (indexes)
 		of_pci_parse_iov_addrs(pdev, indexes);
diff --git a/arch/powerpc/platforms/pseries/vas-sysfs.c b/arch/powerpc/platforms/pseries/vas-sysfs.c
index 909535ca513a..59aef6062847 100644
--- a/arch/powerpc/platforms/pseries/vas-sysfs.c
+++ b/arch/powerpc/platforms/pseries/vas-sysfs.c
@@ -67,7 +67,7 @@ struct vas_sysfs_entry {
  * Create sysfs interface:
  * /sys/devices/vas/vas0/gzip/default_capabilities
  *	This directory contains the following VAS GZIP capabilities
- *	for the defaule credit type.
+ *	for the default credit type.
  * /sys/devices/vas/vas0/gzip/default_capabilities/nr_total_credits
  *	Total number of default credits assigned to the LPAR which
  *	can be changed with DLPAR operation.
diff --git a/arch/powerpc/platforms/pseries/vas.c b/arch/powerpc/platforms/pseries/vas.c
index 1f59d78c77a1..245e0a42981a 100644
--- a/arch/powerpc/platforms/pseries/vas.c
+++ b/arch/powerpc/platforms/pseries/vas.c
@@ -807,7 +807,7 @@ int vas_reconfig_capabilties(u8 type)
 	atomic_set(&caps->nr_total_credits, new_nr_creds);
 	/*
 	 * The total number of available credits may be decreased or
-	 * inceased with DLPAR operation. Means some windows have to be
+	 * increased with DLPAR operation. Means some windows have to be
 	 * closed / reopened. Hold the vas_pseries_mutex so that the
 	 * the user space can not open new windows.
 	 */
diff --git a/arch/powerpc/sysdev/fsl_lbc.c b/arch/powerpc/sysdev/fsl_lbc.c
index 1985e067e952..18acfb4e82af 100644
--- a/arch/powerpc/sysdev/fsl_lbc.c
+++ b/arch/powerpc/sysdev/fsl_lbc.c
@@ -37,7 +37,7 @@ EXPORT_SYMBOL(fsl_lbc_ctrl_dev);
  *
  * This function converts a base address of lbc into the right format for the
  * BR register. If the SOC has eLBC then it returns 32bit physical address
- * else it convers a 34bit local bus physical address to correct format of
+ * else it converts a 34bit local bus physical address to correct format of
  * 32bit address for BR register (Example: MPC8641).
  */
 u32 fsl_lbc_addr(phys_addr_t addr_base)
diff --git a/arch/powerpc/sysdev/fsl_pci.c b/arch/powerpc/sysdev/fsl_pci.c
index a97ce602394e..e5e29033929a 100644
--- a/arch/powerpc/sysdev/fsl_pci.c
+++ b/arch/powerpc/sysdev/fsl_pci.c
@@ -218,7 +218,7 @@ static void setup_pci_atmu(struct pci_controller *hose)
 		 * windows have implemented the default target value as 0xf
 		 * for CCSR space.In all Freescale legacy devices the target
 		 * of 0xf is reserved for local memory space. 9132 Rev1.0
-		 * now has local mempry space mapped to target 0x0 instead of
+		 * now has local memory space mapped to target 0x0 instead of
 		 * 0xf. Hence adding a workaround to remove the target 0xf
 		 * defined for memory space from Inbound window attributes.
 		 */
diff --git a/arch/powerpc/sysdev/ge/ge_pic.c b/arch/powerpc/sysdev/ge/ge_pic.c
index 02553a8ce191..413b375c4d28 100644
--- a/arch/powerpc/sysdev/ge/ge_pic.c
+++ b/arch/powerpc/sysdev/ge/ge_pic.c
@@ -150,7 +150,7 @@ static struct irq_chip gef_pic_chip = {
 };
 
 
-/* When an interrupt is being configured, this call allows some flexibilty
+/* When an interrupt is being configured, this call allows some flexibility
  * in deciding which irq_chip structure is used
  */
 static int gef_pic_host_map(struct irq_domain *h, unsigned int virq,
diff --git a/arch/powerpc/sysdev/mpic_msgr.c b/arch/powerpc/sysdev/mpic_msgr.c
index 36ec0bdd8b63..a25413826b63 100644
--- a/arch/powerpc/sysdev/mpic_msgr.c
+++ b/arch/powerpc/sysdev/mpic_msgr.c
@@ -99,7 +99,7 @@ void mpic_msgr_disable(struct mpic_msgr *msgr)
 EXPORT_SYMBOL_GPL(mpic_msgr_disable);
 
 /* The following three functions are used to compute the order and number of
- * the message register blocks.  They are clearly very inefficent.  However,
+ * the message register blocks.  They are clearly very inefficient.  However,
  * they are called *only* a few times during device initialization.
  */
 static unsigned int mpic_msgr_number_of_blocks(void)
diff --git a/arch/powerpc/sysdev/mpic_msi.c b/arch/powerpc/sysdev/mpic_msi.c
index f412d6ad0b66..9936c014ac7d 100644
--- a/arch/powerpc/sysdev/mpic_msi.c
+++ b/arch/powerpc/sysdev/mpic_msi.c
@@ -37,7 +37,7 @@ static int __init mpic_msi_reserve_u3_hwirqs(struct mpic *mpic)
 	/* Reserve source numbers we know are reserved in the HW.
 	 *
 	 * This is a bit of a mix of U3 and U4 reserves but that's going
-	 * to work fine, we have plenty enugh numbers left so let's just
+	 * to work fine, we have plenty enough numbers left so let's just
 	 * mark anything we don't like reserved.
 	 */
 	for (i = 0;   i < 8;   i++)
diff --git a/arch/powerpc/sysdev/mpic_timer.c b/arch/powerpc/sysdev/mpic_timer.c
index 444e9ce42d0a..b2f0a73e8f93 100644
--- a/arch/powerpc/sysdev/mpic_timer.c
+++ b/arch/powerpc/sysdev/mpic_timer.c
@@ -255,7 +255,7 @@ EXPORT_SYMBOL(mpic_start_timer);
 
 /**
  * mpic_stop_timer - stop hardware timer
- * @handle: the timer to be stoped
+ * @handle: the timer to be stopped
  *
  * The timer periodically generates an interrupt. Unless user stops the timer.
  */
diff --git a/arch/powerpc/sysdev/mpic_u3msi.c b/arch/powerpc/sysdev/mpic_u3msi.c
index 3f4841dfefb5..73d129594078 100644
--- a/arch/powerpc/sysdev/mpic_u3msi.c
+++ b/arch/powerpc/sysdev/mpic_u3msi.c
@@ -78,7 +78,7 @@ static u64 find_u4_magic_addr(struct pci_dev *pdev, unsigned int hwirq)
 
 	/* U4 PCIe MSIs need to write to the special register in
 	 * the bridge that generates interrupts. There should be
-	 * theorically a register at 0xf8005000 where you just write
+	 * theoretically a register at 0xf8005000 where you just write
 	 * the MSI number and that triggers the right interrupt, but
 	 * unfortunately, this is busted in HW, the bridge endian swaps
 	 * the value and hits the wrong nibble in the register.
diff --git a/arch/powerpc/sysdev/xive/native.c b/arch/powerpc/sysdev/xive/native.c
index f940428ad13f..45f72fc715fc 100644
--- a/arch/powerpc/sysdev/xive/native.c
+++ b/arch/powerpc/sysdev/xive/native.c
@@ -617,7 +617,7 @@ bool __init xive_native_init(void)
 
 	xive_tima_os = r.start;
 
-	/* Grab size of provisionning pages */
+	/* Grab size of provisioning pages */
 	xive_parse_provisioning(np);
 
 	/* Switch the XIVE to exploitation mode */
diff --git a/arch/powerpc/xmon/ppc-opc.c b/arch/powerpc/xmon/ppc-opc.c
index dfb80810b16c..0774d711453e 100644
--- a/arch/powerpc/xmon/ppc-opc.c
+++ b/arch/powerpc/xmon/ppc-opc.c
@@ -408,7 +408,7 @@ const struct powerpc_operand powerpc_operands[] =
 #define FXM4 FXM + 1
   { 0xff, 12, insert_fxm, extract_fxm,
     PPC_OPERAND_OPTIONAL | PPC_OPERAND_OPTIONAL_VALUE},
-  /* If the FXM4 operand is ommitted, use the sentinel value -1.  */
+  /* If the FXM4 operand is omitted, use the sentinel value -1.  */
   { -1, -1, NULL, NULL, 0},
 
   /* The IMM20 field in an LI instruction.  */
diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index b423812e94e0..b80ab82b98e5 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -2024,7 +2024,7 @@ static void dump_206_sprs(void)
 	if (!cpu_has_feature(CPU_FTR_ARCH_206))
 		return;
 
-	/* Actually some of these pre-date 2.06, but whatevs */
+	/* Actually some of these pre-date 2.06, but whatever */
 
 	printf("srr0   = %.16lx  srr1  = %.16lx dsisr  = %.8lx\n",
 		mfspr(SPRN_SRR0), mfspr(SPRN_SRR1), mfspr(SPRN_DSISR));
diff --git a/arch/powerpc/platforms/powernv/ocxl.c b/arch/powerpc/platforms/powernv/ocxl.c
index 28b009b46464..27c936075031 100644
--- a/arch/powerpc/platforms/powernv/ocxl.c
+++ b/arch/powerpc/platforms/powernv/ocxl.c
@@ -289,7 +289,7 @@ int pnv_ocxl_get_pasid_count(struct pci_dev *dev, int *count)
 	 * be used by a function depends on how many functions exist
 	 * on the device. The NPU needs to be configured to know how
 	 * many bits are available to PASIDs and how many are to be
-	 * used by the function BDF indentifier.
+	 * used by the function BDF identifier.
 	 *
 	 * We only support one AFU-carrying function for now.
 	 */

