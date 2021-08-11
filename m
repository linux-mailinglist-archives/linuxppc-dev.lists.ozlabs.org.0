Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78BFA3E957A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Aug 2021 18:04:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GlF4Z1ycsz3dRd
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Aug 2021 02:04:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=jN7MVicx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d;
 helo=mail-pj1-x102d.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=jN7MVicx; dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GlF1w3Djcz3bNk
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Aug 2021 02:01:56 +1000 (AEST)
Received: by mail-pj1-x102d.google.com with SMTP id bo18so4281149pjb.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Aug 2021 09:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1YZJ7rHuqHe3aXhAHGVZUOQS96YsnTQLLJmckgSgdlg=;
 b=jN7MVicxrSnzyMewSFSODXv9XQa7kQQDvLvdwyBU9qMWAlv6UKlADGgYX0Sn8NoCFi
 AOYc6ihoJ2HWFmYe32SXGR9N7Nxz8g8Kes2pP0AxuB16vUQPPgLlgj6WytmCdDXmfHiS
 rmmq+7IcuqLJ0lXkwKcBaFq1AVMBOlxfybS3w/gyvHyRWT/xNAO7vBHt2+y94o5SoJlP
 9bYSo/OjOsCS9uzd98DQIWmWqtaV3RkEE+WJHnRS4O5zlv2fJIvzL2FTKTzrihAXFdd6
 zIJ0RkkXMD10BPfZcr5JCGpkKYvm3jIM+9JKvqbZciRggVMYLH7ryfigFhffdsL8SvXN
 lmLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1YZJ7rHuqHe3aXhAHGVZUOQS96YsnTQLLJmckgSgdlg=;
 b=ZVBBwsNwQWpqwyi1txBtrgGkG45exeaR0yqkEZt/fw0VM9yfTinxWeVyEIERsrVjVJ
 r5g5q4VJwAizXoK9kCcvZaAPzi5cwqQIxPiRC9uu1aZ/v0rw0tBWOCKd0hE//sbBFUJH
 vhBMz/HAOxHFNAGdjNDkF/LIKbFbKnqx6wBNz/x62+PDGJcdsrQwVG8Apl2xDwFWNBfz
 PYU3O4LXus1kYrhEk+wS1bQWdV8tIw9mGZjMQ0YynsOtAwRcKXmjliON2MGGu2GOiMdi
 BYiM3WlCQs8/TrtjkKPoOKKZDbG5M0h7EI/Gqf9SGXPZ3XtsjuOKakJSPr/7FeQOJaWT
 5HSw==
X-Gm-Message-State: AOAM5329Ad/4xlkUPxoSSJ/rhDAFNaISGQ2BR6Qe2+EyEHvm4UEboPVr
 KmCoQORhZwnEhyNVj+dHYhY=
X-Google-Smtp-Source: ABdhPJz21ZSYLB9+E08upEP2Lur+4yuqBOu8Pf5X7IDQtq5I1Uqceg1jDWAn3VKIvBPnOuHWyTujGg==
X-Received: by 2002:a62:2785:0:b029:3c7:c29f:97b0 with SMTP id
 n127-20020a6227850000b02903c7c29f97b0mr27768375pfn.78.1628697714396; 
 Wed, 11 Aug 2021 09:01:54 -0700 (PDT)
Received: from bobo.ibm.com ([118.210.97.79])
 by smtp.gmail.com with ESMTPSA id k19sm6596494pff.28.2021.08.11.09.01.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Aug 2021 09:01:54 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v2 04/60] KVM: PPC: Book3S HV Nested: Fix TM softpatch HFAC
 interrupt emulation
Date: Thu, 12 Aug 2021 02:00:38 +1000
Message-Id: <20210811160134.904987-5-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210811160134.904987-1-npiggin@gmail.com>
References: <20210811160134.904987-1-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Have the TM softpatch emulation code set up the HFAC interrupt and
return -1 in case an instruction was executed with HFSCR bits clear,
and have the interrupt exit handler fall through to the HFAC handler.
When the L0 is running a nested guest, this ensures the HFAC interrupt
is correctly passed up to the L1.

The "direct guest" exit handler will turn these into PROGILL program
interrupts so functionality in practice will be unchanged. But it's
possible an L1 would want to handle these in a different way.

Also rearrange the FAC interrupt emulation code to match the HFAC format
while here (mainly, adding the FSCR_INTR_CAUSE mask).

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/reg.h  |  3 ++-
 arch/powerpc/kvm/book3s_hv.c    | 35 ++++++++++++++++----------
 arch/powerpc/kvm/book3s_hv_tm.c | 44 ++++++++++++++++++---------------
 3 files changed, 48 insertions(+), 34 deletions(-)

diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/reg.h
index be85cf156a1f..e9d27265253b 100644
--- a/arch/powerpc/include/asm/reg.h
+++ b/arch/powerpc/include/asm/reg.h
@@ -415,6 +415,7 @@
 #define   FSCR_TAR	__MASK(FSCR_TAR_LG)
 #define   FSCR_EBB	__MASK(FSCR_EBB_LG)
 #define   FSCR_DSCR	__MASK(FSCR_DSCR_LG)
+#define   FSCR_INTR_CAUSE (ASM_CONST(0xFF) << 56)	/* interrupt cause */
 #define SPRN_HFSCR	0xbe	/* HV=1 Facility Status & Control Register */
 #define   HFSCR_PREFIX	__MASK(FSCR_PREFIX_LG)
 #define   HFSCR_MSGP	__MASK(FSCR_MSGP_LG)
@@ -426,7 +427,7 @@
 #define   HFSCR_DSCR	__MASK(FSCR_DSCR_LG)
 #define   HFSCR_VECVSX	__MASK(FSCR_VECVSX_LG)
 #define   HFSCR_FP	__MASK(FSCR_FP_LG)
-#define   HFSCR_INTR_CAUSE (ASM_CONST(0xFF) << 56)	/* interrupt cause */
+#define   HFSCR_INTR_CAUSE FSCR_INTR_CAUSE
 #define SPRN_TAR	0x32f	/* Target Address Register */
 #define SPRN_LPCR	0x13E	/* LPAR Control Register */
 #define   LPCR_VPM0		ASM_CONST(0x8000000000000000)
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 2afe7a95fc9c..e79eedb65e6b 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -1682,6 +1682,21 @@ XXX benchmark guest exits
 			r = RESUME_GUEST;
 		}
 		break;
+
+#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
+	case BOOK3S_INTERRUPT_HV_SOFTPATCH:
+		/*
+		 * This occurs for various TM-related instructions that
+		 * we need to emulate on POWER9 DD2.2.  We have already
+		 * handled the cases where the guest was in real-suspend
+		 * mode and was transitioning to transactional state.
+		 */
+		r = kvmhv_p9_tm_emulation(vcpu);
+		if (r != -1)
+			break;
+		fallthrough; /* go to facility unavailable handler */
+#endif
+
 	/*
 	 * This occurs if the guest (kernel or userspace), does something that
 	 * is prohibited by HFSCR.
@@ -1700,18 +1715,6 @@ XXX benchmark guest exits
 		}
 		break;
 
-#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
-	case BOOK3S_INTERRUPT_HV_SOFTPATCH:
-		/*
-		 * This occurs for various TM-related instructions that
-		 * we need to emulate on POWER9 DD2.2.  We have already
-		 * handled the cases where the guest was in real-suspend
-		 * mode and was transitioning to transactional state.
-		 */
-		r = kvmhv_p9_tm_emulation(vcpu);
-		break;
-#endif
-
 	case BOOK3S_INTERRUPT_HV_RM_HARD:
 		r = RESUME_PASSTHROUGH;
 		break;
@@ -1814,9 +1817,15 @@ static int kvmppc_handle_nested_exit(struct kvm_vcpu *vcpu)
 		 * mode and was transitioning to transactional state.
 		 */
 		r = kvmhv_p9_tm_emulation(vcpu);
-		break;
+		if (r != -1)
+			break;
+		fallthrough; /* go to facility unavailable handler */
 #endif
 
+	case BOOK3S_INTERRUPT_H_FAC_UNAVAIL:
+		r = RESUME_HOST;
+		break;
+
 	case BOOK3S_INTERRUPT_HV_RM_HARD:
 		vcpu->arch.trap = 0;
 		r = RESUME_GUEST;
diff --git a/arch/powerpc/kvm/book3s_hv_tm.c b/arch/powerpc/kvm/book3s_hv_tm.c
index e7c36f8bf205..866cadd70094 100644
--- a/arch/powerpc/kvm/book3s_hv_tm.c
+++ b/arch/powerpc/kvm/book3s_hv_tm.c
@@ -88,14 +88,15 @@ int kvmhv_p9_tm_emulation(struct kvm_vcpu *vcpu)
 		}
 		/* check EBB facility is available */
 		if (!(vcpu->arch.hfscr & HFSCR_EBB)) {
-			/* generate an illegal instruction interrupt */
-			kvmppc_core_queue_program(vcpu, SRR1_PROGILL);
-			return RESUME_GUEST;
+			vcpu->arch.hfscr &= ~HFSCR_INTR_CAUSE;
+			vcpu->arch.hfscr |= (u64)FSCR_EBB_LG << 56;
+			vcpu->arch.trap = BOOK3S_INTERRUPT_H_FAC_UNAVAIL;
+			return -1; /* rerun host interrupt handler */
 		}
 		if ((msr & MSR_PR) && !(vcpu->arch.fscr & FSCR_EBB)) {
 			/* generate a facility unavailable interrupt */
-			vcpu->arch.fscr = (vcpu->arch.fscr & ~(0xffull << 56)) |
-				((u64)FSCR_EBB_LG << 56);
+			vcpu->arch.fscr &= ~FSCR_INTR_CAUSE;
+			vcpu->arch.fscr |= (u64)FSCR_EBB_LG << 56;
 			kvmppc_book3s_queue_irqprio(vcpu, BOOK3S_INTERRUPT_FAC_UNAVAIL);
 			return RESUME_GUEST;
 		}
@@ -138,14 +139,15 @@ int kvmhv_p9_tm_emulation(struct kvm_vcpu *vcpu)
 		}
 		/* check for TM disabled in the HFSCR or MSR */
 		if (!(vcpu->arch.hfscr & HFSCR_TM)) {
-			/* generate an illegal instruction interrupt */
-			kvmppc_core_queue_program(vcpu, SRR1_PROGILL);
-			return RESUME_GUEST;
+			vcpu->arch.hfscr &= ~HFSCR_INTR_CAUSE;
+			vcpu->arch.hfscr |= (u64)FSCR_TM_LG << 56;
+			vcpu->arch.trap = BOOK3S_INTERRUPT_H_FAC_UNAVAIL;
+			return -1; /* rerun host interrupt handler */
 		}
 		if (!(msr & MSR_TM)) {
 			/* generate a facility unavailable interrupt */
-			vcpu->arch.fscr = (vcpu->arch.fscr & ~(0xffull << 56)) |
-				((u64)FSCR_TM_LG << 56);
+			vcpu->arch.fscr &= ~FSCR_INTR_CAUSE;
+			vcpu->arch.fscr |= (u64)FSCR_TM_LG << 56;
 			kvmppc_book3s_queue_irqprio(vcpu,
 						BOOK3S_INTERRUPT_FAC_UNAVAIL);
 			return RESUME_GUEST;
@@ -169,14 +171,15 @@ int kvmhv_p9_tm_emulation(struct kvm_vcpu *vcpu)
 	case (PPC_INST_TRECLAIM & PO_XOP_OPCODE_MASK):
 		/* check for TM disabled in the HFSCR or MSR */
 		if (!(vcpu->arch.hfscr & HFSCR_TM)) {
-			/* generate an illegal instruction interrupt */
-			kvmppc_core_queue_program(vcpu, SRR1_PROGILL);
-			return RESUME_GUEST;
+			vcpu->arch.hfscr &= ~HFSCR_INTR_CAUSE;
+			vcpu->arch.hfscr |= (u64)FSCR_TM_LG << 56;
+			vcpu->arch.trap = BOOK3S_INTERRUPT_H_FAC_UNAVAIL;
+			return -1; /* rerun host interrupt handler */
 		}
 		if (!(msr & MSR_TM)) {
 			/* generate a facility unavailable interrupt */
-			vcpu->arch.fscr = (vcpu->arch.fscr & ~(0xffull << 56)) |
-				((u64)FSCR_TM_LG << 56);
+			vcpu->arch.fscr &= ~FSCR_INTR_CAUSE;
+			vcpu->arch.fscr |= (u64)FSCR_TM_LG << 56;
 			kvmppc_book3s_queue_irqprio(vcpu,
 						BOOK3S_INTERRUPT_FAC_UNAVAIL);
 			return RESUME_GUEST;
@@ -208,14 +211,15 @@ int kvmhv_p9_tm_emulation(struct kvm_vcpu *vcpu)
 		/* XXX do we need to check for PR=0 here? */
 		/* check for TM disabled in the HFSCR or MSR */
 		if (!(vcpu->arch.hfscr & HFSCR_TM)) {
-			/* generate an illegal instruction interrupt */
-			kvmppc_core_queue_program(vcpu, SRR1_PROGILL);
-			return RESUME_GUEST;
+			vcpu->arch.hfscr &= ~HFSCR_INTR_CAUSE;
+			vcpu->arch.hfscr |= (u64)FSCR_TM_LG << 56;
+			vcpu->arch.trap = BOOK3S_INTERRUPT_H_FAC_UNAVAIL;
+			return -1; /* rerun host interrupt handler */
 		}
 		if (!(msr & MSR_TM)) {
 			/* generate a facility unavailable interrupt */
-			vcpu->arch.fscr = (vcpu->arch.fscr & ~(0xffull << 56)) |
-				((u64)FSCR_TM_LG << 56);
+			vcpu->arch.fscr &= ~FSCR_INTR_CAUSE;
+			vcpu->arch.fscr |= (u64)FSCR_TM_LG << 56;
 			kvmppc_book3s_queue_irqprio(vcpu,
 						BOOK3S_INTERRUPT_FAC_UNAVAIL);
 			return RESUME_GUEST;
-- 
2.23.0

