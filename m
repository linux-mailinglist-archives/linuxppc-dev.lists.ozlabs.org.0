Return-Path: <linuxppc-dev+bounces-368-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7016895B98C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2024 17:12:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqRWz0qRvz2yng;
	Fri, 23 Aug 2024 01:12:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724339551;
	cv=none; b=aTJyLGRB1V+rcfj4k0UzC5ELyzigPi74TBMyMiuAD5ksvXVnqLoBFQm9hQimPl4USmD33Q+zhQQKfMMx+MoeOJrPGf3pOS21xHq7b7o9Vsh0aBrggvu/jvGj/gO1RpgBaEyJnJ83G0tFfVBq+2kOrG5xAxIWueC1jjvdSpbwxn/QicJalTiUTTAKah0Pk+ZWuIUQsAFlfgQrss2wS80R5HehSf1RdM+KlRl2rHfC7DGZYELIb//nz6i6hkETbP4Epezm1JyjdWpWZORsBEasEfJHMkJxWprdXQS1uCGUTqkdoxyIDbU2zi/fdfIBQ7IDFy0gQTiOk5FiEdl7snqJWg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724339551; c=relaxed/relaxed;
	bh=t/GyyKQjhnvuOt3BOc8RNJrfkkM+4199Rp4lYae/2nQ=;
	h=Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding; b=EylMzoDUWgWXshxCqXEHt141TB3DVmNb4kJh899j937ZHt8v6AF9gs9smUYwQfmGgM+fcONcCWZgVPB8IwCJpO2M+I8evqhDUObk43RsvPU78qb+3n+z4d7i+PBT8/oDNyW9ptc40HKrYzFcH1JfkHEX835CzBfXs31SRbFuFOhTIZ7gHASSmOOYXhVFbySdjHHTacUhhNHvWIQfm0IzMzxrErQQVNseRNTc0Zn4X2ZnArAA4yxTzfCWjey0CRkf2E2JDWdmCxFF72FeQbvE7nWiicEeHcMvCND6nWvbhHg8s+wsM/wtiIL+LliWP5SJN9OHCnRDEhE+0FOBsC6o2g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=joey.gouly@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=joey.gouly@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqRWy3hcHz2yhP
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2024 01:12:30 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 955EA15DB;
	Thu, 22 Aug 2024 08:12:20 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 76AB93F58B;
	Thu, 22 Aug 2024 08:11:50 -0700 (PDT)
From: Joey Gouly <joey.gouly@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: nd@arm.com,
	akpm@linux-foundation.org,
	aneesh.kumar@kernel.org,
	aneesh.kumar@linux.ibm.com,
	anshuman.khandual@arm.com,
	bp@alien8.de,
	broonie@kernel.org,
	catalin.marinas@arm.com,
	christophe.leroy@csgroup.eu,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	joey.gouly@arm.com,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	maz@kernel.org,
	mingo@redhat.com,
	mpe@ellerman.id.au,
	naveen.n.rao@linux.ibm.com,
	npiggin@gmail.com,
	oliver.upton@linux.dev,
	shuah@kernel.org,
	skhan@linuxfoundation.org,
	szabolcs.nagy@arm.com,
	tglx@linutronix.de,
	will@kernel.org,
	x86@kernel.org,
	kvmarm@lists.linux.dev,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v5 07/30] KVM: arm64: Save/restore POE registers
Date: Thu, 22 Aug 2024 16:10:50 +0100
Message-Id: <20240822151113.1479789-8-joey.gouly@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240822151113.1479789-1-joey.gouly@arm.com>
References: <20240822151113.1479789-1-joey.gouly@arm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define the new system registers that POE introduces and context switch them.

Signed-off-by: Joey Gouly <joey.gouly@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Reviewed-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/kvm_host.h          |  4 ++++
 arch/arm64/include/asm/vncr_mapping.h      |  1 +
 arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h | 27 ++++++++++++++++++++++
 arch/arm64/kvm/sys_regs.c                  | 19 +++++++++++++--
 4 files changed, 49 insertions(+), 2 deletions(-)

diff --git arch/arm64/include/asm/kvm_host.h arch/arm64/include/asm/kvm_host.h
index a33f5996ca9f..5c9de7692201 100644
--- arch/arm64/include/asm/kvm_host.h
+++ arch/arm64/include/asm/kvm_host.h
@@ -446,6 +446,8 @@ enum vcpu_sysreg {
 	GCR_EL1,	/* Tag Control Register */
 	TFSRE0_EL1,	/* Tag Fault Status Register (EL0) */
 
+	POR_EL0,	/* Permission Overlay Register 0 (EL0) */
+
 	/* 32bit specific registers. */
 	DACR32_EL2,	/* Domain Access Control Register */
 	IFSR32_EL2,	/* Instruction Fault Status Register */
@@ -517,6 +519,8 @@ enum vcpu_sysreg {
 	VNCR(PIR_EL1),	 /* Permission Indirection Register 1 (EL1) */
 	VNCR(PIRE0_EL1), /*  Permission Indirection Register 0 (EL1) */
 
+	VNCR(POR_EL1),	/* Permission Overlay Register 1 (EL1) */
+
 	VNCR(HFGRTR_EL2),
 	VNCR(HFGWTR_EL2),
 	VNCR(HFGITR_EL2),
diff --git arch/arm64/include/asm/vncr_mapping.h arch/arm64/include/asm/vncr_mapping.h
index df2c47c55972..06f8ec0906a6 100644
--- arch/arm64/include/asm/vncr_mapping.h
+++ arch/arm64/include/asm/vncr_mapping.h
@@ -52,6 +52,7 @@
 #define VNCR_PIRE0_EL1		0x290
 #define VNCR_PIRE0_EL2		0x298
 #define VNCR_PIR_EL1		0x2A0
+#define VNCR_POR_EL1		0x2A8
 #define VNCR_ICH_LR0_EL2        0x400
 #define VNCR_ICH_LR1_EL2        0x408
 #define VNCR_ICH_LR2_EL2        0x410
diff --git arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
index 4c0fdabaf8ae..1579a3c08a36 100644
--- arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
+++ arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
@@ -16,9 +16,15 @@
 #include <asm/kvm_hyp.h>
 #include <asm/kvm_mmu.h>
 
+static inline bool ctxt_has_s1poe(struct kvm_cpu_context *ctxt);
+
 static inline void __sysreg_save_common_state(struct kvm_cpu_context *ctxt)
 {
 	ctxt_sys_reg(ctxt, MDSCR_EL1)	= read_sysreg(mdscr_el1);
+
+	// POR_EL0 can affect uaccess, so must be saved/restored early.
+	if (ctxt_has_s1poe(ctxt))
+		ctxt_sys_reg(ctxt, POR_EL0)	= read_sysreg_s(SYS_POR_EL0);
 }
 
 static inline void __sysreg_save_user_state(struct kvm_cpu_context *ctxt)
@@ -66,6 +72,17 @@ static inline bool ctxt_has_tcrx(struct kvm_cpu_context *ctxt)
 	return kvm_has_feat(kern_hyp_va(vcpu->kvm), ID_AA64MMFR3_EL1, TCRX, IMP);
 }
 
+static inline bool ctxt_has_s1poe(struct kvm_cpu_context *ctxt)
+{
+	struct kvm_vcpu *vcpu;
+
+	if (!system_supports_poe())
+		return false;
+
+	vcpu = ctxt_to_vcpu(ctxt);
+	return kvm_has_feat(kern_hyp_va(vcpu->kvm), ID_AA64MMFR3_EL1, S1POE, IMP);
+}
+
 static inline void __sysreg_save_el1_state(struct kvm_cpu_context *ctxt)
 {
 	ctxt_sys_reg(ctxt, SCTLR_EL1)	= read_sysreg_el1(SYS_SCTLR);
@@ -80,6 +97,9 @@ static inline void __sysreg_save_el1_state(struct kvm_cpu_context *ctxt)
 			ctxt_sys_reg(ctxt, PIR_EL1)	= read_sysreg_el1(SYS_PIR);
 			ctxt_sys_reg(ctxt, PIRE0_EL1)	= read_sysreg_el1(SYS_PIRE0);
 		}
+
+		if (ctxt_has_s1poe(ctxt))
+			ctxt_sys_reg(ctxt, POR_EL1)	= read_sysreg_el1(SYS_POR);
 	}
 	ctxt_sys_reg(ctxt, ESR_EL1)	= read_sysreg_el1(SYS_ESR);
 	ctxt_sys_reg(ctxt, AFSR0_EL1)	= read_sysreg_el1(SYS_AFSR0);
@@ -120,6 +140,10 @@ static inline void __sysreg_save_el2_return_state(struct kvm_cpu_context *ctxt)
 static inline void __sysreg_restore_common_state(struct kvm_cpu_context *ctxt)
 {
 	write_sysreg(ctxt_sys_reg(ctxt, MDSCR_EL1),  mdscr_el1);
+
+	// POR_EL0 can affect uaccess, so must be saved/restored early.
+	if (ctxt_has_s1poe(ctxt))
+		write_sysreg_s(ctxt_sys_reg(ctxt, POR_EL0),	SYS_POR_EL0);
 }
 
 static inline void __sysreg_restore_user_state(struct kvm_cpu_context *ctxt)
@@ -158,6 +182,9 @@ static inline void __sysreg_restore_el1_state(struct kvm_cpu_context *ctxt)
 			write_sysreg_el1(ctxt_sys_reg(ctxt, PIR_EL1),	SYS_PIR);
 			write_sysreg_el1(ctxt_sys_reg(ctxt, PIRE0_EL1),	SYS_PIRE0);
 		}
+
+		if (ctxt_has_s1poe(ctxt))
+			write_sysreg_el1(ctxt_sys_reg(ctxt, POR_EL1),	SYS_POR);
 	}
 	write_sysreg_el1(ctxt_sys_reg(ctxt, ESR_EL1),	SYS_ESR);
 	write_sysreg_el1(ctxt_sys_reg(ctxt, AFSR0_EL1),	SYS_AFSR0);
diff --git arch/arm64/kvm/sys_regs.c arch/arm64/kvm/sys_regs.c
index c90324060436..e7208b59ea12 100644
--- arch/arm64/kvm/sys_regs.c
+++ arch/arm64/kvm/sys_regs.c
@@ -2255,6 +2255,15 @@ static bool access_zcr_el2(struct kvm_vcpu *vcpu,
 	return true;
 }
 
+static unsigned int s1poe_visibility(const struct kvm_vcpu *vcpu,
+				     const struct sys_reg_desc *rd)
+{
+	if (kvm_has_feat(vcpu->kvm, ID_AA64MMFR3_EL1, S1POE, IMP))
+		return 0;
+
+	return REG_HIDDEN;
+}
+
 /*
  * Architected system registers.
  * Important: Must be sorted ascending by Op0, Op1, CRn, CRm, Op2
@@ -2492,6 +2501,8 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	{ SYS_DESC(SYS_MAIR_EL1), access_vm_reg, reset_unknown, MAIR_EL1 },
 	{ SYS_DESC(SYS_PIRE0_EL1), NULL, reset_unknown, PIRE0_EL1 },
 	{ SYS_DESC(SYS_PIR_EL1), NULL, reset_unknown, PIR_EL1 },
+	{ SYS_DESC(SYS_POR_EL1), NULL, reset_unknown, POR_EL1,
+	  .visibility = s1poe_visibility },
 	{ SYS_DESC(SYS_AMAIR_EL1), access_vm_reg, reset_amair_el1, AMAIR_EL1 },
 
 	{ SYS_DESC(SYS_LORSA_EL1), trap_loregion },
@@ -2578,6 +2589,8 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	  .access = access_pmovs, .reg = PMOVSSET_EL0,
 	  .get_user = get_pmreg, .set_user = set_pmreg },
 
+	{ SYS_DESC(SYS_POR_EL0), NULL, reset_unknown, POR_EL0,
+	  .visibility = s1poe_visibility },
 	{ SYS_DESC(SYS_TPIDR_EL0), NULL, reset_unknown, TPIDR_EL0 },
 	{ SYS_DESC(SYS_TPIDRRO_EL0), NULL, reset_unknown, TPIDRRO_EL0 },
 	{ SYS_DESC(SYS_TPIDR2_EL0), undef_access },
@@ -4568,8 +4581,6 @@ void kvm_calculate_traps(struct kvm_vcpu *vcpu)
 	kvm->arch.fgu[HFGxTR_GROUP] = (HFGxTR_EL2_nAMAIR2_EL1		|
 				       HFGxTR_EL2_nMAIR2_EL1		|
 				       HFGxTR_EL2_nS2POR_EL1		|
-				       HFGxTR_EL2_nPOR_EL1		|
-				       HFGxTR_EL2_nPOR_EL0		|
 				       HFGxTR_EL2_nACCDATA_EL1		|
 				       HFGxTR_EL2_nSMPRI_EL1_MASK	|
 				       HFGxTR_EL2_nTPIDR2_EL0_MASK);
@@ -4604,6 +4615,10 @@ void kvm_calculate_traps(struct kvm_vcpu *vcpu)
 		kvm->arch.fgu[HFGxTR_GROUP] |= (HFGxTR_EL2_nPIRE0_EL1 |
 						HFGxTR_EL2_nPIR_EL1);
 
+	if (!kvm_has_feat(kvm, ID_AA64MMFR3_EL1, S1POE, IMP))
+		kvm->arch.fgu[HFGxTR_GROUP] |= (HFGxTR_EL2_nPOR_EL1 |
+						HFGxTR_EL2_nPOR_EL0);
+
 	if (!kvm_has_feat(kvm, ID_AA64PFR0_EL1, AMU, IMP))
 		kvm->arch.fgu[HAFGRTR_GROUP] |= ~(HAFGRTR_EL2_RES0 |
 						  HAFGRTR_EL2_RES1);
-- 
2.25.1


