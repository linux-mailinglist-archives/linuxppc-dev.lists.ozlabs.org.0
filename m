Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2393D51C7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jul 2021 05:52:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GY5bB4Xd3z3d5V
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jul 2021 13:52:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=tk8mYaUi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62a;
 helo=mail-pl1-x62a.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=tk8mYaUi; dkim-atps=neutral
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GY5Yl49NRz2yyt
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Jul 2021 13:50:51 +1000 (AEST)
Received: by mail-pl1-x62a.google.com with SMTP id d17so9977768plh.10
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Jul 2021 20:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ket7QMZuBWxOmfOxsVbiAMFMn9xvu4czvT5FGDl8BRI=;
 b=tk8mYaUiuS2WgrsvDLlxUf3uNzG7n+tMTnZtUPlZzIqnKan+EuRoG8y8MhyxN1kp7J
 yw+fh+ZLtulxewv7YU3IrL7XOXAHukXPPn0GSDq1MFqTSmF+/23P3iJLoFD1kljLhAaH
 zqhLgKOVo3sNU9atzMLyO6TqnhzhF4JiQoqS0aqO0QPLH5MLcLmdLs4eoP08uI0vMbMM
 is/W1sTZ2nmfMXcmh3k+QxWKcdKYPErskyBPieLdkiVgxelVEXydO4H+/x090H+oapgX
 QhqNlnN7oVDipxq0pIktDg1a+EeBd+TAPJYHJErx4w4CUnkNdvpvx10Rv86wbOgWQlJt
 /hLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ket7QMZuBWxOmfOxsVbiAMFMn9xvu4czvT5FGDl8BRI=;
 b=EuH6mxhJiwgoD0EMaYna2dRCbiXj9/1lRk2PiaJS2j1SkdRcoBgJWxSJ41Zvh7N0it
 IqzmUh+GMTHJtG/sKQRVqX2Wby4CVGrrBXlRizUIJcfMwvYi7z/WrYJlUYhPbSOM5Jpd
 3vJwTve6Pm2HmweKPViibC9GOcKmYagyqwKSP5Py6SM6EG+oICrDOvXIinhHX4Bp1u+v
 KQhKUUSlDFzzPcD7vK53/G5dIsKHjA/moCUlm5PcnuRYbn2zF6s0rc9OoSxeCrE7YDLa
 fYEER/n9QkFqTH7eAht3iEPwPgR58jIXe747X6A00XdfvUN3moZMSB9eq8fsFPH7MOE7
 T2tA==
X-Gm-Message-State: AOAM530VWNIk+bc9+VKtCm5F3Ae66NM3RO7HsHIJ4hUZCE4PdA9+iq86
 rwNGDJSzsKmIkLORrmOjt2jc0l4wzN4=
X-Google-Smtp-Source: ABdhPJxMi0/9rRanoDPnX92J5xw0CAnQIrAxWn8MrZ3Hyt72Pz3vf9LWo8mIdoLlv5OicHw96GcgVw==
X-Received: by 2002:a17:90b:3844:: with SMTP id
 nl4mr23777654pjb.78.1627271449014; 
 Sun, 25 Jul 2021 20:50:49 -0700 (PDT)
Received: from bobo.ibm.com (220-244-190-123.tpgi.com.au. [220.244.190.123])
 by smtp.gmail.com with ESMTPSA id p33sm41140341pfw.40.2021.07.25.20.50.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jul 2021 20:50:48 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v1 02/55] KVM: PPC: Book3S HV P9: Fixes for TM softpatch
 interrupt
Date: Mon, 26 Jul 2021 13:49:43 +1000
Message-Id: <20210726035036.739609-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210726035036.739609-1-npiggin@gmail.com>
References: <20210726035036.739609-1-npiggin@gmail.com>
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

The softpatch interrupt sets HSRR0 to the faulting instruction +4, so
it should subtract 4 for the faulting instruction address. Also have it
emulate and deliver HFAC interrupts correctly, which is important for
nested HV and facility demand-faulting in future.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/reg.h  |  3 +-
 arch/powerpc/kvm/book3s_hv.c    | 35 ++++++++++++--------
 arch/powerpc/kvm/book3s_hv_tm.c | 57 +++++++++++++++++++++------------
 3 files changed, 61 insertions(+), 34 deletions(-)

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
index ce7ff12cfc03..adac1a6431a0 100644
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
index cc90b8b82329..e4fd4a9dee08 100644
--- a/arch/powerpc/kvm/book3s_hv_tm.c
+++ b/arch/powerpc/kvm/book3s_hv_tm.c
@@ -74,19 +74,23 @@ int kvmhv_p9_tm_emulation(struct kvm_vcpu *vcpu)
 	case PPC_INST_RFEBB:
 		if ((msr & MSR_PR) && (vcpu->arch.vcore->pcr & PCR_ARCH_206)) {
 			/* generate an illegal instruction interrupt */
+			vcpu->arch.regs.nip -= 4;
 			kvmppc_core_queue_program(vcpu, SRR1_PROGILL);
 			return RESUME_GUEST;
 		}
 		/* check EBB facility is available */
 		if (!(vcpu->arch.hfscr & HFSCR_EBB)) {
-			/* generate an illegal instruction interrupt */
-			kvmppc_core_queue_program(vcpu, SRR1_PROGILL);
-			return RESUME_GUEST;
+			vcpu->arch.regs.nip -= 4;
+			vcpu->arch.hfscr &= ~HFSCR_INTR_CAUSE;
+			vcpu->arch.hfscr |= (u64)FSCR_EBB_LG << 56;
+			vcpu->arch.trap = BOOK3S_INTERRUPT_H_FAC_UNAVAIL;
+			return -1; /* rerun host interrupt handler */
 		}
 		if ((msr & MSR_PR) && !(vcpu->arch.fscr & FSCR_EBB)) {
 			/* generate a facility unavailable interrupt */
-			vcpu->arch.fscr = (vcpu->arch.fscr & ~(0xffull << 56)) |
-				((u64)FSCR_EBB_LG << 56);
+			vcpu->arch.regs.nip -= 4;
+			vcpu->arch.fscr &= ~FSCR_INTR_CAUSE;
+			vcpu->arch.fscr |= (u64)FSCR_EBB_LG << 56;
 			kvmppc_book3s_queue_irqprio(vcpu, BOOK3S_INTERRUPT_FAC_UNAVAIL);
 			return RESUME_GUEST;
 		}
@@ -123,19 +127,23 @@ int kvmhv_p9_tm_emulation(struct kvm_vcpu *vcpu)
 		/* check for PR=1 and arch 2.06 bit set in PCR */
 		if ((msr & MSR_PR) && (vcpu->arch.vcore->pcr & PCR_ARCH_206)) {
 			/* generate an illegal instruction interrupt */
+			vcpu->arch.regs.nip -= 4;
 			kvmppc_core_queue_program(vcpu, SRR1_PROGILL);
 			return RESUME_GUEST;
 		}
 		/* check for TM disabled in the HFSCR or MSR */
 		if (!(vcpu->arch.hfscr & HFSCR_TM)) {
-			/* generate an illegal instruction interrupt */
-			kvmppc_core_queue_program(vcpu, SRR1_PROGILL);
-			return RESUME_GUEST;
+			vcpu->arch.regs.nip -= 4;
+			vcpu->arch.hfscr &= ~HFSCR_INTR_CAUSE;
+			vcpu->arch.hfscr |= (u64)FSCR_TM_LG << 56;
+			vcpu->arch.trap = BOOK3S_INTERRUPT_H_FAC_UNAVAIL;
+			return -1; /* rerun host interrupt handler */
 		}
 		if (!(msr & MSR_TM)) {
 			/* generate a facility unavailable interrupt */
-			vcpu->arch.fscr = (vcpu->arch.fscr & ~(0xffull << 56)) |
-				((u64)FSCR_TM_LG << 56);
+			vcpu->arch.regs.nip -= 4;
+			vcpu->arch.fscr &= ~FSCR_INTR_CAUSE;
+			vcpu->arch.fscr |= (u64)FSCR_TM_LG << 56;
 			kvmppc_book3s_queue_irqprio(vcpu,
 						BOOK3S_INTERRUPT_FAC_UNAVAIL);
 			return RESUME_GUEST;
@@ -158,20 +166,24 @@ int kvmhv_p9_tm_emulation(struct kvm_vcpu *vcpu)
 	case (PPC_INST_TRECLAIM & PO_XOP_OPCODE_MASK):
 		/* check for TM disabled in the HFSCR or MSR */
 		if (!(vcpu->arch.hfscr & HFSCR_TM)) {
-			/* generate an illegal instruction interrupt */
-			kvmppc_core_queue_program(vcpu, SRR1_PROGILL);
-			return RESUME_GUEST;
+			vcpu->arch.regs.nip -= 4;
+			vcpu->arch.hfscr &= ~HFSCR_INTR_CAUSE;
+			vcpu->arch.hfscr |= (u64)FSCR_TM_LG << 56;
+			vcpu->arch.trap = BOOK3S_INTERRUPT_H_FAC_UNAVAIL;
+			return -1; /* rerun host interrupt handler */
 		}
 		if (!(msr & MSR_TM)) {
 			/* generate a facility unavailable interrupt */
-			vcpu->arch.fscr = (vcpu->arch.fscr & ~(0xffull << 56)) |
-				((u64)FSCR_TM_LG << 56);
+			vcpu->arch.regs.nip -= 4;
+			vcpu->arch.fscr &= ~FSCR_INTR_CAUSE;
+			vcpu->arch.fscr |= (u64)FSCR_TM_LG << 56;
 			kvmppc_book3s_queue_irqprio(vcpu,
 						BOOK3S_INTERRUPT_FAC_UNAVAIL);
 			return RESUME_GUEST;
 		}
 		/* If no transaction active, generate TM bad thing */
 		if (!MSR_TM_ACTIVE(msr)) {
+			vcpu->arch.regs.nip -= 4;
 			kvmppc_core_queue_program(vcpu, SRR1_PROGTM);
 			return RESUME_GUEST;
 		}
@@ -196,20 +208,24 @@ int kvmhv_p9_tm_emulation(struct kvm_vcpu *vcpu)
 		/* XXX do we need to check for PR=0 here? */
 		/* check for TM disabled in the HFSCR or MSR */
 		if (!(vcpu->arch.hfscr & HFSCR_TM)) {
-			/* generate an illegal instruction interrupt */
-			kvmppc_core_queue_program(vcpu, SRR1_PROGILL);
-			return RESUME_GUEST;
+			vcpu->arch.regs.nip -= 4;
+			vcpu->arch.hfscr &= ~HFSCR_INTR_CAUSE;
+			vcpu->arch.hfscr |= (u64)FSCR_TM_LG << 56;
+			vcpu->arch.trap = BOOK3S_INTERRUPT_H_FAC_UNAVAIL;
+			return -1; /* rerun host interrupt handler */
 		}
 		if (!(msr & MSR_TM)) {
 			/* generate a facility unavailable interrupt */
-			vcpu->arch.fscr = (vcpu->arch.fscr & ~(0xffull << 56)) |
-				((u64)FSCR_TM_LG << 56);
+			vcpu->arch.regs.nip -= 4;
+			vcpu->arch.fscr &= ~FSCR_INTR_CAUSE;
+			vcpu->arch.fscr |= (u64)FSCR_TM_LG << 56;
 			kvmppc_book3s_queue_irqprio(vcpu,
 						BOOK3S_INTERRUPT_FAC_UNAVAIL);
 			return RESUME_GUEST;
 		}
 		/* If transaction active or TEXASR[FS] = 0, bad thing */
 		if (MSR_TM_ACTIVE(msr) || !(vcpu->arch.texasr & TEXASR_FS)) {
+			vcpu->arch.regs.nip -= 4;
 			kvmppc_core_queue_program(vcpu, SRR1_PROGTM);
 			return RESUME_GUEST;
 		}
@@ -224,6 +240,7 @@ int kvmhv_p9_tm_emulation(struct kvm_vcpu *vcpu)
 	}
 
 	/* What should we do here? We didn't recognize the instruction */
+	vcpu->arch.regs.nip -= 4;
 	kvmppc_core_queue_program(vcpu, SRR1_PROGILL);
 	pr_warn_ratelimited("Unrecognized TM-related instruction %#x for emulation", instr);
 
-- 
2.23.0

