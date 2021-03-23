Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C1A3454E2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 02:20:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F4D7m69LBz3dd5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 12:20:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=cYqJs2vy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::536;
 helo=mail-pg1-x536.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=cYqJs2vy; dkim-atps=neutral
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F4CpF6slHz3c8W
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 12:05:09 +1100 (AEDT)
Received: by mail-pg1-x536.google.com with SMTP id l1so10027322pgb.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Mar 2021 18:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r47G5cn1oaGPrrKik2Ywyme7L9rzbfB2t/Rvv5lOwEQ=;
 b=cYqJs2vyeboIor0OFwVYe3LrpjbLH68lpL/4Oy8QJlYaKko83CjdG+RrzflBPKPb9H
 TTJMssRco/dewrHgGzZvwdR/q7VnCgXLAwUYDvYN1utrhWLzQ2rRzQW+sM/0kqFmzmsT
 pm1d8Vqre4+yWd12PQ/lNKHDj40a1SsyNsopsUqcf5Tt5aiS60gXRMAjvvIft2AGAXXa
 +Q5r1EpyGimak7bvFGxolPDZyplEewimixgVwEe8dQ8rQL+YLbrwVVht6XCelDUOdu75
 zu7ltHUWgnlbQfLrWeG5QhaP6vZG/tlWVoAAYLgfq9a5waWOSoggNmaSe/FCRok6lID6
 ngYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r47G5cn1oaGPrrKik2Ywyme7L9rzbfB2t/Rvv5lOwEQ=;
 b=gAsX/9ERiCOjhnt1rh3Ij4sth1CXkPOMFMJKmGIYAA3DpomOy87BJp8DtRCQPOl39g
 8VTBr7oaep/a2RZl1xoH038uSS+n6YETEM9xbpBLtUna6Dj2PIz0I2GLycFVYBM9hxFn
 EAJtXzVcbTfwCx3DEHzR6rQ9Fk3rC/iEN4iMl3pl3z1KPOkBlFy92bqeBYSvHDRYY+Zc
 qSZw+2dFHZ1SXBCr84/Ii4LHcTs2gQ4kU+KaXOw29OP0OmHz+OXH8Bulx5KCpzkM1dAw
 pC2jgquTlTRz0K105aOh+DWurqHuHxO+7EUyCPigR+51mpHd/LOkTAX4Ag6pWDTUc17H
 GeBA==
X-Gm-Message-State: AOAM533FispGO6ISmR89c1v/tcuRShK1Nm1MFcbU3LpZCqbKOyx2eZ/w
 C4s0qNkVefsGjLY/IsMHeBs=
X-Google-Smtp-Source: ABdhPJyjUlacnG7Pm4mHipcF8tls+H6RCZXYxJWxMDeOnXTnU+2EJYtHkVegu0rWvs8LOzgO82UO7g==
X-Received: by 2002:a63:5361:: with SMTP id t33mr1784118pgl.439.1616461507603; 
 Mon, 22 Mar 2021 18:05:07 -0700 (PDT)
Received: from bobo.ibm.com ([58.84.78.96])
 by smtp.gmail.com with ESMTPSA id e7sm14491894pfc.88.2021.03.22.18.05.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 18:05:07 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v4 38/46] KVM: PPC: Book3S HV: Remove radix guest support from
 P7/8 path
Date: Tue, 23 Mar 2021 11:02:57 +1000
Message-Id: <20210323010305.1045293-39-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210323010305.1045293-1-npiggin@gmail.com>
References: <20210323010305.1045293-1-npiggin@gmail.com>
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

The P9 path now runs all supported radix guest combinations, so
remove radix guest support from the P7/8 path.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv_rmhandlers.S | 79 +------------------------
 1 file changed, 3 insertions(+), 76 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
index 61f71a7df238..b1f3ee16fd84 100644
--- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
+++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
@@ -133,15 +133,6 @@ END_FTR_SECTION_IFCLR(CPU_FTR_ARCH_207S)
 	/* Return the trap number on this thread as the return value */
 	mr	r3, r12
 
-	/*
-	 * If we came back from the guest via a relocation-on interrupt,
-	 * we will be in virtual mode at this point, which makes it a
-	 * little easier to get back to the caller.
-	 */
-	mfmsr	r0
-	andi.	r0, r0, MSR_IR		/* in real mode? */
-	bne	.Lvirt_return
-
 	/* RFI into the highmem handler */
 	mfmsr	r6
 	li	r0, MSR_RI
@@ -151,11 +142,6 @@ END_FTR_SECTION_IFCLR(CPU_FTR_ARCH_207S)
 	mtsrr1	r7
 	RFI_TO_KERNEL
 
-	/* Virtual-mode return */
-.Lvirt_return:
-	mtlr	r8
-	blr
-
 kvmppc_primary_no_guest:
 	/* We handle this much like a ceded vcpu */
 	/* put the HDEC into the DEC, since HDEC interrupts don't wake us */
@@ -899,11 +885,6 @@ ALT_FTR_SECTION_END_IFCLR(CPU_FTR_ARCH_300)
 	cmpdi	r3, 512		/* 1 microsecond */
 	blt	hdec_soon
 
-	ld	r6, VCPU_KVM(r4)
-	lbz	r0, KVM_RADIX(r6)
-	cmpwi	r0, 0
-	bne	9f
-
 	/* For hash guest, clear out and reload the SLB */
 BEGIN_MMU_FTR_SECTION
 	/* Radix host won't have populated the SLB, so no need to clear */
@@ -1389,11 +1370,7 @@ guest_exit_cont:		/* r9 = vcpu, r12 = trap, r13 = paca */
 	patch_site 1b patch__call_kvm_flush_link_stack
 
 	/* For hash guest, read the guest SLB and save it away */
-	ld	r5, VCPU_KVM(r9)
-	lbz	r0, KVM_RADIX(r5)
 	li	r5, 0
-	cmpwi	r0, 0
-	bne	0f			/* for radix, save 0 entries */
 	lwz	r0,VCPU_SLB_NR(r9)	/* number of entries in SLB */
 	mtctr	r0
 	li	r6,0
@@ -1432,23 +1409,6 @@ END_MMU_FTR_SECTION_IFSET(MMU_FTR_TYPE_RADIX)
 	slbmte	r6,r5
 1:	addi	r8,r8,16
 	.endr
-	b	guest_bypass
-
-0:	/*
-	 * Malicious or buggy radix guests may have inserted SLB entries
-	 * (only 0..3 because radix always runs with UPRT=1), so these must
-	 * be cleared here to avoid side-channels. slbmte is used rather
-	 * than slbia, as it won't clear cached translations.
-	 */
-	li	r0,0
-	stw	r0,VCPU_SLB_MAX(r9)
-	slbmte	r0,r0
-	li	r4,1
-	slbmte	r0,r4
-	li	r4,2
-	slbmte	r0,r4
-	li	r4,3
-	slbmte	r0,r4
 
 guest_bypass:
 	stw	r12, STACK_SLOT_TRAP(r1)
@@ -1694,24 +1654,6 @@ BEGIN_FTR_SECTION
 	mtspr	SPRN_PID, r7
 END_FTR_SECTION_IFSET(CPU_FTR_ARCH_300)
 
-#ifdef CONFIG_PPC_RADIX_MMU
-	/*
-	 * Are we running hash or radix ?
-	 */
-	ld	r5, VCPU_KVM(r9)
-	lbz	r0, KVM_RADIX(r5)
-	cmpwi	cr2, r0, 0
-	beq	cr2, 2f
-
-	/*
-	 * Radix: do eieio; tlbsync; ptesync sequence in case we
-	 * interrupted the guest between a tlbie and a ptesync.
-	 */
-	eieio
-	tlbsync
-	ptesync
-#endif /* CONFIG_PPC_RADIX_MMU */
-
 	/*
 	 * cp_abort is required if the processor supports local copy-paste
 	 * to clear the copy buffer that was under control of the guest.
@@ -1970,8 +1912,6 @@ kvmppc_tm_emul:
  * reflect the HDSI to the guest as a DSI.
  */
 kvmppc_hdsi:
-	ld	r3, VCPU_KVM(r9)
-	lbz	r0, KVM_RADIX(r3)
 	mfspr	r4, SPRN_HDAR
 	mfspr	r6, SPRN_HDSISR
 BEGIN_FTR_SECTION
@@ -1979,8 +1919,6 @@ BEGIN_FTR_SECTION
 	cmpdi	r6, 0x7fff
 	beq	6f
 END_FTR_SECTION_IFSET(CPU_FTR_ARCH_300)
-	cmpwi	r0, 0
-	bne	.Lradix_hdsi		/* on radix, just save DAR/DSISR/ASDR */
 	/* HPTE not found fault or protection fault? */
 	andis.	r0, r6, (DSISR_NOHPTE | DSISR_PROTFAULT)@h
 	beq	1f			/* if not, send it to the guest */
@@ -2057,23 +1995,11 @@ fast_interrupt_c_return:
 	stb	r0, HSTATE_IN_GUEST(r13)
 	b	guest_exit_cont
 
-.Lradix_hdsi:
-	std	r4, VCPU_FAULT_DAR(r9)
-	stw	r6, VCPU_FAULT_DSISR(r9)
-.Lradix_hisi:
-	mfspr	r5, SPRN_ASDR
-	std	r5, VCPU_FAULT_GPA(r9)
-	b	guest_exit_cont
-
 /*
  * Similarly for an HISI, reflect it to the guest as an ISI unless
  * it is an HPTE not found fault for a page that we have paged out.
  */
 kvmppc_hisi:
-	ld	r3, VCPU_KVM(r9)
-	lbz	r0, KVM_RADIX(r3)
-	cmpwi	r0, 0
-	bne	.Lradix_hisi		/* for radix, just save ASDR */
 	andis.	r0, r11, SRR1_ISI_NOPT@h
 	beq	1f
 	andi.	r0, r11, MSR_IR		/* instruction relocation enabled? */
@@ -3217,15 +3143,16 @@ BEGIN_FTR_SECTION
 	mtspr	SPRN_DAWRX1, r0
 END_FTR_SECTION_IFSET(CPU_FTR_DAWR1)
 
-	/* Clear hash and radix guest SLB. */
+	/* Clear guest SLB. */
 	slbmte	r0, r0
 	PPC_SLBIA(6)
+	ptesync
 
 BEGIN_MMU_FTR_SECTION
 	b	4f
 END_MMU_FTR_SECTION_IFSET(MMU_FTR_TYPE_RADIX)
 
-	ptesync
+	/* load host SLB entries */
 	ld	r8, PACA_SLBSHADOWPTR(r13)
 	.rept	SLB_NUM_BOLTED
 	li	r3, SLBSHADOW_SAVEAREA
-- 
2.23.0

