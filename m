Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 18EA86AFF02
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Mar 2023 07:38:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PWjLL727fz3f5N
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Mar 2023 17:38:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=pnTk4/Gq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PWjJS2dDhz3bhY
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Mar 2023 17:36:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=pnTk4/Gq;
	dkim-atps=neutral
Received: by gandalf.ozlabs.org (Postfix)
	id 4PWjJS25Wtz4xFM; Wed,  8 Mar 2023 17:36:24 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by gandalf.ozlabs.org (Postfix, from userid 1003)
	id 4PWjJS1vqHz4xDq; Wed,  8 Mar 2023 17:36:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
	s=201707; t=1678257384;
	bh=n9I012yV3RIBQ7Uy0VNcPdIQyI03gj8SpBBjx68o6ao=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pnTk4/Gqg0WAShNPxeYrCXCYpeq+fKdm//Ac7dwpWfWz+/Qr90l23A9uynefMUDvF
	 qEN7V4no8QJPvJsUzjJOHY/xIr2oiKwPwoyzoPEZ7bbO9IbEN9ZXeRFhHIFpQxMNkX
	 wBO45N5RcIDPa7ix4qXG9hl5ErvwCY+JTx3YvP59/UQDVNpl2Q1MADWbRBniCFeQMa
	 mEUdFZKyDBrTOIyUmDlbPImDebYOxi/lv0zHb4Pgd2UPPy8PCxOGKqusvivSWLVAVg
	 f7t34G4Lrkoo6NAC6gDalAaFfSImbEFmyYPYxpur82cP0g9+ZdNZ14bzbIpZUtDIOc
	 UoOwjQH9nIYFA==
Date: Wed, 8 Mar 2023 17:36:11 +1100
From: Paul Mackerras <paulus@ozlabs.org>
To: linuxppc-dev@ozlabs.org, kvm@vger.kernel.org
Subject: [PATCH 3/3] powerpc/kvm: Enable prefixed instructions for HV KVM and
 disable for PR KVM
Message-ID: <ZAgs25dCmLrVkBdU@cleo>
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

Now that we can read prefixed instructions from a HV KVM guest and
emulate prefixed load/store instructions to emulated MMIO locations,
we can add HFSCR_PREFIXED into the set of bits that are set in the
HFSCR for a HV KVM guest on POWER10, allowing the guest to use
prefixed instructions.

PR KVM has not yet been extended to handle prefixed instructions in
all situations where we might need to emulate them, so prevent the
guest from enabling prefixed instructions in the FSCR for now.

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
Tested-by: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Paul Mackerras <paulus@ozlabs.org>
---
 arch/powerpc/include/asm/reg.h       | 1 +
 arch/powerpc/kvm/book3s_hv.c         | 9 +++++++--
 arch/powerpc/kvm/book3s_pr.c         | 2 ++
 arch/powerpc/kvm/book3s_rmhandlers.S | 1 +
 4 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/reg.h
index 1e8b2e04e626..7434a3300d84 100644
--- a/arch/powerpc/include/asm/reg.h
+++ b/arch/powerpc/include/asm/reg.h
@@ -417,6 +417,7 @@
 #define   FSCR_DSCR	__MASK(FSCR_DSCR_LG)
 #define   FSCR_INTR_CAUSE (ASM_CONST(0xFF) << 56)	/* interrupt cause */
 #define SPRN_HFSCR	0xbe	/* HV=1 Facility Status & Control Register */
+#define   HFSCR_PREFIX	__MASK(FSCR_PREFIX_LG)
 #define   HFSCR_MSGP	__MASK(FSCR_MSGP_LG)
 #define   HFSCR_TAR	__MASK(FSCR_TAR_LG)
 #define   HFSCR_EBB	__MASK(FSCR_EBB_LG)
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 0d17f4443021..c5b24ab90fb2 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -2921,13 +2921,18 @@ static int kvmppc_core_vcpu_create_hv(struct kvm_vcpu *vcpu)
 
 	/*
 	 * Set the default HFSCR for the guest from the host value.
-	 * This value is only used on POWER9.
-	 * On POWER9, we want to virtualize the doorbell facility, so we
+	 * This value is only used on POWER9 and later.
+	 * On >= POWER9, we want to virtualize the doorbell facility, so we
 	 * don't set the HFSCR_MSGP bit, and that causes those instructions
 	 * to trap and then we emulate them.
 	 */
 	vcpu->arch.hfscr = HFSCR_TAR | HFSCR_EBB | HFSCR_PM | HFSCR_BHRB |
 		HFSCR_DSCR | HFSCR_VECVSX | HFSCR_FP;
+
+	/* On POWER10 and later, allow prefixed instructions */
+	if (cpu_has_feature(CPU_FTR_ARCH_31))
+		vcpu->arch.hfscr |= HFSCR_PREFIX;
+
 	if (cpu_has_feature(CPU_FTR_HVMODE)) {
 		vcpu->arch.hfscr &= mfspr(SPRN_HFSCR);
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
diff --git a/arch/powerpc/kvm/book3s_pr.c b/arch/powerpc/kvm/book3s_pr.c
index 940ab010a471..fa010d92a8d2 100644
--- a/arch/powerpc/kvm/book3s_pr.c
+++ b/arch/powerpc/kvm/book3s_pr.c
@@ -1044,6 +1044,8 @@ void kvmppc_set_fscr(struct kvm_vcpu *vcpu, u64 fscr)
 {
 	if (fscr & FSCR_SCV)
 		fscr &= ~FSCR_SCV; /* SCV must not be enabled */
+	/* Prohibit prefixed instructions for now */
+	fscr &= ~FSCR_PREFIX;
 	if ((vcpu->arch.fscr & FSCR_TAR) && !(fscr & FSCR_TAR)) {
 		/* TAR got dropped, drop it in shadow too */
 		kvmppc_giveup_fac(vcpu, FSCR_TAR_LG);
diff --git a/arch/powerpc/kvm/book3s_rmhandlers.S b/arch/powerpc/kvm/book3s_rmhandlers.S
index 03886ca24498..0a557ffca9fe 100644
--- a/arch/powerpc/kvm/book3s_rmhandlers.S
+++ b/arch/powerpc/kvm/book3s_rmhandlers.S
@@ -123,6 +123,7 @@ INTERRUPT_TRAMPOLINE	BOOK3S_INTERRUPT_ALTIVEC
 kvmppc_handler_skip_ins:
 
 	/* Patch the IP to the next instruction */
+	/* Note that prefixed instructions are disabled in PR KVM for now */
 	mfsrr0	r12
 	addi	r12, r12, 4
 	mtsrr0	r12
-- 
2.37.3

