Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E336A0A0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2019 04:56:58 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45nlRT4C62zDqVK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2019 12:56:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::544; helo=mail-pg1-x544.google.com;
 envelope-from=jniethe5@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="mMbxgWVc"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45nlPc4JpxzDqPB
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2019 12:55:13 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id i8so8644792pgm.13
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jul 2019 19:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ukMNRV3QLXCkcg5EJydHfcMLFLgjwuIeKkkg29Ffa4w=;
 b=mMbxgWVcxzKd5i9Ce2SgQ/K3BxxYHM4cFb72Fts5eFpQqxLoxCCfHUf+g203kxEBFJ
 W+Rb6DVT9+i5x5X2R2nPQHDQnZQcLyp8eLsNizEzUu0uGwFp8ahxDAuAxHkKoGlSrqLE
 X8BOqcVY6rK0sU4MGwiP+fAMrEciADNr/zAv4x2aXDyKf33KJDf/ChtYkaIWImmTEO6h
 nZl5WVxnwTSK81W4AfmVIgMTIIrQ9if9sJPcK3AdhOZF2niNk0uXHGz432nd9nt8TDKj
 UO+ZXZMhJATLBdmggqQt1J14EIYdYwCIOeirwVZ/9RaSAdMDnRM8jWKf57mqPwogsq5Y
 tbHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ukMNRV3QLXCkcg5EJydHfcMLFLgjwuIeKkkg29Ffa4w=;
 b=qmI5S5ME0/lPg/5cQui9dhXWm6JvU6tqApUPC+5AgrqfLVARL4b6yT/tqQddjBzXS1
 DoJbDCaFWw4DwYP/5Hs4yPQ6ahghxYWP3kSkuNWhLMhZtUPOCMBW7R4gDMQquHIv4ym5
 /goXzEoVfq84VnI1MEymMU3ZPV7pT80kAgTGFpc2+XKXZtnWH6S5TzTRFEZXq7UB7S4b
 pylFZiQO2QCiGwfoaJJqRqmjN80+CcOnY1tkeUnOtp+UX17p0KQnMp9yhMZwt9QJlCQG
 2ifo0L+SlRRTCk0QbefX3/BvOaWGPQ2xhDLIhCn+R4uVCwwQ0jI5++cGGDBj22/Bss+Q
 4Esw==
X-Gm-Message-State: APjAAAWiiZQyiTG+PQ0cwblnMeAxDu3nfrowplJgpBEPxYPJKVPz3mF2
 34z5QCMjnBKVHz9HlRcfMNdeHE06FP8=
X-Google-Smtp-Source: APXvYqz0cRJYhv0HI43HuEjehFDOupMdVFFzca0kbny3ESCJ8c/4QQlNXOHY/YerMPNrXZV3ACZYYQ==
X-Received: by 2002:a17:90a:c58e:: with SMTP id
 l14mr32848162pjt.104.1563245709765; 
 Mon, 15 Jul 2019 19:55:09 -0700 (PDT)
Received: from pasglop.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id f17sm16563583pgv.16.2019.07.15.19.55.06
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 19:55:09 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] PPC: Set reserved PCR bits
Date: Tue, 16 Jul 2019 12:54:01 +1000
Message-Id: <20190716025400.4475-1-jniethe5@gmail.com>
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
Cc: mikey@neuling.org, alistair@popple.id.au, sjitindarsingh@gmail.com,
 Jordan Niethe <jniethe5@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently the reserved bits of the Processor Compatibility Register
(PCR) are cleared as per the Programming Note in Section 1.3.3 of the
ISA.  An update is planned for the ISA so that PCR reserved bits should
be set. Set the reserved bits of the PCR as required.

Acked-by: Alistair Popple <alistair@popple.id.au>
Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
 arch/powerpc/include/asm/reg.h          |  3 +++
 arch/powerpc/kernel/cpu_setup_power.S   |  6 ++++++
 arch/powerpc/kernel/dt_cpu_ftrs.c       |  3 ++-
 arch/powerpc/kvm/book3s_hv.c            | 11 +++++++----
 arch/powerpc/kvm/book3s_hv_nested.c     |  6 +++---
 arch/powerpc/kvm/book3s_hv_rmhandlers.S | 10 ++++++----
 6 files changed, 27 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/reg.h
index 10caa145f98b..2e0815994f4d 100644
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
index 0e4c7c1f5c3e..7f2858e3e56a 100644
--- a/arch/powerpc/kernel/dt_cpu_ftrs.c
+++ b/arch/powerpc/kernel/dt_cpu_ftrs.c
@@ -102,7 +102,7 @@ static void __restore_cpu_cpufeatures(void)
 	if (hv_mode) {
 		mtspr(SPRN_LPID, 0);
 		mtspr(SPRN_HFSCR, system_registers.hfscr);
-		mtspr(SPRN_PCR, 0);
+		mtspr(SPRN_PCR, PCR_MASK);
 	}
 	mtspr(SPRN_FSCR, system_registers.fscr);
 
@@ -145,6 +145,7 @@ static void __init cpufeatures_setup_cpu(void)
 		mtspr(SPRN_HFSCR, 0);
 	}
 	mtspr(SPRN_FSCR, 0);
+	mtspr(SPRN_PCR, PCR_MASK);
 
 	/*
 	 * LPCR does not get cleared, to match behaviour with secondaries
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 76b1801aa44a..fb1debaa5a7c 100644
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

