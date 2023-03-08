Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E16146AFEFF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Mar 2023 07:37:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PWjKM5wxQz3chB
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Mar 2023 17:37:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=EfF4UNyi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PWjJS4HTYz3bjY
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Mar 2023 17:36:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=EfF4UNyi;
	dkim-atps=neutral
Received: by gandalf.ozlabs.org (Postfix)
	id 4PWjJS1kDhz4xDw; Wed,  8 Mar 2023 17:36:24 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by gandalf.ozlabs.org (Postfix, from userid 1003)
	id 4PWjJS1X25z4xDp; Wed,  8 Mar 2023 17:36:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
	s=201707; t=1678257384;
	bh=if2QIswgIZuML5GSuAAvBXYdKB5090/J9ahtl9MMKAM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EfF4UNyiWFB/+ir1xnpo1Cp1N0SywonQsD7CjVodIvA1cQ8U01OsMk0OjXv9I3J1U
	 A80KDa//8Y0sqjUbMHS5ANM7yeBbcG/cHb3pEJtjoTac0VlxHPd3StX1S+zzmE4Iue
	 uAuH69aAt+VVa1aATn9ob/AZAxzd6yWTf3QBU1cJ/HsZ8Vj10039coQlyYg8wbgSaU
	 rjgtPHn5KgePEelJa0Zponm4TJGYOeVN14KjZyaN3JfPQRazCM62P89Fbu76052N9s
	 AqERqckAdEZdN7zaTIFxAeZ+8mFiYNpWMfu6UwFrectIkGNTAfPMe2WV9+TOdnG6P1
	 0K5VWFJgD7GfQ==
Date: Wed, 8 Mar 2023 17:35:23 +1100
From: Paul Mackerras <paulus@ozlabs.org>
To: linuxppc-dev@ozlabs.org, kvm@vger.kernel.org
Subject: [PATCH 2/3] powerpc/kvm: Fetch prefixed instructions from the guest
Message-ID: <ZAgsq9h1CCzouQuV@cleo>
References: <ZAgsR04beDcARCiw@cleo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZAgsR04beDcARCiw@cleo>
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
Cc: Michael Neuling <mikey@neuling.org>, kvm-ppc@vger.kernel.org, Nick Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In order to handle emulation of prefixed instructions in the guest,
this first makes vcpu->arch.last_inst be an unsigned long, i.e. 64
bits on 64-bit platforms.  For prefixed instructions, the upper 32
bits are used for the prefix and the lower 32 bits for the suffix, and
both halves are byte-swapped if the guest endianness differs from the
host.

Next, vcpu->arch.emul_inst is now 64 bits wide, to match the HEIR
register on POWER10.  Like HEIR, for a prefixed instruction it is
defined to have the prefix is in the top 32 bits and the suffix in the
bottom 32 bits, with both halves in the correct byte order.

kvmppc_get_last_inst is extended on 64-bit machines to put the prefix
and suffix in the right places in the ppc_inst_t being returned.

kvmppc_load_last_inst now returns the instruction in an unsigned long
in the same format as vcpu->arch.last_inst.  It makes the decision
about whether to fetch a suffix based on the SRR1_PREFIXED bit in the
MSR image stored in the vcpu struct, which generally comes from SRR1
or HSRR1 on an interrupt.  This bit is defined in Power ISA v3.1B to
be set if the interrupt occurred due to a prefixed instruction and
cleared otherwise for all interrupts except for instruction storage
interrupt, which does not come to the hypervisor.  It is set to zero
for asynchronous interrupts such as external interrupts.  In previous
ISA versions it was always set to 0 for all interrupts except
instruction storage interrupt.

The code in book3s_hv_rmhandlers.S that loads the faulting instruction
on a HDSI is only used on POWER8 and therefore doesn't ever need to
load a suffix.

[npiggin@gmail.com - check that the is-prefixed bit in SRR1 matches the
type of instruction that was fetched.]

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
Tested-by: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Paul Mackerras <paulus@ozlabs.org>
---
 arch/powerpc/include/asm/kvm_host.h     |  4 ++--
 arch/powerpc/include/asm/kvm_ppc.h      | 32 ++++++++++++++++++-------
 arch/powerpc/kvm/book3s.c               | 32 +++++++++++++++++++++----
 arch/powerpc/kvm/book3s_64_mmu_hv.c     | 14 +++++++++--
 arch/powerpc/kvm/book3s_hv.c            |  2 +-
 arch/powerpc/kvm/book3s_hv_rmhandlers.S |  6 ++---
 arch/powerpc/kvm/booke.c                |  2 +-
 arch/powerpc/kvm/bookehv_interrupts.S   |  2 +-
 arch/powerpc/kvm/e500_mmu_host.c        |  4 ++--
 arch/powerpc/kvm/emulate.c              |  4 ++++
 arch/powerpc/kvm/emulate_loadstore.c    |  2 +-
 11 files changed, 78 insertions(+), 26 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/asm/kvm_host.h
index caea15dcb91d..1590659fb0f5 100644
--- a/arch/powerpc/include/asm/kvm_host.h
+++ b/arch/powerpc/include/asm/kvm_host.h
@@ -758,7 +758,7 @@ struct kvm_vcpu_arch {
 	u8 prodded;
 	u8 doorbell_request;
 	u8 irq_pending; /* Used by XIVE to signal pending guest irqs */
-	u32 last_inst;
+	unsigned long last_inst;
 
 	struct rcuwait wait;
 	struct rcuwait *waitp;
@@ -818,7 +818,7 @@ struct kvm_vcpu_arch {
 	u64 busy_stolen;
 	u64 busy_preempt;
 
-	u32 emul_inst;
+	u64 emul_inst;
 
 	u32 online;
 
diff --git a/arch/powerpc/include/asm/kvm_ppc.h b/arch/powerpc/include/asm/kvm_ppc.h
index 30aaaa7ce537..5f2033c76b58 100644
--- a/arch/powerpc/include/asm/kvm_ppc.h
+++ b/arch/powerpc/include/asm/kvm_ppc.h
@@ -85,7 +85,8 @@ extern int kvmppc_handle_vsx_store(struct kvm_vcpu *vcpu,
 				int is_default_endian);
 
 extern int kvmppc_load_last_inst(struct kvm_vcpu *vcpu,
-				 enum instruction_fetch_type type, u32 *inst);
+				 enum instruction_fetch_type type,
+				 unsigned long *inst);
 
 extern int kvmppc_ld(struct kvm_vcpu *vcpu, ulong *eaddr, int size, void *ptr,
 		     bool data);
@@ -328,15 +329,30 @@ static inline int kvmppc_get_last_inst(struct kvm_vcpu *vcpu,
 		ret = kvmppc_load_last_inst(vcpu, type, &vcpu->arch.last_inst);
 
 	/*  Write fetch_failed unswapped if the fetch failed */
-	if (ret == EMULATE_DONE)
-		fetched_inst = kvmppc_need_byteswap(vcpu) ?
-				swab32(vcpu->arch.last_inst) :
-				vcpu->arch.last_inst;
-	else
-		fetched_inst = vcpu->arch.last_inst;
+	if (ret != EMULATE_DONE) {
+		*inst = ppc_inst(KVM_INST_FETCH_FAILED);
+		return ret;
+	}
+
+#ifdef CONFIG_PPC64
+	/* Is this a prefixed instruction? */
+	if ((vcpu->arch.last_inst >> 32) != 0) {
+		u32 prefix = vcpu->arch.last_inst >> 32;
+		u32 suffix = vcpu->arch.last_inst;
+		if (kvmppc_need_byteswap(vcpu)) {
+			prefix = swab32(prefix);
+			suffix = swab32(suffix);
+		}
+		*inst = ppc_inst_prefix(prefix, suffix);
+		return EMULATE_DONE;
+	}
+#endif
 
+	fetched_inst = kvmppc_need_byteswap(vcpu) ?
+		swab32(vcpu->arch.last_inst) :
+		vcpu->arch.last_inst;
 	*inst = ppc_inst(fetched_inst);
-	return ret;
+	return EMULATE_DONE;
 }
 
 static inline bool is_kvmppc_hv_enabled(struct kvm *kvm)
diff --git a/arch/powerpc/kvm/book3s.c b/arch/powerpc/kvm/book3s.c
index 6d525285dbe8..2bb2d8dadb17 100644
--- a/arch/powerpc/kvm/book3s.c
+++ b/arch/powerpc/kvm/book3s.c
@@ -481,20 +481,42 @@ int kvmppc_xlate(struct kvm_vcpu *vcpu, ulong eaddr, enum xlate_instdata xlid,
 	return r;
 }
 
+/*
+ * Returns prefixed instructions with the prefix in the high 32 bits
+ * of *inst and suffix in the low 32 bits.  This is the same convention
+ * as used in HEIR, vcpu->arch.last_inst and vcpu->arch.emul_inst.
+ * Like vcpu->arch.last_inst but unlike vcpu->arch.emul_inst, each
+ * half of the value needs byte-swapping if the guest endianness is
+ * different from the host endianness.
+ */
 int kvmppc_load_last_inst(struct kvm_vcpu *vcpu,
-		enum instruction_fetch_type type, u32 *inst)
+		enum instruction_fetch_type type, unsigned long *inst)
 {
 	ulong pc = kvmppc_get_pc(vcpu);
 	int r;
+	u32 iw;
 
 	if (type == INST_SC)
 		pc -= 4;
 
-	r = kvmppc_ld(vcpu, &pc, sizeof(u32), inst, false);
-	if (r == EMULATE_DONE)
-		return r;
-	else
+	r = kvmppc_ld(vcpu, &pc, sizeof(u32), &iw, false);
+	if (r != EMULATE_DONE)
 		return EMULATE_AGAIN;
+	/*
+	 * If [H]SRR1 indicates that the instruction that caused the
+	 * current interrupt is a prefixed instruction, get the suffix.
+	 */
+	if (kvmppc_get_msr(vcpu) & SRR1_PREFIXED) {
+		u32 suffix;
+		pc += 4;
+		r = kvmppc_ld(vcpu, &pc, sizeof(u32), &suffix, false);
+		if (r != EMULATE_DONE)
+			return EMULATE_AGAIN;
+		*inst = ((u64)iw << 32) | suffix;
+	} else {
+		*inst = iw;
+	}
+	return r;
 }
 EXPORT_SYMBOL_GPL(kvmppc_load_last_inst);
 
diff --git a/arch/powerpc/kvm/book3s_64_mmu_hv.c b/arch/powerpc/kvm/book3s_64_mmu_hv.c
index 0be313e71615..af1f060533f2 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_hv.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_hv.c
@@ -433,6 +433,7 @@ int kvmppc_hv_emulate_mmio(struct kvm_vcpu *vcpu,
 			   unsigned long gpa, gva_t ea, int is_store)
 {
 	ppc_inst_t last_inst;
+	bool is_prefixed = !!(kvmppc_get_msr(vcpu) & SRR1_PREFIXED);
 
 	/*
 	 * Fast path - check if the guest physical address corresponds to a
@@ -447,7 +448,7 @@ int kvmppc_hv_emulate_mmio(struct kvm_vcpu *vcpu,
 				       NULL);
 		srcu_read_unlock(&vcpu->kvm->srcu, idx);
 		if (!ret) {
-			kvmppc_set_pc(vcpu, kvmppc_get_pc(vcpu) + 4);
+			kvmppc_set_pc(vcpu, kvmppc_get_pc(vcpu) + (is_prefixed ? 8 : 4));
 			return RESUME_GUEST;
 		}
 	}
@@ -462,7 +463,16 @@ int kvmppc_hv_emulate_mmio(struct kvm_vcpu *vcpu,
 	/*
 	 * WARNING: We do not know for sure whether the instruction we just
 	 * read from memory is the same that caused the fault in the first
-	 * place.  If the instruction we read is neither an load or a store,
+	 * place.
+	 *
+	 * If the fault is prefixed but the instruction is not or vice
+	 * versa, try again so that we don't advance pc the wrong amount.
+	 */
+	if (ppc_inst_prefixed(last_inst) != is_prefixed)
+		return RESUME_GUEST;
+
+	/*
+	 * If the instruction we read is neither an load or a store,
 	 * then it can't access memory, so we don't need to worry about
 	 * enforcing access permissions.  So, assuming it is a load or
 	 * store, we just check that its direction (load or store) is
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 7d1aede06153..0d17f4443021 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -474,7 +474,7 @@ static void kvmppc_dump_regs(struct kvm_vcpu *vcpu)
 	for (r = 0; r < vcpu->arch.slb_max; ++r)
 		pr_err("  ESID = %.16llx VSID = %.16llx\n",
 		       vcpu->arch.slb[r].orige, vcpu->arch.slb[r].origv);
-	pr_err("lpcr = %.16lx sdr1 = %.16lx last_inst = %.8x\n",
+	pr_err("lpcr = %.16lx sdr1 = %.16lx last_inst = %.16lx\n",
 	       vcpu->arch.vcore->lpcr, vcpu->kvm->arch.sdr1,
 	       vcpu->arch.last_inst);
 }
diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
index acf80915f406..66d08a089119 100644
--- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
+++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
@@ -1071,11 +1071,11 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 	/* Save HEIR (HV emulation assist reg) in emul_inst
 	   if this is an HEI (HV emulation interrupt, e40) */
 	li	r3,KVM_INST_FETCH_FAILED
-	stw	r3,VCPU_LAST_INST(r9)
+	std	r3,VCPU_LAST_INST(r9)
 	cmpwi	r12,BOOK3S_INTERRUPT_H_EMUL_ASSIST
 	bne	11f
 	mfspr	r3,SPRN_HEIR
-11:	stw	r3,VCPU_HEIR(r9)
+11:	std	r3,VCPU_HEIR(r9)
 
 	/* these are volatile across C function calls */
 	mfctr	r3
@@ -1676,7 +1676,7 @@ fast_interrupt_c_return:
 	mtmsrd	r3
 
 	/* Store the result */
-	stw	r8, VCPU_LAST_INST(r9)
+	std	r8, VCPU_LAST_INST(r9)
 
 	/* Unset guest mode. */
 	li	r0, KVM_GUEST_MODE_HOST_HV
diff --git a/arch/powerpc/kvm/booke.c b/arch/powerpc/kvm/booke.c
index 875def8d7801..670de5cc2f58 100644
--- a/arch/powerpc/kvm/booke.c
+++ b/arch/powerpc/kvm/booke.c
@@ -841,7 +841,7 @@ static int emulation_exit(struct kvm_vcpu *vcpu)
 		return RESUME_GUEST;
 
 	case EMULATE_FAIL:
-		printk(KERN_CRIT "%s: emulation at %lx failed (%08x)\n",
+		printk(KERN_CRIT "%s: emulation at %lx failed (%08lx)\n",
 		       __func__, vcpu->arch.regs.nip, vcpu->arch.last_inst);
 		/* For debugging, encode the failing instruction and
 		 * report it to userspace. */
diff --git a/arch/powerpc/kvm/bookehv_interrupts.S b/arch/powerpc/kvm/bookehv_interrupts.S
index b5fe6fb53c66..8b4a402217ba 100644
--- a/arch/powerpc/kvm/bookehv_interrupts.S
+++ b/arch/powerpc/kvm/bookehv_interrupts.S
@@ -139,7 +139,7 @@ END_BTB_FLUSH_SECTION
 	 * kvmppc_get_last_inst().
 	 */
 	li	r9, KVM_INST_FETCH_FAILED
-	stw	r9, VCPU_LAST_INST(r4)
+	PPC_STL	r9, VCPU_LAST_INST(r4)
 	.endif
 
 	.if	\flags & NEED_ESR
diff --git a/arch/powerpc/kvm/e500_mmu_host.c b/arch/powerpc/kvm/e500_mmu_host.c
index 05668e964140..ccb8f16ffe41 100644
--- a/arch/powerpc/kvm/e500_mmu_host.c
+++ b/arch/powerpc/kvm/e500_mmu_host.c
@@ -623,7 +623,7 @@ void kvmppc_mmu_map(struct kvm_vcpu *vcpu, u64 eaddr, gpa_t gpaddr,
 
 #ifdef CONFIG_KVM_BOOKE_HV
 int kvmppc_load_last_inst(struct kvm_vcpu *vcpu,
-		enum instruction_fetch_type type, u32 *instr)
+		enum instruction_fetch_type type, unsigned long *instr)
 {
 	gva_t geaddr;
 	hpa_t addr;
@@ -713,7 +713,7 @@ int kvmppc_load_last_inst(struct kvm_vcpu *vcpu,
 }
 #else
 int kvmppc_load_last_inst(struct kvm_vcpu *vcpu,
-		enum instruction_fetch_type type, u32 *instr)
+		enum instruction_fetch_type type, unsigned long *instr)
 {
 	return EMULATE_AGAIN;
 }
diff --git a/arch/powerpc/kvm/emulate.c b/arch/powerpc/kvm/emulate.c
index 2a51d5baabf4..355d5206e8aa 100644
--- a/arch/powerpc/kvm/emulate.c
+++ b/arch/powerpc/kvm/emulate.c
@@ -301,6 +301,10 @@ int kvmppc_emulate_instruction(struct kvm_vcpu *vcpu)
 	trace_kvm_ppc_instr(inst, kvmppc_get_pc(vcpu), emulated);
 
 	/* Advance past emulated instruction. */
+	/*
+	 * If this ever handles prefixed instructions, the 4
+	 * will need to become ppc_inst_len(pinst) instead.
+	 */
 	if (advance)
 		kvmppc_set_pc(vcpu, kvmppc_get_pc(vcpu) + 4);
 
diff --git a/arch/powerpc/kvm/emulate_loadstore.c b/arch/powerpc/kvm/emulate_loadstore.c
index 3eb2803b86fe..7716d04f329c 100644
--- a/arch/powerpc/kvm/emulate_loadstore.c
+++ b/arch/powerpc/kvm/emulate_loadstore.c
@@ -360,7 +360,7 @@ int kvmppc_emulate_loadstore(struct kvm_vcpu *vcpu)
 
 	/* Advance past emulated instruction. */
 	if (emulated != EMULATE_FAIL)
-		kvmppc_set_pc(vcpu, kvmppc_get_pc(vcpu) + 4);
+		kvmppc_set_pc(vcpu, kvmppc_get_pc(vcpu) + ppc_inst_len(inst));
 
 	return emulated;
 }
-- 
2.37.3

