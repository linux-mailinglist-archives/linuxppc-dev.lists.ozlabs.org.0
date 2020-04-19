Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1381AF894
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Apr 2020 10:02:35 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 494j3r1d49zDrCj
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Apr 2020 18:02:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.131;
 helo=out30-131.freemail.mail.aliyun.com;
 envelope-from=tianjia.zhang@linux.alibaba.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.alibaba.com
Received: from out30-131.freemail.mail.aliyun.com
 (out30-131.freemail.mail.aliyun.com [115.124.30.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 494hq74WsvzDqx6
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Apr 2020 17:51:30 +1000 (AEST)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R101e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e01358;
 MF=tianjia.zhang@linux.alibaba.com; NM=1; PH=DS; RN=37; SR=0;
 TI=SMTPD_---0Tvyi2fB_1587282671; 
Received: from localhost(mailfrom:tianjia.zhang@linux.alibaba.com
 fp:SMTPD_---0Tvyi2fB_1587282671) by smtp.aliyun-inc.com(127.0.0.1);
 Sun, 19 Apr 2020 15:51:11 +0800
From: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
To: pbonzini@redhat.com, tsbogend@alpha.franken.de, paulus@ozlabs.org,
 mpe@ellerman.id.au, benh@kernel.crashing.org, borntraeger@de.ibm.com,
 frankja@linux.ibm.com, david@redhat.com, cohuck@redhat.com,
 heiko.carstens@de.ibm.com, gor@linux.ibm.com,
 sean.j.christopherson@intel.com, vkuznets@redhat.com,
 wanpengli@tencent.com, jmattson@google.com, joro@8bytes.org,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, x86@kernel.org,
 hpa@zytor.com, maz@kernel.org, james.morse@arm.com,
 julien.thierry.kdev@gmail.com, suzuki.poulose@arm.com,
 christoffer.dall@arm.com, peterx@redhat.com, thuth@redhat.com
Subject: [PATCH 4/7] KVM: PPC: clean up redundant 'kvm_run' parameters
Date: Sun, 19 Apr 2020 15:51:03 +0800
Message-Id: <20200419075106.16248-5-tianjia.zhang@linux.alibaba.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200419075106.16248-1-tianjia.zhang@linux.alibaba.com>
References: <20200419075106.16248-1-tianjia.zhang@linux.alibaba.com>
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
Cc: linux-s390@vger.kernel.org, tianjia.zhang@linux.alibaba.com,
 kvm@vger.kernel.org, linux-mips@vger.kernel.org, kvm-ppc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 kvmarm@lists.cs.columbia.edu, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In the current kvm version, 'kvm_run' has been included in the 'kvm_vcpu'
structure. Earlier than historical reasons, many kvm-related function
parameters retain the 'kvm_run' and 'kvm_vcpu' parameters at the same time.
This patch does a unified cleanup of these remaining redundant parameters.

Signed-off-by: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
---
 arch/powerpc/include/asm/kvm_book3s.h    | 16 +++---
 arch/powerpc/include/asm/kvm_ppc.h       | 27 +++++----
 arch/powerpc/kvm/book3s.c                |  4 +-
 arch/powerpc/kvm/book3s.h                |  2 +-
 arch/powerpc/kvm/book3s_64_mmu_hv.c      | 12 ++--
 arch/powerpc/kvm/book3s_64_mmu_radix.c   |  4 +-
 arch/powerpc/kvm/book3s_emulate.c        | 10 ++--
 arch/powerpc/kvm/book3s_hv.c             | 60 ++++++++++----------
 arch/powerpc/kvm/book3s_hv_nested.c      | 11 ++--
 arch/powerpc/kvm/book3s_paired_singles.c | 72 ++++++++++++------------
 arch/powerpc/kvm/book3s_pr.c             | 30 +++++-----
 arch/powerpc/kvm/booke.c                 | 36 ++++++------
 arch/powerpc/kvm/booke.h                 |  8 +--
 arch/powerpc/kvm/booke_emulate.c         |  2 +-
 arch/powerpc/kvm/e500_emulate.c          | 15 +++--
 arch/powerpc/kvm/emulate.c               | 10 ++--
 arch/powerpc/kvm/emulate_loadstore.c     | 32 +++++------
 arch/powerpc/kvm/powerpc.c               | 72 ++++++++++++------------
 arch/powerpc/kvm/trace_hv.h              |  6 +-
 19 files changed, 212 insertions(+), 217 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_book3s.h b/arch/powerpc/include/asm/kvm_book3s.h
index 506e4df2d730..66dbb1f85d59 100644
--- a/arch/powerpc/include/asm/kvm_book3s.h
+++ b/arch/powerpc/include/asm/kvm_book3s.h
@@ -155,12 +155,11 @@ extern void kvmppc_mmu_unmap_page(struct kvm_vcpu *vcpu, struct kvmppc_pte *pte)
 extern int kvmppc_mmu_map_segment(struct kvm_vcpu *vcpu, ulong eaddr);
 extern void kvmppc_mmu_flush_segment(struct kvm_vcpu *vcpu, ulong eaddr, ulong seg_size);
 extern void kvmppc_mmu_flush_segments(struct kvm_vcpu *vcpu);
-extern int kvmppc_book3s_hv_page_fault(struct kvm_run *run,
-			struct kvm_vcpu *vcpu, unsigned long addr,
-			unsigned long status);
+extern int kvmppc_book3s_hv_page_fault(struct kvm_vcpu *vcpu,
+			unsigned long addr, unsigned long status);
 extern long kvmppc_hv_find_lock_hpte(struct kvm *kvm, gva_t eaddr,
 			unsigned long slb_v, unsigned long valid);
-extern int kvmppc_hv_emulate_mmio(struct kvm_run *run, struct kvm_vcpu *vcpu,
+extern int kvmppc_hv_emulate_mmio(struct kvm_vcpu *vcpu,
 			unsigned long gpa, gva_t ea, int is_store);
 
 extern void kvmppc_mmu_hpte_cache_map(struct kvm_vcpu *vcpu, struct hpte_cache *pte);
@@ -174,8 +173,7 @@ extern void kvmppc_mmu_hpte_sysexit(void);
 extern int kvmppc_mmu_hv_init(void);
 extern int kvmppc_book3s_hcall_implemented(struct kvm *kvm, unsigned long hc);
 
-extern int kvmppc_book3s_radix_page_fault(struct kvm_run *run,
-			struct kvm_vcpu *vcpu,
+extern int kvmppc_book3s_radix_page_fault(struct kvm_vcpu *vcpu,
 			unsigned long ea, unsigned long dsisr);
 extern unsigned long __kvmhv_copy_tofrom_guest_radix(int lpid, int pid,
 					gva_t eaddr, void *to, void *from,
@@ -234,7 +232,7 @@ extern void kvmppc_trigger_fac_interrupt(struct kvm_vcpu *vcpu, ulong fac);
 extern void kvmppc_set_bat(struct kvm_vcpu *vcpu, struct kvmppc_bat *bat,
 			   bool upper, u32 val);
 extern void kvmppc_giveup_ext(struct kvm_vcpu *vcpu, ulong msr);
-extern int kvmppc_emulate_paired_single(struct kvm_run *run, struct kvm_vcpu *vcpu);
+extern int kvmppc_emulate_paired_single(struct kvm_vcpu *vcpu);
 extern kvm_pfn_t kvmppc_gpa_to_pfn(struct kvm_vcpu *vcpu, gpa_t gpa,
 			bool writing, bool *writable);
 extern void kvmppc_add_revmap_chain(struct kvm *kvm, struct revmap_entry *rev,
@@ -300,12 +298,12 @@ void kvmhv_set_ptbl_entry(unsigned int lpid, u64 dw0, u64 dw1);
 void kvmhv_release_all_nested(struct kvm *kvm);
 long kvmhv_enter_nested_guest(struct kvm_vcpu *vcpu);
 long kvmhv_do_nested_tlbie(struct kvm_vcpu *vcpu);
-int kvmhv_run_single_vcpu(struct kvm_run *kvm_run, struct kvm_vcpu *vcpu,
+int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu,
 			  u64 time_limit, unsigned long lpcr);
 void kvmhv_save_hv_regs(struct kvm_vcpu *vcpu, struct hv_guest_state *hr);
 void kvmhv_restore_hv_return_state(struct kvm_vcpu *vcpu,
 				   struct hv_guest_state *hr);
-long int kvmhv_nested_page_fault(struct kvm_run *run, struct kvm_vcpu *vcpu);
+long int kvmhv_nested_page_fault(struct kvm_vcpu *vcpu);
 
 void kvmppc_giveup_fac(struct kvm_vcpu *vcpu, ulong fac);
 
diff --git a/arch/powerpc/include/asm/kvm_ppc.h b/arch/powerpc/include/asm/kvm_ppc.h
index 94f5a32acaf1..ccf66b3a4c1d 100644
--- a/arch/powerpc/include/asm/kvm_ppc.h
+++ b/arch/powerpc/include/asm/kvm_ppc.h
@@ -58,28 +58,28 @@ enum xlate_readwrite {
 	XLATE_WRITE		/* check for write permissions */
 };
 
-extern int kvmppc_vcpu_run(struct kvm_run *kvm_run, struct kvm_vcpu *vcpu);
-extern int __kvmppc_vcpu_run(struct kvm_run *kvm_run, struct kvm_vcpu *vcpu);
+extern int kvmppc_vcpu_run(struct kvm_vcpu *vcpu);
+extern int __kvmppc_vcpu_run(struct kvm_run *run, struct kvm_vcpu *vcpu);
 extern void kvmppc_handler_highmem(void);
 
 extern void kvmppc_dump_vcpu(struct kvm_vcpu *vcpu);
-extern int kvmppc_handle_load(struct kvm_run *run, struct kvm_vcpu *vcpu,
+extern int kvmppc_handle_load(struct kvm_vcpu *vcpu,
                               unsigned int rt, unsigned int bytes,
 			      int is_default_endian);
-extern int kvmppc_handle_loads(struct kvm_run *run, struct kvm_vcpu *vcpu,
+extern int kvmppc_handle_loads(struct kvm_vcpu *vcpu,
                                unsigned int rt, unsigned int bytes,
 			       int is_default_endian);
-extern int kvmppc_handle_vsx_load(struct kvm_run *run, struct kvm_vcpu *vcpu,
+extern int kvmppc_handle_vsx_load(struct kvm_vcpu *vcpu,
 				unsigned int rt, unsigned int bytes,
 			int is_default_endian, int mmio_sign_extend);
-extern int kvmppc_handle_vmx_load(struct kvm_run *run, struct kvm_vcpu *vcpu,
+extern int kvmppc_handle_vmx_load(struct kvm_vcpu *vcpu,
 		unsigned int rt, unsigned int bytes, int is_default_endian);
-extern int kvmppc_handle_vmx_store(struct kvm_run *run, struct kvm_vcpu *vcpu,
+extern int kvmppc_handle_vmx_store(struct kvm_vcpu *vcpu,
 		unsigned int rs, unsigned int bytes, int is_default_endian);
-extern int kvmppc_handle_store(struct kvm_run *run, struct kvm_vcpu *vcpu,
+extern int kvmppc_handle_store(struct kvm_vcpu *vcpu,
 			       u64 val, unsigned int bytes,
 			       int is_default_endian);
-extern int kvmppc_handle_vsx_store(struct kvm_run *run, struct kvm_vcpu *vcpu,
+extern int kvmppc_handle_vsx_store(struct kvm_vcpu *vcpu,
 				int rs, unsigned int bytes,
 				int is_default_endian);
 
@@ -90,10 +90,9 @@ extern int kvmppc_ld(struct kvm_vcpu *vcpu, ulong *eaddr, int size, void *ptr,
 		     bool data);
 extern int kvmppc_st(struct kvm_vcpu *vcpu, ulong *eaddr, int size, void *ptr,
 		     bool data);
-extern int kvmppc_emulate_instruction(struct kvm_run *run,
-                                      struct kvm_vcpu *vcpu);
+extern int kvmppc_emulate_instruction(struct kvm_vcpu *vcpu);
 extern int kvmppc_emulate_loadstore(struct kvm_vcpu *vcpu);
-extern int kvmppc_emulate_mmio(struct kvm_run *run, struct kvm_vcpu *vcpu);
+extern int kvmppc_emulate_mmio(struct kvm_vcpu *vcpu);
 extern void kvmppc_emulate_dec(struct kvm_vcpu *vcpu);
 extern u32 kvmppc_get_dec(struct kvm_vcpu *vcpu, u64 tb);
 extern void kvmppc_decrementer_func(struct kvm_vcpu *vcpu);
@@ -267,7 +266,7 @@ struct kvmppc_ops {
 	void (*vcpu_put)(struct kvm_vcpu *vcpu);
 	void (*inject_interrupt)(struct kvm_vcpu *vcpu, int vec, u64 srr1_flags);
 	void (*set_msr)(struct kvm_vcpu *vcpu, u64 msr);
-	int (*vcpu_run)(struct kvm_run *run, struct kvm_vcpu *vcpu);
+	int (*vcpu_run)(struct kvm_vcpu *vcpu);
 	int (*vcpu_create)(struct kvm_vcpu *vcpu);
 	void (*vcpu_free)(struct kvm_vcpu *vcpu);
 	int (*check_requests)(struct kvm_vcpu *vcpu);
@@ -291,7 +290,7 @@ struct kvmppc_ops {
 	int (*init_vm)(struct kvm *kvm);
 	void (*destroy_vm)(struct kvm *kvm);
 	int (*get_smmu_info)(struct kvm *kvm, struct kvm_ppc_smmu_info *info);
-	int (*emulate_op)(struct kvm_run *run, struct kvm_vcpu *vcpu,
+	int (*emulate_op)(struct kvm_vcpu *vcpu,
 			  unsigned int inst, int *advance);
 	int (*emulate_mtspr)(struct kvm_vcpu *vcpu, int sprn, ulong spr_val);
 	int (*emulate_mfspr)(struct kvm_vcpu *vcpu, int sprn, ulong *spr_val);
diff --git a/arch/powerpc/kvm/book3s.c b/arch/powerpc/kvm/book3s.c
index 5690a1f9b976..345d22de213b 100644
--- a/arch/powerpc/kvm/book3s.c
+++ b/arch/powerpc/kvm/book3s.c
@@ -758,9 +758,9 @@ void kvmppc_set_msr(struct kvm_vcpu *vcpu, u64 msr)
 }
 EXPORT_SYMBOL_GPL(kvmppc_set_msr);
 
-int kvmppc_vcpu_run(struct kvm_run *kvm_run, struct kvm_vcpu *vcpu)
+int kvmppc_vcpu_run(struct kvm_vcpu *vcpu)
 {
-	return vcpu->kvm->arch.kvm_ops->vcpu_run(kvm_run, vcpu);
+	return vcpu->kvm->arch.kvm_ops->vcpu_run(vcpu);
 }
 
 int kvm_arch_vcpu_ioctl_translate(struct kvm_vcpu *vcpu,
diff --git a/arch/powerpc/kvm/book3s.h b/arch/powerpc/kvm/book3s.h
index eae259ee49af..9b6323ec8e60 100644
--- a/arch/powerpc/kvm/book3s.h
+++ b/arch/powerpc/kvm/book3s.h
@@ -18,7 +18,7 @@ extern void kvm_set_spte_hva_hv(struct kvm *kvm, unsigned long hva, pte_t pte);
 
 extern int kvmppc_mmu_init_pr(struct kvm_vcpu *vcpu);
 extern void kvmppc_mmu_destroy_pr(struct kvm_vcpu *vcpu);
-extern int kvmppc_core_emulate_op_pr(struct kvm_run *run, struct kvm_vcpu *vcpu,
+extern int kvmppc_core_emulate_op_pr(struct kvm_vcpu *vcpu,
 				     unsigned int inst, int *advance);
 extern int kvmppc_core_emulate_mtspr_pr(struct kvm_vcpu *vcpu,
 					int sprn, ulong spr_val);
diff --git a/arch/powerpc/kvm/book3s_64_mmu_hv.c b/arch/powerpc/kvm/book3s_64_mmu_hv.c
index 6404df613ea3..bb15472edc86 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_hv.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_hv.c
@@ -413,7 +413,7 @@ static int instruction_is_store(unsigned int instr)
 	return (instr & mask) != 0;
 }
 
-int kvmppc_hv_emulate_mmio(struct kvm_run *run, struct kvm_vcpu *vcpu,
+int kvmppc_hv_emulate_mmio(struct kvm_vcpu *vcpu,
 			   unsigned long gpa, gva_t ea, int is_store)
 {
 	u32 last_inst;
@@ -473,10 +473,10 @@ int kvmppc_hv_emulate_mmio(struct kvm_run *run, struct kvm_vcpu *vcpu,
 
 	vcpu->arch.paddr_accessed = gpa;
 	vcpu->arch.vaddr_accessed = ea;
-	return kvmppc_emulate_mmio(run, vcpu);
+	return kvmppc_emulate_mmio(vcpu);
 }
 
-int kvmppc_book3s_hv_page_fault(struct kvm_run *run, struct kvm_vcpu *vcpu,
+int kvmppc_book3s_hv_page_fault(struct kvm_vcpu *vcpu,
 				unsigned long ea, unsigned long dsisr)
 {
 	struct kvm *kvm = vcpu->kvm;
@@ -499,7 +499,7 @@ int kvmppc_book3s_hv_page_fault(struct kvm_run *run, struct kvm_vcpu *vcpu,
 	pte_t pte, *ptep;
 
 	if (kvm_is_radix(kvm))
-		return kvmppc_book3s_radix_page_fault(run, vcpu, ea, dsisr);
+		return kvmppc_book3s_radix_page_fault(vcpu, ea, dsisr);
 
 	/*
 	 * Real-mode code has already searched the HPT and found the
@@ -519,7 +519,7 @@ int kvmppc_book3s_hv_page_fault(struct kvm_run *run, struct kvm_vcpu *vcpu,
 			gpa_base = r & HPTE_R_RPN & ~(psize - 1);
 			gfn_base = gpa_base >> PAGE_SHIFT;
 			gpa = gpa_base | (ea & (psize - 1));
-			return kvmppc_hv_emulate_mmio(run, vcpu, gpa, ea,
+			return kvmppc_hv_emulate_mmio(vcpu, gpa, ea,
 						dsisr & DSISR_ISSTORE);
 		}
 	}
@@ -555,7 +555,7 @@ int kvmppc_book3s_hv_page_fault(struct kvm_run *run, struct kvm_vcpu *vcpu,
 
 	/* No memslot means it's an emulated MMIO region */
 	if (!memslot || (memslot->flags & KVM_MEMSLOT_INVALID))
-		return kvmppc_hv_emulate_mmio(run, vcpu, gpa, ea,
+		return kvmppc_hv_emulate_mmio(vcpu, gpa, ea,
 					      dsisr & DSISR_ISSTORE);
 
 	/*
diff --git a/arch/powerpc/kvm/book3s_64_mmu_radix.c b/arch/powerpc/kvm/book3s_64_mmu_radix.c
index 9f050064d2a2..f6c0812c2ee8 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_radix.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_radix.c
@@ -886,7 +886,7 @@ int kvmppc_book3s_instantiate_page(struct kvm_vcpu *vcpu,
 	return ret;
 }
 
-int kvmppc_book3s_radix_page_fault(struct kvm_run *run, struct kvm_vcpu *vcpu,
+int kvmppc_book3s_radix_page_fault(struct kvm_vcpu *vcpu,
 				   unsigned long ea, unsigned long dsisr)
 {
 	struct kvm *kvm = vcpu->kvm;
@@ -932,7 +932,7 @@ int kvmppc_book3s_radix_page_fault(struct kvm_run *run, struct kvm_vcpu *vcpu,
 			kvmppc_core_queue_data_storage(vcpu, ea, dsisr);
 			return RESUME_GUEST;
 		}
-		return kvmppc_hv_emulate_mmio(run, vcpu, gpa, ea, writing);
+		return kvmppc_hv_emulate_mmio(vcpu, gpa, ea, writing);
 	}
 
 	if (memslot->flags & KVM_MEM_READONLY) {
diff --git a/arch/powerpc/kvm/book3s_emulate.c b/arch/powerpc/kvm/book3s_emulate.c
index dad71d276b91..0effd48c8f4d 100644
--- a/arch/powerpc/kvm/book3s_emulate.c
+++ b/arch/powerpc/kvm/book3s_emulate.c
@@ -235,7 +235,7 @@ void kvmppc_emulate_tabort(struct kvm_vcpu *vcpu, int ra_val)
 
 #endif
 
-int kvmppc_core_emulate_op_pr(struct kvm_run *run, struct kvm_vcpu *vcpu,
+int kvmppc_core_emulate_op_pr(struct kvm_vcpu *vcpu,
 			      unsigned int inst, int *advance)
 {
 	int emulated = EMULATE_DONE;
@@ -371,13 +371,13 @@ int kvmppc_core_emulate_op_pr(struct kvm_run *run, struct kvm_vcpu *vcpu,
 			if (kvmppc_h_pr(vcpu, cmd) == EMULATE_DONE)
 				break;
 
-			run->papr_hcall.nr = cmd;
+			vcpu->run->papr_hcall.nr = cmd;
 			for (i = 0; i < 9; ++i) {
 				ulong gpr = kvmppc_get_gpr(vcpu, 4 + i);
-				run->papr_hcall.args[i] = gpr;
+				vcpu->run->papr_hcall.args[i] = gpr;
 			}
 
-			run->exit_reason = KVM_EXIT_PAPR_HCALL;
+			vcpu->run->exit_reason = KVM_EXIT_PAPR_HCALL;
 			vcpu->arch.hcall_needed = 1;
 			emulated = EMULATE_EXIT_USER;
 			break;
@@ -629,7 +629,7 @@ int kvmppc_core_emulate_op_pr(struct kvm_run *run, struct kvm_vcpu *vcpu,
 	}
 
 	if (emulated == EMULATE_FAIL)
-		emulated = kvmppc_emulate_paired_single(run, vcpu);
+		emulated = kvmppc_emulate_paired_single(vcpu);
 
 	return emulated;
 }
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 413ea2dcb10c..296bc6fb4eb1 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -1156,8 +1156,7 @@ static int kvmppc_hcall_impl_hv(unsigned long cmd)
 	return kvmppc_hcall_impl_hv_realmode(cmd);
 }
 
-static int kvmppc_emulate_debug_inst(struct kvm_run *run,
-					struct kvm_vcpu *vcpu)
+static int kvmppc_emulate_debug_inst(struct kvm_vcpu *vcpu)
 {
 	u32 last_inst;
 
@@ -1171,8 +1170,8 @@ static int kvmppc_emulate_debug_inst(struct kvm_run *run,
 	}
 
 	if (last_inst == KVMPPC_INST_SW_BREAKPOINT) {
-		run->exit_reason = KVM_EXIT_DEBUG;
-		run->debug.arch.address = kvmppc_get_pc(vcpu);
+		vcpu->run->exit_reason = KVM_EXIT_DEBUG;
+		vcpu->run->debug.arch.address = kvmppc_get_pc(vcpu);
 		return RESUME_HOST;
 	} else {
 		kvmppc_core_queue_program(vcpu, SRR1_PROGILL);
@@ -1273,9 +1272,10 @@ static int kvmppc_emulate_doorbell_instr(struct kvm_vcpu *vcpu)
 	return RESUME_GUEST;
 }
 
-static int kvmppc_handle_exit_hv(struct kvm_run *run, struct kvm_vcpu *vcpu,
+static int kvmppc_handle_exit_hv(struct kvm_vcpu *vcpu,
 				 struct task_struct *tsk)
 {
+	struct kvm_run *run = vcpu->run;
 	int r = RESUME_HOST;
 
 	vcpu->stat.sum_exits++;
@@ -1410,7 +1410,7 @@ static int kvmppc_handle_exit_hv(struct kvm_run *run, struct kvm_vcpu *vcpu,
 				swab32(vcpu->arch.emul_inst) :
 				vcpu->arch.emul_inst;
 		if (vcpu->guest_debug & KVM_GUESTDBG_USE_SW_BP) {
-			r = kvmppc_emulate_debug_inst(run, vcpu);
+			r = kvmppc_emulate_debug_inst(vcpu);
 		} else {
 			kvmppc_core_queue_program(vcpu, SRR1_PROGILL);
 			r = RESUME_GUEST;
@@ -1462,7 +1462,7 @@ static int kvmppc_handle_exit_hv(struct kvm_run *run, struct kvm_vcpu *vcpu,
 	return r;
 }
 
-static int kvmppc_handle_nested_exit(struct kvm_run *run, struct kvm_vcpu *vcpu)
+static int kvmppc_handle_nested_exit(struct kvm_vcpu *vcpu)
 {
 	int r;
 	int srcu_idx;
@@ -1520,7 +1520,7 @@ static int kvmppc_handle_nested_exit(struct kvm_run *run, struct kvm_vcpu *vcpu)
 	 */
 	case BOOK3S_INTERRUPT_H_DATA_STORAGE:
 		srcu_idx = srcu_read_lock(&vcpu->kvm->srcu);
-		r = kvmhv_nested_page_fault(run, vcpu);
+		r = kvmhv_nested_page_fault(vcpu);
 		srcu_read_unlock(&vcpu->kvm->srcu, srcu_idx);
 		break;
 	case BOOK3S_INTERRUPT_H_INST_STORAGE:
@@ -1530,7 +1530,7 @@ static int kvmppc_handle_nested_exit(struct kvm_run *run, struct kvm_vcpu *vcpu)
 		if (vcpu->arch.shregs.msr & HSRR1_HISI_WRITE)
 			vcpu->arch.fault_dsisr |= DSISR_ISSTORE;
 		srcu_idx = srcu_read_lock(&vcpu->kvm->srcu);
-		r = kvmhv_nested_page_fault(run, vcpu);
+		r = kvmhv_nested_page_fault(vcpu);
 		srcu_read_unlock(&vcpu->kvm->srcu, srcu_idx);
 		break;
 
@@ -2934,7 +2934,7 @@ static void post_guest_process(struct kvmppc_vcore *vc, bool is_master)
 
 		ret = RESUME_GUEST;
 		if (vcpu->arch.trap)
-			ret = kvmppc_handle_exit_hv(vcpu->run, vcpu,
+			ret = kvmppc_handle_exit_hv(vcpu,
 						    vcpu->arch.run_task);
 
 		vcpu->arch.ret = ret;
@@ -3900,15 +3900,16 @@ static int kvmhv_setup_mmu(struct kvm_vcpu *vcpu)
 	return r;
 }
 
-static int kvmppc_run_vcpu(struct kvm_run *kvm_run, struct kvm_vcpu *vcpu)
+static int kvmppc_run_vcpu(struct kvm_vcpu *vcpu)
 {
+	struct kvm_run *run = vcpu->run;
 	int n_ceded, i, r;
 	struct kvmppc_vcore *vc;
 	struct kvm_vcpu *v;
 
 	trace_kvmppc_run_vcpu_enter(vcpu);
 
-	kvm_run->exit_reason = 0;
+	run->exit_reason = 0;
 	vcpu->arch.ret = RESUME_GUEST;
 	vcpu->arch.trap = 0;
 	kvmppc_update_vpas(vcpu);
@@ -3952,8 +3953,8 @@ static int kvmppc_run_vcpu(struct kvm_run *kvm_run, struct kvm_vcpu *vcpu)
 			r = kvmhv_setup_mmu(vcpu);
 			spin_lock(&vc->lock);
 			if (r) {
-				kvm_run->exit_reason = KVM_EXIT_FAIL_ENTRY;
-				kvm_run->fail_entry.
+				run->exit_reason = KVM_EXIT_FAIL_ENTRY;
+				run->fail_entry.
 					hardware_entry_failure_reason = 0;
 				vcpu->arch.ret = r;
 				break;
@@ -4013,7 +4014,7 @@ static int kvmppc_run_vcpu(struct kvm_run *kvm_run, struct kvm_vcpu *vcpu)
 	if (vcpu->arch.state == KVMPPC_VCPU_RUNNABLE) {
 		kvmppc_remove_runnable(vc, vcpu);
 		vcpu->stat.signal_exits++;
-		kvm_run->exit_reason = KVM_EXIT_INTR;
+		run->exit_reason = KVM_EXIT_INTR;
 		vcpu->arch.ret = -EINTR;
 	}
 
@@ -4024,15 +4025,15 @@ static int kvmppc_run_vcpu(struct kvm_run *kvm_run, struct kvm_vcpu *vcpu)
 		wake_up(&v->arch.cpu_run);
 	}
 
-	trace_kvmppc_run_vcpu_exit(vcpu, kvm_run);
+	trace_kvmppc_run_vcpu_exit(vcpu);
 	spin_unlock(&vc->lock);
 	return vcpu->arch.ret;
 }
 
-int kvmhv_run_single_vcpu(struct kvm_run *kvm_run,
-			  struct kvm_vcpu *vcpu, u64 time_limit,
+int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 			  unsigned long lpcr)
 {
+	struct kvm_run *run = vcpu->run;
 	int trap, r, pcpu;
 	int srcu_idx, lpid;
 	struct kvmppc_vcore *vc;
@@ -4041,7 +4042,7 @@ int kvmhv_run_single_vcpu(struct kvm_run *kvm_run,
 
 	trace_kvmppc_run_vcpu_enter(vcpu);
 
-	kvm_run->exit_reason = 0;
+	run->exit_reason = 0;
 	vcpu->arch.ret = RESUME_GUEST;
 	vcpu->arch.trap = 0;
 
@@ -4165,9 +4166,9 @@ int kvmhv_run_single_vcpu(struct kvm_run *kvm_run,
 	r = RESUME_GUEST;
 	if (trap) {
 		if (!nested)
-			r = kvmppc_handle_exit_hv(kvm_run, vcpu, current);
+			r = kvmppc_handle_exit_hv(vcpu, current);
 		else
-			r = kvmppc_handle_nested_exit(kvm_run, vcpu);
+			r = kvmppc_handle_nested_exit(vcpu);
 	}
 	vcpu->arch.ret = r;
 
@@ -4177,7 +4178,7 @@ int kvmhv_run_single_vcpu(struct kvm_run *kvm_run,
 		while (vcpu->arch.ceded && !kvmppc_vcpu_woken(vcpu)) {
 			if (signal_pending(current)) {
 				vcpu->stat.signal_exits++;
-				kvm_run->exit_reason = KVM_EXIT_INTR;
+				run->exit_reason = KVM_EXIT_INTR;
 				vcpu->arch.ret = -EINTR;
 				break;
 			}
@@ -4193,13 +4194,13 @@ int kvmhv_run_single_vcpu(struct kvm_run *kvm_run,
 
  done:
 	kvmppc_remove_runnable(vc, vcpu);
-	trace_kvmppc_run_vcpu_exit(vcpu, kvm_run);
+	trace_kvmppc_run_vcpu_exit(vcpu);
 
 	return vcpu->arch.ret;
 
  sigpend:
 	vcpu->stat.signal_exits++;
-	kvm_run->exit_reason = KVM_EXIT_INTR;
+	run->exit_reason = KVM_EXIT_INTR;
 	vcpu->arch.ret = -EINTR;
  out:
 	local_irq_enable();
@@ -4207,8 +4208,9 @@ int kvmhv_run_single_vcpu(struct kvm_run *kvm_run,
 	goto done;
 }
 
-static int kvmppc_vcpu_run_hv(struct kvm_run *run, struct kvm_vcpu *vcpu)
+static int kvmppc_vcpu_run_hv(struct kvm_vcpu *vcpu)
 {
+	struct kvm_run *run = vcpu->run;
 	int r;
 	int srcu_idx;
 	unsigned long ebb_regs[3] = {};	/* shut up GCC */
@@ -4292,10 +4294,10 @@ static int kvmppc_vcpu_run_hv(struct kvm_run *run, struct kvm_vcpu *vcpu)
 		 */
 		if (kvm->arch.threads_indep && kvm_is_radix(kvm) &&
 		    !no_mixing_hpt_and_radix)
-			r = kvmhv_run_single_vcpu(run, vcpu, ~(u64)0,
+			r = kvmhv_run_single_vcpu(vcpu, ~(u64)0,
 						  vcpu->arch.vcore->lpcr);
 		else
-			r = kvmppc_run_vcpu(run, vcpu);
+			r = kvmppc_run_vcpu(vcpu);
 
 		if (run->exit_reason == KVM_EXIT_PAPR_HCALL &&
 		    !(vcpu->arch.shregs.msr & MSR_PR)) {
@@ -4305,7 +4307,7 @@ static int kvmppc_vcpu_run_hv(struct kvm_run *run, struct kvm_vcpu *vcpu)
 			kvmppc_core_prepare_to_enter(vcpu);
 		} else if (r == RESUME_PAGE_FAULT) {
 			srcu_idx = srcu_read_lock(&kvm->srcu);
-			r = kvmppc_book3s_hv_page_fault(run, vcpu,
+			r = kvmppc_book3s_hv_page_fault(vcpu,
 				vcpu->arch.fault_dar, vcpu->arch.fault_dsisr);
 			srcu_read_unlock(&kvm->srcu, srcu_idx);
 		} else if (r == RESUME_PASSTHROUGH) {
@@ -4979,7 +4981,7 @@ static void kvmppc_core_destroy_vm_hv(struct kvm *kvm)
 }
 
 /* We don't need to emulate any privileged instructions or dcbz */
-static int kvmppc_core_emulate_op_hv(struct kvm_run *run, struct kvm_vcpu *vcpu,
+static int kvmppc_core_emulate_op_hv(struct kvm_vcpu *vcpu,
 				     unsigned int inst, int *advance)
 {
 	return EMULATE_FAIL;
diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3s_hv_nested.c
index 5a3987f3ebf3..fe4c535882e6 100644
--- a/arch/powerpc/kvm/book3s_hv_nested.c
+++ b/arch/powerpc/kvm/book3s_hv_nested.c
@@ -290,7 +290,7 @@ long kvmhv_enter_nested_guest(struct kvm_vcpu *vcpu)
 			r = RESUME_HOST;
 			break;
 		}
-		r = kvmhv_run_single_vcpu(vcpu->run, vcpu, hdec_exp, lpcr);
+		r = kvmhv_run_single_vcpu(vcpu, hdec_exp, lpcr);
 	} while (is_kvmppc_resume_guest(r));
 
 	/* save L2 state for return */
@@ -1256,8 +1256,7 @@ static inline int kvmppc_radix_shift_to_level(int shift)
 }
 
 /* called with gp->tlb_lock held */
-static long int __kvmhv_nested_page_fault(struct kvm_run *run,
-					  struct kvm_vcpu *vcpu,
+static long int __kvmhv_nested_page_fault(struct kvm_vcpu *vcpu,
 					  struct kvm_nested_guest *gp)
 {
 	struct kvm *kvm = vcpu->kvm;
@@ -1340,7 +1339,7 @@ static long int __kvmhv_nested_page_fault(struct kvm_run *run,
 		}
 
 		/* passthrough of emulated MMIO case */
-		return kvmppc_hv_emulate_mmio(run, vcpu, gpa, ea, writing);
+		return kvmppc_hv_emulate_mmio(vcpu, gpa, ea, writing);
 	}
 	if (memslot->flags & KVM_MEM_READONLY) {
 		if (writing) {
@@ -1427,13 +1426,13 @@ static long int __kvmhv_nested_page_fault(struct kvm_run *run,
 	return RESUME_GUEST;
 }
 
-long int kvmhv_nested_page_fault(struct kvm_run *run, struct kvm_vcpu *vcpu)
+long int kvmhv_nested_page_fault(struct kvm_vcpu *vcpu)
 {
 	struct kvm_nested_guest *gp = vcpu->arch.nested;
 	long int ret;
 
 	mutex_lock(&gp->tlb_lock);
-	ret = __kvmhv_nested_page_fault(run, vcpu, gp);
+	ret = __kvmhv_nested_page_fault(vcpu, gp);
 	mutex_unlock(&gp->tlb_lock);
 	return ret;
 }
diff --git a/arch/powerpc/kvm/book3s_paired_singles.c b/arch/powerpc/kvm/book3s_paired_singles.c
index bf0282775e37..a11436720a8c 100644
--- a/arch/powerpc/kvm/book3s_paired_singles.c
+++ b/arch/powerpc/kvm/book3s_paired_singles.c
@@ -169,7 +169,7 @@ static void kvmppc_inject_pf(struct kvm_vcpu *vcpu, ulong eaddr, bool is_store)
 	kvmppc_book3s_queue_irqprio(vcpu, BOOK3S_INTERRUPT_DATA_STORAGE);
 }
 
-static int kvmppc_emulate_fpr_load(struct kvm_run *run, struct kvm_vcpu *vcpu,
+static int kvmppc_emulate_fpr_load(struct kvm_vcpu *vcpu,
 				   int rs, ulong addr, int ls_type)
 {
 	int emulated = EMULATE_FAIL;
@@ -188,7 +188,7 @@ static int kvmppc_emulate_fpr_load(struct kvm_run *run, struct kvm_vcpu *vcpu,
 		kvmppc_inject_pf(vcpu, addr, false);
 		goto done_load;
 	} else if (r == EMULATE_DO_MMIO) {
-		emulated = kvmppc_handle_load(run, vcpu, KVM_MMIO_REG_FPR | rs,
+		emulated = kvmppc_handle_load(vcpu, KVM_MMIO_REG_FPR | rs,
 					      len, 1);
 		goto done_load;
 	}
@@ -213,7 +213,7 @@ static int kvmppc_emulate_fpr_load(struct kvm_run *run, struct kvm_vcpu *vcpu,
 	return emulated;
 }
 
-static int kvmppc_emulate_fpr_store(struct kvm_run *run, struct kvm_vcpu *vcpu,
+static int kvmppc_emulate_fpr_store(struct kvm_vcpu *vcpu,
 				    int rs, ulong addr, int ls_type)
 {
 	int emulated = EMULATE_FAIL;
@@ -248,7 +248,7 @@ static int kvmppc_emulate_fpr_store(struct kvm_run *run, struct kvm_vcpu *vcpu,
 	if (r < 0) {
 		kvmppc_inject_pf(vcpu, addr, true);
 	} else if (r == EMULATE_DO_MMIO) {
-		emulated = kvmppc_handle_store(run, vcpu, val, len, 1);
+		emulated = kvmppc_handle_store(vcpu, val, len, 1);
 	} else {
 		emulated = EMULATE_DONE;
 	}
@@ -259,7 +259,7 @@ static int kvmppc_emulate_fpr_store(struct kvm_run *run, struct kvm_vcpu *vcpu,
 	return emulated;
 }
 
-static int kvmppc_emulate_psq_load(struct kvm_run *run, struct kvm_vcpu *vcpu,
+static int kvmppc_emulate_psq_load(struct kvm_vcpu *vcpu,
 				   int rs, ulong addr, bool w, int i)
 {
 	int emulated = EMULATE_FAIL;
@@ -279,12 +279,12 @@ static int kvmppc_emulate_psq_load(struct kvm_run *run, struct kvm_vcpu *vcpu,
 		kvmppc_inject_pf(vcpu, addr, false);
 		goto done_load;
 	} else if ((r == EMULATE_DO_MMIO) && w) {
-		emulated = kvmppc_handle_load(run, vcpu, KVM_MMIO_REG_FPR | rs,
+		emulated = kvmppc_handle_load(vcpu, KVM_MMIO_REG_FPR | rs,
 					      4, 1);
 		vcpu->arch.qpr[rs] = tmp[1];
 		goto done_load;
 	} else if (r == EMULATE_DO_MMIO) {
-		emulated = kvmppc_handle_load(run, vcpu, KVM_MMIO_REG_FQPR | rs,
+		emulated = kvmppc_handle_load(vcpu, KVM_MMIO_REG_FQPR | rs,
 					      8, 1);
 		goto done_load;
 	}
@@ -302,7 +302,7 @@ static int kvmppc_emulate_psq_load(struct kvm_run *run, struct kvm_vcpu *vcpu,
 	return emulated;
 }
 
-static int kvmppc_emulate_psq_store(struct kvm_run *run, struct kvm_vcpu *vcpu,
+static int kvmppc_emulate_psq_store(struct kvm_vcpu *vcpu,
 				    int rs, ulong addr, bool w, int i)
 {
 	int emulated = EMULATE_FAIL;
@@ -318,10 +318,10 @@ static int kvmppc_emulate_psq_store(struct kvm_run *run, struct kvm_vcpu *vcpu,
 	if (r < 0) {
 		kvmppc_inject_pf(vcpu, addr, true);
 	} else if ((r == EMULATE_DO_MMIO) && w) {
-		emulated = kvmppc_handle_store(run, vcpu, tmp[0], 4, 1);
+		emulated = kvmppc_handle_store(vcpu, tmp[0], 4, 1);
 	} else if (r == EMULATE_DO_MMIO) {
 		u64 val = ((u64)tmp[0] << 32) | tmp[1];
-		emulated = kvmppc_handle_store(run, vcpu, val, 8, 1);
+		emulated = kvmppc_handle_store(vcpu, val, 8, 1);
 	} else {
 		emulated = EMULATE_DONE;
 	}
@@ -618,7 +618,7 @@ static int kvmppc_ps_one_in(struct kvm_vcpu *vcpu, bool rc,
 	return EMULATE_DONE;
 }
 
-int kvmppc_emulate_paired_single(struct kvm_run *run, struct kvm_vcpu *vcpu)
+int kvmppc_emulate_paired_single(struct kvm_vcpu *vcpu)
 {
 	u32 inst;
 	enum emulation_result emulated = EMULATE_DONE;
@@ -680,7 +680,7 @@ int kvmppc_emulate_paired_single(struct kvm_run *run, struct kvm_vcpu *vcpu)
 		int i = inst_get_field(inst, 17, 19);
 
 		addr += get_d_signext(inst);
-		emulated = kvmppc_emulate_psq_load(run, vcpu, ax_rd, addr, w, i);
+		emulated = kvmppc_emulate_psq_load(vcpu, ax_rd, addr, w, i);
 		break;
 	}
 	case OP_PSQ_LU:
@@ -690,7 +690,7 @@ int kvmppc_emulate_paired_single(struct kvm_run *run, struct kvm_vcpu *vcpu)
 		int i = inst_get_field(inst, 17, 19);
 
 		addr += get_d_signext(inst);
-		emulated = kvmppc_emulate_psq_load(run, vcpu, ax_rd, addr, w, i);
+		emulated = kvmppc_emulate_psq_load(vcpu, ax_rd, addr, w, i);
 
 		if (emulated == EMULATE_DONE)
 			kvmppc_set_gpr(vcpu, ax_ra, addr);
@@ -703,7 +703,7 @@ int kvmppc_emulate_paired_single(struct kvm_run *run, struct kvm_vcpu *vcpu)
 		int i = inst_get_field(inst, 17, 19);
 
 		addr += get_d_signext(inst);
-		emulated = kvmppc_emulate_psq_store(run, vcpu, ax_rd, addr, w, i);
+		emulated = kvmppc_emulate_psq_store(vcpu, ax_rd, addr, w, i);
 		break;
 	}
 	case OP_PSQ_STU:
@@ -713,7 +713,7 @@ int kvmppc_emulate_paired_single(struct kvm_run *run, struct kvm_vcpu *vcpu)
 		int i = inst_get_field(inst, 17, 19);
 
 		addr += get_d_signext(inst);
-		emulated = kvmppc_emulate_psq_store(run, vcpu, ax_rd, addr, w, i);
+		emulated = kvmppc_emulate_psq_store(vcpu, ax_rd, addr, w, i);
 
 		if (emulated == EMULATE_DONE)
 			kvmppc_set_gpr(vcpu, ax_ra, addr);
@@ -733,7 +733,7 @@ int kvmppc_emulate_paired_single(struct kvm_run *run, struct kvm_vcpu *vcpu)
 			int i = inst_get_field(inst, 22, 24);
 
 			addr += kvmppc_get_gpr(vcpu, ax_rb);
-			emulated = kvmppc_emulate_psq_load(run, vcpu, ax_rd, addr, w, i);
+			emulated = kvmppc_emulate_psq_load(vcpu, ax_rd, addr, w, i);
 			break;
 		}
 		case OP_4X_PS_CMPO0:
@@ -747,7 +747,7 @@ int kvmppc_emulate_paired_single(struct kvm_run *run, struct kvm_vcpu *vcpu)
 			int i = inst_get_field(inst, 22, 24);
 
 			addr += kvmppc_get_gpr(vcpu, ax_rb);
-			emulated = kvmppc_emulate_psq_load(run, vcpu, ax_rd, addr, w, i);
+			emulated = kvmppc_emulate_psq_load(vcpu, ax_rd, addr, w, i);
 
 			if (emulated == EMULATE_DONE)
 				kvmppc_set_gpr(vcpu, ax_ra, addr);
@@ -824,7 +824,7 @@ int kvmppc_emulate_paired_single(struct kvm_run *run, struct kvm_vcpu *vcpu)
 			int i = inst_get_field(inst, 22, 24);
 
 			addr += kvmppc_get_gpr(vcpu, ax_rb);
-			emulated = kvmppc_emulate_psq_store(run, vcpu, ax_rd, addr, w, i);
+			emulated = kvmppc_emulate_psq_store(vcpu, ax_rd, addr, w, i);
 			break;
 		}
 		case OP_4XW_PSQ_STUX:
@@ -834,7 +834,7 @@ int kvmppc_emulate_paired_single(struct kvm_run *run, struct kvm_vcpu *vcpu)
 			int i = inst_get_field(inst, 22, 24);
 
 			addr += kvmppc_get_gpr(vcpu, ax_rb);
-			emulated = kvmppc_emulate_psq_store(run, vcpu, ax_rd, addr, w, i);
+			emulated = kvmppc_emulate_psq_store(vcpu, ax_rd, addr, w, i);
 
 			if (emulated == EMULATE_DONE)
 				kvmppc_set_gpr(vcpu, ax_ra, addr);
@@ -922,7 +922,7 @@ int kvmppc_emulate_paired_single(struct kvm_run *run, struct kvm_vcpu *vcpu)
 	{
 		ulong addr = (ax_ra ? kvmppc_get_gpr(vcpu, ax_ra) : 0) + full_d;
 
-		emulated = kvmppc_emulate_fpr_load(run, vcpu, ax_rd, addr,
+		emulated = kvmppc_emulate_fpr_load(vcpu, ax_rd, addr,
 						   FPU_LS_SINGLE);
 		break;
 	}
@@ -930,7 +930,7 @@ int kvmppc_emulate_paired_single(struct kvm_run *run, struct kvm_vcpu *vcpu)
 	{
 		ulong addr = kvmppc_get_gpr(vcpu, ax_ra) + full_d;
 
-		emulated = kvmppc_emulate_fpr_load(run, vcpu, ax_rd, addr,
+		emulated = kvmppc_emulate_fpr_load(vcpu, ax_rd, addr,
 						   FPU_LS_SINGLE);
 
 		if (emulated == EMULATE_DONE)
@@ -941,7 +941,7 @@ int kvmppc_emulate_paired_single(struct kvm_run *run, struct kvm_vcpu *vcpu)
 	{
 		ulong addr = (ax_ra ? kvmppc_get_gpr(vcpu, ax_ra) : 0) + full_d;
 
-		emulated = kvmppc_emulate_fpr_load(run, vcpu, ax_rd, addr,
+		emulated = kvmppc_emulate_fpr_load(vcpu, ax_rd, addr,
 						   FPU_LS_DOUBLE);
 		break;
 	}
@@ -949,7 +949,7 @@ int kvmppc_emulate_paired_single(struct kvm_run *run, struct kvm_vcpu *vcpu)
 	{
 		ulong addr = kvmppc_get_gpr(vcpu, ax_ra) + full_d;
 
-		emulated = kvmppc_emulate_fpr_load(run, vcpu, ax_rd, addr,
+		emulated = kvmppc_emulate_fpr_load(vcpu, ax_rd, addr,
 						   FPU_LS_DOUBLE);
 
 		if (emulated == EMULATE_DONE)
@@ -960,7 +960,7 @@ int kvmppc_emulate_paired_single(struct kvm_run *run, struct kvm_vcpu *vcpu)
 	{
 		ulong addr = (ax_ra ? kvmppc_get_gpr(vcpu, ax_ra) : 0) + full_d;
 
-		emulated = kvmppc_emulate_fpr_store(run, vcpu, ax_rd, addr,
+		emulated = kvmppc_emulate_fpr_store(vcpu, ax_rd, addr,
 						    FPU_LS_SINGLE);
 		break;
 	}
@@ -968,7 +968,7 @@ int kvmppc_emulate_paired_single(struct kvm_run *run, struct kvm_vcpu *vcpu)
 	{
 		ulong addr = kvmppc_get_gpr(vcpu, ax_ra) + full_d;
 
-		emulated = kvmppc_emulate_fpr_store(run, vcpu, ax_rd, addr,
+		emulated = kvmppc_emulate_fpr_store(vcpu, ax_rd, addr,
 						    FPU_LS_SINGLE);
 
 		if (emulated == EMULATE_DONE)
@@ -979,7 +979,7 @@ int kvmppc_emulate_paired_single(struct kvm_run *run, struct kvm_vcpu *vcpu)
 	{
 		ulong addr = (ax_ra ? kvmppc_get_gpr(vcpu, ax_ra) : 0) + full_d;
 
-		emulated = kvmppc_emulate_fpr_store(run, vcpu, ax_rd, addr,
+		emulated = kvmppc_emulate_fpr_store(vcpu, ax_rd, addr,
 						    FPU_LS_DOUBLE);
 		break;
 	}
@@ -987,7 +987,7 @@ int kvmppc_emulate_paired_single(struct kvm_run *run, struct kvm_vcpu *vcpu)
 	{
 		ulong addr = kvmppc_get_gpr(vcpu, ax_ra) + full_d;
 
-		emulated = kvmppc_emulate_fpr_store(run, vcpu, ax_rd, addr,
+		emulated = kvmppc_emulate_fpr_store(vcpu, ax_rd, addr,
 						    FPU_LS_DOUBLE);
 
 		if (emulated == EMULATE_DONE)
@@ -1001,7 +1001,7 @@ int kvmppc_emulate_paired_single(struct kvm_run *run, struct kvm_vcpu *vcpu)
 			ulong addr = ax_ra ? kvmppc_get_gpr(vcpu, ax_ra) : 0;
 
 			addr += kvmppc_get_gpr(vcpu, ax_rb);
-			emulated = kvmppc_emulate_fpr_load(run, vcpu, ax_rd,
+			emulated = kvmppc_emulate_fpr_load(vcpu, ax_rd,
 							   addr, FPU_LS_SINGLE);
 			break;
 		}
@@ -1010,7 +1010,7 @@ int kvmppc_emulate_paired_single(struct kvm_run *run, struct kvm_vcpu *vcpu)
 			ulong addr = kvmppc_get_gpr(vcpu, ax_ra) +
 				     kvmppc_get_gpr(vcpu, ax_rb);
 
-			emulated = kvmppc_emulate_fpr_load(run, vcpu, ax_rd,
+			emulated = kvmppc_emulate_fpr_load(vcpu, ax_rd,
 							   addr, FPU_LS_SINGLE);
 
 			if (emulated == EMULATE_DONE)
@@ -1022,7 +1022,7 @@ int kvmppc_emulate_paired_single(struct kvm_run *run, struct kvm_vcpu *vcpu)
 			ulong addr = (ax_ra ? kvmppc_get_gpr(vcpu, ax_ra) : 0) +
 				     kvmppc_get_gpr(vcpu, ax_rb);
 
-			emulated = kvmppc_emulate_fpr_load(run, vcpu, ax_rd,
+			emulated = kvmppc_emulate_fpr_load(vcpu, ax_rd,
 							   addr, FPU_LS_DOUBLE);
 			break;
 		}
@@ -1031,7 +1031,7 @@ int kvmppc_emulate_paired_single(struct kvm_run *run, struct kvm_vcpu *vcpu)
 			ulong addr = kvmppc_get_gpr(vcpu, ax_ra) +
 				     kvmppc_get_gpr(vcpu, ax_rb);
 
-			emulated = kvmppc_emulate_fpr_load(run, vcpu, ax_rd,
+			emulated = kvmppc_emulate_fpr_load(vcpu, ax_rd,
 							   addr, FPU_LS_DOUBLE);
 
 			if (emulated == EMULATE_DONE)
@@ -1043,7 +1043,7 @@ int kvmppc_emulate_paired_single(struct kvm_run *run, struct kvm_vcpu *vcpu)
 			ulong addr = (ax_ra ? kvmppc_get_gpr(vcpu, ax_ra) : 0) +
 				     kvmppc_get_gpr(vcpu, ax_rb);
 
-			emulated = kvmppc_emulate_fpr_store(run, vcpu, ax_rd,
+			emulated = kvmppc_emulate_fpr_store(vcpu, ax_rd,
 							    addr, FPU_LS_SINGLE);
 			break;
 		}
@@ -1052,7 +1052,7 @@ int kvmppc_emulate_paired_single(struct kvm_run *run, struct kvm_vcpu *vcpu)
 			ulong addr = kvmppc_get_gpr(vcpu, ax_ra) +
 				     kvmppc_get_gpr(vcpu, ax_rb);
 
-			emulated = kvmppc_emulate_fpr_store(run, vcpu, ax_rd,
+			emulated = kvmppc_emulate_fpr_store(vcpu, ax_rd,
 							    addr, FPU_LS_SINGLE);
 
 			if (emulated == EMULATE_DONE)
@@ -1064,7 +1064,7 @@ int kvmppc_emulate_paired_single(struct kvm_run *run, struct kvm_vcpu *vcpu)
 			ulong addr = (ax_ra ? kvmppc_get_gpr(vcpu, ax_ra) : 0) +
 				     kvmppc_get_gpr(vcpu, ax_rb);
 
-			emulated = kvmppc_emulate_fpr_store(run, vcpu, ax_rd,
+			emulated = kvmppc_emulate_fpr_store(vcpu, ax_rd,
 							    addr, FPU_LS_DOUBLE);
 			break;
 		}
@@ -1073,7 +1073,7 @@ int kvmppc_emulate_paired_single(struct kvm_run *run, struct kvm_vcpu *vcpu)
 			ulong addr = kvmppc_get_gpr(vcpu, ax_ra) +
 				     kvmppc_get_gpr(vcpu, ax_rb);
 
-			emulated = kvmppc_emulate_fpr_store(run, vcpu, ax_rd,
+			emulated = kvmppc_emulate_fpr_store(vcpu, ax_rd,
 							    addr, FPU_LS_DOUBLE);
 
 			if (emulated == EMULATE_DONE)
@@ -1085,7 +1085,7 @@ int kvmppc_emulate_paired_single(struct kvm_run *run, struct kvm_vcpu *vcpu)
 			ulong addr = (ax_ra ? kvmppc_get_gpr(vcpu, ax_ra) : 0) +
 				     kvmppc_get_gpr(vcpu, ax_rb);
 
-			emulated = kvmppc_emulate_fpr_store(run, vcpu, ax_rd,
+			emulated = kvmppc_emulate_fpr_store(vcpu, ax_rd,
 							    addr,
 							    FPU_LS_SINGLE_LOW);
 			break;
diff --git a/arch/powerpc/kvm/book3s_pr.c b/arch/powerpc/kvm/book3s_pr.c
index a0f6813f4560..ef54f917bdaf 100644
--- a/arch/powerpc/kvm/book3s_pr.c
+++ b/arch/powerpc/kvm/book3s_pr.c
@@ -700,7 +700,7 @@ static bool kvmppc_visible_gpa(struct kvm_vcpu *vcpu, gpa_t gpa)
 	return kvm_is_visible_gfn(vcpu->kvm, gpa >> PAGE_SHIFT);
 }
 
-int kvmppc_handle_pagefault(struct kvm_run *run, struct kvm_vcpu *vcpu,
+static int kvmppc_handle_pagefault(struct kvm_vcpu *vcpu,
 			    ulong eaddr, int vec)
 {
 	bool data = (vec == BOOK3S_INTERRUPT_DATA_STORAGE);
@@ -795,7 +795,7 @@ int kvmppc_handle_pagefault(struct kvm_run *run, struct kvm_vcpu *vcpu,
 		/* The guest's PTE is not mapped yet. Map on the host */
 		if (kvmppc_mmu_map_page(vcpu, &pte, iswrite) == -EIO) {
 			/* Exit KVM if mapping failed */
-			run->exit_reason = KVM_EXIT_INTERNAL_ERROR;
+			vcpu->run->exit_reason = KVM_EXIT_INTERNAL_ERROR;
 			return RESUME_HOST;
 		}
 		if (data)
@@ -808,7 +808,7 @@ int kvmppc_handle_pagefault(struct kvm_run *run, struct kvm_vcpu *vcpu,
 		vcpu->stat.mmio_exits++;
 		vcpu->arch.paddr_accessed = pte.raddr;
 		vcpu->arch.vaddr_accessed = pte.eaddr;
-		r = kvmppc_emulate_mmio(run, vcpu);
+		r = kvmppc_emulate_mmio(vcpu);
 		if ( r == RESUME_HOST_NV )
 			r = RESUME_HOST;
 	}
@@ -992,7 +992,7 @@ static void kvmppc_emulate_fac(struct kvm_vcpu *vcpu, ulong fac)
 	enum emulation_result er = EMULATE_FAIL;
 
 	if (!(kvmppc_get_msr(vcpu) & MSR_PR))
-		er = kvmppc_emulate_instruction(vcpu->run, vcpu);
+		er = kvmppc_emulate_instruction(vcpu);
 
 	if ((er != EMULATE_DONE) && (er != EMULATE_AGAIN)) {
 		/* Couldn't emulate, trigger interrupt in guest */
@@ -1089,8 +1089,7 @@ static void kvmppc_clear_debug(struct kvm_vcpu *vcpu)
 	}
 }
 
-static int kvmppc_exit_pr_progint(struct kvm_run *run, struct kvm_vcpu *vcpu,
-				  unsigned int exit_nr)
+static int kvmppc_exit_pr_progint(struct kvm_vcpu *vcpu, unsigned int exit_nr)
 {
 	enum emulation_result er;
 	ulong flags;
@@ -1124,7 +1123,7 @@ static int kvmppc_exit_pr_progint(struct kvm_run *run, struct kvm_vcpu *vcpu,
 	}
 
 	vcpu->stat.emulated_inst_exits++;
-	er = kvmppc_emulate_instruction(run, vcpu);
+	er = kvmppc_emulate_instruction(vcpu);
 	switch (er) {
 	case EMULATE_DONE:
 		r = RESUME_GUEST_NV;
@@ -1139,7 +1138,7 @@ static int kvmppc_exit_pr_progint(struct kvm_run *run, struct kvm_vcpu *vcpu,
 		r = RESUME_GUEST;
 		break;
 	case EMULATE_DO_MMIO:
-		run->exit_reason = KVM_EXIT_MMIO;
+		vcpu->run->exit_reason = KVM_EXIT_MMIO;
 		r = RESUME_HOST_NV;
 		break;
 	case EMULATE_EXIT_USER:
@@ -1198,7 +1197,7 @@ int kvmppc_handle_exit_pr(struct kvm_run *run, struct kvm_vcpu *vcpu,
 		/* only care about PTEG not found errors, but leave NX alone */
 		if (shadow_srr1 & 0x40000000) {
 			int idx = srcu_read_lock(&vcpu->kvm->srcu);
-			r = kvmppc_handle_pagefault(run, vcpu, kvmppc_get_pc(vcpu), exit_nr);
+			r = kvmppc_handle_pagefault(vcpu, kvmppc_get_pc(vcpu), exit_nr);
 			srcu_read_unlock(&vcpu->kvm->srcu, idx);
 			vcpu->stat.sp_instruc++;
 		} else if (vcpu->arch.mmu.is_dcbz32(vcpu) &&
@@ -1248,7 +1247,7 @@ int kvmppc_handle_exit_pr(struct kvm_run *run, struct kvm_vcpu *vcpu,
 		 */
 		if (fault_dsisr & (DSISR_NOHPTE | DSISR_PROTFAULT)) {
 			int idx = srcu_read_lock(&vcpu->kvm->srcu);
-			r = kvmppc_handle_pagefault(run, vcpu, dar, exit_nr);
+			r = kvmppc_handle_pagefault(vcpu, dar, exit_nr);
 			srcu_read_unlock(&vcpu->kvm->srcu, idx);
 		} else {
 			kvmppc_core_queue_data_storage(vcpu, dar, fault_dsisr);
@@ -1292,7 +1291,7 @@ int kvmppc_handle_exit_pr(struct kvm_run *run, struct kvm_vcpu *vcpu,
 		break;
 	case BOOK3S_INTERRUPT_PROGRAM:
 	case BOOK3S_INTERRUPT_H_EMUL_ASSIST:
-		r = kvmppc_exit_pr_progint(run, vcpu, exit_nr);
+		r = kvmppc_exit_pr_progint(vcpu, exit_nr);
 		break;
 	case BOOK3S_INTERRUPT_SYSCALL:
 	{
@@ -1370,7 +1369,7 @@ int kvmppc_handle_exit_pr(struct kvm_run *run, struct kvm_vcpu *vcpu,
 			emul = kvmppc_get_last_inst(vcpu, INST_GENERIC,
 						    &last_inst);
 			if (emul == EMULATE_DONE)
-				r = kvmppc_exit_pr_progint(run, vcpu, exit_nr);
+				r = kvmppc_exit_pr_progint(vcpu, exit_nr);
 			else
 				r = RESUME_GUEST;
 
@@ -1825,8 +1824,9 @@ static void kvmppc_core_vcpu_free_pr(struct kvm_vcpu *vcpu)
 	vfree(vcpu_book3s);
 }
 
-static int kvmppc_vcpu_run_pr(struct kvm_run *kvm_run, struct kvm_vcpu *vcpu)
+static int kvmppc_vcpu_run_pr(struct kvm_vcpu *vcpu)
 {
+	struct kvm_run *run = vcpu->run;
 	int ret;
 #ifdef CONFIG_ALTIVEC
 	unsigned long uninitialized_var(vrsave);
@@ -1834,7 +1834,7 @@ static int kvmppc_vcpu_run_pr(struct kvm_run *kvm_run, struct kvm_vcpu *vcpu)
 
 	/* Check if we can run the vcpu at all */
 	if (!vcpu->arch.sane) {
-		kvm_run->exit_reason = KVM_EXIT_INTERNAL_ERROR;
+		run->exit_reason = KVM_EXIT_INTERNAL_ERROR;
 		ret = -EINVAL;
 		goto out;
 	}
@@ -1861,7 +1861,7 @@ static int kvmppc_vcpu_run_pr(struct kvm_run *kvm_run, struct kvm_vcpu *vcpu)
 
 	kvmppc_fix_ee_before_entry();
 
-	ret = __kvmppc_vcpu_run(kvm_run, vcpu);
+	ret = __kvmppc_vcpu_run(run, vcpu);
 
 	kvmppc_clear_debug(vcpu);
 
diff --git a/arch/powerpc/kvm/booke.c b/arch/powerpc/kvm/booke.c
index 6c18ea88fd25..26b3f5900b72 100644
--- a/arch/powerpc/kvm/booke.c
+++ b/arch/powerpc/kvm/booke.c
@@ -730,13 +730,14 @@ int kvmppc_core_check_requests(struct kvm_vcpu *vcpu)
 	return r;
 }
 
-int kvmppc_vcpu_run(struct kvm_run *kvm_run, struct kvm_vcpu *vcpu)
+int kvmppc_vcpu_run(struct kvm_vcpu *vcpu)
 {
+	struct kvm_run *run = vcpu->run;
 	int ret, s;
 	struct debug_reg debug;
 
 	if (!vcpu->arch.sane) {
-		kvm_run->exit_reason = KVM_EXIT_INTERNAL_ERROR;
+		run->exit_reason = KVM_EXIT_INTERNAL_ERROR;
 		return -EINVAL;
 	}
 
@@ -778,7 +779,7 @@ int kvmppc_vcpu_run(struct kvm_run *kvm_run, struct kvm_vcpu *vcpu)
 	vcpu->arch.pgdir = vcpu->kvm->mm->pgd;
 	kvmppc_fix_ee_before_entry();
 
-	ret = __kvmppc_vcpu_run(kvm_run, vcpu);
+	ret = __kvmppc_vcpu_run(run, vcpu);
 
 	/* No need for guest_exit. It's done in handle_exit.
 	   We also get here with interrupts enabled. */
@@ -800,11 +801,11 @@ int kvmppc_vcpu_run(struct kvm_run *kvm_run, struct kvm_vcpu *vcpu)
 	return ret;
 }
 
-static int emulation_exit(struct kvm_run *run, struct kvm_vcpu *vcpu)
+static int emulation_exit(struct kvm_vcpu *vcpu)
 {
 	enum emulation_result er;
 
-	er = kvmppc_emulate_instruction(run, vcpu);
+	er = kvmppc_emulate_instruction(vcpu);
 	switch (er) {
 	case EMULATE_DONE:
 		/* don't overwrite subtypes, just account kvm_stats */
@@ -821,8 +822,8 @@ static int emulation_exit(struct kvm_run *run, struct kvm_vcpu *vcpu)
 		       __func__, vcpu->arch.regs.nip, vcpu->arch.last_inst);
 		/* For debugging, encode the failing instruction and
 		 * report it to userspace. */
-		run->hw.hardware_exit_reason = ~0ULL << 32;
-		run->hw.hardware_exit_reason |= vcpu->arch.last_inst;
+		vcpu->run->hw.hardware_exit_reason = ~0ULL << 32;
+		vcpu->run->hw.hardware_exit_reason |= vcpu->arch.last_inst;
 		kvmppc_core_queue_program(vcpu, ESR_PIL);
 		return RESUME_HOST;
 
@@ -834,8 +835,9 @@ static int emulation_exit(struct kvm_run *run, struct kvm_vcpu *vcpu)
 	}
 }
 
-static int kvmppc_handle_debug(struct kvm_run *run, struct kvm_vcpu *vcpu)
+static int kvmppc_handle_debug(struct kvm_vcpu *vcpu)
 {
+	struct kvm_run *run = vcpu->run;
 	struct debug_reg *dbg_reg = &(vcpu->arch.dbg_reg);
 	u32 dbsr = vcpu->arch.dbsr;
 
@@ -954,7 +956,7 @@ static void kvmppc_restart_interrupt(struct kvm_vcpu *vcpu,
 	}
 }
 
-static int kvmppc_resume_inst_load(struct kvm_run *run, struct kvm_vcpu *vcpu,
+static int kvmppc_resume_inst_load(struct kvm_vcpu *vcpu,
 				  enum emulation_result emulated, u32 last_inst)
 {
 	switch (emulated) {
@@ -966,8 +968,8 @@ static int kvmppc_resume_inst_load(struct kvm_run *run, struct kvm_vcpu *vcpu,
 		       __func__, vcpu->arch.regs.nip);
 		/* For debugging, encode the failing instruction and
 		 * report it to userspace. */
-		run->hw.hardware_exit_reason = ~0ULL << 32;
-		run->hw.hardware_exit_reason |= last_inst;
+		vcpu->run->hw.hardware_exit_reason = ~0ULL << 32;
+		vcpu->run->hw.hardware_exit_reason |= last_inst;
 		kvmppc_core_queue_program(vcpu, ESR_PIL);
 		return RESUME_HOST;
 
@@ -1024,7 +1026,7 @@ int kvmppc_handle_exit(struct kvm_run *run, struct kvm_vcpu *vcpu,
 	run->ready_for_interrupt_injection = 1;
 
 	if (emulated != EMULATE_DONE) {
-		r = kvmppc_resume_inst_load(run, vcpu, emulated, last_inst);
+		r = kvmppc_resume_inst_load(vcpu, emulated, last_inst);
 		goto out;
 	}
 
@@ -1084,7 +1086,7 @@ int kvmppc_handle_exit(struct kvm_run *run, struct kvm_vcpu *vcpu,
 		break;
 
 	case BOOKE_INTERRUPT_HV_PRIV:
-		r = emulation_exit(run, vcpu);
+		r = emulation_exit(vcpu);
 		break;
 
 	case BOOKE_INTERRUPT_PROGRAM:
@@ -1094,7 +1096,7 @@ int kvmppc_handle_exit(struct kvm_run *run, struct kvm_vcpu *vcpu,
 			 * We are here because of an SW breakpoint instr,
 			 * so lets return to host to handle.
 			 */
-			r = kvmppc_handle_debug(run, vcpu);
+			r = kvmppc_handle_debug(vcpu);
 			run->exit_reason = KVM_EXIT_DEBUG;
 			kvmppc_account_exit(vcpu, DEBUG_EXITS);
 			break;
@@ -1115,7 +1117,7 @@ int kvmppc_handle_exit(struct kvm_run *run, struct kvm_vcpu *vcpu,
 			break;
 		}
 
-		r = emulation_exit(run, vcpu);
+		r = emulation_exit(vcpu);
 		break;
 
 	case BOOKE_INTERRUPT_FP_UNAVAIL:
@@ -1282,7 +1284,7 @@ int kvmppc_handle_exit(struct kvm_run *run, struct kvm_vcpu *vcpu,
 			 * actually RAM. */
 			vcpu->arch.paddr_accessed = gpaddr;
 			vcpu->arch.vaddr_accessed = eaddr;
-			r = kvmppc_emulate_mmio(run, vcpu);
+			r = kvmppc_emulate_mmio(vcpu);
 			kvmppc_account_exit(vcpu, MMIO_EXITS);
 		}
 
@@ -1333,7 +1335,7 @@ int kvmppc_handle_exit(struct kvm_run *run, struct kvm_vcpu *vcpu,
 	}
 
 	case BOOKE_INTERRUPT_DEBUG: {
-		r = kvmppc_handle_debug(run, vcpu);
+		r = kvmppc_handle_debug(vcpu);
 		if (r == RESUME_HOST)
 			run->exit_reason = KVM_EXIT_DEBUG;
 		kvmppc_account_exit(vcpu, DEBUG_EXITS);
diff --git a/arch/powerpc/kvm/booke.h b/arch/powerpc/kvm/booke.h
index 65b4d337d337..be9da96d9f06 100644
--- a/arch/powerpc/kvm/booke.h
+++ b/arch/powerpc/kvm/booke.h
@@ -70,7 +70,7 @@ void kvmppc_set_tcr(struct kvm_vcpu *vcpu, u32 new_tcr);
 void kvmppc_set_tsr_bits(struct kvm_vcpu *vcpu, u32 tsr_bits);
 void kvmppc_clr_tsr_bits(struct kvm_vcpu *vcpu, u32 tsr_bits);
 
-int kvmppc_booke_emulate_op(struct kvm_run *run, struct kvm_vcpu *vcpu,
+int kvmppc_booke_emulate_op(struct kvm_vcpu *vcpu,
                             unsigned int inst, int *advance);
 int kvmppc_booke_emulate_mfspr(struct kvm_vcpu *vcpu, int sprn, ulong *spr_val);
 int kvmppc_booke_emulate_mtspr(struct kvm_vcpu *vcpu, int sprn, ulong spr_val);
@@ -94,16 +94,12 @@ enum int_class {
 
 void kvmppc_set_pending_interrupt(struct kvm_vcpu *vcpu, enum int_class type);
 
-extern int kvmppc_core_emulate_op_e500(struct kvm_run *run,
-				       struct kvm_vcpu *vcpu,
+extern int kvmppc_core_emulate_op_e500(struct kvm_vcpu *vcpu,
 				       unsigned int inst, int *advance);
 extern int kvmppc_core_emulate_mtspr_e500(struct kvm_vcpu *vcpu, int sprn,
 					  ulong spr_val);
 extern int kvmppc_core_emulate_mfspr_e500(struct kvm_vcpu *vcpu, int sprn,
 					  ulong *spr_val);
-extern int kvmppc_core_emulate_op_e500(struct kvm_run *run,
-				       struct kvm_vcpu *vcpu,
-				       unsigned int inst, int *advance);
 extern int kvmppc_core_emulate_mtspr_e500(struct kvm_vcpu *vcpu, int sprn,
 					  ulong spr_val);
 extern int kvmppc_core_emulate_mfspr_e500(struct kvm_vcpu *vcpu, int sprn,
diff --git a/arch/powerpc/kvm/booke_emulate.c b/arch/powerpc/kvm/booke_emulate.c
index 689ff5f90e9e..d8d38aca71bd 100644
--- a/arch/powerpc/kvm/booke_emulate.c
+++ b/arch/powerpc/kvm/booke_emulate.c
@@ -39,7 +39,7 @@ static void kvmppc_emul_rfci(struct kvm_vcpu *vcpu)
 	kvmppc_set_msr(vcpu, vcpu->arch.csrr1);
 }
 
-int kvmppc_booke_emulate_op(struct kvm_run *run, struct kvm_vcpu *vcpu,
+int kvmppc_booke_emulate_op(struct kvm_vcpu *vcpu,
                             unsigned int inst, int *advance)
 {
 	int emulated = EMULATE_DONE;
diff --git a/arch/powerpc/kvm/e500_emulate.c b/arch/powerpc/kvm/e500_emulate.c
index 3d0d3ec5be96..64eb833e9f02 100644
--- a/arch/powerpc/kvm/e500_emulate.c
+++ b/arch/powerpc/kvm/e500_emulate.c
@@ -83,16 +83,16 @@ static int kvmppc_e500_emul_msgsnd(struct kvm_vcpu *vcpu, int rb)
 }
 #endif
 
-static int kvmppc_e500_emul_ehpriv(struct kvm_run *run, struct kvm_vcpu *vcpu,
+static int kvmppc_e500_emul_ehpriv(struct kvm_vcpu *vcpu,
 				   unsigned int inst, int *advance)
 {
 	int emulated = EMULATE_DONE;
 
 	switch (get_oc(inst)) {
 	case EHPRIV_OC_DEBUG:
-		run->exit_reason = KVM_EXIT_DEBUG;
-		run->debug.arch.address = vcpu->arch.regs.nip;
-		run->debug.arch.status = 0;
+		vcpu->run->exit_reason = KVM_EXIT_DEBUG;
+		vcpu->run->debug.arch.address = vcpu->arch.regs.nip;
+		vcpu->run->debug.arch.status = 0;
 		kvmppc_account_exit(vcpu, DEBUG_EXITS);
 		emulated = EMULATE_EXIT_USER;
 		*advance = 0;
@@ -125,7 +125,7 @@ static int kvmppc_e500_emul_mftmr(struct kvm_vcpu *vcpu, unsigned int inst,
 	return EMULATE_FAIL;
 }
 
-int kvmppc_core_emulate_op_e500(struct kvm_run *run, struct kvm_vcpu *vcpu,
+int kvmppc_core_emulate_op_e500(struct kvm_vcpu *vcpu,
 				unsigned int inst, int *advance)
 {
 	int emulated = EMULATE_DONE;
@@ -182,8 +182,7 @@ int kvmppc_core_emulate_op_e500(struct kvm_run *run, struct kvm_vcpu *vcpu,
 			break;
 
 		case XOP_EHPRIV:
-			emulated = kvmppc_e500_emul_ehpriv(run, vcpu, inst,
-							   advance);
+			emulated = kvmppc_e500_emul_ehpriv(vcpu, inst, advance);
 			break;
 
 		default:
@@ -197,7 +196,7 @@ int kvmppc_core_emulate_op_e500(struct kvm_run *run, struct kvm_vcpu *vcpu,
 	}
 
 	if (emulated == EMULATE_FAIL)
-		emulated = kvmppc_booke_emulate_op(run, vcpu, inst, advance);
+		emulated = kvmppc_booke_emulate_op(vcpu, inst, advance);
 
 	return emulated;
 }
diff --git a/arch/powerpc/kvm/emulate.c b/arch/powerpc/kvm/emulate.c
index 6fca38ca791f..ee1147c98cd8 100644
--- a/arch/powerpc/kvm/emulate.c
+++ b/arch/powerpc/kvm/emulate.c
@@ -191,7 +191,7 @@ static int kvmppc_emulate_mfspr(struct kvm_vcpu *vcpu, int sprn, int rt)
 
 /* XXX Should probably auto-generate instruction decoding for a particular core
  * from opcode tables in the future. */
-int kvmppc_emulate_instruction(struct kvm_run *run, struct kvm_vcpu *vcpu)
+int kvmppc_emulate_instruction(struct kvm_vcpu *vcpu)
 {
 	u32 inst;
 	int rs, rt, sprn;
@@ -270,9 +270,9 @@ int kvmppc_emulate_instruction(struct kvm_run *run, struct kvm_vcpu *vcpu)
 		 * these are illegal instructions.
 		 */
 		if (inst == KVMPPC_INST_SW_BREAKPOINT) {
-			run->exit_reason = KVM_EXIT_DEBUG;
-			run->debug.arch.status = 0;
-			run->debug.arch.address = kvmppc_get_pc(vcpu);
+			vcpu->run->exit_reason = KVM_EXIT_DEBUG;
+			vcpu->run->debug.arch.status = 0;
+			vcpu->run->debug.arch.address = kvmppc_get_pc(vcpu);
 			emulated = EMULATE_EXIT_USER;
 			advance = 0;
 		} else
@@ -285,7 +285,7 @@ int kvmppc_emulate_instruction(struct kvm_run *run, struct kvm_vcpu *vcpu)
 	}
 
 	if (emulated == EMULATE_FAIL) {
-		emulated = vcpu->kvm->arch.kvm_ops->emulate_op(run, vcpu, inst,
+		emulated = vcpu->kvm->arch.kvm_ops->emulate_op(vcpu, inst,
 							       &advance);
 		if (emulated == EMULATE_AGAIN) {
 			advance = 0;
diff --git a/arch/powerpc/kvm/emulate_loadstore.c b/arch/powerpc/kvm/emulate_loadstore.c
index 1139bc56e004..e8a47c84d77d 100644
--- a/arch/powerpc/kvm/emulate_loadstore.c
+++ b/arch/powerpc/kvm/emulate_loadstore.c
@@ -71,7 +71,6 @@ static bool kvmppc_check_altivec_disabled(struct kvm_vcpu *vcpu)
  */
 int kvmppc_emulate_loadstore(struct kvm_vcpu *vcpu)
 {
-	struct kvm_run *run = vcpu->run;
 	u32 inst;
 	enum emulation_result emulated = EMULATE_FAIL;
 	int advance = 1;
@@ -104,10 +103,10 @@ int kvmppc_emulate_loadstore(struct kvm_vcpu *vcpu)
 			int instr_byte_swap = op.type & BYTEREV;
 
 			if (op.type & SIGNEXT)
-				emulated = kvmppc_handle_loads(run, vcpu,
+				emulated = kvmppc_handle_loads(vcpu,
 						op.reg, size, !instr_byte_swap);
 			else
-				emulated = kvmppc_handle_load(run, vcpu,
+				emulated = kvmppc_handle_load(vcpu,
 						op.reg, size, !instr_byte_swap);
 
 			if ((op.type & UPDATE) && (emulated != EMULATE_FAIL))
@@ -124,10 +123,10 @@ int kvmppc_emulate_loadstore(struct kvm_vcpu *vcpu)
 				vcpu->arch.mmio_sp64_extend = 1;
 
 			if (op.type & SIGNEXT)
-				emulated = kvmppc_handle_loads(run, vcpu,
+				emulated = kvmppc_handle_loads(vcpu,
 					     KVM_MMIO_REG_FPR|op.reg, size, 1);
 			else
-				emulated = kvmppc_handle_load(run, vcpu,
+				emulated = kvmppc_handle_load(vcpu,
 					     KVM_MMIO_REG_FPR|op.reg, size, 1);
 
 			if ((op.type & UPDATE) && (emulated != EMULATE_FAIL))
@@ -164,12 +163,12 @@ int kvmppc_emulate_loadstore(struct kvm_vcpu *vcpu)
 
 			if (size == 16) {
 				vcpu->arch.mmio_vmx_copy_nums = 2;
-				emulated = kvmppc_handle_vmx_load(run,
-						vcpu, KVM_MMIO_REG_VMX|op.reg,
+				emulated = kvmppc_handle_vmx_load(vcpu,
+						KVM_MMIO_REG_VMX|op.reg,
 						8, 1);
 			} else {
 				vcpu->arch.mmio_vmx_copy_nums = 1;
-				emulated = kvmppc_handle_vmx_load(run, vcpu,
+				emulated = kvmppc_handle_vmx_load(vcpu,
 						KVM_MMIO_REG_VMX|op.reg,
 						size, 1);
 			}
@@ -217,7 +216,7 @@ int kvmppc_emulate_loadstore(struct kvm_vcpu *vcpu)
 				io_size_each = op.element_size;
 			}
 
-			emulated = kvmppc_handle_vsx_load(run, vcpu,
+			emulated = kvmppc_handle_vsx_load(vcpu,
 					KVM_MMIO_REG_VSX|op.reg, io_size_each,
 					1, op.type & SIGNEXT);
 			break;
@@ -227,8 +226,7 @@ int kvmppc_emulate_loadstore(struct kvm_vcpu *vcpu)
 			/* if need byte reverse, op.val has been reversed by
 			 * analyse_instr().
 			 */
-			emulated = kvmppc_handle_store(run, vcpu, op.val,
-					size, 1);
+			emulated = kvmppc_handle_store(vcpu, op.val, size, 1);
 
 			if ((op.type & UPDATE) && (emulated != EMULATE_FAIL))
 				kvmppc_set_gpr(vcpu, op.update_reg, op.ea);
@@ -250,7 +248,7 @@ int kvmppc_emulate_loadstore(struct kvm_vcpu *vcpu)
 			if (op.type & FPCONV)
 				vcpu->arch.mmio_sp64_extend = 1;
 
-			emulated = kvmppc_handle_store(run, vcpu,
+			emulated = kvmppc_handle_store(vcpu,
 					VCPU_FPR(vcpu, op.reg), size, 1);
 
 			if ((op.type & UPDATE) && (emulated != EMULATE_FAIL))
@@ -290,12 +288,12 @@ int kvmppc_emulate_loadstore(struct kvm_vcpu *vcpu)
 
 			if (size == 16) {
 				vcpu->arch.mmio_vmx_copy_nums = 2;
-				emulated = kvmppc_handle_vmx_store(run,
-						vcpu, op.reg, 8, 1);
+				emulated = kvmppc_handle_vmx_store(vcpu,
+						op.reg, 8, 1);
 			} else {
 				vcpu->arch.mmio_vmx_copy_nums = 1;
-				emulated = kvmppc_handle_vmx_store(run,
-						vcpu, op.reg, size, 1);
+				emulated = kvmppc_handle_vmx_store(vcpu,
+						op.reg, size, 1);
 			}
 
 			break;
@@ -338,7 +336,7 @@ int kvmppc_emulate_loadstore(struct kvm_vcpu *vcpu)
 				io_size_each = op.element_size;
 			}
 
-			emulated = kvmppc_handle_vsx_store(run, vcpu,
+			emulated = kvmppc_handle_vsx_store(vcpu,
 					op.reg, io_size_each, 1);
 			break;
 		}
diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index 7e24691e138a..de4c317ad5f1 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -279,7 +279,7 @@ int kvmppc_sanity_check(struct kvm_vcpu *vcpu)
 }
 EXPORT_SYMBOL_GPL(kvmppc_sanity_check);
 
-int kvmppc_emulate_mmio(struct kvm_run *run, struct kvm_vcpu *vcpu)
+int kvmppc_emulate_mmio(struct kvm_vcpu *vcpu)
 {
 	enum emulation_result er;
 	int r;
@@ -295,7 +295,7 @@ int kvmppc_emulate_mmio(struct kvm_run *run, struct kvm_vcpu *vcpu)
 		r = RESUME_GUEST;
 		break;
 	case EMULATE_DO_MMIO:
-		run->exit_reason = KVM_EXIT_MMIO;
+		vcpu->run->exit_reason = KVM_EXIT_MMIO;
 		/* We must reload nonvolatiles because "update" load/store
 		 * instructions modify register state. */
 		/* Future optimization: only reload non-volatiles if they were
@@ -1106,9 +1106,9 @@ static inline u32 dp_to_sp(u64 fprd)
 #define dp_to_sp(x)	(x)
 #endif /* CONFIG_PPC_FPU */
 
-static void kvmppc_complete_mmio_load(struct kvm_vcpu *vcpu,
-                                      struct kvm_run *run)
+static void kvmppc_complete_mmio_load(struct kvm_vcpu *vcpu)
 {
+	struct kvm_run *run = vcpu->run;
 	u64 uninitialized_var(gpr);
 
 	if (run->mmio.len > sizeof(gpr)) {
@@ -1218,10 +1218,11 @@ static void kvmppc_complete_mmio_load(struct kvm_vcpu *vcpu,
 	}
 }
 
-static int __kvmppc_handle_load(struct kvm_run *run, struct kvm_vcpu *vcpu,
+static int __kvmppc_handle_load(struct kvm_vcpu *vcpu,
 				unsigned int rt, unsigned int bytes,
 				int is_default_endian, int sign_extend)
 {
+	struct kvm_run *run = vcpu->run;
 	int idx, ret;
 	bool host_swabbed;
 
@@ -1255,7 +1256,7 @@ static int __kvmppc_handle_load(struct kvm_run *run, struct kvm_vcpu *vcpu,
 	srcu_read_unlock(&vcpu->kvm->srcu, idx);
 
 	if (!ret) {
-		kvmppc_complete_mmio_load(vcpu, run);
+		kvmppc_complete_mmio_load(vcpu);
 		vcpu->mmio_needed = 0;
 		return EMULATE_DONE;
 	}
@@ -1263,24 +1264,24 @@ static int __kvmppc_handle_load(struct kvm_run *run, struct kvm_vcpu *vcpu,
 	return EMULATE_DO_MMIO;
 }
 
-int kvmppc_handle_load(struct kvm_run *run, struct kvm_vcpu *vcpu,
+int kvmppc_handle_load(struct kvm_vcpu *vcpu,
 		       unsigned int rt, unsigned int bytes,
 		       int is_default_endian)
 {
-	return __kvmppc_handle_load(run, vcpu, rt, bytes, is_default_endian, 0);
+	return __kvmppc_handle_load(vcpu, rt, bytes, is_default_endian, 0);
 }
 EXPORT_SYMBOL_GPL(kvmppc_handle_load);
 
 /* Same as above, but sign extends */
-int kvmppc_handle_loads(struct kvm_run *run, struct kvm_vcpu *vcpu,
+int kvmppc_handle_loads(struct kvm_vcpu *vcpu,
 			unsigned int rt, unsigned int bytes,
 			int is_default_endian)
 {
-	return __kvmppc_handle_load(run, vcpu, rt, bytes, is_default_endian, 1);
+	return __kvmppc_handle_load(vcpu, rt, bytes, is_default_endian, 1);
 }
 
 #ifdef CONFIG_VSX
-int kvmppc_handle_vsx_load(struct kvm_run *run, struct kvm_vcpu *vcpu,
+int kvmppc_handle_vsx_load(struct kvm_vcpu *vcpu,
 			unsigned int rt, unsigned int bytes,
 			int is_default_endian, int mmio_sign_extend)
 {
@@ -1291,13 +1292,13 @@ int kvmppc_handle_vsx_load(struct kvm_run *run, struct kvm_vcpu *vcpu,
 		return EMULATE_FAIL;
 
 	while (vcpu->arch.mmio_vsx_copy_nums) {
-		emulated = __kvmppc_handle_load(run, vcpu, rt, bytes,
+		emulated = __kvmppc_handle_load(vcpu, rt, bytes,
 			is_default_endian, mmio_sign_extend);
 
 		if (emulated != EMULATE_DONE)
 			break;
 
-		vcpu->arch.paddr_accessed += run->mmio.len;
+		vcpu->arch.paddr_accessed += vcpu->run->mmio.len;
 
 		vcpu->arch.mmio_vsx_copy_nums--;
 		vcpu->arch.mmio_vsx_offset++;
@@ -1306,9 +1307,10 @@ int kvmppc_handle_vsx_load(struct kvm_run *run, struct kvm_vcpu *vcpu,
 }
 #endif /* CONFIG_VSX */
 
-int kvmppc_handle_store(struct kvm_run *run, struct kvm_vcpu *vcpu,
+int kvmppc_handle_store(struct kvm_vcpu *vcpu,
 			u64 val, unsigned int bytes, int is_default_endian)
 {
+	struct kvm_run *run = vcpu->run;
 	void *data = run->mmio.data;
 	int idx, ret;
 	bool host_swabbed;
@@ -1422,7 +1424,7 @@ static inline int kvmppc_get_vsr_data(struct kvm_vcpu *vcpu, int rs, u64 *val)
 	return result;
 }
 
-int kvmppc_handle_vsx_store(struct kvm_run *run, struct kvm_vcpu *vcpu,
+int kvmppc_handle_vsx_store(struct kvm_vcpu *vcpu,
 			int rs, unsigned int bytes, int is_default_endian)
 {
 	u64 val;
@@ -1438,13 +1440,13 @@ int kvmppc_handle_vsx_store(struct kvm_run *run, struct kvm_vcpu *vcpu,
 		if (kvmppc_get_vsr_data(vcpu, rs, &val) == -1)
 			return EMULATE_FAIL;
 
-		emulated = kvmppc_handle_store(run, vcpu,
+		emulated = kvmppc_handle_store(vcpu,
 			 val, bytes, is_default_endian);
 
 		if (emulated != EMULATE_DONE)
 			break;
 
-		vcpu->arch.paddr_accessed += run->mmio.len;
+		vcpu->arch.paddr_accessed += vcpu->run->mmio.len;
 
 		vcpu->arch.mmio_vsx_copy_nums--;
 		vcpu->arch.mmio_vsx_offset++;
@@ -1453,19 +1455,19 @@ int kvmppc_handle_vsx_store(struct kvm_run *run, struct kvm_vcpu *vcpu,
 	return emulated;
 }
 
-static int kvmppc_emulate_mmio_vsx_loadstore(struct kvm_vcpu *vcpu,
-			struct kvm_run *run)
+static int kvmppc_emulate_mmio_vsx_loadstore(struct kvm_vcpu *vcpu)
 {
+	struct kvm_run *run = vcpu->run;
 	enum emulation_result emulated = EMULATE_FAIL;
 	int r;
 
 	vcpu->arch.paddr_accessed += run->mmio.len;
 
 	if (!vcpu->mmio_is_write) {
-		emulated = kvmppc_handle_vsx_load(run, vcpu, vcpu->arch.io_gpr,
+		emulated = kvmppc_handle_vsx_load(vcpu, vcpu->arch.io_gpr,
 			 run->mmio.len, 1, vcpu->arch.mmio_sign_extend);
 	} else {
-		emulated = kvmppc_handle_vsx_store(run, vcpu,
+		emulated = kvmppc_handle_vsx_store(vcpu,
 			 vcpu->arch.io_gpr, run->mmio.len, 1);
 	}
 
@@ -1489,7 +1491,7 @@ static int kvmppc_emulate_mmio_vsx_loadstore(struct kvm_vcpu *vcpu,
 #endif /* CONFIG_VSX */
 
 #ifdef CONFIG_ALTIVEC
-int kvmppc_handle_vmx_load(struct kvm_run *run, struct kvm_vcpu *vcpu,
+int kvmppc_handle_vmx_load(struct kvm_vcpu *vcpu,
 		unsigned int rt, unsigned int bytes, int is_default_endian)
 {
 	enum emulation_result emulated = EMULATE_DONE;
@@ -1498,13 +1500,13 @@ int kvmppc_handle_vmx_load(struct kvm_run *run, struct kvm_vcpu *vcpu,
 		return EMULATE_FAIL;
 
 	while (vcpu->arch.mmio_vmx_copy_nums) {
-		emulated = __kvmppc_handle_load(run, vcpu, rt, bytes,
+		emulated = __kvmppc_handle_load(vcpu, rt, bytes,
 				is_default_endian, 0);
 
 		if (emulated != EMULATE_DONE)
 			break;
 
-		vcpu->arch.paddr_accessed += run->mmio.len;
+		vcpu->arch.paddr_accessed += vcpu->run->mmio.len;
 		vcpu->arch.mmio_vmx_copy_nums--;
 		vcpu->arch.mmio_vmx_offset++;
 	}
@@ -1584,7 +1586,7 @@ int kvmppc_get_vmx_byte(struct kvm_vcpu *vcpu, int index, u64 *val)
 	return result;
 }
 
-int kvmppc_handle_vmx_store(struct kvm_run *run, struct kvm_vcpu *vcpu,
+int kvmppc_handle_vmx_store(struct kvm_vcpu *vcpu,
 		unsigned int rs, unsigned int bytes, int is_default_endian)
 {
 	u64 val = 0;
@@ -1619,12 +1621,12 @@ int kvmppc_handle_vmx_store(struct kvm_run *run, struct kvm_vcpu *vcpu,
 			return EMULATE_FAIL;
 		}
 
-		emulated = kvmppc_handle_store(run, vcpu, val, bytes,
+		emulated = kvmppc_handle_store(vcpu, val, bytes,
 				is_default_endian);
 		if (emulated != EMULATE_DONE)
 			break;
 
-		vcpu->arch.paddr_accessed += run->mmio.len;
+		vcpu->arch.paddr_accessed += vcpu->run->mmio.len;
 		vcpu->arch.mmio_vmx_copy_nums--;
 		vcpu->arch.mmio_vmx_offset++;
 	}
@@ -1632,19 +1634,19 @@ int kvmppc_handle_vmx_store(struct kvm_run *run, struct kvm_vcpu *vcpu,
 	return emulated;
 }
 
-static int kvmppc_emulate_mmio_vmx_loadstore(struct kvm_vcpu *vcpu,
-		struct kvm_run *run)
+static int kvmppc_emulate_mmio_vmx_loadstore(struct kvm_vcpu *vcpu)
 {
+	struct kvm_run *run = vcpu->run;
 	enum emulation_result emulated = EMULATE_FAIL;
 	int r;
 
 	vcpu->arch.paddr_accessed += run->mmio.len;
 
 	if (!vcpu->mmio_is_write) {
-		emulated = kvmppc_handle_vmx_load(run, vcpu,
+		emulated = kvmppc_handle_vmx_load(vcpu,
 				vcpu->arch.io_gpr, run->mmio.len, 1);
 	} else {
-		emulated = kvmppc_handle_vmx_store(run, vcpu,
+		emulated = kvmppc_handle_vmx_store(vcpu,
 				vcpu->arch.io_gpr, run->mmio.len, 1);
 	}
 
@@ -1774,7 +1776,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 	if (vcpu->mmio_needed) {
 		vcpu->mmio_needed = 0;
 		if (!vcpu->mmio_is_write)
-			kvmppc_complete_mmio_load(vcpu, run);
+			kvmppc_complete_mmio_load(vcpu);
 #ifdef CONFIG_VSX
 		if (vcpu->arch.mmio_vsx_copy_nums > 0) {
 			vcpu->arch.mmio_vsx_copy_nums--;
@@ -1782,7 +1784,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 		}
 
 		if (vcpu->arch.mmio_vsx_copy_nums > 0) {
-			r = kvmppc_emulate_mmio_vsx_loadstore(vcpu, run);
+			r = kvmppc_emulate_mmio_vsx_loadstore(vcpu);
 			if (r == RESUME_HOST) {
 				vcpu->mmio_needed = 1;
 				goto out;
@@ -1796,7 +1798,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 		}
 
 		if (vcpu->arch.mmio_vmx_copy_nums > 0) {
-			r = kvmppc_emulate_mmio_vmx_loadstore(vcpu, run);
+			r = kvmppc_emulate_mmio_vmx_loadstore(vcpu);
 			if (r == RESUME_HOST) {
 				vcpu->mmio_needed = 1;
 				goto out;
@@ -1829,7 +1831,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 	if (run->immediate_exit)
 		r = -EINTR;
 	else
-		r = kvmppc_vcpu_run(run, vcpu);
+		r = kvmppc_vcpu_run(vcpu);
 
 	kvm_sigset_deactivate(vcpu);
 
diff --git a/arch/powerpc/kvm/trace_hv.h b/arch/powerpc/kvm/trace_hv.h
index 8a1e3b0047f1..4a61a971c34e 100644
--- a/arch/powerpc/kvm/trace_hv.h
+++ b/arch/powerpc/kvm/trace_hv.h
@@ -472,9 +472,9 @@ TRACE_EVENT(kvmppc_run_vcpu_enter,
 );
 
 TRACE_EVENT(kvmppc_run_vcpu_exit,
-	TP_PROTO(struct kvm_vcpu *vcpu, struct kvm_run *run),
+	TP_PROTO(struct kvm_vcpu *vcpu),
 
-	TP_ARGS(vcpu, run),
+	TP_ARGS(vcpu),
 
 	TP_STRUCT__entry(
 		__field(int,		vcpu_id)
@@ -484,7 +484,7 @@ TRACE_EVENT(kvmppc_run_vcpu_exit,
 
 	TP_fast_assign(
 		__entry->vcpu_id  = vcpu->vcpu_id;
-		__entry->exit     = run->exit_reason;
+		__entry->exit     = vcpu->run->exit_reason;
 		__entry->ret      = vcpu->arch.ret;
 	),
 
-- 
2.17.1

