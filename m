Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 144AE1F323C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 04:14:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49gtww1vxzzDqSw
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 12:14:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=107.174.27.60; helo=ozlabs.ru;
 envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Received: from ozlabs.ru (unknown [107.174.27.60])
 by lists.ozlabs.org (Postfix) with ESMTP id 49gtvF6ZYbzDqD2
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jun 2020 12:13:11 +1000 (AEST)
Received: from fstn1-p1.ozlabs.ibm.com (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id 35E39AE8000F;
 Mon,  8 Jun 2020 22:10:16 -0400 (EDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH kernel] KVM: PPC: Protect kvm_vcpu_read_guest with srcu locks
Date: Tue,  9 Jun 2020 12:12:29 +1000
Message-Id: <20200609021230.103494-1-aik@ozlabs.ru>
X-Mailer: git-send-email 2.17.1
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The kvm_vcpu_read_guest/kvm_vcpu_write_guest used for nested guests
eventually call srcu_dereference_check to dereference a memslot and
lockdep produces a warning as neither kvm->slots_lock nor
kvm->srcu lock is held and kvm->users_count is above zero (>100 in fact).

This wraps mentioned VCPU read/write helpers in srcu read lock/unlock as
it is done in other places. This uses vcpu->srcu_idx when possible.

These helpers are only used for nested KVM so this may explain why
we did not see these before.

Here is an example of a warning:

=============================
WARNING: suspicious RCU usage
5.7.0-rc3-le_dma-bypass.3.2_a+fstn1 #897 Not tainted
-----------------------------
include/linux/kvm_host.h:633 suspicious rcu_dereference_check() usage!

other info that might help us debug this:

rcu_scheduler_active = 2, debug_locks = 1
1 lock held by qemu-system-ppc/2752:
 #0: c000200359016be0 (&vcpu->mutex){+.+.}-{3:3}, at: kvm_vcpu_ioctl+0x144/0xd80 [kvm]

stack backtrace:
CPU: 80 PID: 2752 Comm: qemu-system-ppc Not tainted 5.7.0-rc3-le_dma-bypass.3.2_a+fstn1 #897
Call Trace:
[c0002003591ab240] [c000000000b23ab4] dump_stack+0x190/0x25c (unreliable)
[c0002003591ab2b0] [c00000000023f954] lockdep_rcu_suspicious+0x140/0x164
[c0002003591ab330] [c008000004a445f8] kvm_vcpu_gfn_to_memslot+0x4c0/0x510 [kvm]
[c0002003591ab3a0] [c008000004a44c18] kvm_vcpu_read_guest+0xa0/0x180 [kvm]
[c0002003591ab410] [c008000004ff9bd8] kvmhv_enter_nested_guest+0x90/0xb80 [kvm_hv]
[c0002003591ab980] [c008000004fe07bc] kvmppc_pseries_do_hcall+0x7b4/0x1c30 [kvm_hv]
[c0002003591aba10] [c008000004fe5d30] kvmppc_vcpu_run_hv+0x10a8/0x1a30 [kvm_hv]
[c0002003591abae0] [c008000004a5d954] kvmppc_vcpu_run+0x4c/0x70 [kvm]
[c0002003591abb10] [c008000004a56e54] kvm_arch_vcpu_ioctl_run+0x56c/0x7c0 [kvm]
[c0002003591abba0] [c008000004a3ddc4] kvm_vcpu_ioctl+0x4ac/0xd80 [kvm]
[c0002003591abd20] [c0000000006ebb58] ksys_ioctl+0x188/0x210
[c0002003591abd70] [c0000000006ebc28] sys_ioctl+0x48/0xb0
[c0002003591abdb0] [c000000000042764] system_call_exception+0x1d4/0x2e0
[c0002003591abe20] [c00000000000cce8] system_call_common+0xe8/0x214

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 arch/powerpc/kvm/book3s_64_mmu_radix.c |  4 ++++
 arch/powerpc/kvm/book3s_hv_nested.c    | 30 ++++++++++++++++----------
 arch/powerpc/kvm/book3s_rtas.c         |  2 ++
 arch/powerpc/kvm/powerpc.c             |  5 ++++-
 4 files changed, 29 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_64_mmu_radix.c b/arch/powerpc/kvm/book3s_64_mmu_radix.c
index aa12cd4078b3..ef7fcc2e7c96 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_radix.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_radix.c
@@ -160,7 +160,9 @@ int kvmppc_mmu_walk_radix_tree(struct kvm_vcpu *vcpu, gva_t eaddr,
 			return -EINVAL;
 		/* Read the entry from guest memory */
 		addr = base + (index * sizeof(rpte));
+		vcpu->srcu_idx = srcu_read_lock(&kvm->srcu);
 		ret = kvm_read_guest(kvm, addr, &rpte, sizeof(rpte));
+		srcu_read_unlock(&kvm->srcu, vcpu->srcu_idx);
 		if (ret) {
 			if (pte_ret_p)
 				*pte_ret_p = addr;
@@ -236,7 +238,9 @@ int kvmppc_mmu_radix_translate_table(struct kvm_vcpu *vcpu, gva_t eaddr,
 
 	/* Read the table to find the root of the radix tree */
 	ptbl = (table & PRTB_MASK) + (table_index * sizeof(entry));
+	vcpu->srcu_idx = srcu_read_lock(&kvm->srcu);
 	ret = kvm_read_guest(kvm, ptbl, &entry, sizeof(entry));
+	srcu_read_unlock(&kvm->srcu, vcpu->srcu_idx);
 	if (ret)
 		return ret;
 
diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3s_hv_nested.c
index dc97e5be76f6..1d3ab6fb00a7 100644
--- a/arch/powerpc/kvm/book3s_hv_nested.c
+++ b/arch/powerpc/kvm/book3s_hv_nested.c
@@ -233,20 +233,21 @@ long kvmhv_enter_nested_guest(struct kvm_vcpu *vcpu)
 
 	/* copy parameters in */
 	hv_ptr = kvmppc_get_gpr(vcpu, 4);
+	regs_ptr = kvmppc_get_gpr(vcpu, 5);
+	vcpu->srcu_idx = srcu_read_lock(&vcpu->kvm->srcu);
 	err = kvm_vcpu_read_guest(vcpu, hv_ptr, &l2_hv,
-				  sizeof(struct hv_guest_state));
+				  sizeof(struct hv_guest_state)) ||
+		kvm_vcpu_read_guest(vcpu, regs_ptr, &l2_regs,
+				    sizeof(struct pt_regs));
+	srcu_read_unlock(&vcpu->kvm->srcu, vcpu->srcu_idx);
 	if (err)
 		return H_PARAMETER;
+
 	if (kvmppc_need_byteswap(vcpu))
 		byteswap_hv_regs(&l2_hv);
 	if (l2_hv.version != HV_GUEST_STATE_VERSION)
 		return H_P2;
 
-	regs_ptr = kvmppc_get_gpr(vcpu, 5);
-	err = kvm_vcpu_read_guest(vcpu, regs_ptr, &l2_regs,
-				  sizeof(struct pt_regs));
-	if (err)
-		return H_PARAMETER;
 	if (kvmppc_need_byteswap(vcpu))
 		byteswap_pt_regs(&l2_regs);
 	if (l2_hv.vcpu_token >= NR_CPUS)
@@ -324,12 +325,12 @@ long kvmhv_enter_nested_guest(struct kvm_vcpu *vcpu)
 		byteswap_hv_regs(&l2_hv);
 		byteswap_pt_regs(&l2_regs);
 	}
+	vcpu->srcu_idx = srcu_read_lock(&vcpu->kvm->srcu);
 	err = kvm_vcpu_write_guest(vcpu, hv_ptr, &l2_hv,
-				   sizeof(struct hv_guest_state));
-	if (err)
-		return H_AUTHORITY;
-	err = kvm_vcpu_write_guest(vcpu, regs_ptr, &l2_regs,
+				   sizeof(struct hv_guest_state)) ||
+		kvm_vcpu_write_guest(vcpu, regs_ptr, &l2_regs,
 				   sizeof(struct pt_regs));
+	srcu_read_unlock(&vcpu->kvm->srcu, vcpu->srcu_idx);
 	if (err)
 		return H_AUTHORITY;
 
@@ -509,12 +510,16 @@ long kvmhv_copy_tofrom_guest_nested(struct kvm_vcpu *vcpu)
 			goto not_found;
 
 		/* Write what was loaded into our buffer back to the L1 guest */
+		vcpu->srcu_idx = srcu_read_lock(&vcpu->kvm->srcu);
 		rc = kvm_vcpu_write_guest(vcpu, gp_to, buf, n);
+		srcu_read_unlock(&vcpu->kvm->srcu, vcpu->srcu_idx);
 		if (rc)
 			goto not_found;
 	} else {
 		/* Load the data to be stored from the L1 guest into our buf */
+		vcpu->srcu_idx = srcu_read_lock(&vcpu->kvm->srcu);
 		rc = kvm_vcpu_read_guest(vcpu, gp_from, buf, n);
+		srcu_read_unlock(&vcpu->kvm->srcu, vcpu->srcu_idx);
 		if (rc)
 			goto not_found;
 
@@ -549,9 +554,12 @@ static void kvmhv_update_ptbl_cache(struct kvm_nested_guest *gp)
 
 	ret = -EFAULT;
 	ptbl_addr = (kvm->arch.l1_ptcr & PRTB_MASK) + (gp->l1_lpid << 4);
-	if (gp->l1_lpid < (1ul << ((kvm->arch.l1_ptcr & PRTS_MASK) + 8)))
+	if (gp->l1_lpid < (1ul << ((kvm->arch.l1_ptcr & PRTS_MASK) + 8))) {
+		int srcu_idx = srcu_read_lock(&kvm->srcu);
 		ret = kvm_read_guest(kvm, ptbl_addr,
 				     &ptbl_entry, sizeof(ptbl_entry));
+		srcu_read_unlock(&kvm->srcu, srcu_idx);
+	}
 	if (ret) {
 		gp->l1_gr_to_hr = 0;
 		gp->process_table = 0;
diff --git a/arch/powerpc/kvm/book3s_rtas.c b/arch/powerpc/kvm/book3s_rtas.c
index 26b25994c969..c5e677508d3b 100644
--- a/arch/powerpc/kvm/book3s_rtas.c
+++ b/arch/powerpc/kvm/book3s_rtas.c
@@ -229,7 +229,9 @@ int kvmppc_rtas_hcall(struct kvm_vcpu *vcpu)
 	 */
 	args_phys = kvmppc_get_gpr(vcpu, 4) & KVM_PAM;
 
+	vcpu->srcu_idx = srcu_read_lock(&vcpu->kvm->srcu);
 	rc = kvm_read_guest(vcpu->kvm, args_phys, &args, sizeof(args));
+	srcu_read_unlock(&vcpu->kvm->srcu, vcpu->srcu_idx);
 	if (rc)
 		goto fail;
 
diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index e15166b0a16d..2c3a1c799e14 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -403,7 +403,10 @@ int kvmppc_ld(struct kvm_vcpu *vcpu, ulong *eaddr, int size, void *ptr,
 		return EMULATE_DONE;
 	}
 
-	if (kvm_read_guest(vcpu->kvm, pte.raddr, ptr, size))
+	vcpu->srcu_idx = srcu_read_lock(&vcpu->kvm->srcu);
+	rc = kvm_read_guest(vcpu->kvm, pte.raddr, ptr, size);
+	srcu_read_unlock(&vcpu->kvm->srcu, vcpu->srcu_idx);
+	if (rc)
 		return EMULATE_DO_MMIO;
 
 	return EMULATE_DONE;
-- 
2.17.1

