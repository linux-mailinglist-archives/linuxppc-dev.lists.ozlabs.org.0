Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A20393FB9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 May 2021 11:18:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FrzdN1JLYz3d4V
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 May 2021 19:18:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=agLt0+Jw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42b;
 helo=mail-pf1-x42b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=agLt0+Jw; dkim-atps=neutral
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FrzQ40vZ5z3019
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 May 2021 19:08:59 +1000 (AEST)
Received: by mail-pf1-x42b.google.com with SMTP id d16so2732982pfn.12
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 May 2021 02:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Cdem97n2JgDG+pSuYlO1upx+iOqmx1MkVAKC6RPUAD8=;
 b=agLt0+JwOiwlWEymSjnkTDm47mavQ46vBrtYrUmO/2OgLyTpr9sQB6uoboiu1DBmgg
 8Yu1Yj/TdhVuWcHL5t0RNodx/E4XRR8qpiSJmUDVZy0jmS0UgBJxUvB5mVfmGhsQSkwr
 oojksaZebjRqxadtgwTzjpZm5NJNBGkWNFhL4AsKxtdkAe526vMD/jXyG+nvu/3tXfIp
 5qiiAc/ohVPMb0Ww7dVQfATm9hU8Li/qquq4rOVv95VIL0t4W/e0pbbRk6/jauPNBxqZ
 U3TDIipLkK5VZHev7O6dNpd4pgVVaqYUNh2eI1bmyZY4Ykyz3rob5WiVnB+Uam6Mn7Cg
 U2WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Cdem97n2JgDG+pSuYlO1upx+iOqmx1MkVAKC6RPUAD8=;
 b=t5TeeH2jAWbTURbkfkPphnE+Qs00oO90cvPQl/AwApU+08ged9m6ksDV4gcQhWtLEm
 UQd5J3TwzHh8KdtnA/Vs6JR/gdposZAit7+Alrqd7dHnwURrE8gTqSnE/Slhp/Y6AjhI
 Ea9OzA7O0nkEFFLJf4ExlqVznUsee+uFpS7i6phPIJKA8xatt/ztoKpmuQfWNU+D0BPE
 wbR3AQgiYbZUK7FIz3GYG4HGExC4TCTFuSvM8gpUy2+H4tOEjEn2c+9DQS7WGQmBpFf+
 NWqPCUPtQq08wM3/SqcPk8ExYnYz4DDNXE+yPufD2oz+To1nhfB3DChWg4vt1qUGijWx
 Oqkg==
X-Gm-Message-State: AOAM5318MdLa9C92Yt9zgzg8gSFhgtW6oPnXPeCLE9CZDpkHB6Yhe/Bf
 QpwfkBHm3lgHqA2/zUqrmQg0asG1BWc=
X-Google-Smtp-Source: ABdhPJxurOW1kcwvQLiqjAgtcq+fZ+o163se9IG+T2Awbj74pZJfsOhGmfqaV4LgK//bzO5qxeLupg==
X-Received: by 2002:a63:1149:: with SMTP id 9mr8048945pgr.156.1622192937629;
 Fri, 28 May 2021 02:08:57 -0700 (PDT)
Received: from bobo.ibm.com (124-169-110-219.tpgi.com.au. [124.169.110.219])
 by smtp.gmail.com with ESMTPSA id a2sm3624183pfv.156.2021.05.28.02.08.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 May 2021 02:08:57 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v7 23/32] KVM: PPC: Book3S HV: Remove radix guest support from
 P7/8 path
Date: Fri, 28 May 2021 19:07:43 +1000
Message-Id: <20210528090752.3542186-24-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210528090752.3542186-1-npiggin@gmail.com>
References: <20210528090752.3542186-1-npiggin@gmail.com>
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
index 28af4efb4587..aa267d173ded 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -534,7 +534,6 @@ int main(void)
 	OFFSET(VCPU_SLB_NR, kvm_vcpu, arch.slb_nr);
 	OFFSET(VCPU_FAULT_DSISR, kvm_vcpu, arch.fault_dsisr);
 	OFFSET(VCPU_FAULT_DAR, kvm_vcpu, arch.fault_dar);
-	OFFSET(VCPU_FAULT_GPA, kvm_vcpu, arch.fault_gpa);
 	OFFSET(VCPU_INTR_MSR, kvm_vcpu, arch.intr_msr);
 	OFFSET(VCPU_LAST_INST, kvm_vcpu, arch.last_inst);
 	OFFSET(VCPU_TRAP, kvm_vcpu, arch.trap);
diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
index 3b8fd4bd2419..bf441b9b03cb 100644
--- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
+++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
@@ -134,15 +134,6 @@ END_FTR_SECTION_IFCLR(CPU_FTR_ARCH_207S)
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
@@ -152,11 +143,6 @@ END_FTR_SECTION_IFCLR(CPU_FTR_ARCH_207S)
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
@@ -902,11 +888,6 @@ ALT_FTR_SECTION_END_IFCLR(CPU_FTR_ARCH_300)
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
@@ -1094,12 +1075,8 @@ BEGIN_FTR_SECTION
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
@@ -1110,26 +1087,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_ARCH_300)
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
@@ -1392,11 +1349,7 @@ guest_exit_cont:		/* r9 = vcpu, r12 = trap, r13 = paca */
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
@@ -1435,23 +1388,6 @@ END_MMU_FTR_SECTION_IFSET(MMU_FTR_TYPE_RADIX)
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
@@ -1701,24 +1637,6 @@ BEGIN_FTR_SECTION
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
@@ -1977,8 +1895,6 @@ kvmppc_tm_emul:
  * reflect the HDSI to the guest as a DSI.
  */
 kvmppc_hdsi:
-	ld	r3, VCPU_KVM(r9)
-	lbz	r0, KVM_RADIX(r3)
 	mfspr	r4, SPRN_HDAR
 	mfspr	r6, SPRN_HDSISR
 BEGIN_FTR_SECTION
@@ -1986,8 +1902,6 @@ BEGIN_FTR_SECTION
 	cmpdi	r6, 0x7fff
 	beq	6f
 END_FTR_SECTION_IFSET(CPU_FTR_ARCH_300)
-	cmpwi	r0, 0
-	bne	.Lradix_hdsi		/* on radix, just save DAR/DSISR/ASDR */
 	/* HPTE not found fault or protection fault? */
 	andis.	r0, r6, (DSISR_NOHPTE | DSISR_PROTFAULT)@h
 	beq	1f			/* if not, send it to the guest */
@@ -2064,23 +1978,11 @@ fast_interrupt_c_return:
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
@@ -3224,15 +3126,16 @@ BEGIN_FTR_SECTION
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

