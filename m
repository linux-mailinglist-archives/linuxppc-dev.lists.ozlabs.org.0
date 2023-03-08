Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 360E16AFF05
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Mar 2023 07:38:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PWjMM0MKXz3fDd
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Mar 2023 17:38:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=V1Yg4nzC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PWjJY010Bz3c7d
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Mar 2023 17:36:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=V1Yg4nzC;
	dkim-atps=neutral
Received: by gandalf.ozlabs.org (Postfix)
	id 4PWjJS1L6Mz4xDj; Wed,  8 Mar 2023 17:36:24 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by gandalf.ozlabs.org (Postfix, from userid 1003)
	id 4PWjJS1DBzz4xDh; Wed,  8 Mar 2023 17:36:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
	s=201707; t=1678257384;
	bh=fMYS1ISZ/3APzUUSTWugIFz7lD9cZcuwempkwjBgo7Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V1Yg4nzC6kyJPdrt/ztoUTvCks53YGb6twWyOuNX2W5ki+xY3xpW4plmnjxwWiLuS
	 8EJswTwL8Udd1ToazeWRsYpty9I3FjRPIWESQJHuJKf5Gw5mlW4P9v5FiOTPYh2y/2
	 fNNgct+kyQygrijaGkF6bVj/Nbtayg/HSNObEK1Aq3Zv+jAMYBhb40JP8B0KLpGc1b
	 j57ot2Lq/4+RLJ0DojXgNDsTu9tqBrewMIYtBlAMTE7Yt+SxsRI+tfQtOGIi5ZJnmj
	 7Vz3hr7XuYQNOfot7f28Q4W6DIH+f1R73MXEUwRxtdB0YSfxPYsC8ODAD/2r2lu0CI
	 lGQaRfcl4FggQ==
Date: Wed, 8 Mar 2023 17:34:48 +1100
From: Paul Mackerras <paulus@ozlabs.org>
To: linuxppc-dev@ozlabs.org, kvm@vger.kernel.org
Subject: [PATCH 1/3] powerpc/kvm: Make kvmppc_get_last_inst() produce a
 ppc_inst_t
Message-ID: <ZAgsiPlL9O7KnlZZ@cleo>
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

This changes kvmppc_get_last_inst() so that the instruction it fetches
is returned in a ppc_inst_t variable rather than a u32.  This will
allow us to return a 64-bit prefixed instruction on those 64-bit
machines that implement Power ISA v3.1 or later, such as POWER10.
On 32-bit platforms, ppc_inst_t is 32 bits wide, and is turned back
into a u32 by ppc_inst_val, which is an identity operation on those
platforms.

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
Tested-by: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Paul Mackerras <paulus@ozlabs.org>
---
 arch/powerpc/include/asm/kvm_ppc.h       |  5 +++--
 arch/powerpc/kvm/book3s_64_mmu_hv.c      | 12 ++++++++----
 arch/powerpc/kvm/book3s_hv.c             | 13 ++++++++-----
 arch/powerpc/kvm/book3s_paired_singles.c |  4 +++-
 arch/powerpc/kvm/book3s_pr.c             | 20 ++++++++++----------
 arch/powerpc/kvm/booke.c                 | 10 +++++++---
 arch/powerpc/kvm/emulate.c               |  4 +++-
 arch/powerpc/kvm/emulate_loadstore.c     |  6 +++---
 arch/powerpc/kvm/powerpc.c               |  4 ++--
 9 files changed, 47 insertions(+), 31 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_ppc.h b/arch/powerpc/include/asm/kvm_ppc.h
index eae9619b6190..30aaaa7ce537 100644
--- a/arch/powerpc/include/asm/kvm_ppc.h
+++ b/arch/powerpc/include/asm/kvm_ppc.h
@@ -28,6 +28,7 @@
 #include <asm/xive.h>
 #include <asm/cpu_has_feature.h>
 #endif
+#include <asm/inst.h>
 
 /*
  * KVMPPC_INST_SW_BREAKPOINT is debug Instruction
@@ -316,7 +317,7 @@ extern struct kvmppc_ops *kvmppc_hv_ops;
 extern struct kvmppc_ops *kvmppc_pr_ops;
 
 static inline int kvmppc_get_last_inst(struct kvm_vcpu *vcpu,
-				enum instruction_fetch_type type, u32 *inst)
+				enum instruction_fetch_type type, ppc_inst_t *inst)
 {
 	int ret = EMULATE_DONE;
 	u32 fetched_inst;
@@ -334,7 +335,7 @@ static inline int kvmppc_get_last_inst(struct kvm_vcpu *vcpu,
 	else
 		fetched_inst = vcpu->arch.last_inst;
 
-	*inst = fetched_inst;
+	*inst = ppc_inst(fetched_inst);
 	return ret;
 }
 
diff --git a/arch/powerpc/kvm/book3s_64_mmu_hv.c b/arch/powerpc/kvm/book3s_64_mmu_hv.c
index 7006bcbc2e37..0be313e71615 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_hv.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_hv.c
@@ -415,20 +415,24 @@ static int kvmppc_mmu_book3s_64_hv_xlate(struct kvm_vcpu *vcpu, gva_t eaddr,
  * embodied here.)  If the instruction isn't a load or store, then
  * this doesn't return anything useful.
  */
-static int instruction_is_store(unsigned int instr)
+static int instruction_is_store(ppc_inst_t instr)
 {
 	unsigned int mask;
+	unsigned int suffix;
 
 	mask = 0x10000000;
-	if ((instr & 0xfc000000) == 0x7c000000)
+	suffix = ppc_inst_val(instr);
+	if (ppc_inst_prefixed(instr))
+		suffix = ppc_inst_suffix(instr);
+	else if ((suffix & 0xfc000000) == 0x7c000000)
 		mask = 0x100;		/* major opcode 31 */
-	return (instr & mask) != 0;
+	return (suffix & mask) != 0;
 }
 
 int kvmppc_hv_emulate_mmio(struct kvm_vcpu *vcpu,
 			   unsigned long gpa, gva_t ea, int is_store)
 {
-	u32 last_inst;
+	ppc_inst_t last_inst;
 
 	/*
 	 * Fast path - check if the guest physical address corresponds to a
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 6ba68dd6190b..7d1aede06153 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -1412,7 +1412,7 @@ static int kvmppc_hcall_impl_hv(unsigned long cmd)
 
 static int kvmppc_emulate_debug_inst(struct kvm_vcpu *vcpu)
 {
-	u32 last_inst;
+	ppc_inst_t last_inst;
 
 	if (kvmppc_get_last_inst(vcpu, INST_GENERIC, &last_inst) !=
 					EMULATE_DONE) {
@@ -1423,7 +1423,7 @@ static int kvmppc_emulate_debug_inst(struct kvm_vcpu *vcpu)
 		return RESUME_GUEST;
 	}
 
-	if (last_inst == KVMPPC_INST_SW_BREAKPOINT) {
+	if (ppc_inst_val(last_inst) == KVMPPC_INST_SW_BREAKPOINT) {
 		vcpu->run->exit_reason = KVM_EXIT_DEBUG;
 		vcpu->run->debug.arch.address = kvmppc_get_pc(vcpu);
 		return RESUME_HOST;
@@ -1476,9 +1476,11 @@ static int kvmppc_emulate_doorbell_instr(struct kvm_vcpu *vcpu)
 	unsigned long arg;
 	struct kvm *kvm = vcpu->kvm;
 	struct kvm_vcpu *tvcpu;
+	ppc_inst_t pinst;
 
-	if (kvmppc_get_last_inst(vcpu, INST_GENERIC, &inst) != EMULATE_DONE)
+	if (kvmppc_get_last_inst(vcpu, INST_GENERIC, &pinst) != EMULATE_DONE)
 		return RESUME_GUEST;
+	inst = ppc_inst_val(pinst);
 	if (get_op(inst) != 31)
 		return EMULATE_FAIL;
 	rb = get_rb(inst);
@@ -1994,14 +1996,15 @@ static int kvmppc_handle_nested_exit(struct kvm_vcpu *vcpu)
 		 */
 		if (!(vcpu->arch.hfscr_permitted & (1UL << cause)) ||
 				(vcpu->arch.nested_hfscr & (1UL << cause))) {
+			ppc_inst_t pinst;
 			vcpu->arch.trap = BOOK3S_INTERRUPT_H_EMUL_ASSIST;
 
 			/*
 			 * If the fetch failed, return to guest and
 			 * try executing it again.
 			 */
-			r = kvmppc_get_last_inst(vcpu, INST_GENERIC,
-						 &vcpu->arch.emul_inst);
+			r = kvmppc_get_last_inst(vcpu, INST_GENERIC, &pinst);
+			vcpu->arch.emul_inst = ppc_inst_val(pinst);
 			if (r != EMULATE_DONE)
 				r = RESUME_GUEST;
 			else
diff --git a/arch/powerpc/kvm/book3s_paired_singles.c b/arch/powerpc/kvm/book3s_paired_singles.c
index a11436720a8c..bc39c76c9d9f 100644
--- a/arch/powerpc/kvm/book3s_paired_singles.c
+++ b/arch/powerpc/kvm/book3s_paired_singles.c
@@ -621,6 +621,7 @@ static int kvmppc_ps_one_in(struct kvm_vcpu *vcpu, bool rc,
 int kvmppc_emulate_paired_single(struct kvm_vcpu *vcpu)
 {
 	u32 inst;
+	ppc_inst_t pinst;
 	enum emulation_result emulated = EMULATE_DONE;
 	int ax_rd, ax_ra, ax_rb, ax_rc;
 	short full_d;
@@ -632,7 +633,8 @@ int kvmppc_emulate_paired_single(struct kvm_vcpu *vcpu)
 	int i;
 #endif
 
-	emulated = kvmppc_get_last_inst(vcpu, INST_GENERIC, &inst);
+	emulated = kvmppc_get_last_inst(vcpu, INST_GENERIC, &pinst);
+	inst = ppc_inst_val(pinst);
 	if (emulated != EMULATE_DONE)
 		return emulated;
 
diff --git a/arch/powerpc/kvm/book3s_pr.c b/arch/powerpc/kvm/book3s_pr.c
index 9fc4dd8f66eb..940ab010a471 100644
--- a/arch/powerpc/kvm/book3s_pr.c
+++ b/arch/powerpc/kvm/book3s_pr.c
@@ -1079,7 +1079,7 @@ static int kvmppc_exit_pr_progint(struct kvm_vcpu *vcpu, unsigned int exit_nr)
 {
 	enum emulation_result er;
 	ulong flags;
-	u32 last_inst;
+	ppc_inst_t last_inst;
 	int emul, r;
 
 	/*
@@ -1100,9 +1100,9 @@ static int kvmppc_exit_pr_progint(struct kvm_vcpu *vcpu, unsigned int exit_nr)
 	if (kvmppc_get_msr(vcpu) & MSR_PR) {
 #ifdef EXIT_DEBUG
 		pr_info("Userspace triggered 0x700 exception at\n 0x%lx (0x%x)\n",
-			kvmppc_get_pc(vcpu), last_inst);
+			kvmppc_get_pc(vcpu), ppc_inst_val(last_inst));
 #endif
-		if ((last_inst & 0xff0007ff) != (INS_DCBZ & 0xfffffff7)) {
+		if ((ppc_inst_val(last_inst) & 0xff0007ff) != (INS_DCBZ & 0xfffffff7)) {
 			kvmppc_core_queue_program(vcpu, flags);
 			return RESUME_GUEST;
 		}
@@ -1119,7 +1119,7 @@ static int kvmppc_exit_pr_progint(struct kvm_vcpu *vcpu, unsigned int exit_nr)
 		break;
 	case EMULATE_FAIL:
 		pr_crit("%s: emulation at %lx failed (%08x)\n",
-			__func__, kvmppc_get_pc(vcpu), last_inst);
+			__func__, kvmppc_get_pc(vcpu), ppc_inst_val(last_inst));
 		kvmppc_core_queue_program(vcpu, flags);
 		r = RESUME_GUEST;
 		break;
@@ -1281,7 +1281,7 @@ int kvmppc_handle_exit_pr(struct kvm_vcpu *vcpu, unsigned int exit_nr)
 		break;
 	case BOOK3S_INTERRUPT_SYSCALL:
 	{
-		u32 last_sc;
+		ppc_inst_t last_sc;
 		int emul;
 
 		/* Get last sc for papr */
@@ -1296,7 +1296,7 @@ int kvmppc_handle_exit_pr(struct kvm_vcpu *vcpu, unsigned int exit_nr)
 		}
 
 		if (vcpu->arch.papr_enabled &&
-		    (last_sc == 0x44000022) &&
+		    (ppc_inst_val(last_sc) == 0x44000022) &&
 		    !(kvmppc_get_msr(vcpu) & MSR_PR)) {
 			/* SC 1 papr hypercalls */
 			ulong cmd = kvmppc_get_gpr(vcpu, 3);
@@ -1348,7 +1348,7 @@ int kvmppc_handle_exit_pr(struct kvm_vcpu *vcpu, unsigned int exit_nr)
 	{
 		int ext_msr = 0;
 		int emul;
-		u32 last_inst;
+		ppc_inst_t last_inst;
 
 		if (vcpu->arch.hflags & BOOK3S_HFLAG_PAIRED_SINGLE) {
 			/* Do paired single instruction emulation */
@@ -1382,15 +1382,15 @@ int kvmppc_handle_exit_pr(struct kvm_vcpu *vcpu, unsigned int exit_nr)
 	}
 	case BOOK3S_INTERRUPT_ALIGNMENT:
 	{
-		u32 last_inst;
+		ppc_inst_t last_inst;
 		int emul = kvmppc_get_last_inst(vcpu, INST_GENERIC, &last_inst);
 
 		if (emul == EMULATE_DONE) {
 			u32 dsisr;
 			u64 dar;
 
-			dsisr = kvmppc_alignment_dsisr(vcpu, last_inst);
-			dar = kvmppc_alignment_dar(vcpu, last_inst);
+			dsisr = kvmppc_alignment_dsisr(vcpu, ppc_inst_val(last_inst));
+			dar = kvmppc_alignment_dar(vcpu, ppc_inst_val(last_inst));
 
 			kvmppc_set_dsisr(vcpu, dsisr);
 			kvmppc_set_dar(vcpu, dar);
diff --git a/arch/powerpc/kvm/booke.c b/arch/powerpc/kvm/booke.c
index e89281d3ba28..875def8d7801 100644
--- a/arch/powerpc/kvm/booke.c
+++ b/arch/powerpc/kvm/booke.c
@@ -1012,6 +1012,7 @@ int kvmppc_handle_exit(struct kvm_vcpu *vcpu, unsigned int exit_nr)
 	int s;
 	int idx;
 	u32 last_inst = KVM_INST_FETCH_FAILED;
+	ppc_inst_t pinst;
 	enum emulation_result emulated = EMULATE_DONE;
 
 	/* Fix irq state (pairs with kvmppc_fix_ee_before_entry()) */
@@ -1031,12 +1032,15 @@ int kvmppc_handle_exit(struct kvm_vcpu *vcpu, unsigned int exit_nr)
 	case BOOKE_INTERRUPT_DATA_STORAGE:
 	case BOOKE_INTERRUPT_DTLB_MISS:
 	case BOOKE_INTERRUPT_HV_PRIV:
-		emulated = kvmppc_get_last_inst(vcpu, INST_GENERIC, &last_inst);
+		emulated = kvmppc_get_last_inst(vcpu, INST_GENERIC, &pinst);
+		last_inst = ppc_inst_val(pinst);
 		break;
 	case BOOKE_INTERRUPT_PROGRAM:
 		/* SW breakpoints arrive as illegal instructions on HV */
-		if (vcpu->guest_debug & KVM_GUESTDBG_USE_SW_BP)
-			emulated = kvmppc_get_last_inst(vcpu, INST_GENERIC, &last_inst);
+		if (vcpu->guest_debug & KVM_GUESTDBG_USE_SW_BP) {
+			emulated = kvmppc_get_last_inst(vcpu, INST_GENERIC, &pinst);
+			last_inst = ppc_inst_val(pinst);
+		}
 		break;
 	default:
 		break;
diff --git a/arch/powerpc/kvm/emulate.c b/arch/powerpc/kvm/emulate.c
index ee1147c98cd8..2a51d5baabf4 100644
--- a/arch/powerpc/kvm/emulate.c
+++ b/arch/powerpc/kvm/emulate.c
@@ -194,6 +194,7 @@ static int kvmppc_emulate_mfspr(struct kvm_vcpu *vcpu, int sprn, int rt)
 int kvmppc_emulate_instruction(struct kvm_vcpu *vcpu)
 {
 	u32 inst;
+	ppc_inst_t pinst;
 	int rs, rt, sprn;
 	enum emulation_result emulated;
 	int advance = 1;
@@ -201,7 +202,8 @@ int kvmppc_emulate_instruction(struct kvm_vcpu *vcpu)
 	/* this default type might be overwritten by subcategories */
 	kvmppc_set_exit_type(vcpu, EMULATED_INST_EXITS);
 
-	emulated = kvmppc_get_last_inst(vcpu, INST_GENERIC, &inst);
+	emulated = kvmppc_get_last_inst(vcpu, INST_GENERIC, &pinst);
+	inst = ppc_inst_val(pinst);
 	if (emulated != EMULATE_DONE)
 		return emulated;
 
diff --git a/arch/powerpc/kvm/emulate_loadstore.c b/arch/powerpc/kvm/emulate_loadstore.c
index cfc9114b87d0..3eb2803b86fe 100644
--- a/arch/powerpc/kvm/emulate_loadstore.c
+++ b/arch/powerpc/kvm/emulate_loadstore.c
@@ -71,7 +71,7 @@ static bool kvmppc_check_altivec_disabled(struct kvm_vcpu *vcpu)
  */
 int kvmppc_emulate_loadstore(struct kvm_vcpu *vcpu)
 {
-	u32 inst;
+	ppc_inst_t inst;
 	enum emulation_result emulated = EMULATE_FAIL;
 	struct instruction_op op;
 
@@ -93,7 +93,7 @@ int kvmppc_emulate_loadstore(struct kvm_vcpu *vcpu)
 
 	emulated = EMULATE_FAIL;
 	vcpu->arch.regs.msr = vcpu->arch.shared->msr;
-	if (analyse_instr(&op, &vcpu->arch.regs, ppc_inst(inst)) == 0) {
+	if (analyse_instr(&op, &vcpu->arch.regs, inst) == 0) {
 		int type = op.type & INSTR_TYPE_MASK;
 		int size = GETSIZE(op.type);
 
@@ -356,7 +356,7 @@ int kvmppc_emulate_loadstore(struct kvm_vcpu *vcpu)
 		}
 	}
 
-	trace_kvm_ppc_instr(inst, kvmppc_get_pc(vcpu), emulated);
+	trace_kvm_ppc_instr(ppc_inst_val(inst), kvmppc_get_pc(vcpu), emulated);
 
 	/* Advance past emulated instruction. */
 	if (emulated != EMULATE_FAIL)
diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index 04494a4fb37a..b594352816f2 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -304,11 +304,11 @@ int kvmppc_emulate_mmio(struct kvm_vcpu *vcpu)
 		break;
 	case EMULATE_FAIL:
 	{
-		u32 last_inst;
+		ppc_inst_t last_inst;
 
 		kvmppc_get_last_inst(vcpu, INST_GENERIC, &last_inst);
 		kvm_debug_ratelimited("Guest access to device memory using unsupported instruction (opcode: %#08x)\n",
-				      last_inst);
+				      ppc_inst_val(last_inst));
 
 		/*
 		 * Injecting a Data Storage here is a bit more
-- 
2.37.3

