Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A783353AE3
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Apr 2021 03:37:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FDCvh3nNJz3h8y
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Apr 2021 11:37:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=ZVNP/laJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::532;
 helo=mail-pg1-x532.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ZVNP/laJ; dkim-atps=neutral
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FDCYz0MPtz3cV0
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Apr 2021 11:22:14 +1000 (AEST)
Received: by mail-pg1-x532.google.com with SMTP id p12so3153126pgj.10
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 04 Apr 2021 18:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Bgj6ZVQ1/Pl35CJQp9ZmWiGl78cl6oSaKcj2HrE6tyU=;
 b=ZVNP/laJhtVaKvXRjxshoPIdoljBUNtxTvK9sao0rTs9jEpxJ/c62v0of6Xl1psgZC
 IUZg00342UB2oOWeBCEJ9fptDd+2DuUiwKNEXXCA0jHCx2gJ/cULsSyc4qkzAEbT84L9
 Rfm8+cpZwrCxdT2+WtFyn6bOOU72UCvaQzJGPwK4PaWm79EiK4yhtuSeuQvquj2aYT/6
 yo6zzMoq1Zke0Q7FNuvtxzxQAlZS555g6BGlfkNKhmKM6+0J8ifOE1KOdXNww18M5RuY
 fmkFF18xj83mwfWYo9KDBjq5vXfrO0VGTBnEcPLGjLtxYnIjynsVEJNko4bT3unApw9/
 /hyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Bgj6ZVQ1/Pl35CJQp9ZmWiGl78cl6oSaKcj2HrE6tyU=;
 b=iaLu4h5B1m+QF1/kq+NShBeHFICE3W3lOq9/d646vI3O/ljJJSUwLuZk1ec5/jekEM
 r8tW5fqjK1i5BTAcXpanJDDzY0ELLXyXP0uDpVX57DZdUB4pi5bDg0sJF90mO+j/alNn
 a9J22To0085ALQVPPCcY/lYeQCJx4ap/YRZPbYkDOto5/Mo5CUHcsF7zyMQw0tz8gUXK
 vEJrtlM8hWHChH/Tfplydhby1mN2ZZ8S/5HlHqM6grpR5kDP3HgclTknZLuKHPtVJRBh
 0/OW8xVn87Lw8D2UjR+q1ZrXwi4AyGHP2p7KX10hsgF6edEq0cFpyuoyroy2b41eQIap
 iwcA==
X-Gm-Message-State: AOAM530TLf89b0n/FuiTroA1Z8vq7j7tMENunh9QXwGJx0mVAJX2aPCL
 UH7yVzeFedaozmdkuUptYno=
X-Google-Smtp-Source: ABdhPJyuYqDj0Zk+VuhdDqhUapBontLUeX9LzAYDIfH8Y+Y0A1K+GOtpjXIU6nxsdLIsn//5eau/dA==
X-Received: by 2002:a62:7ad6:0:b029:20f:eaee:deed with SMTP id
 v205-20020a627ad60000b029020feaeedeedmr21346691pfc.37.1617585732756; 
 Sun, 04 Apr 2021 18:22:12 -0700 (PDT)
Received: from bobo.ibm.com ([1.132.215.134])
 by smtp.gmail.com with ESMTPSA id e3sm14062536pfm.43.2021.04.04.18.22.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Apr 2021 18:22:12 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v6 39/48] KVM: PPC: Book3S HV: Remove radix guest support from
 P7/8 path
Date: Mon,  5 Apr 2021 11:19:39 +1000
Message-Id: <20210405011948.675354-40-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210405011948.675354-1-npiggin@gmail.com>
References: <20210405011948.675354-1-npiggin@gmail.com>
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
 arch/powerpc/kernel/asm-offsets.c       |   1 -
 arch/powerpc/kvm/book3s_hv_rmhandlers.S | 103 +-----------------------
 2 files changed, 3 insertions(+), 101 deletions(-)

diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
index f3a662201a9f..0da926258ab2 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -551,7 +551,6 @@ int main(void)
 	OFFSET(VCPU_SLB_NR, kvm_vcpu, arch.slb_nr);
 	OFFSET(VCPU_FAULT_DSISR, kvm_vcpu, arch.fault_dsisr);
 	OFFSET(VCPU_FAULT_DAR, kvm_vcpu, arch.fault_dar);
-	OFFSET(VCPU_FAULT_GPA, kvm_vcpu, arch.fault_gpa);
 	OFFSET(VCPU_INTR_MSR, kvm_vcpu, arch.intr_msr);
 	OFFSET(VCPU_LAST_INST, kvm_vcpu, arch.last_inst);
 	OFFSET(VCPU_TRAP, kvm_vcpu, arch.trap);
diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
index 9fd7e9e7fda6..87fa8bda3515 100644
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
@@ -1091,12 +1072,8 @@ BEGIN_FTR_SECTION
 	mtspr	SPRN_HDSISR, r0
 END_FTR_SECTION_IFSET(CPU_FTR_ARCH_300)
 
-	ld	r6, VCPU_KVM(r4)
-	lbz	r7, KVM_SECURE_GUEST(r6)
-	cmpdi	r7, 0
 	ld	r6, VCPU_GPR(R6)(r4)
 	ld	r7, VCPU_GPR(R7)(r4)
-	bne	ret_to_ultra
 
 	ld	r0, VCPU_CR(r4)
 	mtcr	r0
@@ -1107,26 +1084,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_ARCH_300)
 	ld	r4, VCPU_GPR(R4)(r4)
 	HRFI_TO_GUEST
 	b	.
-/*
- * Use UV_RETURN ultracall to return control back to the Ultravisor after
- * processing an hypercall or interrupt that was forwarded (a.k.a. reflected)
- * to the Hypervisor.
- *
- * All registers have already been loaded, except:
- *   R0 = hcall result
- *   R2 = SRR1, so UV can detect a synthesized interrupt (if any)
- *   R3 = UV_RETURN
- */
-ret_to_ultra:
-	ld	r0, VCPU_CR(r4)
-	mtcr	r0
-
-	ld	r0, VCPU_GPR(R3)(r4)
-	mfspr	r2, SPRN_SRR1
-	li	r3, 0
-	ori	r3, r3, UV_RETURN
-	ld	r4, VCPU_GPR(R4)(r4)
-	sc	2
 
 secondary_too_late:
 	li	r12, 0
@@ -1389,11 +1346,7 @@ guest_exit_cont:		/* r9 = vcpu, r12 = trap, r13 = paca */
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
@@ -1432,23 +1385,6 @@ END_MMU_FTR_SECTION_IFSET(MMU_FTR_TYPE_RADIX)
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
@@ -1694,24 +1630,6 @@ BEGIN_FTR_SECTION
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
@@ -1970,8 +1888,6 @@ kvmppc_tm_emul:
  * reflect the HDSI to the guest as a DSI.
  */
 kvmppc_hdsi:
-	ld	r3, VCPU_KVM(r9)
-	lbz	r0, KVM_RADIX(r3)
 	mfspr	r4, SPRN_HDAR
 	mfspr	r6, SPRN_HDSISR
 BEGIN_FTR_SECTION
@@ -1979,8 +1895,6 @@ BEGIN_FTR_SECTION
 	cmpdi	r6, 0x7fff
 	beq	6f
 END_FTR_SECTION_IFSET(CPU_FTR_ARCH_300)
-	cmpwi	r0, 0
-	bne	.Lradix_hdsi		/* on radix, just save DAR/DSISR/ASDR */
 	/* HPTE not found fault or protection fault? */
 	andis.	r0, r6, (DSISR_NOHPTE | DSISR_PROTFAULT)@h
 	beq	1f			/* if not, send it to the guest */
@@ -2057,23 +1971,11 @@ fast_interrupt_c_return:
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
@@ -3217,15 +3119,16 @@ BEGIN_FTR_SECTION
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

