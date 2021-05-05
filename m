Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 98801373CF4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 May 2021 16:02:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FZz1c54QCz303n
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 May 2021 00:02:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FZz1D2CLjz2yxW
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 May 2021 00:02:20 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4FZz125n1Bz9sXS;
 Wed,  5 May 2021 16:02:14 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RtgKVJrtb_61; Wed,  5 May 2021 16:02:14 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4FZz110QcHz9sXT;
 Wed,  5 May 2021 16:02:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E233B8B7CA;
 Wed,  5 May 2021 16:02:12 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id wgcZoj-XOThG; Wed,  5 May 2021 16:02:12 +0200 (CEST)
Received: from po15610vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 57F6B8B7D7;
 Wed,  5 May 2021 16:02:12 +0200 (CEST)
Received: by po15610vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 2C61D64856; Wed,  5 May 2021 14:02:12 +0000 (UTC)
Message-Id: <1c80981548dc0c4f145109cdd473022c1aad8d2b.1620223302.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 1/2] powerpc/asm-offset: Remove unused items
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com
Date: Wed,  5 May 2021 14:02:12 +0000 (UTC)
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

Following PACA related items are not used anymore by ASM code:
PACA_SIZE, PACACONTEXTID, PACALOWSLICESPSIZE, PACAHIGHSLICEPSIZE,
PACA_SLB_ADDR_LIMIT, MMUPSIZEDEFSIZE, PACASLBCACHE, PACASLBCACHEPTR,
PACASTABRR, PACAVMALLOCSLLP, MMUPSIZESLLP, PACACONTEXTSLLP,
PACALPPACAPTR, LPPACA_DTLIDX and PACA_DTL_RIDX.

Following items are also not used anymore:
SIGSEGV, NMI_MASK, THREAD_DBCR0, KUAP, TI_FLAGS, TI_PREEMPT,
DCACHEL1BLOCKSPERPAGE, ICACHEL1BLOCKSIZE, ICACHEL1LOGBLOCKSIZE,
ICACHEL1BLOCKSPERPAGE, STACK_REGS_KUAP, KVM_NEED_FLUSH, KVM_FWNMI,
VCPU_DEC, VCPU_SPMC, HSTATE_XICS_PHYS, HSTATE_SAVED_XIRR and
PPC_DBELL_MSGTYPE.

Remove all of them.

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/asm-offsets.c | 52 +------------------------------
 1 file changed, 1 insertion(+), 51 deletions(-)

diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
index 28af4efb4587..0480f4006e0c 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -87,10 +87,7 @@ int main(void)
 #endif
 #endif
 	OFFSET(MMCONTEXTID, mm_struct, context.id);
-#ifdef CONFIG_PPC64
-	DEFINE(SIGSEGV, SIGSEGV);
-	DEFINE(NMI_MASK, NMI_MASK);
-#else
+#ifdef CONFIG_PPC32
 #ifdef CONFIG_PPC_RTAS
 	OFFSET(RTAS_SP, thread_struct, rtas_sp);
 #endif
@@ -154,18 +151,12 @@ int main(void)
 	OFFSET(THREAD_USED_SPE, thread_struct, used_spe);
 #endif /* CONFIG_SPE */
 #endif /* CONFIG_PPC64 */
-#if defined(CONFIG_4xx) || defined(CONFIG_BOOKE)
-	OFFSET(THREAD_DBCR0, thread_struct, debug.dbcr0);
-#endif
 #ifdef CONFIG_KVM_BOOK3S_32_HANDLER
 	OFFSET(THREAD_KVM_SVCPU, thread_struct, kvm_shadow_vcpu);
 #endif
 #if defined(CONFIG_KVM) && defined(CONFIG_BOOKE)
 	OFFSET(THREAD_KVM_VCPU, thread_struct, kvm_vcpu);
 #endif
-#if defined(CONFIG_PPC_BOOK3S_32) && defined(CONFIG_PPC_KUAP)
-	OFFSET(KUAP, thread_struct, kuap);
-#endif
 
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 	OFFSET(PACATMSCRATCH, paca_struct, tm_scratch);
@@ -185,19 +176,12 @@ int main(void)
 	       sizeof(struct pt_regs) + 16);
 #endif /* CONFIG_PPC_TRANSACTIONAL_MEM */
 
-	OFFSET(TI_FLAGS, thread_info, flags);
 	OFFSET(TI_LOCAL_FLAGS, thread_info, local_flags);
-	OFFSET(TI_PREEMPT, thread_info, preempt_count);
 
 #ifdef CONFIG_PPC64
 	OFFSET(DCACHEL1BLOCKSIZE, ppc64_caches, l1d.block_size);
 	OFFSET(DCACHEL1LOGBLOCKSIZE, ppc64_caches, l1d.log_block_size);
-	OFFSET(DCACHEL1BLOCKSPERPAGE, ppc64_caches, l1d.blocks_per_page);
-	OFFSET(ICACHEL1BLOCKSIZE, ppc64_caches, l1i.block_size);
-	OFFSET(ICACHEL1LOGBLOCKSIZE, ppc64_caches, l1i.log_block_size);
-	OFFSET(ICACHEL1BLOCKSPERPAGE, ppc64_caches, l1i.blocks_per_page);
 	/* paca */
-	DEFINE(PACA_SIZE, sizeof(struct paca_struct));
 	OFFSET(PACAPACAINDEX, paca_struct, paca_index);
 	OFFSET(PACAPROCSTART, paca_struct, cpu_start);
 	OFFSET(PACAKSAVE, paca_struct, kstack);
@@ -212,15 +196,6 @@ int main(void)
 	OFFSET(PACAIRQSOFTMASK, paca_struct, irq_soft_mask);
 	OFFSET(PACAIRQHAPPENED, paca_struct, irq_happened);
 	OFFSET(PACA_FTRACE_ENABLED, paca_struct, ftrace_enabled);
-#ifdef CONFIG_PPC_BOOK3S
-	OFFSET(PACACONTEXTID, paca_struct, mm_ctx_id);
-#ifdef CONFIG_PPC_MM_SLICES
-	OFFSET(PACALOWSLICESPSIZE, paca_struct, mm_ctx_low_slices_psize);
-	OFFSET(PACAHIGHSLICEPSIZE, paca_struct, mm_ctx_high_slices_psize);
-	OFFSET(PACA_SLB_ADDR_LIMIT, paca_struct, mm_ctx_slb_addr_limit);
-	DEFINE(MMUPSIZEDEFSIZE, sizeof(struct mmu_psize_def));
-#endif /* CONFIG_PPC_MM_SLICES */
-#endif
 
 #ifdef CONFIG_PPC_BOOK3E
 	OFFSET(PACAPGD, paca_struct, pgd);
@@ -241,21 +216,9 @@ int main(void)
 #endif /* CONFIG_PPC_BOOK3E */
 
 #ifdef CONFIG_PPC_BOOK3S_64
-	OFFSET(PACASLBCACHE, paca_struct, slb_cache);
-	OFFSET(PACASLBCACHEPTR, paca_struct, slb_cache_ptr);
-	OFFSET(PACASTABRR, paca_struct, stab_rr);
-	OFFSET(PACAVMALLOCSLLP, paca_struct, vmalloc_sllp);
-#ifdef CONFIG_PPC_MM_SLICES
-	OFFSET(MMUPSIZESLLP, mmu_psize_def, sllp);
-#else
-	OFFSET(PACACONTEXTSLLP, paca_struct, mm_ctx_sllp);
-#endif /* CONFIG_PPC_MM_SLICES */
 	OFFSET(PACA_EXGEN, paca_struct, exgen);
 	OFFSET(PACA_EXMC, paca_struct, exmc);
 	OFFSET(PACA_EXNMI, paca_struct, exnmi);
-#ifdef CONFIG_PPC_PSERIES
-	OFFSET(PACALPPACAPTR, paca_struct, lppaca_ptr);
-#endif
 	OFFSET(PACA_SLBSHADOWPTR, paca_struct, slb_shadow_ptr);
 	OFFSET(SLBSHADOW_STACKVSID, slb_shadow, save_area[SLB_NUM_BOLTED - 1].vsid);
 	OFFSET(SLBSHADOW_STACKESID, slb_shadow, save_area[SLB_NUM_BOLTED - 1].esid);
@@ -264,9 +227,7 @@ int main(void)
 #ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
 	OFFSET(PACA_PMCINUSE, paca_struct, pmcregs_in_use);
 #endif
-	OFFSET(LPPACA_DTLIDX, lppaca, dtl_idx);
 	OFFSET(LPPACA_YIELDCOUNT, lppaca, yield_count);
-	OFFSET(PACA_DTL_RIDX, paca_struct, dtl_ridx);
 #endif /* CONFIG_PPC_BOOK3S_64 */
 	OFFSET(PACAEMERGSP, paca_struct, emergency_sp);
 #ifdef CONFIG_PPC_BOOK3S_64
@@ -343,10 +304,6 @@ int main(void)
 	STACK_PT_REGS_OFFSET(STACK_REGS_AMR, amr);
 	STACK_PT_REGS_OFFSET(STACK_REGS_IAMR, iamr);
 #endif
-#ifdef CONFIG_PPC_KUAP
-	STACK_PT_REGS_OFFSET(STACK_REGS_KUAP, kuap);
-#endif
-
 
 #if defined(CONFIG_PPC32)
 #if defined(CONFIG_BOOKE) || defined(CONFIG_40x)
@@ -482,11 +439,9 @@ int main(void)
 	OFFSET(KVM_HOST_LPID, kvm, arch.host_lpid);
 	OFFSET(KVM_HOST_LPCR, kvm, arch.host_lpcr);
 	OFFSET(KVM_HOST_SDR1, kvm, arch.host_sdr1);
-	OFFSET(KVM_NEED_FLUSH, kvm, arch.need_tlb_flush.bits);
 	OFFSET(KVM_ENABLED_HCALLS, kvm, arch.enabled_hcalls);
 	OFFSET(KVM_VRMA_SLB_V, kvm, arch.vrma_slb_v);
 	OFFSET(KVM_RADIX, kvm, arch.radix);
-	OFFSET(KVM_FWNMI, kvm, arch.fwnmi_enabled);
 	OFFSET(KVM_SECURE_GUEST, kvm, arch.secure_guest);
 	OFFSET(VCPU_DSISR, kvm_vcpu, arch.shregs.dsisr);
 	OFFSET(VCPU_DAR, kvm_vcpu, arch.shregs.dar);
@@ -514,7 +469,6 @@ int main(void)
 	OFFSET(VCPU_DAWRX1, kvm_vcpu, arch.dawrx1);
 	OFFSET(VCPU_CIABR, kvm_vcpu, arch.ciabr);
 	OFFSET(VCPU_HFLAGS, kvm_vcpu, arch.hflags);
-	OFFSET(VCPU_DEC, kvm_vcpu, arch.dec);
 	OFFSET(VCPU_DEC_EXPIRES, kvm_vcpu, arch.dec_expires);
 	OFFSET(VCPU_PENDING_EXC, kvm_vcpu, arch.pending_exceptions);
 	OFFSET(VCPU_CEDED, kvm_vcpu, arch.ceded);
@@ -525,7 +479,6 @@ int main(void)
 	OFFSET(VCPU_MMCRA, kvm_vcpu, arch.mmcra);
 	OFFSET(VCPU_MMCRS, kvm_vcpu, arch.mmcrs);
 	OFFSET(VCPU_PMC, kvm_vcpu, arch.pmc);
-	OFFSET(VCPU_SPMC, kvm_vcpu, arch.spmc);
 	OFFSET(VCPU_SIAR, kvm_vcpu, arch.siar);
 	OFFSET(VCPU_SDAR, kvm_vcpu, arch.sdar);
 	OFFSET(VCPU_SIER, kvm_vcpu, arch.sier);
@@ -646,10 +599,8 @@ int main(void)
 	HSTATE_FIELD(HSTATE_HWTHREAD_STATE, hwthread_state);
 	HSTATE_FIELD(HSTATE_KVM_VCPU, kvm_vcpu);
 	HSTATE_FIELD(HSTATE_KVM_VCORE, kvm_vcore);
-	HSTATE_FIELD(HSTATE_XICS_PHYS, xics_phys);
 	HSTATE_FIELD(HSTATE_XIVE_TIMA_PHYS, xive_tima_phys);
 	HSTATE_FIELD(HSTATE_XIVE_TIMA_VIRT, xive_tima_virt);
-	HSTATE_FIELD(HSTATE_SAVED_XIRR, saved_xirr);
 	HSTATE_FIELD(HSTATE_HOST_IPI, host_ipi);
 	HSTATE_FIELD(HSTATE_PTID, ptid);
 	HSTATE_FIELD(HSTATE_FAKE_SUSPEND, fake_suspend);
@@ -757,7 +708,6 @@ int main(void)
 #endif
 
 	DEFINE(PPC_DBELL_SERVER, PPC_DBELL_SERVER);
-	DEFINE(PPC_DBELL_MSGTYPE, PPC_DBELL_MSGTYPE);
 
 #ifdef CONFIG_PPC_8xx
 	DEFINE(VIRT_IMMR_BASE, (u64)__fix_to_virt(FIX_IMMR_BASE));
-- 
2.25.0

