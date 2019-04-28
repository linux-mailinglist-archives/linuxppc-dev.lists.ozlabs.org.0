Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 75315B5EB
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Apr 2019 13:49:30 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44sR0S06NmzDqdR
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Apr 2019 21:49:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::544; helo=mail-pg1-x544.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="YK42zMuw"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44sQw81psKzDqTd
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Apr 2019 21:45:44 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id p6so3801510pgh.9
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Apr 2019 04:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d7f8FKFN9V09H9BsdFy+OL88WIiGWWEvYn92DfFrXPI=;
 b=YK42zMuwfeDi9ApQViNl7jVlTmT1Ste4nKho2xsPBCU9jHQQq/tAJxtHrW0pERcpvg
 Uub3Vclz3zCKkGvuTJ9OyOJ3sPp7jaCcbsGfUu+kUzs0tpBMHa3bbaB+Bq4UoPV34mNC
 CphvmY1gHSJQ2BaXFsc9elZKtxyzlx5kxsfxkeDOh4gEU41KN0tIoeIJgEyNxjGjSgfd
 5Fk2zWgVrH2++k/CsLapa8jUC1CYTzoHxcqC1C6bfzG3qoOAo72VuP6CzdaOECRyFPjg
 NFeEvrhiGA6hwW7ney1VB119D4A0D6uvTGRPKBj6aTfh4T1o2ATMSD8FxpA1xmjut7Np
 4FIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d7f8FKFN9V09H9BsdFy+OL88WIiGWWEvYn92DfFrXPI=;
 b=eUNFkZhuI4mWHG66Sh2zKVkytcT4EQNukMFoy3N6SNJRRS1lHBN7QJMcJ9506QqvPU
 iEwpE96Rpz7BV+Mi9NnkBWoOOEOMML45QK+lECt9Nsrw7jJFdNZjc8AcDr/tSjvRQdzG
 yLXw0J0UXrxZCvPUgd3SUJLjWPwcQAwB7aVyJ+SRD3P8o+I8aVogZE/m49vrlGHCA0Jr
 Fg8N44pKV6RyTdJUDfW+18+87NCeDUxZ8KrwkjTSr49do5/oL/eGfFlnhsTChX6y5L4j
 Hngua3lZEHTrx7S/hkvoNir0hs2l66DTV6euXsTDIUKE+WRmp32qPsTOII/jwcB4tSkc
 bQLg==
X-Gm-Message-State: APjAAAWn860tu0XaFP7nGBrFvOee+2NDf5vZq06OPxSlyXdTHf8iG3Tf
 N3GBbEl9ZRfDhdgpjmAexRMwcuNL
X-Google-Smtp-Source: APXvYqwzb1ST8DhDAFOuwnVSOKR+x76IA564UWF4XepT8pNPy0JVOhkx9GxL9PuwsgZD4jMkTObvpQ==
X-Received: by 2002:a62:e414:: with SMTP id r20mr21393765pfh.143.1556451941578; 
 Sun, 28 Apr 2019 04:45:41 -0700 (PDT)
Received: from bobo.local0.net ([203.63.161.26])
 by smtp.gmail.com with ESMTPSA id m12sm8154892pff.6.2019.04.28.04.45.38
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 28 Apr 2019 04:45:41 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v10 2/2] powerpc/64s: KVM update for reimplement book3s idle
 code in C
Date: Sun, 28 Apr 2019 21:45:15 +1000
Message-Id: <20190428114515.32683-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190428114515.32683-1-npiggin@gmail.com>
References: <20190428114515.32683-1-npiggin@gmail.com>
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
Cc: "Gautham R . Shenoy" <ego@linux.vnet.ibm.com>, kvm-ppc@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is the KVM update to the new idle code. A few improvements:

- Idle sleepers now always return to caller rather than branch out
  to KVM first.
- This allows optimisations like very fast return to caller when no
  state has been lost.
- KVM no longer requires nap_state_lost because it controls NVGPR
  save/restore itself on the way in and out.
- The heavy idle wakeup KVM request check can be moved out of the
  normal host idle code and into the not-performance-critical offline
  code.
- KVM nap code now returns from where it is called, which makes the
  flow a bit easier to follow.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/paca.h         |   1 -
 arch/powerpc/kernel/asm-offsets.c       |   1 -
 arch/powerpc/kernel/exceptions-64s.S    |  14 ++-
 arch/powerpc/kernel/idle_book3s.S       |  22 -----
 arch/powerpc/kvm/book3s_hv_rmhandlers.S | 118 ++++++++++++++----------
 arch/powerpc/platforms/powernv/idle.c   |  15 +++
 arch/powerpc/xmon/xmon.c                |   3 -
 7 files changed, 92 insertions(+), 82 deletions(-)

diff --git a/arch/powerpc/include/asm/paca.h b/arch/powerpc/include/asm/paca.h
index e55dedd7ee3e..245d11a71784 100644
--- a/arch/powerpc/include/asm/paca.h
+++ b/arch/powerpc/include/asm/paca.h
@@ -174,7 +174,6 @@ struct paca_struct {
 	u8 io_sync;			/* writel() needs spin_unlock sync */
 	u8 irq_work_pending;		/* IRQ_WORK interrupt while soft-disable */
 #ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
-	u8 nap_state_lost;		/* NV GPR values lost in power7_idle */
 	u8 pmcregs_in_use;		/* pseries puts this in lppaca */
 #endif
 	u64 sprg_vdso;			/* Saved user-visible sprg */
diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
index a14a77bc4243..8e02444e9d3d 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -271,7 +271,6 @@ int main(void)
 	OFFSET(ACCOUNT_USER_TIME, paca_struct, accounting.utime);
 	OFFSET(ACCOUNT_SYSTEM_TIME, paca_struct, accounting.stime);
 	OFFSET(PACA_TRAP_SAVE, paca_struct, trap_save);
-	OFFSET(PACA_NAPSTATELOST, paca_struct, nap_state_lost);
 	OFFSET(PACA_SPRG_VDSO, paca_struct, sprg_vdso);
 #else /* CONFIG_PPC64 */
 #ifdef CONFIG_VIRT_CPU_ACCOUNTING_NATIVE
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 671c256da167..6b86055e5251 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -122,6 +122,8 @@ EXC_VIRT_NONE(0x4000, 0x100)
 	rlwinm.	r10,r10,47-31,30,31 ;					\
 	beq-	1f ;							\
 	cmpwi	cr1,r10,2 ;						\
+	mfspr	r3,SPRN_SRR1 ;						\
+	bltlr	cr1 ;	/* no state loss, return to idle caller */	\
 	BRANCH_TO_C000(r10, system_reset_idle_common) ;			\
 1:									\
 	KVMTEST_PR(n) ;							\
@@ -145,12 +147,10 @@ TRAMP_KVM(PACA_EXNMI, 0x100)
 
 #ifdef CONFIG_PPC_P7_NAP
 EXC_COMMON_BEGIN(system_reset_idle_common)
-	mfspr	r3,SPRN_SRR1
-#ifndef CONFIG_KVM_BOOK3S_HV_POSSIBLE
-	/* this bltlr could  be moved before the branch_to, and the
-	 * branch_to could maybe go straight to idle_return */
-	bltlr	cr1	/* no state loss, return to idle caller */
-#endif
+	/*
+	 * This must be a direct branch (without linker branch stub) because
+	 * we can not use TOC at this point as r2 may not be restored yet.
+	 */
 	b	idle_return_gpr_loss
 #endif
 
@@ -443,9 +443,7 @@ EXC_COMMON_BEGIN(machine_check_idle_common)
 	mtlr	r4
 	rlwinm	r10,r3,47-31,30,31
 	cmpwi	cr1,r10,2
-#ifndef CONFIG_KVM_BOOK3S_HV_POSSIBLE
 	bltlr	cr1	/* no state loss, return to idle caller */
-#endif
 	b	idle_return_gpr_loss
 #endif
 	/*
diff --git a/arch/powerpc/kernel/idle_book3s.S b/arch/powerpc/kernel/idle_book3s.S
index 0fb2eb731a29..2dfbd5d5b932 100644
--- a/arch/powerpc/kernel/idle_book3s.S
+++ b/arch/powerpc/kernel/idle_book3s.S
@@ -19,9 +19,6 @@
 #include <asm/asm-offsets.h>
 #include <asm/ppc-opcode.h>
 #include <asm/cpuidle.h>
-#ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
-#include <asm/kvm_book3s_asm.h>
-#endif
 
 /*
  * Desired PSSCR in r3
@@ -93,25 +90,6 @@ _GLOBAL(isa300_idle_stop_mayloss)
  * a simple blr instead).
  */
 _GLOBAL(idle_return_gpr_loss)
-#ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
-	lbz	r0,HSTATE_HWTHREAD_STATE(r13)
-	cmpwi	r0,KVM_HWTHREAD_IN_KERNEL
-	beq	0f
-	li	r0,KVM_HWTHREAD_IN_KERNEL
-	stb	r0,HSTATE_HWTHREAD_STATE(r13)
-	/* Order setting hwthread_state vs. testing hwthread_req */
-	sync
-0:	lbz	r0,HSTATE_HWTHREAD_REQ(r13)
-	cmpwi	r0,0
-	beq	1f
-	b	kvm_start_guest
-1:
-	lbz	r0,PACA_NAPSTATELOST(r13)
-	cmpwi	r0,0
-	bne	2f
-	bltlr	cr1
-2:
-#endif
 	ld	r1,PACAR1(r13)
 	ld	r4,-8*19(r1)
 	ld	r5,-8*20(r1)
diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
index 58d0f1ba845d..f66191d8f841 100644
--- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
+++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
@@ -35,6 +35,7 @@
 #include <asm/thread_info.h>
 #include <asm/asm-compat.h>
 #include <asm/feature-fixups.h>
+#include <asm/cpuidle.h>
 
 /* Sign-extend HDEC if not on POWER9 */
 #define EXTEND_HDEC(reg)			\
@@ -45,6 +46,7 @@ END_FTR_SECTION_IFCLR(CPU_FTR_ARCH_300)
 /* Values in HSTATE_NAPPING(r13) */
 #define NAPPING_CEDE	1
 #define NAPPING_NOVCPU	2
+#define NAPPING_UNSPLIT	3
 
 /* Stack frame offsets for kvmppc_hv_entry */
 #define SFS			208
@@ -290,17 +292,19 @@ kvm_novcpu_exit:
 	b	kvmhv_switch_to_host
 
 /*
- * We come in here when wakened from nap mode.
- * Relocation is off and most register values are lost.
- * r13 points to the PACA.
+ * We come in here when wakened from Linux offline idle code.
+ * Relocation is off
  * r3 contains the SRR1 wakeup value, SRR1 is trashed.
  */
-	.globl	kvm_start_guest
-kvm_start_guest:
-	/* Set runlatch bit the minute you wake up from nap */
-	mfspr	r0, SPRN_CTRLF
-	ori 	r0, r0, 1
-	mtspr	SPRN_CTRLT, r0
+_GLOBAL(idle_kvm_start_guest)
+	ld	r4,PACAEMERGSP(r13)
+	mfcr	r5
+	mflr	r0
+	std	r1,0(r4)
+	std	r5,8(r4)
+	std	r0,16(r4)
+	subi	r1,r4,STACK_FRAME_OVERHEAD
+	SAVE_NVGPRS(r1)
 
 	/*
 	 * Could avoid this and pass it through in r3. For now,
@@ -308,27 +312,23 @@ kvm_start_guest:
 	 */
 	mtspr	SPRN_SRR1,r3
 
-	ld	r2,PACATOC(r13)
-
 	li	r0,0
 	stb	r0,PACA_FTRACE_ENABLED(r13)
 
 	li	r0,KVM_HWTHREAD_IN_KVM
 	stb	r0,HSTATE_HWTHREAD_STATE(r13)
 
-	/* NV GPR values from power7_idle() will no longer be valid */
-	li	r0,1
-	stb	r0,PACA_NAPSTATELOST(r13)
-
-	/* were we napping due to cede? */
+	/* kvm cede / napping does not come through here */
 	lbz	r0,HSTATE_NAPPING(r13)
-	cmpwi	r0,NAPPING_CEDE
-	beq	kvm_end_cede
-	cmpwi	r0,NAPPING_NOVCPU
-	beq	kvm_novcpu_wakeup
+	twnei	r0,0
+
+	b	1f
 
-	ld	r1,PACAEMERGSP(r13)
-	subi	r1,r1,STACK_FRAME_OVERHEAD
+kvm_unsplit_wakeup:
+	li	r0, 0
+	stb	r0, HSTATE_NAPPING(r13)
+
+1:
 
 	/*
 	 * We weren't napping due to cede, so this must be a secondary
@@ -437,21 +437,25 @@ kvm_no_guest:
 	lbz	r3, HSTATE_HWTHREAD_REQ(r13)
 	cmpwi	r3, 0
 	bne	54f
-/*
- * We jump to pnv_wakeup_loss, which will return to the caller
- * of power7_nap in the powernv cpu offline loop.  The value we
- * put in r3 becomes the return value for power7_nap. pnv_wakeup_loss
- * requires SRR1 in r12.
- */
+
+	/*
+	 * Jump to idle_return_gpr_loss, which returns to the
+	 * idle_kvm_start_guest caller.
+	 */
 	li	r3, LPCR_PECE0
 	mfspr	r4, SPRN_LPCR
 	rlwimi	r4, r3, 0, LPCR_PECE0 | LPCR_PECE1
 	mtspr	SPRN_LPCR, r4
-	li	r3, 0
-	/* set up cr3 and r3 for return */
-	cmpdi	cr3, r3, 0
+	/* set up r3 for return */
 	mfspr	r3,SPRN_SRR1
-	b	idle_return_gpr_loss
+	REST_NVGPRS(r1)
+	addi	r1, r1, STACK_FRAME_OVERHEAD
+	ld	r0, 16(r1)
+	ld	r5, 8(r1)
+	ld	r1, 0(r1)
+	mtlr	r0
+	mtcr	r5
+	blr
 
 53:	HMT_LOW
 	ld	r5, HSTATE_KVM_VCORE(r13)
@@ -536,6 +540,8 @@ END_FTR_SECTION_IFSET(CPU_FTR_ARCH_207S)
 	lbz	r0, KVM_SPLIT_DO_NAP(r3)
 	cmpwi	r0, 0
 	beq	57f
+	li	r3, NAPPING_UNSPLIT
+	stb	r3, HSTATE_NAPPING(r13)
 	li	r3, (LPCR_PECEDH | LPCR_PECE0) >> 4
 	mfspr	r5, SPRN_LPCR
 	rlwimi	r5, r3, 4, (LPCR_PECEDP | LPCR_PECEDH | LPCR_PECE0 | LPCR_PECE1)
@@ -2656,6 +2662,9 @@ END_FTR_SECTION_IFSET(CPU_FTR_ARCH_300)
 
 	lis	r3, LPCR_PECEDP@h	/* Do wake on privileged doorbell */
 
+	/* Go back to host stack */
+	ld	r1, HSTATE_HOST_R1(r13)
+
 	/*
 	 * Take a nap until a decrementer or external or doobell interrupt
 	 * occurs, with PECE1 and PECE0 set in LPCR.
@@ -2684,26 +2693,42 @@ BEGIN_FTR_SECTION
 	 *		requested level = 0 (just stop dispatching)
 	 */
 	lis	r3, (PSSCR_EC | PSSCR_ESL)@h
-	mtspr	SPRN_PSSCR, r3
 	/* Set LPCR_PECE_HVEE bit to enable wakeup by HV interrupts */
 	li	r4, LPCR_PECE_HVEE@higher
 	sldi	r4, r4, 32
 	or	r5, r5, r4
-END_FTR_SECTION_IFSET(CPU_FTR_ARCH_300)
+FTR_SECTION_ELSE
+	li	r3, PNV_THREAD_NAP
+ALT_FTR_SECTION_END_IFSET(CPU_FTR_ARCH_300)
 	mtspr	SPRN_LPCR,r5
 	isync
-	li	r0, 0
-	std	r0, HSTATE_SCRATCH0(r13)
-	ptesync
-	ld	r0, HSTATE_SCRATCH0(r13)
-1:	cmpd	r0, r0
-	bne	1b
+
 BEGIN_FTR_SECTION
-	nap
+	bl	isa300_idle_stop_mayloss
 FTR_SECTION_ELSE
-	PPC_STOP
-ALT_FTR_SECTION_END_IFCLR(CPU_FTR_ARCH_300)
-	b	.
+	bl	isa206_idle_insn_mayloss
+ALT_FTR_SECTION_END_IFSET(CPU_FTR_ARCH_300)
+
+	mfspr	r0, SPRN_CTRLF
+	ori	r0, r0, 1
+	mtspr	SPRN_CTRLT, r0
+
+	mtspr	SPRN_SRR1, r3
+
+	li	r0, 0
+	stb	r0, PACA_FTRACE_ENABLED(r13)
+
+	li	r0, KVM_HWTHREAD_IN_KVM
+	stb	r0, HSTATE_HWTHREAD_STATE(r13)
+
+	lbz	r0, HSTATE_NAPPING(r13)
+	cmpwi	r0, NAPPING_CEDE
+	beq	kvm_end_cede
+	cmpwi	r0, NAPPING_NOVCPU
+	beq	kvm_novcpu_wakeup
+	cmpwi	r0, NAPPING_UNSPLIT
+	beq	kvm_unsplit_wakeup
+	twi	31,0,0 /* Nap state must not be zero */
 
 33:	mr	r4, r3
 	li	r3, 0
@@ -2711,12 +2736,11 @@ ALT_FTR_SECTION_END_IFCLR(CPU_FTR_ARCH_300)
 	b	34f
 
 kvm_end_cede:
+	/* Woken by external or decrementer interrupt */
+
 	/* get vcpu pointer */
 	ld	r4, HSTATE_KVM_VCPU(r13)
 
-	/* Woken by external or decrementer interrupt */
-	ld	r1, HSTATE_HOST_R1(r13)
-
 #ifdef CONFIG_KVM_BOOK3S_HV_EXIT_TIMING
 	addi	r3, r4, VCPU_TB_RMINTR
 	bl	kvmhv_accumulate_time
diff --git a/arch/powerpc/platforms/powernv/idle.c b/arch/powerpc/platforms/powernv/idle.c
index 182112fd845a..c9133f7908ca 100644
--- a/arch/powerpc/platforms/powernv/idle.c
+++ b/arch/powerpc/platforms/powernv/idle.c
@@ -505,6 +505,8 @@ static unsigned long power7_idle_insn(unsigned long type)
 	return srr1;
 }
 
+extern unsigned long idle_kvm_start_guest(unsigned long srr1);
+
 #ifdef CONFIG_HOTPLUG_CPU
 static unsigned long power7_offline(void)
 {
@@ -536,6 +538,14 @@ static unsigned long power7_offline(void)
 	srr1 = power7_idle_insn(power7_offline_type);
 	__ppc64_runlatch_on();
 
+#ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
+	local_paca->kvm_hstate.hwthread_state = KVM_HWTHREAD_IN_KERNEL;
+	/* Order setting hwthread_state vs. testing hwthread_req */
+	smp_mb();
+	if (local_paca->kvm_hstate.hwthread_req)
+		srr1 = idle_kvm_start_guest(srr1);
+#endif
+
 	mtmsr(MSR_KERNEL);
 
 	return srr1;
@@ -823,6 +833,11 @@ static unsigned long power9_offline_stop(unsigned long psscr)
 	srr1 = power9_idle_stop(psscr, false);
 	__ppc64_runlatch_on();
 
+	local_paca->kvm_hstate.hwthread_state = KVM_HWTHREAD_IN_KERNEL;
+	/* Order setting hwthread_state vs. testing hwthread_req */
+	smp_mb();
+	if (local_paca->kvm_hstate.hwthread_req)
+		srr1 = idle_kvm_start_guest(srr1);
 	mtmsr(MSR_KERNEL);
 #endif
 
diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index 77197110e900..e583ed3f6b93 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -2431,9 +2431,6 @@ static void dump_one_paca(int cpu)
 	DUMP(p, irq_happened, "%#-*x");
 	DUMP(p, io_sync, "%#-*x");
 	DUMP(p, irq_work_pending, "%#-*x");
-#ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
-	DUMP(p, nap_state_lost, "%#-*x");
-#endif
 	DUMP(p, sprg_vdso, "%#-*llx");
 
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
-- 
2.20.1

