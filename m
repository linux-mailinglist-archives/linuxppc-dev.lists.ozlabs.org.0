Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 60388365AB1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Apr 2021 16:02:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FPlkZ2DzJz303j
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Apr 2021 00:02:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FPljv3hqrz2y8N
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Apr 2021 00:02:10 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FPljq00Qvz9v0F0;
 Tue, 20 Apr 2021 16:02:07 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id YAB-mwaOpcIn; Tue, 20 Apr 2021 16:02:06 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FPljp6KxFz9v0Dw;
 Tue, 20 Apr 2021 16:02:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 42B0D8B807;
 Tue, 20 Apr 2021 16:02:08 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id fR6DYh36rDtq; Tue, 20 Apr 2021 16:02:08 +0200 (CEST)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D3D3E8B7ED;
 Tue, 20 Apr 2021 16:02:07 +0200 (CEST)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 5209067A48; Tue, 20 Apr 2021 14:02:07 +0000 (UTC)
Message-Id: <bad58c66859b2a475c0ad516b53164ae3b4853cd.1618927318.git.christophe.leroy@csgroup.eu>
In-Reply-To: <22cadf29620664b600b82026d2a72b8b23351777.1618927318.git.christophe.leroy@csgroup.eu>
References: <22cadf29620664b600b82026d2a72b8b23351777.1618927318.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 2/2] powerpc: Enable OPTPROBES on PPC32
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 naveen.n.rao@linux.vnet.ibm.com
Date: Tue, 20 Apr 2021 14:02:07 +0000 (UTC)
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

For that, create a 32 bits version of patch_imm64_load_insns()
and create a patch_imm_load_insns() which calls
patch_imm32_load_insns() on PPC32 and patch_imm64_load_insns()
on PPC64.

Adapt optprobes_head.S for PPC32. Use PPC_LL/PPC_STL macros instead
of raw ld/std, opt out things linked to paca and use stmw/lmw to
save/restore registers.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v2: Comments from Naveen.
---
 arch/powerpc/Kconfig                 |  2 +-
 arch/powerpc/kernel/optprobes.c      | 24 ++++++++--
 arch/powerpc/kernel/optprobes_head.S | 65 +++++++++++++++-------------
 3 files changed, 56 insertions(+), 35 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 475d77a6ebbe..d2e31a578e26 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -229,7 +229,7 @@ config PPC
 	select HAVE_MOD_ARCH_SPECIFIC
 	select HAVE_NMI				if PERF_EVENTS || (PPC64 && PPC_BOOK3S)
 	select HAVE_HARDLOCKUP_DETECTOR_ARCH	if PPC64 && PPC_BOOK3S && SMP
-	select HAVE_OPTPROBES			if PPC64
+	select HAVE_OPTPROBES
 	select HAVE_PERF_EVENTS
 	select HAVE_PERF_EVENTS_NMI		if PPC64
 	select HAVE_HARDLOCKUP_DETECTOR_PERF	if PERF_EVENTS && HAVE_PERF_EVENTS_NMI && !HAVE_HARDLOCKUP_DETECTOR_ARCH
diff --git a/arch/powerpc/kernel/optprobes.c b/arch/powerpc/kernel/optprobes.c
index 58fdb9f66e0f..cdf87086fa33 100644
--- a/arch/powerpc/kernel/optprobes.c
+++ b/arch/powerpc/kernel/optprobes.c
@@ -141,11 +141,21 @@ void arch_remove_optimized_kprobe(struct optimized_kprobe *op)
 	}
 }
 
+static void patch_imm32_load_insns(unsigned long val, int reg, kprobe_opcode_t *addr)
+{
+	patch_instruction((struct ppc_inst *)addr,
+			  ppc_inst(PPC_RAW_LIS(reg, IMM_H(val))));
+	addr++;
+
+	patch_instruction((struct ppc_inst *)addr,
+			  ppc_inst(PPC_RAW_ORI(reg, reg, IMM_L(val))));
+}
+
 /*
  * Generate instructions to load provided immediate 64-bit value
  * to register 'reg' and patch these instructions at 'addr'.
  */
-static void patch_imm64_load_insns(unsigned long val, int reg, kprobe_opcode_t *addr)
+static void patch_imm64_load_insns(unsigned long long val, int reg, kprobe_opcode_t *addr)
 {
 	/* lis reg,(op)@highest */
 	patch_instruction((struct ppc_inst *)addr,
@@ -177,6 +187,14 @@ static void patch_imm64_load_insns(unsigned long val, int reg, kprobe_opcode_t *
 				   ___PPC_RS(reg) | (val & 0xffff)));
 }
 
+static void patch_imm_load_insns(unsigned long val, int reg, kprobe_opcode_t *addr)
+{
+	if (IS_ENABLED(CONFIG_PPC64))
+		patch_imm64_load_insns(val, reg, addr);
+	else
+		patch_imm32_load_insns(val, reg, addr);
+}
+
 int arch_prepare_optimized_kprobe(struct optimized_kprobe *op, struct kprobe *p)
 {
 	struct ppc_inst branch_op_callback, branch_emulate_step, temp;
@@ -230,7 +248,7 @@ int arch_prepare_optimized_kprobe(struct optimized_kprobe *op, struct kprobe *p)
 	 * Fixup the template with instructions to:
 	 * 1. load the address of the actual probepoint
 	 */
-	patch_imm64_load_insns((unsigned long)op, 3, buff + TMPL_OP_IDX);
+	patch_imm_load_insns((unsigned long)op, 3, buff + TMPL_OP_IDX);
 
 	/*
 	 * 2. branch to optimized_callback() and emulate_step()
@@ -264,7 +282,7 @@ int arch_prepare_optimized_kprobe(struct optimized_kprobe *op, struct kprobe *p)
 	 * 3. load instruction to be emulated into relevant register, and
 	 */
 	temp = ppc_inst_read((struct ppc_inst *)p->ainsn.insn);
-	patch_imm64_load_insns(ppc_inst_as_ulong(temp), 4, buff + TMPL_INSN_IDX);
+	patch_imm_load_insns(ppc_inst_as_ulong(temp), 4, buff + TMPL_INSN_IDX);
 
 	/*
 	 * 4. branch back from trampoline
diff --git a/arch/powerpc/kernel/optprobes_head.S b/arch/powerpc/kernel/optprobes_head.S
index ff8ba4d3824d..19ea3312403c 100644
--- a/arch/powerpc/kernel/optprobes_head.S
+++ b/arch/powerpc/kernel/optprobes_head.S
@@ -9,6 +9,16 @@
 #include <asm/ptrace.h>
 #include <asm/asm-offsets.h>
 
+#ifdef CONFIG_PPC64
+#define SAVE_30GPRS(base) SAVE_10GPRS(2,base); SAVE_10GPRS(12,base); SAVE_10GPRS(22,base)
+#define REST_30GPRS(base) REST_10GPRS(2,base); REST_10GPRS(12,base); REST_10GPRS(22,base)
+#define TEMPLATE_FOR_IMM_LOAD_INSNS	nop; nop; nop; nop; nop
+#else
+#define SAVE_30GPRS(base) stmw	r2, GPR2(base)
+#define REST_30GPRS(base) lmw	r2, GPR2(base)
+#define TEMPLATE_FOR_IMM_LOAD_INSNS	nop; nop; nop
+#endif
+
 #define	OPT_SLOT_SIZE	65536
 
 	.balign	4
@@ -30,39 +40,41 @@ optinsn_slot:
 	.global optprobe_template_entry
 optprobe_template_entry:
 	/* Create an in-memory pt_regs */
-	stdu	r1,-INT_FRAME_SIZE(r1)
+	PPC_STLU	r1,-INT_FRAME_SIZE(r1)
 	SAVE_GPR(0,r1)
 	/* Save the previous SP into stack */
 	addi	r0,r1,INT_FRAME_SIZE
-	std	r0,GPR1(r1)
-	SAVE_10GPRS(2,r1)
-	SAVE_10GPRS(12,r1)
-	SAVE_10GPRS(22,r1)
+	PPC_STL	r0,GPR1(r1)
+	SAVE_30GPRS(r1)
 	/* Save SPRS */
 	mfmsr	r5
-	std	r5,_MSR(r1)
+	PPC_STL	r5,_MSR(r1)
 	li	r5,0x700
-	std	r5,_TRAP(r1)
+	PPC_STL	r5,_TRAP(r1)
 	li	r5,0
-	std	r5,ORIG_GPR3(r1)
-	std	r5,RESULT(r1)
+	PPC_STL	r5,ORIG_GPR3(r1)
+	PPC_STL	r5,RESULT(r1)
 	mfctr	r5
-	std	r5,_CTR(r1)
+	PPC_STL	r5,_CTR(r1)
 	mflr	r5
-	std	r5,_LINK(r1)
+	PPC_STL	r5,_LINK(r1)
 	mfspr	r5,SPRN_XER
-	std	r5,_XER(r1)
+	PPC_STL	r5,_XER(r1)
 	mfcr	r5
-	std	r5,_CCR(r1)
+	PPC_STL	r5,_CCR(r1)
+#ifdef CONFIG_PPC64
 	lbz     r5,PACAIRQSOFTMASK(r13)
 	std     r5,SOFTE(r1)
+#endif
 
 	/*
 	 * We may get here from a module, so load the kernel TOC in r2.
 	 * The original TOC gets restored when pt_regs is restored
 	 * further below.
 	 */
+#ifdef CONFIG_PPC64
 	ld	r2,PACATOC(r13)
+#endif
 
 	.global optprobe_template_op_address
 optprobe_template_op_address:
@@ -70,11 +82,8 @@ optprobe_template_op_address:
 	 * Parameters to optimized_callback():
 	 * 1. optimized_kprobe structure in r3
 	 */
-	nop
-	nop
-	nop
-	nop
-	nop
+	TEMPLATE_FOR_IMM_LOAD_INSNS
+
 	/* 2. pt_regs pointer in r4 */
 	addi	r4,r1,STACK_FRAME_OVERHEAD
 
@@ -92,11 +101,7 @@ optprobe_template_call_handler:
 	.global optprobe_template_insn
 optprobe_template_insn:
 	/* 2, Pass instruction to be emulated in r4 */
-	nop
-	nop
-	nop
-	nop
-	nop
+	TEMPLATE_FOR_IMM_LOAD_INSNS
 
 	.global optprobe_template_call_emulate
 optprobe_template_call_emulate:
@@ -107,20 +112,18 @@ optprobe_template_call_emulate:
 	 * All done.
 	 * Now, restore the registers...
 	 */
-	ld	r5,_MSR(r1)
+	PPC_LL	r5,_MSR(r1)
 	mtmsr	r5
-	ld	r5,_CTR(r1)
+	PPC_LL	r5,_CTR(r1)
 	mtctr	r5
-	ld	r5,_LINK(r1)
+	PPC_LL	r5,_LINK(r1)
 	mtlr	r5
-	ld	r5,_XER(r1)
+	PPC_LL	r5,_XER(r1)
 	mtxer	r5
-	ld	r5,_CCR(r1)
+	PPC_LL	r5,_CCR(r1)
 	mtcr	r5
 	REST_GPR(0,r1)
-	REST_10GPRS(2,r1)
-	REST_10GPRS(12,r1)
-	REST_10GPRS(22,r1)
+	REST_30GPRS(r1)
 	/* Restore the previous SP */
 	addi	r1,r1,INT_FRAME_SIZE
 
-- 
2.25.0

