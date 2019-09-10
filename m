Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E104DAE369
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Sep 2019 08:03:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46SDwb2s4bzDqS9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Sep 2019 16:03:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46SDtw1F95zDqNC
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Sep 2019 16:01:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=popple.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46SDtt6srDz9s4Y;
 Tue, 10 Sep 2019 16:01:42 +1000 (AEST)
From: Alistair Popple <alistair@popple.id.au>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2] PPC: Set reserved PCR bits
Date: Tue, 10 Sep 2019 16:01:02 +1000
Message-Id: <20190910060102.21597-1-alistair@popple.id.au>
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
Cc: Jordan Niethe <jniethe5@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Alistair Popple <alistair@popple.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently the reserved bits of the Processor Compatibility Register
(PCR) are cleared as per the Programming Note in Section 1.3.3 of
version 3.0B of the Power ISA. This causes all new architecture
features to be made available when running on newer processors with
new architecture features added to the PCR as bits must be set to
disable a given feature.

For example to disable new features added as part of Version 2.07 of
the ISA the corresponding bit in the PCR needs to be set.

As new processor features generally require explicit kernel support
they should be disabled until such support is implemented. Therefore
kernels should set all unknown/reserved bits in the PCR such that any
new architecture features which the kernel does not currently know
about get disabled.

An update is planned to the ISA to clarify that the PCR is an
exception to the Programming Note on reserved bits in Section 1.3.3.

Signed-off-by: Alistair Popple <alistair@popple.id.au>
Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
Tested-by: Joel Stanley <joel@jms.id.au>
---
v2: Added some clarifications to the commit message
---
 arch/powerpc/include/asm/reg.h          |  3 +++
 arch/powerpc/kernel/cpu_setup_power.S   |  6 ++++++
 arch/powerpc/kernel/dt_cpu_ftrs.c       |  3 ++-
 arch/powerpc/kvm/book3s_hv.c            | 11 +++++++----
 arch/powerpc/kvm/book3s_hv_nested.c     |  6 +++---
 arch/powerpc/kvm/book3s_hv_rmhandlers.S | 10 ++++++----
 6 files changed, 27 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/reg.h
index 10caa145f98b..258435c75c43 100644
--- a/arch/powerpc/include/asm/reg.h
+++ b/arch/powerpc/include/asm/reg.h
@@ -475,6 +475,7 @@
 #define   PCR_VEC_DIS	(1ul << (63-0))	/* Vec. disable (bit NA since POWER8) */
 #define   PCR_VSX_DIS	(1ul << (63-1))	/* VSX disable (bit NA since POWER8) */
 #define   PCR_TM_DIS	(1ul << (63-2))	/* Trans. memory disable (POWER8) */
+#define   PCR_HIGH_BITS	(PCR_VEC_DIS | PCR_VSX_DIS | PCR_TM_DIS)
 /*
  * These bits are used in the function kvmppc_set_arch_compat() to specify and
  * determine both the compatibility level which we want to emulate and the
@@ -483,6 +484,8 @@
 #define   PCR_ARCH_207	0x8		/* Architecture 2.07 */
 #define   PCR_ARCH_206	0x4		/* Architecture 2.06 */
 #define   PCR_ARCH_205	0x2		/* Architecture 2.05 */
+#define   PCR_LOW_BITS	(PCR_ARCH_207 | PCR_ARCH_206 | PCR_ARCH_205)
+#define   PCR_MASK	~(PCR_HIGH_BITS | PCR_LOW_BITS)	/* PCR Reserved Bits */
 #define	SPRN_HEIR	0x153	/* Hypervisor Emulated Instruction Register */
 #define SPRN_TLBINDEXR	0x154	/* P7 TLB control register */
 #define SPRN_TLBVPNR	0x155	/* P7 TLB control register */
diff --git a/arch/powerpc/kernel/cpu_setup_power.S b/arch/powerpc/kernel/cpu_setup_power.S
index 3239a9fe6c1c..a460298c7ddb 100644
--- a/arch/powerpc/kernel/cpu_setup_power.S
+++ b/arch/powerpc/kernel/cpu_setup_power.S
@@ -23,6 +23,7 @@ _GLOBAL(__setup_cpu_power7)
 	beqlr
 	li	r0,0
 	mtspr	SPRN_LPID,r0
+	LOAD_REG_IMMEDIATE(r0, PCR_MASK)
 	mtspr	SPRN_PCR,r0
 	mfspr	r3,SPRN_LPCR
 	li	r4,(LPCR_LPES1 >> LPCR_LPES_SH)
@@ -37,6 +38,7 @@ _GLOBAL(__restore_cpu_power7)
 	beqlr
 	li	r0,0
 	mtspr	SPRN_LPID,r0
+	LOAD_REG_IMMEDIATE(r0, PCR_MASK)
 	mtspr	SPRN_PCR,r0
 	mfspr	r3,SPRN_LPCR
 	li	r4,(LPCR_LPES1 >> LPCR_LPES_SH)
@@ -54,6 +56,7 @@ _GLOBAL(__setup_cpu_power8)
 	beqlr
 	li	r0,0
 	mtspr	SPRN_LPID,r0
+	LOAD_REG_IMMEDIATE(r0, PCR_MASK)
 	mtspr	SPRN_PCR,r0
 	mfspr	r3,SPRN_LPCR
 	ori	r3, r3, LPCR_PECEDH
@@ -76,6 +79,7 @@ _GLOBAL(__restore_cpu_power8)
 	beqlr
 	li	r0,0
 	mtspr	SPRN_LPID,r0
+	LOAD_REG_IMMEDIATE(r0, PCR_MASK)
 	mtspr	SPRN_PCR,r0
 	mfspr   r3,SPRN_LPCR
 	ori	r3, r3, LPCR_PECEDH
@@ -98,6 +102,7 @@ _GLOBAL(__setup_cpu_power9)
 	mtspr	SPRN_PSSCR,r0
 	mtspr	SPRN_LPID,r0
 	mtspr	SPRN_PID,r0
+	LOAD_REG_IMMEDIATE(r0, PCR_MASK)
 	mtspr	SPRN_PCR,r0
 	mfspr	r3,SPRN_LPCR
 	LOAD_REG_IMMEDIATE(r4, LPCR_PECEDH | LPCR_PECE_HVEE | LPCR_HVICE  | LPCR_HEIC)
@@ -123,6 +128,7 @@ _GLOBAL(__restore_cpu_power9)
 	mtspr	SPRN_PSSCR,r0
 	mtspr	SPRN_LPID,r0
 	mtspr	SPRN_PID,r0
+	LOAD_REG_IMMEDIATE(r0, PCR_MASK)
 	mtspr	SPRN_PCR,r0
 	mfspr   r3,SPRN_LPCR
 	LOAD_REG_IMMEDIATE(r4, LPCR_PECEDH | LPCR_PECE_HVEE | LPCR_HVICE | LPCR_HEIC)
diff --git a/arch/powerpc/kernel/dt_cpu_ftrs.c b/arch/powerpc/kernel/dt_cpu_ftrs.c
index bd95318d2202..bceee2fde885 100644
--- a/arch/powerpc/kernel/dt_cpu_ftrs.c
+++ b/arch/powerpc/kernel/dt_cpu_ftrs.c
@@ -101,7 +101,7 @@ static void __restore_cpu_cpufeatures(void)
 	if (hv_mode) {
 		mtspr(SPRN_LPID, 0);
 		mtspr(SPRN_HFSCR, system_registers.hfscr);
-		mtspr(SPRN_PCR, 0);
+		mtspr(SPRN_PCR, PCR_MASK);
 	}
 	mtspr(SPRN_FSCR, system_registers.fscr);
 
@@ -144,6 +144,7 @@ static void __init cpufeatures_setup_cpu(void)
 		mtspr(SPRN_HFSCR, 0);
 	}
 	mtspr(SPRN_FSCR, 0);
+	mtspr(SPRN_PCR, PCR_MASK);
 
 	/*
 	 * LPCR does not get cleared, to match behaviour with secondaries
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index cde3f5a4b3e4..7a133c3aebe6 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -401,8 +401,11 @@ static int kvmppc_set_arch_compat(struct kvm_vcpu *vcpu, u32 arch_compat)
 
 	spin_lock(&vc->lock);
 	vc->arch_compat = arch_compat;
-	/* Set all PCR bits for which guest_pcr_bit <= bit < host_pcr_bit */
-	vc->pcr = host_pcr_bit - guest_pcr_bit;
+	/*
+	 * Set all PCR bits for which guest_pcr_bit <= bit < host_pcr_bit
+	 * Also set all reserved PCR bits
+	 */
+	vc->pcr = (host_pcr_bit - guest_pcr_bit) | PCR_MASK;
 	spin_unlock(&vc->lock);
 
 	return 0;
@@ -3398,7 +3401,7 @@ static int kvmhv_load_hv_regs_and_go(struct kvm_vcpu *vcpu, u64 time_limit,
 	}
 
 	if (vc->pcr)
-		mtspr(SPRN_PCR, vc->pcr);
+		mtspr(SPRN_PCR, vc->pcr | PCR_MASK);
 	mtspr(SPRN_DPDES, vc->dpdes);
 	mtspr(SPRN_VTB, vc->vtb);
 
@@ -3478,7 +3481,7 @@ static int kvmhv_load_hv_regs_and_go(struct kvm_vcpu *vcpu, u64 time_limit,
 	vc->vtb = mfspr(SPRN_VTB);
 	mtspr(SPRN_DPDES, 0);
 	if (vc->pcr)
-		mtspr(SPRN_PCR, 0);
+		mtspr(SPRN_PCR, PCR_MASK);
 
 	if (vc->tb_offset_applied) {
 		u64 new_tb = mftb() - vc->tb_offset_applied;
diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3s_hv_nested.c
index 735e0ac6f5b2..e916522c5c39 100644
--- a/arch/powerpc/kvm/book3s_hv_nested.c
+++ b/arch/powerpc/kvm/book3s_hv_nested.c
@@ -29,7 +29,7 @@ void kvmhv_save_hv_regs(struct kvm_vcpu *vcpu, struct hv_guest_state *hr)
 {
 	struct kvmppc_vcore *vc = vcpu->arch.vcore;
 
-	hr->pcr = vc->pcr;
+	hr->pcr = vc->pcr | PCR_MASK;
 	hr->dpdes = vc->dpdes;
 	hr->hfscr = vcpu->arch.hfscr;
 	hr->tb_offset = vc->tb_offset;
@@ -65,7 +65,7 @@ static void byteswap_hv_regs(struct hv_guest_state *hr)
 	hr->lpid = swab32(hr->lpid);
 	hr->vcpu_token = swab32(hr->vcpu_token);
 	hr->lpcr = swab64(hr->lpcr);
-	hr->pcr = swab64(hr->pcr);
+	hr->pcr = swab64(hr->pcr) | PCR_MASK;
 	hr->amor = swab64(hr->amor);
 	hr->dpdes = swab64(hr->dpdes);
 	hr->hfscr = swab64(hr->hfscr);
@@ -148,7 +148,7 @@ static void restore_hv_regs(struct kvm_vcpu *vcpu, struct hv_guest_state *hr)
 {
 	struct kvmppc_vcore *vc = vcpu->arch.vcore;
 
-	vc->pcr = hr->pcr;
+	vc->pcr = hr->pcr | PCR_MASK;
 	vc->dpdes = hr->dpdes;
 	vcpu->arch.hfscr = hr->hfscr;
 	vcpu->arch.dawr = hr->dawr0;
diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
index 337e64468d78..f21dee7a1757 100644
--- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
+++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
@@ -643,8 +643,10 @@ END_FTR_SECTION_IFCLR(CPU_FTR_ARCH_300)
 
 	/* Load guest PCR value to select appropriate compat mode */
 37:	ld	r7, VCORE_PCR(r5)
-	cmpdi	r7, 0
+	LOAD_REG_IMMEDIATE(r6, PCR_MASK)
+	cmpld	r7, r6
 	beq	38f
+	or	r7, r7, r6
 	mtspr	SPRN_PCR, r7
 38:
 
@@ -1884,10 +1886,10 @@ END_FTR_SECTION_IFSET(CPU_FTR_ARCH_207S)
 
 	/* Reset PCR */
 	ld	r0, VCORE_PCR(r5)
-	cmpdi	r0, 0
+	LOAD_REG_IMMEDIATE(r6, PCR_MASK)
+	cmpld	r0, r6
 	beq	18f
-	li	r0, 0
-	mtspr	SPRN_PCR, r0
+	mtspr	SPRN_PCR, r6
 18:
 	/* Signal secondary CPUs to continue */
 	stb	r0,VCORE_IN_GUEST(r5)
-- 
2.20.1

