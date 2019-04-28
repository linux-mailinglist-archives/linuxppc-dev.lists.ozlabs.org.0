Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED7FB5EA
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Apr 2019 13:48:19 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44sQz51279zDqcq
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Apr 2019 21:48:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::642; helo=mail-pl1-x642.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="K/fekBBk"; 
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44sQw64MFWzDqTd
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Apr 2019 21:45:42 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id l2so975426plt.11
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Apr 2019 04:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5yFxqTaEjO1MnOZj2ckKdkWVMA4BN220BFqgMzRxz20=;
 b=K/fekBBkkbBEb1bCDp3VRNjgs5qtXxiBQuxI9aspADXUFEpKpI+Sud7nPuc4KqzAw4
 hR4JcEhhoqXeHVxhhC8I+Z04VmvHyIJoE2BfUTMb6K+CKf9HgfibGQao9SIsYyD/9Bq8
 4ROvvbTQC5rikxxhKctUPI03TJlnycwuE/HTgUbBQWOTVB4AKVlTXAgG0Iw3c4M/j8Ht
 9PAi9I8UqL2vgpiPvtI5z5zwXFWai/9htIJ/UPonF9zes6psaxj9O9gHSAL1iEOldj4S
 wAc0eEREIoVHEH3ZShuFScmPeJr06iYsBDg6lMIeoFbpEhSHIIl40HDwew3mzdVAU1/5
 s6sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5yFxqTaEjO1MnOZj2ckKdkWVMA4BN220BFqgMzRxz20=;
 b=oRqIA06VLZ+3OIJJjVVS8ShO6EVHMZIKx0+8ITqPiS2r+DY20+PJRy3kfDjL8mIXzt
 kF+ogRfs1Lrr9ZXXRVHC/gkPb/NG/wX8ToQWzKfEoG4xsNlGURQEAMo890kVtSIusXul
 4uZkdQSy62ZQFPAwjBW3ycigQ9vaP7ZPOPfViTSKGziS3LUCG6dZ8N0Y5SUlc0u0Kzck
 xFkXt/HudoS1/EJYLfj1LePmjDXlIEmU7TSZZ07/s0GpyBVpNPvhua0M62ewDDIKEPyS
 XFrE8FuiZNvYNqIQ6WjoZv5Mo8f7m/+QHP9mvfh+Aku71TyIcg9Mjv9e4Bun7PZHpo8+
 bq4w==
X-Gm-Message-State: APjAAAUnyyZdMIS10i4ARzWUlTBVeRjGk5QtcuSBTsUXJ0Y1XOGLrH/2
 JIC31IeJ58c7+Im2DinalWQVe3xC
X-Google-Smtp-Source: APXvYqx0nmaqU9zSEXSUbAwKVy38Sg8aeOtACcuf+56owYvyNSDsVO1RWLXzwGcl0MQ6csWPT6/SPQ==
X-Received: by 2002:a17:902:7c01:: with SMTP id
 x1mr21608890pll.299.1556451938474; 
 Sun, 28 Apr 2019 04:45:38 -0700 (PDT)
Received: from bobo.local0.net ([203.63.161.26])
 by smtp.gmail.com with ESMTPSA id m12sm8154892pff.6.2019.04.28.04.45.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 28 Apr 2019 04:45:37 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v10 1/2] powerpc/64s: reimplement book3s idle code in C
Date: Sun, 28 Apr 2019 21:45:14 +1000
Message-Id: <20190428114515.32683-2-npiggin@gmail.com>
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

Reimplement Book3S idle code in C, moving POWER7/8/9 implementation
speific HV idle code to the powernv platform code.

Book3S assembly stubs are kept in common code and used only to save
the stack frame and non-volatile GPRs before executing architected
idle instructions, and restoring the stack and reloading GPRs then
returning to C after waking from idle.

The complex logic dealing with threads and subcores, locking, SPRs,
HMIs, timebase resync, etc., is all done in C which makes it more
maintainable.

This is not a strict 1:1 translation to C code, there are some
significant differences:

- Idle wakeup no longer uses the ->cpu_restore call to reinit SPRs,
  but saves and restores them itself.

- The optimisation where EC=ESL=0 idle modes did not have to save GPRs
  or change MSR is restored, because it's now simple to do. ESL=1
  sleeps that do not lose GPRs can use this optimization too.

- KVM secondary entry and cede is now more of a call/return style
  rather than branchy. nap_state_lost is not required because KVM
  always returns via NVGPR restoring path.

- KVM secondary wakeup from offline sequence is moved entirely into
  the offline wakeup, which avoids a hwsync in the normal idle wakeup
  path.

Performance measured with context switch ping-pong on different
threads or cores, is possibly improved a small amount, 1-3% depending
on stop state and core vs thread test for shallow states. Deep states
it's in the noise compared with other latencies.

Reviewed-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Notes:
- I've broken the KVM code into the second patch just for review. The
  first patch makes KVM kind-of work with its existing design in the
  new idle code.

  The problem is the kvm_start_guest case branches out from the low
  level asm, which now no longer fixes up SPRs. Guests will somewhat
  run with deep idle states disabled for offline.

  Rather than a significant rework of the code to make old-KVM work
  with new-idle code that would need testing and review and then gets
  undone by the next patch, I have just broken it up like this for
  hopefully easier review of the KVM parts. Patches can be squashed
  together before upstream merge.

- P9 restores some of the PMU SPRs, but not others, and P8 only zeroes
  them. There are improvmets to be made to SPR save restore policies and
  documentation, but this first pass tries to keep things as they were.
  More work likely needs to be done here.

Left to do:
- Test actual POWER7 hardware. Will check about that tomorrow.

Since v9:
- Fix ELFv1 build error.
- Port to powerpc next.
- Test POWER8 and POWER9 online/offline
- Test POWER8 and POWER9 KVM guests with threads, combinations of MMU
  modes in guest and host, indep threads mode, etc.
---
 arch/powerpc/include/asm/cpuidle.h       |   19 +-
 arch/powerpc/include/asm/paca.h          |   41 +-
 arch/powerpc/include/asm/processor.h     |    9 +-
 arch/powerpc/include/asm/reg.h           |    8 +-
 arch/powerpc/kernel/asm-offsets.c        |   17 -
 arch/powerpc/kernel/exceptions-64s.S     |   25 +-
 arch/powerpc/kernel/idle_book3s.S        | 1097 +++-------------------
 arch/powerpc/kernel/setup-common.c       |    4 +-
 arch/powerpc/kvm/book3s_hv_rmhandlers.S  |    6 +-
 arch/powerpc/platforms/powernv/idle.c    |  887 +++++++++++++----
 arch/powerpc/platforms/powernv/subcore.c |    2 +-
 arch/powerpc/xmon/xmon.c                 |   25 +-
 12 files changed, 941 insertions(+), 1199 deletions(-)

diff --git a/arch/powerpc/include/asm/cpuidle.h b/arch/powerpc/include/asm/cpuidle.h
index 43e5f31fe64d..9844b3ded187 100644
--- a/arch/powerpc/include/asm/cpuidle.h
+++ b/arch/powerpc/include/asm/cpuidle.h
@@ -27,10 +27,11 @@
  * the THREAD_WINKLE_BITS are set, which indicate which threads have not
  * yet woken from the winkle state.
  */
-#define PNV_CORE_IDLE_LOCK_BIT			0x10000000
+#define NR_PNV_CORE_IDLE_LOCK_BIT		28
+#define PNV_CORE_IDLE_LOCK_BIT			(1ULL << NR_PNV_CORE_IDLE_LOCK_BIT)
 
+#define PNV_CORE_IDLE_WINKLE_COUNT_SHIFT	16
 #define PNV_CORE_IDLE_WINKLE_COUNT		0x00010000
-#define PNV_CORE_IDLE_WINKLE_COUNT_ALL_BIT	0x00080000
 #define PNV_CORE_IDLE_WINKLE_COUNT_BITS		0x000F0000
 #define PNV_CORE_IDLE_THREAD_WINKLE_BITS_SHIFT	8
 #define PNV_CORE_IDLE_THREAD_WINKLE_BITS	0x0000FF00
@@ -68,16 +69,6 @@
 #define ERR_DEEP_STATE_ESL_MISMATCH	-2
 
 #ifndef __ASSEMBLY__
-/* Additional SPRs that need to be saved/restored during stop */
-struct stop_sprs {
-	u64 pid;
-	u64 ldbar;
-	u64 fscr;
-	u64 hfscr;
-	u64 mmcr1;
-	u64 mmcr2;
-	u64 mmcra;
-};
 
 #define PNV_IDLE_NAME_LEN    16
 struct pnv_idle_states_t {
@@ -92,10 +83,6 @@ struct pnv_idle_states_t {
 
 extern struct pnv_idle_states_t *pnv_idle_states;
 extern int nr_pnv_idle_states;
-extern u32 pnv_fastsleep_workaround_at_entry[];
-extern u32 pnv_fastsleep_workaround_at_exit[];
-
-extern u64 pnv_first_deep_stop_state;
 
 unsigned long pnv_cpu_offline(unsigned int cpu);
 int validate_psscr_val_mask(u64 *psscr_val, u64 *psscr_mask, u32 flags);
diff --git a/arch/powerpc/include/asm/paca.h b/arch/powerpc/include/asm/paca.h
index e843bc5d1a0f..e55dedd7ee3e 100644
--- a/arch/powerpc/include/asm/paca.h
+++ b/arch/powerpc/include/asm/paca.h
@@ -173,8 +173,8 @@ struct paca_struct {
 	u8 irq_happened;		/* irq happened while soft-disabled */
 	u8 io_sync;			/* writel() needs spin_unlock sync */
 	u8 irq_work_pending;		/* IRQ_WORK interrupt while soft-disable */
-	u8 nap_state_lost;		/* NV GPR values lost in power7_idle */
 #ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
+	u8 nap_state_lost;		/* NV GPR values lost in power7_idle */
 	u8 pmcregs_in_use;		/* pseries puts this in lppaca */
 #endif
 	u64 sprg_vdso;			/* Saved user-visible sprg */
@@ -183,23 +183,28 @@ struct paca_struct {
 #endif
 
 #ifdef CONFIG_PPC_POWERNV
-	/* Per-core mask tracking idle threads and a lock bit-[L][TTTTTTTT] */
-	u32 *core_idle_state_ptr;
-	u8 thread_idle_state;		/* PNV_THREAD_RUNNING/NAP/SLEEP	*/
-	/* Mask to indicate thread id in core */
-	u8 thread_mask;
-	/* Mask to denote subcore sibling threads */
-	u8 subcore_sibling_mask;
-	/* Flag to request this thread not to stop */
-	atomic_t dont_stop;
-	/* The PSSCR value that the kernel requested before going to stop */
-	u64 requested_psscr;
-
-	/*
-	 * Save area for additional SPRs that need to be
-	 * saved/restored during cpuidle stop.
-	 */
-	struct stop_sprs stop_sprs;
+	/* PowerNV idle fields */
+	/* PNV_CORE_IDLE_* bits, all siblings work on thread 0 paca */
+	unsigned long idle_state;
+	union {
+		/* P7/P8 specific fields */
+		struct {
+			/* PNV_THREAD_RUNNING/NAP/SLEEP	*/
+			u8 thread_idle_state;
+			/* Mask to denote subcore sibling threads */
+			u8 subcore_sibling_mask;
+		};
+
+		/* P9 specific fields */
+		struct {
+#ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
+			/* The PSSCR value that the kernel requested before going to stop */
+			u64 requested_psscr;
+			/* Flag to request this thread not to stop */
+			atomic_t dont_stop;
+#endif
+		};
+	};
 #endif
 
 #ifdef CONFIG_PPC_BOOK3S_64
diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include/asm/processor.h
index 540949b397d4..706ac5df546f 100644
--- a/arch/powerpc/include/asm/processor.h
+++ b/arch/powerpc/include/asm/processor.h
@@ -414,14 +414,17 @@ static inline unsigned long get_clean_sp(unsigned long sp, int is_32)
 }
 #endif
 
+/* asm stubs */
+extern unsigned long isa300_idle_stop_noloss(unsigned long psscr_val);
+extern unsigned long isa300_idle_stop_mayloss(unsigned long psscr_val);
+extern unsigned long isa206_idle_insn_mayloss(unsigned long type);
+
 extern unsigned long cpuidle_disable;
 enum idle_boot_override {IDLE_NO_OVERRIDE = 0, IDLE_POWERSAVE_OFF};
 
 extern int powersave_nap;	/* set if nap mode can be used in idle loop */
-extern unsigned long power7_idle_insn(unsigned long type); /* PNV_THREAD_NAP/etc*/
+
 extern void power7_idle_type(unsigned long type);
-extern unsigned long power9_idle_stop(unsigned long psscr_val);
-extern unsigned long power9_offline_stop(unsigned long psscr_val);
 extern void power9_idle_type(unsigned long stop_psscr_val,
 			      unsigned long stop_psscr_mask);
 
diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/reg.h
index c5b2aff0ce8e..10caa145f98b 100644
--- a/arch/powerpc/include/asm/reg.h
+++ b/arch/powerpc/include/asm/reg.h
@@ -168,6 +168,7 @@
 #define PSSCR_ESL		0x00200000 /* Enable State Loss */
 #define PSSCR_SD		0x00400000 /* Status Disable */
 #define PSSCR_PLS	0xf000000000000000 /* Power-saving Level Status */
+#define PSSCR_PLS_SHIFT	60
 #define PSSCR_GUEST_VIS	0xf0000000000003ffUL /* Guest-visible PSSCR fields */
 #define PSSCR_FAKE_SUSPEND	0x00000400 /* Fake-suspend bit (P9 DD2.2) */
 #define PSSCR_FAKE_SUSPEND_LG	10	   /* Fake-suspend bit position */
@@ -758,10 +759,9 @@
 #define	  SRR1_WAKERESET	0x00100000 /* System reset */
 #define   SRR1_WAKEHDBELL	0x000c0000 /* Hypervisor doorbell on P8 */
 #define	  SRR1_WAKESTATE	0x00030000 /* Powersave exit mask [46:47] */
-#define	  SRR1_WS_DEEPEST	0x00030000 /* Some resources not maintained,
-					  * may not be recoverable */
-#define	  SRR1_WS_DEEPER	0x00020000 /* Some resources not maintained */
-#define	  SRR1_WS_DEEP		0x00010000 /* All resources maintained */
+#define	  SRR1_WS_HVLOSS	0x00030000 /* HV resources not maintained */
+#define	  SRR1_WS_GPRLOSS	0x00020000 /* GPRs not maintained */
+#define	  SRR1_WS_NOLOSS	0x00010000 /* All resources maintained */
 #define   SRR1_PROGTM		0x00200000 /* TM Bad Thing */
 #define   SRR1_PROGFPE		0x00100000 /* Floating Point Enabled */
 #define   SRR1_PROGILL		0x00080000 /* Illegal instruction */
diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
index 60b82198de7c..a14a77bc4243 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -773,23 +773,6 @@ int main(void)
 	OFFSET(VCPU_TIMING_LAST_ENTER_TBL, kvm_vcpu, arch.timing_last_enter.tv32.tbl);
 #endif
 
-#ifdef CONFIG_PPC_POWERNV
-	OFFSET(PACA_CORE_IDLE_STATE_PTR, paca_struct, core_idle_state_ptr);
-	OFFSET(PACA_THREAD_IDLE_STATE, paca_struct, thread_idle_state);
-	OFFSET(PACA_THREAD_MASK, paca_struct, thread_mask);
-	OFFSET(PACA_SUBCORE_SIBLING_MASK, paca_struct, subcore_sibling_mask);
-	OFFSET(PACA_REQ_PSSCR, paca_struct, requested_psscr);
-	OFFSET(PACA_DONT_STOP, paca_struct, dont_stop);
-#define STOP_SPR(x, f)	OFFSET(x, paca_struct, stop_sprs.f)
-	STOP_SPR(STOP_PID, pid);
-	STOP_SPR(STOP_LDBAR, ldbar);
-	STOP_SPR(STOP_FSCR, fscr);
-	STOP_SPR(STOP_HFSCR, hfscr);
-	STOP_SPR(STOP_MMCR1, mmcr1);
-	STOP_SPR(STOP_MMCR2, mmcr2);
-	STOP_SPR(STOP_MMCRA, mmcra);
-#endif
-
 	DEFINE(PPC_DBELL_SERVER, PPC_DBELL_SERVER);
 	DEFINE(PPC_DBELL_MSGTYPE, PPC_DBELL_MSGTYPE);
 
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index bedd89438827..671c256da167 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -121,7 +121,7 @@ EXC_VIRT_NONE(0x4000, 0x100)
 	mfspr	r10,SPRN_SRR1 ;						\
 	rlwinm.	r10,r10,47-31,30,31 ;					\
 	beq-	1f ;							\
-	cmpwi	cr3,r10,2 ;						\
+	cmpwi	cr1,r10,2 ;						\
 	BRANCH_TO_C000(r10, system_reset_idle_common) ;			\
 1:									\
 	KVMTEST_PR(n) ;							\
@@ -145,8 +145,13 @@ TRAMP_KVM(PACA_EXNMI, 0x100)
 
 #ifdef CONFIG_PPC_P7_NAP
 EXC_COMMON_BEGIN(system_reset_idle_common)
-	mfspr	r12,SPRN_SRR1
-	b	pnv_powersave_wakeup
+	mfspr	r3,SPRN_SRR1
+#ifndef CONFIG_KVM_BOOK3S_HV_POSSIBLE
+	/* this bltlr could  be moved before the branch_to, and the
+	 * branch_to could maybe go straight to idle_return */
+	bltlr	cr1	/* no state loss, return to idle caller */
+#endif
+	b	idle_return_gpr_loss
 #endif
 
 /*
@@ -429,17 +434,19 @@ EXC_COMMON_BEGIN(machine_check_idle_common)
 	 * Then decrement MCE nesting after finishing with the stack.
 	 */
 	ld	r3,_MSR(r1)
+	ld	r4,_LINK(r1)
 
 	lhz	r11,PACA_IN_MCE(r13)
 	subi	r11,r11,1
 	sth	r11,PACA_IN_MCE(r13)
 
-	/* Turn off the RI bit because SRR1 is used by idle wakeup code. */
-	/* Recoverability could be improved by reducing the use of SRR1. */
-	li	r11,0
-	mtmsrd	r11,1
-
-	b	pnv_powersave_wakeup_mce
+	mtlr	r4
+	rlwinm	r10,r3,47-31,30,31
+	cmpwi	cr1,r10,2
+#ifndef CONFIG_KVM_BOOK3S_HV_POSSIBLE
+	bltlr	cr1	/* no state loss, return to idle caller */
+#endif
+	b	idle_return_gpr_loss
 #endif
 	/*
 	 * Handle machine check early in real mode. We come here with
diff --git a/arch/powerpc/kernel/idle_book3s.S b/arch/powerpc/kernel/idle_book3s.S
index 4a860d3b9229..0fb2eb731a29 100644
--- a/arch/powerpc/kernel/idle_book3s.S
+++ b/arch/powerpc/kernel/idle_book3s.S
@@ -1,539 +1,98 @@
 /*
- *  This file contains idle entry/exit functions for POWER7,
- *  POWER8 and POWER9 CPUs.
+ *  Copyright 2018, IBM Corporation.
  *
  *  This program is free software; you can redistribute it and/or
  *  modify it under the terms of the GNU General Public License
  *  as published by the Free Software Foundation; either version
  *  2 of the License, or (at your option) any later version.
+ *
+ *  This file contains general idle entry/exit functions to save
+ *  and restore stack and NVGPRs which allows C code to call idle
+ *  states that lose GPRs, and it will return transparently with
+ *  SRR1 wakeup reason return value.
+ *
+ *  The platform / CPU caller must ensure SPRs and any other non-GPR
+ *  state is saved and restored correctly, handle KVM, interrupts, etc.
  */
 
-#include <linux/threads.h>
-#include <asm/processor.h>
-#include <asm/page.h>
-#include <asm/cputable.h>
-#include <asm/thread_info.h>
 #include <asm/ppc_asm.h>
 #include <asm/asm-offsets.h>
 #include <asm/ppc-opcode.h>
-#include <asm/hw_irq.h>
-#include <asm/kvm_book3s_asm.h>
-#include <asm/opal.h>
 #include <asm/cpuidle.h>
-#include <asm/exception-64s.h>
-#include <asm/book3s/64/mmu-hash.h>
-#include <asm/mmu.h>
-#include <asm/asm-compat.h>
-#include <asm/feature-fixups.h>
-
-#undef DEBUG
-
-/*
- * Use unused space in the interrupt stack to save and restore
- * registers for winkle support.
- */
-#define _MMCR0	GPR0
-#define _SDR1	GPR3
-#define _PTCR	GPR3
-#define _RPR	GPR4
-#define _SPURR	GPR5
-#define _PURR	GPR6
-#define _TSCR	GPR7
-#define _DSCR	GPR8
-#define _AMOR	GPR9
-#define _WORT	GPR10
-#define _WORC	GPR11
-#define _LPCR	GPR12
-
-#define PSSCR_EC_ESL_MASK_SHIFTED          (PSSCR_EC | PSSCR_ESL) >> 16
-
-	.text
+#ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
+#include <asm/kvm_book3s_asm.h>
+#endif
 
 /*
- * Used by threads before entering deep idle states. Saves SPRs
- * in interrupt stack frame
- */
-save_sprs_to_stack:
-	/*
-	 * Note all register i.e per-core, per-subcore or per-thread is saved
-	 * here since any thread in the core might wake up first
-	 */
-BEGIN_FTR_SECTION
-	/*
-	 * Note - SDR1 is dropped in Power ISA v3. Hence not restoring
-	 * SDR1 here
-	 */
-	mfspr	r3,SPRN_PTCR
-	std	r3,_PTCR(r1)
-	mfspr	r3,SPRN_LPCR
-	std	r3,_LPCR(r1)
-FTR_SECTION_ELSE
-	mfspr	r3,SPRN_SDR1
-	std	r3,_SDR1(r1)
-ALT_FTR_SECTION_END_IFSET(CPU_FTR_ARCH_300)
-	mfspr	r3,SPRN_RPR
-	std	r3,_RPR(r1)
-	mfspr	r3,SPRN_SPURR
-	std	r3,_SPURR(r1)
-	mfspr	r3,SPRN_PURR
-	std	r3,_PURR(r1)
-	mfspr	r3,SPRN_TSCR
-	std	r3,_TSCR(r1)
-	mfspr	r3,SPRN_DSCR
-	std	r3,_DSCR(r1)
-	mfspr	r3,SPRN_AMOR
-	std	r3,_AMOR(r1)
-	mfspr	r3,SPRN_WORT
-	std	r3,_WORT(r1)
-	mfspr	r3,SPRN_WORC
-	std	r3,_WORC(r1)
-/*
- * On POWER9, there are idle states such as stop4, invoked via cpuidle,
- * that lose hypervisor resources. In such cases, we need to save
- * additional SPRs before entering those idle states so that they can
- * be restored to their older values on wakeup from the idle state.
+ * Desired PSSCR in r3
  *
- * On POWER8, the only such deep idle state is winkle which is used
- * only in the context of CPU-Hotplug, where these additional SPRs are
- * reinitiazed to a sane value. Hence there is no need to save/restore
- * these SPRs.
- */
-BEGIN_FTR_SECTION
-	blr
-END_FTR_SECTION_IFCLR(CPU_FTR_ARCH_300)
-
-power9_save_additional_sprs:
-	mfspr	r3, SPRN_PID
-	mfspr	r4, SPRN_LDBAR
-	std	r3, STOP_PID(r13)
-	std	r4, STOP_LDBAR(r13)
-
-	mfspr	r3, SPRN_FSCR
-	mfspr	r4, SPRN_HFSCR
-	std	r3, STOP_FSCR(r13)
-	std	r4, STOP_HFSCR(r13)
-
-	mfspr	r3, SPRN_MMCRA
-	mfspr	r4, SPRN_MMCR0
-	std	r3, STOP_MMCRA(r13)
-	std	r4, _MMCR0(r1)
-
-	mfspr	r3, SPRN_MMCR1
-	mfspr	r4, SPRN_MMCR2
-	std	r3, STOP_MMCR1(r13)
-	std	r4, STOP_MMCR2(r13)
-	blr
-
-power9_restore_additional_sprs:
-	ld	r3,_LPCR(r1)
-	ld	r4, STOP_PID(r13)
-	mtspr	SPRN_LPCR,r3
-	mtspr	SPRN_PID, r4
-
-	ld	r3, STOP_LDBAR(r13)
-	ld	r4, STOP_FSCR(r13)
-	mtspr	SPRN_LDBAR, r3
-	mtspr	SPRN_FSCR, r4
-
-	ld	r3, STOP_HFSCR(r13)
-	ld	r4, STOP_MMCRA(r13)
-	mtspr	SPRN_HFSCR, r3
-	mtspr	SPRN_MMCRA, r4
-
-	ld	r3, _MMCR0(r1)
-	ld	r4, STOP_MMCR1(r13)
-	mtspr	SPRN_MMCR0, r3
-	mtspr	SPRN_MMCR1, r4
-
-	ld	r3, STOP_MMCR2(r13)
-	ld	r4, PACA_SPRG_VDSO(r13)
-	mtspr	SPRN_MMCR2, r3
-	mtspr	SPRN_SPRG3, r4
-	blr
-
-/*
- * Used by threads when the lock bit of core_idle_state is set.
- * Threads will spin in HMT_LOW until the lock bit is cleared.
- * r14 - pointer to core_idle_state
- * r15 - used to load contents of core_idle_state
- * r9  - used as a temporary variable
+ * No state will be lost regardless of wakeup mechanism (interrupt or NIA).
+ *
+ * An EC=0 type wakeup will return with a value of 0. SRESET wakeup (which can
+ * happen with xscom SRESET and possibly MCE) may clobber volatiles except LR,
+ * and must blr, to return to caller with r3 set according to caller's expected
+ * return code (for Book3S/64 that is SRR1).
  */
-
-core_idle_lock_held:
-	HMT_LOW
-3:	lwz	r15,0(r14)
-	andis.	r15,r15,PNV_CORE_IDLE_LOCK_BIT@h
-	bne	3b
-	HMT_MEDIUM
-	lwarx	r15,0,r14
-	andis.	r9,r15,PNV_CORE_IDLE_LOCK_BIT@h
-	bne-	core_idle_lock_held
+_GLOBAL(isa300_idle_stop_noloss)
+	mtspr 	SPRN_PSSCR,r3
+	PPC_STOP
+	li	r3,0
 	blr
 
-/* Reuse some unused pt_regs slots for AMR/IAMR/UAMOR/UAMOR */
-#define PNV_POWERSAVE_AMR	_TRAP
-#define PNV_POWERSAVE_IAMR	_DAR
-#define PNV_POWERSAVE_UAMOR	_DSISR
-#define PNV_POWERSAVE_AMOR	RESULT
-
 /*
- * Pass requested state in r3:
- *	r3 - PNV_THREAD_NAP/SLEEP/WINKLE in POWER8
- *	   - Requested PSSCR value in POWER9
+ * Desired PSSCR in r3
+ *
+ * GPRs may be lost, so they are saved here. Wakeup is by interrupt only.
+ * The SRESET wakeup returns to this function's caller by calling
+ * idle_return_gpr_loss with r3 set to desired return value.
+ *
+ * A wakeup without GPR loss may alteratively be handled as in
+ * isa300_idle_stop_noloss and blr directly, as an optimisation.
  *
- * Address of idle handler to branch to in realmode in r4
+ * The caller is responsible for saving/restoring SPRs, MSR, timebase,
+ * etc.
  */
-pnv_powersave_common:
-	/* Use r3 to pass state nap/sleep/winkle */
-	/* NAP is a state loss, we create a regs frame on the
-	 * stack, fill it up with the state we care about and
-	 * stick a pointer to it in PACAR1. We really only
-	 * need to save PC, some CR bits and the NV GPRs,
-	 * but for now an interrupt frame will do.
-	 */
-	mtctr	r4
-
-	mflr	r0
-	std	r0,16(r1)
-	stdu	r1,-INT_FRAME_SIZE(r1)
-	std	r0,_LINK(r1)
-	std	r0,_NIP(r1)
-
-	/* We haven't lost state ... yet */
-	li	r0,0
-	stb	r0,PACA_NAPSTATELOST(r13)
-
-	/* Continue saving state */
-	SAVE_GPR(2, r1)
-	SAVE_NVGPRS(r1)
-
-BEGIN_FTR_SECTION
-	mfspr	r4, SPRN_AMR
-	mfspr	r5, SPRN_IAMR
-	mfspr	r6, SPRN_UAMOR
-	std	r4, PNV_POWERSAVE_AMR(r1)
-	std	r5, PNV_POWERSAVE_IAMR(r1)
-	std	r6, PNV_POWERSAVE_UAMOR(r1)
-BEGIN_FTR_SECTION_NESTED(42)
-	mfspr	r7, SPRN_AMOR
-	std	r7, PNV_POWERSAVE_AMOR(r1)
-END_FTR_SECTION_NESTED_IFSET(CPU_FTR_HVMODE, 42)
-END_FTR_SECTION_IFSET(CPU_FTR_ARCH_207S)
-
-	mfcr	r5
-	std	r5,_CCR(r1)
+_GLOBAL(isa300_idle_stop_mayloss)
+	mtspr 	SPRN_PSSCR,r3
 	std	r1,PACAR1(r13)
-
-BEGIN_FTR_SECTION
-	/*
-	 * POWER9 does not require real mode to stop, and presently does not
-	 * set hwthread_state for KVM (threads don't share MMU context), so
-	 * we can remain in virtual mode for this.
-	 */
-	bctr
-END_FTR_SECTION_IFSET(CPU_FTR_ARCH_300)
-	/*
-	 * POWER8
-	 * Go to real mode to do the nap, as required by the architecture.
-	 * Also, we need to be in real mode before setting hwthread_state,
-	 * because as soon as we do that, another thread can switch
-	 * the MMU context to the guest.
-	 */
-	LOAD_REG_IMMEDIATE(r7, MSR_IDLE)
-	mtmsrd	r7,0
-	bctr
-
-/*
- * This is the sequence required to execute idle instructions, as
- * specified in ISA v2.07 (and earlier). MSR[IR] and MSR[DR] must be 0.
- */
-#define IDLE_STATE_ENTER_SEQ_NORET(IDLE_INST)			\
-	/* Magic NAP/SLEEP/WINKLE mode enter sequence */	\
-	std	r0,0(r1);					\
-	ptesync;						\
-	ld	r0,0(r1);					\
-236:	cmpd	cr0,r0,r0;					\
-	bne	236b;						\
-	IDLE_INST;
-
-
-	.globl pnv_enter_arch207_idle_mode
-pnv_enter_arch207_idle_mode:
-#ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
-	/* Tell KVM we're entering idle */
-	li	r4,KVM_HWTHREAD_IN_IDLE
-	/******************************************************/
-	/*  N O T E   W E L L    ! ! !    N O T E   W E L L   */
-	/* The following store to HSTATE_HWTHREAD_STATE(r13)  */
-	/* MUST occur in real mode, i.e. with the MMU off,    */
-	/* and the MMU must stay off until we clear this flag */
-	/* and test HSTATE_HWTHREAD_REQ(r13) in               */
-	/* pnv_powersave_wakeup in this file.                 */
-	/* The reason is that another thread can switch the   */
-	/* MMU to a guest context whenever this flag is set   */
-	/* to KVM_HWTHREAD_IN_IDLE, and if the MMU was on,    */
-	/* that would potentially cause this thread to start  */
-	/* executing instructions from guest memory in        */
-	/* hypervisor mode, leading to a host crash or data   */
-	/* corruption, or worse.                              */
-	/******************************************************/
-	stb	r4,HSTATE_HWTHREAD_STATE(r13)
-#endif
-	stb	r3,PACA_THREAD_IDLE_STATE(r13)
-	cmpwi	cr3,r3,PNV_THREAD_SLEEP
-	bge	cr3,2f
-	IDLE_STATE_ENTER_SEQ_NORET(PPC_NAP)
-	/* No return */
-2:
-	/* Sleep or winkle */
-	lbz	r7,PACA_THREAD_MASK(r13)
-	ld	r14,PACA_CORE_IDLE_STATE_PTR(r13)
-	li	r5,0
-	beq	cr3,3f
-	lis	r5,PNV_CORE_IDLE_WINKLE_COUNT@h
-3:
-lwarx_loop1:
-	lwarx	r15,0,r14
-
-	andis.	r9,r15,PNV_CORE_IDLE_LOCK_BIT@h
-	bnel-	core_idle_lock_held
-
-	add	r15,r15,r5			/* Add if winkle */
-	andc	r15,r15,r7			/* Clear thread bit */
-
-	andi.	r9,r15,PNV_CORE_IDLE_THREAD_BITS
-
-/*
- * If cr0 = 0, then current thread is the last thread of the core entering
- * sleep. Last thread needs to execute the hardware bug workaround code if
- * required by the platform.
- * Make the workaround call unconditionally here. The below branch call is
- * patched out when the idle states are discovered if the platform does not
- * require it.
- */
-.global pnv_fastsleep_workaround_at_entry
-pnv_fastsleep_workaround_at_entry:
-	beq	fastsleep_workaround_at_entry
-
-	stwcx.	r15,0,r14
-	bne-	lwarx_loop1
-	isync
-
-common_enter: /* common code for all the threads entering sleep or winkle */
-	bgt	cr3,enter_winkle
-	IDLE_STATE_ENTER_SEQ_NORET(PPC_SLEEP)
-
-fastsleep_workaround_at_entry:
-	oris	r15,r15,PNV_CORE_IDLE_LOCK_BIT@h
-	stwcx.	r15,0,r14
-	bne-	lwarx_loop1
-	isync
-
-	/* Fast sleep workaround */
-	li	r3,1
-	li	r4,1
-	bl	opal_config_cpu_idle_state
-
-	/* Unlock */
-	xoris	r15,r15,PNV_CORE_IDLE_LOCK_BIT@h
-	lwsync
-	stw	r15,0(r14)
-	b	common_enter
-
-enter_winkle:
-	bl	save_sprs_to_stack
-
-	IDLE_STATE_ENTER_SEQ_NORET(PPC_WINKLE)
-
-/*
- * r3 - PSSCR value corresponding to the requested stop state.
- */
-power_enter_stop:
-/*
- * Check if we are executing the lite variant with ESL=EC=0
- */
-	andis.   r4,r3,PSSCR_EC_ESL_MASK_SHIFTED
-	clrldi   r3,r3,60 /* r3 = Bits[60:63] = Requested Level (RL) */
-	bne	 .Lhandle_esl_ec_set
+	mflr	r4
+	mfcr	r5
+	/* use stack red zone rather than a new frame for saving regs */
+	std	r2,-8*0(r1)
+	std	r14,-8*1(r1)
+	std	r15,-8*2(r1)
+	std	r16,-8*3(r1)
+	std	r17,-8*4(r1)
+	std	r18,-8*5(r1)
+	std	r19,-8*6(r1)
+	std	r20,-8*7(r1)
+	std	r21,-8*8(r1)
+	std	r22,-8*9(r1)
+	std	r23,-8*10(r1)
+	std	r24,-8*11(r1)
+	std	r25,-8*12(r1)
+	std	r26,-8*13(r1)
+	std	r27,-8*14(r1)
+	std	r28,-8*15(r1)
+	std	r29,-8*16(r1)
+	std	r30,-8*17(r1)
+	std	r31,-8*18(r1)
+	std	r4,-8*19(r1)
+	std	r5,-8*20(r1)
+	/* 168 bytes */
 	PPC_STOP
-	li	r3,0  /* Since we didn't lose state, return 0 */
-	std	r3, PACA_REQ_PSSCR(r13)
-
-	/*
-	 * pnv_wakeup_noloss() expects r12 to contain the SRR1 value so
-	 * it can determine if the wakeup reason is an HMI in
-	 * CHECK_HMI_INTERRUPT.
-	 *
-	 * However, when we wakeup with ESL=0, SRR1 will not contain the wakeup
-	 * reason, so there is no point setting r12 to SRR1.
-	 *
-	 * Further, we clear r12 here, so that we don't accidentally enter the
-	 * HMI in pnv_wakeup_noloss() if the value of r12[42:45] == WAKE_HMI.
-	 */
-	li	r12, 0
-	b 	pnv_wakeup_noloss
-
-.Lhandle_esl_ec_set:
-BEGIN_FTR_SECTION
-	/*
-	 * POWER9 DD2.0 or earlier can incorrectly set PMAO when waking up after
-	 * a state-loss idle. Saving and restoring MMCR0 over idle is a
-	 * workaround.
-	 */
-	mfspr	r4,SPRN_MMCR0
-	std	r4,_MMCR0(r1)
-END_FTR_SECTION_IFCLR(CPU_FTR_POWER9_DD2_1)
+	b	.	/* catch bugs */
 
 /*
- * Check if the requested state is a deep idle state.
- */
-	LOAD_REG_ADDRBASE(r5,pnv_first_deep_stop_state)
-	ld	r4,ADDROFF(pnv_first_deep_stop_state)(r5)
-	cmpd	r3,r4
-	bge	.Lhandle_deep_stop
-	PPC_STOP	/* Does not return (system reset interrupt) */
-
-.Lhandle_deep_stop:
-/*
- * Entering deep idle state.
- * Clear thread bit in PACA_CORE_IDLE_STATE, save SPRs to
- * stack and enter stop
- */
-	lbz     r7,PACA_THREAD_MASK(r13)
-	ld      r14,PACA_CORE_IDLE_STATE_PTR(r13)
-
-lwarx_loop_stop:
-	lwarx   r15,0,r14
-	andis.	r9,r15,PNV_CORE_IDLE_LOCK_BIT@h
-	bnel-	core_idle_lock_held
-	andc    r15,r15,r7                      /* Clear thread bit */
-
-	stwcx.  r15,0,r14
-	bne-    lwarx_loop_stop
-	isync
-
-	bl	save_sprs_to_stack
-
-	PPC_STOP	/* Does not return (system reset interrupt) */
-
-/*
- * Entered with MSR[EE]=0 and no soft-masked interrupts pending.
- * r3 contains desired idle state (PNV_THREAD_NAP/SLEEP/WINKLE).
- */
-_GLOBAL(power7_idle_insn)
-	/* Now check if user or arch enabled NAP mode */
-	LOAD_REG_ADDR(r4, pnv_enter_arch207_idle_mode)
-	b	pnv_powersave_common
-
-#define CHECK_HMI_INTERRUPT						\
-BEGIN_FTR_SECTION_NESTED(66);						\
-	rlwinm	r0,r12,45-31,0xf;  /* extract wake reason field (P8) */	\
-FTR_SECTION_ELSE_NESTED(66);						\
-	rlwinm	r0,r12,45-31,0xe;  /* P7 wake reason field is 3 bits */	\
-ALT_FTR_SECTION_END_NESTED_IFSET(CPU_FTR_ARCH_207S, 66);		\
-	cmpwi	r0,0xa;			/* Hypervisor maintenance ? */	\
-	bne+	20f;							\
-	/* Invoke opal call to handle hmi */				\
-	ld	r2,PACATOC(r13);					\
-	ld	r1,PACAR1(r13);						\
-	std	r3,ORIG_GPR3(r1);	/* Save original r3 */		\
-	li	r3,0;			/* NULL argument */		\
-	bl	hmi_exception_realmode;					\
-	nop;								\
-	ld	r3,ORIG_GPR3(r1);	/* Restore original r3 */	\
-20:	nop;
-
-/*
- * Entered with MSR[EE]=0 and no soft-masked interrupts pending.
- * r3 contains desired PSSCR register value.
+ * Desired return value in r3
  *
- * Offline (CPU unplug) case also must notify KVM that the CPU is
- * idle.
- */
-_GLOBAL(power9_offline_stop)
-#ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
-	/*
-	 * Tell KVM we're entering idle.
-	 * This does not have to be done in real mode because the P9 MMU
-	 * is independent per-thread. Some steppings share radix/hash mode
-	 * between threads, but in that case KVM has a barrier sync in real
-	 * mode before and after switching between radix and hash.
-	 */
-	li	r4,KVM_HWTHREAD_IN_IDLE
-	stb	r4,HSTATE_HWTHREAD_STATE(r13)
-#endif
-	/* fall through */
-
-_GLOBAL(power9_idle_stop)
-	std	r3, PACA_REQ_PSSCR(r13)
-#ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
-BEGIN_FTR_SECTION
-	sync
-	lwz	r5, PACA_DONT_STOP(r13)
-	cmpwi	r5, 0
-	bne	1f
-END_FTR_SECTION_IFSET(CPU_FTR_P9_TM_XER_SO_BUG)
-#endif
-	mtspr 	SPRN_PSSCR,r3
-	LOAD_REG_ADDR(r4,power_enter_stop)
-	b	pnv_powersave_common
-	/* No return */
-#ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
-1:
-	/*
-	 * We get here when TM / thread reconfiguration bug workaround
-	 * code wants to get the CPU into SMT4 mode, and therefore
-	 * we are being asked not to stop.
-	 */
-	li	r3, 0
-	std	r3, PACA_REQ_PSSCR(r13)
-	blr		/* return 0 for wakeup cause / SRR1 value */
-#endif
-
-/*
- * Called from machine check handler for powersave wakeups.
- * Low level machine check processing has already been done. Now just
- * go through the wake up path to get everything in order.
+ * The idle wakeup SRESET interrupt can call this after calling
+ * to return to the idle sleep function caller with r3 as the return code.
  *
- * r3 - The original SRR1 value.
- * Original SRR[01] have been clobbered.
- * MSR_RI is clear.
- */
-.global pnv_powersave_wakeup_mce
-pnv_powersave_wakeup_mce:
-	/* Set cr3 for pnv_powersave_wakeup */
-	rlwinm	r11,r3,47-31,30,31
-	cmpwi	cr3,r11,2
-
-	/*
-	 * Now put the original SRR1 with SRR1_WAKEMCE_RESVD as the wake
-	 * reason into r12, which allows reuse of the system reset wakeup
-	 * code without being mistaken for another type of wakeup.
-	 */
-	oris	r12,r3,SRR1_WAKEMCE_RESVD@h
-
-	b	pnv_powersave_wakeup
-
-/*
- * Called from reset vector for powersave wakeups.
- * cr3 - set to gt if waking up with partial/complete hypervisor state loss
- * r12 - SRR1
+ * This must not be used if idle was entered via a _noloss function (use
+ * a simple blr instead).
  */
-.global pnv_powersave_wakeup
-pnv_powersave_wakeup:
-	ld	r2, PACATOC(r13)
-
-BEGIN_FTR_SECTION
-	bl	pnv_restore_hyp_resource_arch300
-FTR_SECTION_ELSE
-	bl	pnv_restore_hyp_resource_arch207
-ALT_FTR_SECTION_END_IFSET(CPU_FTR_ARCH_300)
-
-	li	r0,PNV_THREAD_RUNNING
-	stb	r0,PACA_THREAD_IDLE_STATE(r13)	/* Clear thread state */
-
-	mr	r3,r12
-
+_GLOBAL(idle_return_gpr_loss)
 #ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
 	lbz	r0,HSTATE_HWTHREAD_STATE(r13)
 	cmpwi	r0,KVM_HWTHREAD_IN_KERNEL
@@ -547,449 +106,105 @@ ALT_FTR_SECTION_END_IFSET(CPU_FTR_ARCH_300)
 	beq	1f
 	b	kvm_start_guest
 1:
+	lbz	r0,PACA_NAPSTATELOST(r13)
+	cmpwi	r0,0
+	bne	2f
+	bltlr	cr1
+2:
 #endif
-
-	/* Return SRR1 from power7_nap() */
-	blt	cr3,pnv_wakeup_noloss
-	b	pnv_wakeup_loss
+	ld	r1,PACAR1(r13)
+	ld	r4,-8*19(r1)
+	ld	r5,-8*20(r1)
+	mtlr	r4
+	mtcr	r5
+	/*
+	 * KVM nap requires r2 to be saved, rather than just restoring it
+	 * from PACATOC. This could be avoided for that less common case
+	 * if KVM saved its r2.
+	 */
+	ld	r2,-8*0(r1)
+	ld	r14,-8*1(r1)
+	ld	r15,-8*2(r1)
+	ld	r16,-8*3(r1)
+	ld	r17,-8*4(r1)
+	ld	r18,-8*5(r1)
+	ld	r19,-8*6(r1)
+	ld	r20,-8*7(r1)
+	ld	r21,-8*8(r1)
+	ld	r22,-8*9(r1)
+	ld	r23,-8*10(r1)
+	ld	r24,-8*11(r1)
+	ld	r25,-8*12(r1)
+	ld	r26,-8*13(r1)
+	ld	r27,-8*14(r1)
+	ld	r28,-8*15(r1)
+	ld	r29,-8*16(r1)
+	ld	r30,-8*17(r1)
+	ld	r31,-8*18(r1)
+	blr
 
 /*
- * Check whether we have woken up with hypervisor state loss.
- * If yes, restore hypervisor state and return back to link.
+ * This is the sequence required to execute idle instructions, as
+ * specified in ISA v2.07 (and earlier). MSR[IR] and MSR[DR] must be 0.
  *
- * cr3 - set to gt if waking up with partial/complete hypervisor state loss
+ * The 0(r1) slot is used to save r2 in isa206, so use that here.
  */
-pnv_restore_hyp_resource_arch300:
-	/*
-	 * Workaround for POWER9, if we lost resources, the ERAT
-	 * might have been mixed up and needs flushing. We also need
-	 * to reload MMCR0 (see comment above). We also need to set
-	 * then clear bit 60 in MMCRA to ensure the PMU starts running.
-	 */
-	blt	cr3,1f
-BEGIN_FTR_SECTION
-	PPC_INVALIDATE_ERAT
-	ld	r1,PACAR1(r13)
-	ld	r4,_MMCR0(r1)
-	mtspr	SPRN_MMCR0,r4
-END_FTR_SECTION_IFCLR(CPU_FTR_POWER9_DD2_1)
-	mfspr	r4,SPRN_MMCRA
-	ori	r4,r4,(1 << (63-60))
-	mtspr	SPRN_MMCRA,r4
-	xori	r4,r4,(1 << (63-60))
-	mtspr	SPRN_MMCRA,r4
-1:
-	/*
-	 * POWER ISA 3. Use PSSCR to determine if we
-	 * are waking up from deep idle state
-	 */
-	LOAD_REG_ADDRBASE(r5,pnv_first_deep_stop_state)
-	ld	r4,ADDROFF(pnv_first_deep_stop_state)(r5)
-
-	/*
-	 * 0-3 bits correspond to Power-Saving Level Status
-	 * which indicates the idle state we are waking up from
-	 */
-	mfspr	r5, SPRN_PSSCR
-	rldicl  r5,r5,4,60
-	li	r0, 0		/* clear requested_psscr to say we're awake */
-	std	r0, PACA_REQ_PSSCR(r13)
-	cmpd	cr4,r5,r4
-	bge	cr4,pnv_wakeup_tb_loss /* returns to caller */
-
-	blr	/* Waking up without hypervisor state loss. */
-
-/* Same calling convention as arch300 */
-pnv_restore_hyp_resource_arch207:
-	/*
-	 * POWER ISA 2.07 or less.
-	 * Check if we slept with sleep or winkle.
-	 */
-	lbz	r4,PACA_THREAD_IDLE_STATE(r13)
-	cmpwi	cr2,r4,PNV_THREAD_NAP
-	bgt	cr2,pnv_wakeup_tb_loss	/* Either sleep or Winkle */
-
-	/*
-	 * We fall through here if PACA_THREAD_IDLE_STATE shows we are waking
-	 * up from nap. At this stage CR3 shouldn't contains 'gt' since that
-	 * indicates we are waking with hypervisor state loss from nap.
-	 */
-	bgt	cr3,.
-
-	blr	/* Waking up without hypervisor state loss */
+#define IDLE_STATE_ENTER_SEQ_NORET(IDLE_INST)			\
+	/* Magic NAP/SLEEP/WINKLE mode enter sequence */	\
+	std	r2,0(r1);					\
+	ptesync;						\
+	ld	r2,0(r1);					\
+236:	cmpd	cr0,r2,r2;					\
+	bne	236b;						\
+	IDLE_INST;						\
+	b	.	/* catch bugs */
 
 /*
- * Called if waking up from idle state which can cause either partial or
- * complete hyp state loss.
- * In POWER8, called if waking up from fastsleep or winkle
- * In POWER9, called if waking up from stop state >= pnv_first_deep_stop_state
+ * Desired instruction type in r3
  *
- * r13 - PACA
- * cr3 - gt if waking up with partial/complete hypervisor state loss
+ * GPRs may be lost, so they are saved here. Wakeup is by interrupt only.
+ * The SRESET wakeup returns to this function's caller by calling
+ * idle_return_gpr_loss with r3 set to desired return value.
  *
- * If ISA300:
- * cr4 - gt or eq if waking up from complete hypervisor state loss.
+ * A wakeup without GPR loss may alteratively be handled as in
+ * isa300_idle_stop_noloss and blr directly, as an optimisation.
  *
- * If ISA207:
- * r4 - PACA_THREAD_IDLE_STATE
- */
-pnv_wakeup_tb_loss:
-	ld	r1,PACAR1(r13)
-	/*
-	 * Before entering any idle state, the NVGPRs are saved in the stack.
-	 * If there was a state loss, or PACA_NAPSTATELOST was set, then the
-	 * NVGPRs are restored. If we are here, it is likely that state is lost,
-	 * but not guaranteed -- neither ISA207 nor ISA300 tests to reach
-	 * here are the same as the test to restore NVGPRS:
-	 * PACA_THREAD_IDLE_STATE test for ISA207, PSSCR test for ISA300,
-	 * and SRR1 test for restoring NVGPRs.
-	 *
-	 * We are about to clobber NVGPRs now, so set NAPSTATELOST to
-	 * guarantee they will always be restored. This might be tightened
-	 * with careful reading of specs (particularly for ISA300) but this
-	 * is already a slow wakeup path and it's simpler to be safe.
-	 */
-	li	r0,1
-	stb	r0,PACA_NAPSTATELOST(r13)
-
-	/*
-	 *
-	 * Save SRR1 and LR in NVGPRs as they might be clobbered in
-	 * opal_call() (called in CHECK_HMI_INTERRUPT). SRR1 is required
-	 * to determine the wakeup reason if we branch to kvm_start_guest. LR
-	 * is required to return back to reset vector after hypervisor state
-	 * restore is complete.
-	 */
-	mr	r19,r12
-	mr	r18,r4
-	mflr	r17
-BEGIN_FTR_SECTION
-	CHECK_HMI_INTERRUPT
-END_FTR_SECTION_IFSET(CPU_FTR_HVMODE)
-
-	ld	r14,PACA_CORE_IDLE_STATE_PTR(r13)
-	lbz	r7,PACA_THREAD_MASK(r13)
-
-	/*
-	 * Take the core lock to synchronize against other threads.
-	 *
-	 * Lock bit is set in one of the 2 cases-
-	 * a. In the sleep/winkle enter path, the last thread is executing
-	 * fastsleep workaround code.
-	 * b. In the wake up path, another thread is executing fastsleep
-	 * workaround undo code or resyncing timebase or restoring context
-	 * In either case loop until the lock bit is cleared.
-	 */
-1:
-	lwarx	r15,0,r14
-	andis.	r9,r15,PNV_CORE_IDLE_LOCK_BIT@h
-	bnel-	core_idle_lock_held
-	oris	r15,r15,PNV_CORE_IDLE_LOCK_BIT@h
-	stwcx.	r15,0,r14
-	bne-	1b
-	isync
-
-	andi.	r9,r15,PNV_CORE_IDLE_THREAD_BITS
-	cmpwi	cr2,r9,0
-
-	/*
-	 * At this stage
-	 * cr2 - eq if first thread to wakeup in core
-	 * cr3-  gt if waking up with partial/complete hypervisor state loss
-	 * ISA300:
-	 * cr4 - gt or eq if waking up from complete hypervisor state loss.
-	 */
-
-BEGIN_FTR_SECTION
-	/*
-	 * Were we in winkle?
-	 * If yes, check if all threads were in winkle, decrement our
-	 * winkle count, set all thread winkle bits if all were in winkle.
-	 * Check if our thread has a winkle bit set, and set cr4 accordingly
-	 * (to match ISA300, above). Pseudo-code for core idle state
-	 * transitions for ISA207 is as follows (everything happens atomically
-	 * due to store conditional and/or lock bit):
-	 *
-	 * nap_idle() { }
-	 * nap_wake() { }
-	 *
-	 * sleep_idle()
-	 * {
-	 *	core_idle_state &= ~thread_in_core
-	 * }
-	 *
-	 * sleep_wake()
-	 * {
-	 *     bool first_in_core, first_in_subcore;
-	 *
-	 *     first_in_core = (core_idle_state & IDLE_THREAD_BITS) == 0;
-	 *     first_in_subcore = (core_idle_state & SUBCORE_SIBLING_MASK) == 0;
-	 *
-	 *     core_idle_state |= thread_in_core;
-	 * }
-	 *
-	 * winkle_idle()
-	 * {
-	 *	core_idle_state &= ~thread_in_core;
-	 *	core_idle_state += 1 << WINKLE_COUNT_SHIFT;
-	 * }
-	 *
-	 * winkle_wake()
-	 * {
-	 *     bool first_in_core, first_in_subcore, winkle_state_lost;
-	 *
-	 *     first_in_core = (core_idle_state & IDLE_THREAD_BITS) == 0;
-	 *     first_in_subcore = (core_idle_state & SUBCORE_SIBLING_MASK) == 0;
-	 *
-	 *     core_idle_state |= thread_in_core;
-	 *
-	 *     if ((core_idle_state & WINKLE_MASK) == (8 << WINKLE_COUNT_SIHFT))
-	 *         core_idle_state |= THREAD_WINKLE_BITS;
-	 *     core_idle_state -= 1 << WINKLE_COUNT_SHIFT;
-	 *
-	 *     winkle_state_lost = core_idle_state &
-	 *				(thread_in_core << WINKLE_THREAD_SHIFT);
-	 *     core_idle_state &= ~(thread_in_core << WINKLE_THREAD_SHIFT);
-	 * }
-	 *
-	 */
-	cmpwi	r18,PNV_THREAD_WINKLE
-	bne	2f
-	andis.	r9,r15,PNV_CORE_IDLE_WINKLE_COUNT_ALL_BIT@h
-	subis	r15,r15,PNV_CORE_IDLE_WINKLE_COUNT@h
-	beq	2f
-	ori	r15,r15,PNV_CORE_IDLE_THREAD_WINKLE_BITS /* all were winkle */
-2:
-	/* Shift thread bit to winkle mask, then test if this thread is set,
-	 * and remove it from the winkle bits */
-	slwi	r8,r7,8
-	and	r8,r8,r15
-	andc	r15,r15,r8
-	cmpwi	cr4,r8,1 /* cr4 will be gt if our bit is set, lt if not */
-
-	lbz	r4,PACA_SUBCORE_SIBLING_MASK(r13)
-	and	r4,r4,r15
-	cmpwi	r4,0	/* Check if first in subcore */
-
-	or	r15,r15,r7		/* Set thread bit */
-	beq	first_thread_in_subcore
-END_FTR_SECTION_IFCLR(CPU_FTR_ARCH_300)
-
-	or	r15,r15,r7		/* Set thread bit */
-	beq	cr2,first_thread_in_core
-
-	/* Not first thread in core or subcore to wake up */
-	b	clear_lock
-
-first_thread_in_subcore:
-	/*
-	 * If waking up from sleep, subcore state is not lost. Hence
-	 * skip subcore state restore
-	 */
-	blt	cr4,subcore_state_restored
-
-	/* Restore per-subcore state */
-	ld      r4,_SDR1(r1)
-	mtspr   SPRN_SDR1,r4
-
-	ld      r4,_RPR(r1)
-	mtspr   SPRN_RPR,r4
-	ld	r4,_AMOR(r1)
-	mtspr	SPRN_AMOR,r4
-
-subcore_state_restored:
-	/*
-	 * Check if the thread is also the first thread in the core. If not,
-	 * skip to clear_lock.
-	 */
-	bne	cr2,clear_lock
-
-first_thread_in_core:
-
-	/*
-	 * First thread in the core waking up from any state which can cause
-	 * partial or complete hypervisor state loss. It needs to
-	 * call the fastsleep workaround code if the platform requires it.
-	 * Call it unconditionally here. The below branch instruction will
-	 * be patched out if the platform does not have fastsleep or does not
-	 * require the workaround. Patching will be performed during the
-	 * discovery of idle-states.
-	 */
-.global pnv_fastsleep_workaround_at_exit
-pnv_fastsleep_workaround_at_exit:
-	b	fastsleep_workaround_at_exit
-
-timebase_resync:
-	/*
-	 * Use cr3 which indicates that we are waking up with atleast partial
-	 * hypervisor state loss to determine if TIMEBASE RESYNC is needed.
-	 */
-	ble	cr3,.Ltb_resynced
-	/* Time base re-sync */
-	bl	opal_resync_timebase;
-	/*
-	 * If waking up from sleep (POWER8), per core state
-	 * is not lost, skip to clear_lock.
-	 */
-.Ltb_resynced:
-	blt	cr4,clear_lock
-
-	/*
-	 * First thread in the core to wake up and its waking up with
-	 * complete hypervisor state loss. Restore per core hypervisor
-	 * state.
-	 */
-BEGIN_FTR_SECTION
-	ld	r4,_PTCR(r1)
-	mtspr	SPRN_PTCR,r4
-	ld	r4,_RPR(r1)
-	mtspr	SPRN_RPR,r4
-	ld	r4,_AMOR(r1)
-	mtspr	SPRN_AMOR,r4
-END_FTR_SECTION_IFSET(CPU_FTR_ARCH_300)
-
-	ld	r4,_TSCR(r1)
-	mtspr	SPRN_TSCR,r4
-	ld	r4,_WORC(r1)
-	mtspr	SPRN_WORC,r4
-
-clear_lock:
-	xoris	r15,r15,PNV_CORE_IDLE_LOCK_BIT@h
-	lwsync
-	stw	r15,0(r14)
-
-common_exit:
-	/*
-	 * Common to all threads.
-	 *
-	 * If waking up from sleep, hypervisor state is not lost. Hence
-	 * skip hypervisor state restore.
-	 */
-	blt	cr4,hypervisor_state_restored
-
-	/* Waking up from winkle */
-
-BEGIN_MMU_FTR_SECTION
-	b	no_segments
-END_MMU_FTR_SECTION_IFSET(MMU_FTR_TYPE_RADIX)
-	/* Restore SLB  from PACA */
-	ld	r8,PACA_SLBSHADOWPTR(r13)
-
-	.rept	SLB_NUM_BOLTED
-	li	r3, SLBSHADOW_SAVEAREA
-	LDX_BE	r5, r8, r3
-	addi	r3, r3, 8
-	LDX_BE	r6, r8, r3
-	andis.	r7,r5,SLB_ESID_V@h
-	beq	1f
-	slbmte	r6,r5
-1:	addi	r8,r8,16
-	.endr
-no_segments:
-
-	/* Restore per thread state */
-
-	ld	r4,_SPURR(r1)
-	mtspr	SPRN_SPURR,r4
-	ld	r4,_PURR(r1)
-	mtspr	SPRN_PURR,r4
-	ld	r4,_DSCR(r1)
-	mtspr	SPRN_DSCR,r4
-	ld	r4,_WORT(r1)
-	mtspr	SPRN_WORT,r4
-
-	/* Call cur_cpu_spec->cpu_restore() */
-	LOAD_REG_ADDR(r4, cur_cpu_spec)
-	ld	r4,0(r4)
-	ld	r12,CPU_SPEC_RESTORE(r4)
-#ifdef PPC64_ELF_ABI_v1
-	ld	r12,0(r12)
-#endif
-	mtctr	r12
-	bctrl
-
-/*
- * On POWER9, we can come here on wakeup from a cpuidle stop state.
- * Hence restore the additional SPRs to the saved value.
+ * The caller is responsible for saving/restoring SPRs, MSR, timebase,
+ * etc.
  *
- * On POWER8, we come here only on winkle. Since winkle is used
- * only in the case of CPU-Hotplug, we don't need to restore
- * the additional SPRs.
+ * This must be called in real-mode (MSR_IDLE).
  */
-BEGIN_FTR_SECTION
-	bl 	power9_restore_additional_sprs
-END_FTR_SECTION_IFSET(CPU_FTR_ARCH_300)
-hypervisor_state_restored:
-
-	mr	r12,r19
-	mtlr	r17
-	blr		/* return to pnv_powersave_wakeup */
-
-fastsleep_workaround_at_exit:
-	li	r3,1
-	li	r4,0
-	bl	opal_config_cpu_idle_state
-	b	timebase_resync
-
-/*
- * R3 here contains the value that will be returned to the caller
- * of power7_nap.
- * R12 contains SRR1 for CHECK_HMI_INTERRUPT.
- */
-.global pnv_wakeup_loss
-pnv_wakeup_loss:
-	ld	r1,PACAR1(r13)
-BEGIN_FTR_SECTION
-	CHECK_HMI_INTERRUPT
-END_FTR_SECTION_IFSET(CPU_FTR_HVMODE)
-	REST_NVGPRS(r1)
-	REST_GPR(2, r1)
-
-BEGIN_FTR_SECTION
-	/* These regs were saved in pnv_powersave_common() */
-	ld	r4, PNV_POWERSAVE_AMR(r1)
-	ld	r5, PNV_POWERSAVE_IAMR(r1)
-	ld	r6, PNV_POWERSAVE_UAMOR(r1)
-	mtspr	SPRN_AMR, r4
-	mtspr	SPRN_IAMR, r5
-	mtspr	SPRN_UAMOR, r6
-BEGIN_FTR_SECTION_NESTED(42)
-	ld	r7, PNV_POWERSAVE_AMOR(r1)
-	mtspr	SPRN_AMOR, r7
-END_FTR_SECTION_NESTED_IFSET(CPU_FTR_HVMODE, 42)
-	/*
-	 * We don't need an isync here after restoring IAMR because the upcoming
-	 * mtmsrd is execution synchronizing.
-	 */
-END_FTR_SECTION_IFSET(CPU_FTR_ARCH_207S)
-
-	ld	r4,PACAKMSR(r13)
-	ld	r5,_LINK(r1)
-	ld	r6,_CCR(r1)
-	addi	r1,r1,INT_FRAME_SIZE
-	mtlr	r5
-	mtcr	r6
-	mtmsrd	r4
-	blr
+_GLOBAL(isa206_idle_insn_mayloss)
+	std	r1,PACAR1(r13)
+	mflr	r4
+	mfcr	r5
+	/* use stack red zone rather than a new frame for saving regs */
+	std	r2,-8*0(r1)
+	std	r14,-8*1(r1)
+	std	r15,-8*2(r1)
+	std	r16,-8*3(r1)
+	std	r17,-8*4(r1)
+	std	r18,-8*5(r1)
+	std	r19,-8*6(r1)
+	std	r20,-8*7(r1)
+	std	r21,-8*8(r1)
+	std	r22,-8*9(r1)
+	std	r23,-8*10(r1)
+	std	r24,-8*11(r1)
+	std	r25,-8*12(r1)
+	std	r26,-8*13(r1)
+	std	r27,-8*14(r1)
+	std	r28,-8*15(r1)
+	std	r29,-8*16(r1)
+	std	r30,-8*17(r1)
+	std	r31,-8*18(r1)
+	std	r4,-8*19(r1)
+	std	r5,-8*20(r1)
+	cmpwi	r3,PNV_THREAD_NAP
+	bne	1f
+	IDLE_STATE_ENTER_SEQ_NORET(PPC_NAP)
+1:	cmpwi	r3,PNV_THREAD_SLEEP
+	bne	2f
+	IDLE_STATE_ENTER_SEQ_NORET(PPC_SLEEP)
+2:	IDLE_STATE_ENTER_SEQ_NORET(PPC_WINKLE)
 
-/*
- * R3 here contains the value that will be returned to the caller
- * of power7_nap.
- * R12 contains SRR1 for CHECK_HMI_INTERRUPT.
- */
-pnv_wakeup_noloss:
-	lbz	r0,PACA_NAPSTATELOST(r13)
-	cmpwi	r0,0
-	bne	pnv_wakeup_loss
-	ld	r1,PACAR1(r13)
-BEGIN_FTR_SECTION
-	CHECK_HMI_INTERRUPT
-END_FTR_SECTION_IFSET(CPU_FTR_HVMODE)
-	ld	r4,PACAKMSR(r13)
-	ld	r5,_NIP(r1)
-	ld	r6,_CCR(r1)
-	addi	r1,r1,INT_FRAME_SIZE
-	mtlr	r5
-	mtcr	r6
-	mtmsrd	r4
-	blr
diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
index 1729bf409562..70dc10aa0ccf 100644
--- a/arch/powerpc/kernel/setup-common.c
+++ b/arch/powerpc/kernel/setup-common.c
@@ -401,8 +401,8 @@ void __init check_for_initrd(void)
 
 #ifdef CONFIG_SMP
 
-int threads_per_core, threads_per_subcore, threads_shift;
-cpumask_t threads_core_mask;
+int threads_per_core, threads_per_subcore, threads_shift __read_mostly;
+cpumask_t threads_core_mask __read_mostly;
 EXPORT_SYMBOL_GPL(threads_per_core);
 EXPORT_SYMBOL_GPL(threads_per_subcore);
 EXPORT_SYMBOL_GPL(threads_shift);
diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
index 3a5e719ef032..58d0f1ba845d 100644
--- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
+++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
@@ -448,8 +448,10 @@ kvm_no_guest:
 	rlwimi	r4, r3, 0, LPCR_PECE0 | LPCR_PECE1
 	mtspr	SPRN_LPCR, r4
 	li	r3, 0
-	mfspr	r12,SPRN_SRR1
-	b	pnv_wakeup_loss
+	/* set up cr3 and r3 for return */
+	cmpdi	cr3, r3, 0
+	mfspr	r3,SPRN_SRR1
+	b	idle_return_gpr_loss
 
 53:	HMT_LOW
 	ld	r5, HSTATE_KVM_VCORE(r13)
diff --git a/arch/powerpc/platforms/powernv/idle.c b/arch/powerpc/platforms/powernv/idle.c
index e52f9b06dd9c..182112fd845a 100644
--- a/arch/powerpc/platforms/powernv/idle.c
+++ b/arch/powerpc/platforms/powernv/idle.c
@@ -16,6 +16,7 @@
 #include <linux/device.h>
 #include <linux/cpu.h>
 
+#include <asm/asm-prototypes.h>
 #include <asm/firmware.h>
 #include <asm/machdep.h>
 #include <asm/opal.h>
@@ -48,10 +49,10 @@ static u64 pnv_default_stop_mask;
 static bool default_stop_found;
 
 /*
- * First deep stop state. Used to figure out when to save/restore
- * hypervisor context.
+ * First stop state levels when SPR and TB loss can occur.
  */
-u64 pnv_first_deep_stop_state = MAX_STOP_STATE;
+static u64 pnv_first_tb_loss_level = MAX_STOP_STATE + 1;
+static u64 pnv_first_spr_loss_level = MAX_STOP_STATE + 1;
 
 /*
  * psscr value and mask of the deepest stop idle state.
@@ -62,6 +63,8 @@ static u64 pnv_deepest_stop_psscr_mask;
 static u64 pnv_deepest_stop_flag;
 static bool deepest_stop_found;
 
+static unsigned long power7_offline_type;
+
 static int pnv_save_sprs_for_deep_states(void)
 {
 	int cpu;
@@ -72,12 +75,12 @@ static int pnv_save_sprs_for_deep_states(void)
 	 * all cpus at boot. Get these reg values of current cpu and use the
 	 * same across all cpus.
 	 */
-	uint64_t lpcr_val = mfspr(SPRN_LPCR);
-	uint64_t hid0_val = mfspr(SPRN_HID0);
-	uint64_t hid1_val = mfspr(SPRN_HID1);
-	uint64_t hid4_val = mfspr(SPRN_HID4);
-	uint64_t hid5_val = mfspr(SPRN_HID5);
-	uint64_t hmeer_val = mfspr(SPRN_HMEER);
+	uint64_t lpcr_val	= mfspr(SPRN_LPCR);
+	uint64_t hid0_val	= mfspr(SPRN_HID0);
+	uint64_t hid1_val	= mfspr(SPRN_HID1);
+	uint64_t hid4_val	= mfspr(SPRN_HID4);
+	uint64_t hid5_val	= mfspr(SPRN_HID5);
+	uint64_t hmeer_val	= mfspr(SPRN_HMEER);
 	uint64_t msr_val = MSR_IDLE;
 	uint64_t psscr_val = pnv_deepest_stop_psscr_val;
 
@@ -137,89 +140,6 @@ static int pnv_save_sprs_for_deep_states(void)
 	return 0;
 }
 
-static void pnv_alloc_idle_core_states(void)
-{
-	int i, j;
-	int nr_cores = cpu_nr_cores();
-	u32 *core_idle_state;
-
-	/*
-	 * core_idle_state - The lower 8 bits track the idle state of
-	 * each thread of the core.
-	 *
-	 * The most significant bit is the lock bit.
-	 *
-	 * Initially all the bits corresponding to threads_per_core
-	 * are set. They are cleared when the thread enters deep idle
-	 * state like sleep and winkle/stop.
-	 *
-	 * Initially the lock bit is cleared.  The lock bit has 2
-	 * purposes:
-	 * 	a. While the first thread in the core waking up from
-	 * 	   idle is restoring core state, it prevents other
-	 * 	   threads in the core from switching to process
-	 * 	   context.
-	 * 	b. While the last thread in the core is saving the
-	 *	   core state, it prevents a different thread from
-	 *	   waking up.
-	 */
-	for (i = 0; i < nr_cores; i++) {
-		int first_cpu = i * threads_per_core;
-		int node = cpu_to_node(first_cpu);
-		size_t paca_ptr_array_size;
-
-		core_idle_state = kmalloc_node(sizeof(u32), GFP_KERNEL, node);
-		*core_idle_state = (1 << threads_per_core) - 1;
-		paca_ptr_array_size = (threads_per_core *
-				       sizeof(struct paca_struct *));
-
-		for (j = 0; j < threads_per_core; j++) {
-			int cpu = first_cpu + j;
-
-			paca_ptrs[cpu]->core_idle_state_ptr = core_idle_state;
-			paca_ptrs[cpu]->thread_idle_state = PNV_THREAD_RUNNING;
-			paca_ptrs[cpu]->thread_mask = 1 << j;
-		}
-	}
-
-	update_subcore_sibling_mask();
-
-	if (supported_cpuidle_states & OPAL_PM_LOSE_FULL_CONTEXT) {
-		int rc = pnv_save_sprs_for_deep_states();
-
-		if (likely(!rc))
-			return;
-
-		/*
-		 * The stop-api is unable to restore hypervisor
-		 * resources on wakeup from platform idle states which
-		 * lose full context. So disable such states.
-		 */
-		supported_cpuidle_states &= ~OPAL_PM_LOSE_FULL_CONTEXT;
-		pr_warn("cpuidle-powernv: Disabling idle states that lose full context\n");
-		pr_warn("cpuidle-powernv: Idle power-savings, CPU-Hotplug affected\n");
-
-		if (cpu_has_feature(CPU_FTR_ARCH_300) &&
-		    (pnv_deepest_stop_flag & OPAL_PM_LOSE_FULL_CONTEXT)) {
-			/*
-			 * Use the default stop state for CPU-Hotplug
-			 * if available.
-			 */
-			if (default_stop_found) {
-				pnv_deepest_stop_psscr_val =
-					pnv_default_stop_val;
-				pnv_deepest_stop_psscr_mask =
-					pnv_default_stop_mask;
-				pr_warn("cpuidle-powernv: Offlined CPUs will stop with psscr = 0x%016llx\n",
-					pnv_deepest_stop_psscr_val);
-			} else { /* Fallback to snooze loop for CPU-Hotplug */
-				deepest_stop_found = false;
-				pr_warn("cpuidle-powernv: Offlined CPUs will busy wait\n");
-			}
-		}
-	}
-}
-
 u32 pnv_get_supported_cpuidle_states(void)
 {
 	return supported_cpuidle_states;
@@ -238,6 +158,9 @@ static void pnv_fastsleep_workaround_apply(void *info)
 		*err = 1;
 }
 
+static bool power7_fastsleep_workaround_entry = true;
+static bool power7_fastsleep_workaround_exit = true;
+
 /*
  * Used to store fastsleep workaround state
  * 0 - Workaround applied/undone at fastsleep entry/exit path (Default)
@@ -269,21 +192,15 @@ static ssize_t store_fastsleep_workaround_applyonce(struct device *dev,
 	 * fastsleep_workaround_applyonce = 1 implies
 	 * fastsleep workaround needs to be left in 'applied' state on all
 	 * the cores. Do this by-
-	 * 1. Patching out the call to 'undo' workaround in fastsleep exit path
-	 * 2. Sending ipi to all the cores which have at least one online thread
-	 * 3. Patching out the call to 'apply' workaround in fastsleep entry
-	 * path
+	 * 1. Disable the 'undo' workaround in fastsleep exit path
+	 * 2. Sendi IPIs to all the cores which have at least one online thread
+	 * 3. Disable the 'apply' workaround in fastsleep entry path
+	 *
 	 * There is no need to send ipi to cores which have all threads
 	 * offlined, as last thread of the core entering fastsleep or deeper
 	 * state would have applied workaround.
 	 */
-	err = patch_instruction(
-		(unsigned int *)pnv_fastsleep_workaround_at_exit,
-		PPC_INST_NOP);
-	if (err) {
-		pr_err("fastsleep_workaround_applyonce change failed while patching pnv_fastsleep_workaround_at_exit");
-		goto fail;
-	}
+	power7_fastsleep_workaround_exit = false;
 
 	get_online_cpus();
 	primary_thread_mask = cpu_online_cores_map();
@@ -296,13 +213,7 @@ static ssize_t store_fastsleep_workaround_applyonce(struct device *dev,
 		goto fail;
 	}
 
-	err = patch_instruction(
-		(unsigned int *)pnv_fastsleep_workaround_at_entry,
-		PPC_INST_NOP);
-	if (err) {
-		pr_err("fastsleep_workaround_applyonce change failed while patching pnv_fastsleep_workaround_at_entry");
-		goto fail;
-	}
+	power7_fastsleep_workaround_entry = false;
 
 	fastsleep_workaround_applyonce = 1;
 
@@ -315,27 +226,336 @@ static DEVICE_ATTR(fastsleep_workaround_applyonce, 0600,
 			show_fastsleep_workaround_applyonce,
 			store_fastsleep_workaround_applyonce);
 
-static unsigned long __power7_idle_type(unsigned long type)
+static inline void atomic_start_thread_idle(void)
 {
+	int cpu = raw_smp_processor_id();
+	int first = cpu_first_thread_sibling(cpu);
+	int thread_nr = cpu_thread_in_core(cpu);
+	unsigned long *state = &paca_ptrs[first]->idle_state;
+
+	clear_bit(thread_nr, state);
+}
+
+static inline void atomic_stop_thread_idle(void)
+{
+	int cpu = raw_smp_processor_id();
+	int first = cpu_first_thread_sibling(cpu);
+	int thread_nr = cpu_thread_in_core(cpu);
+	unsigned long *state = &paca_ptrs[first]->idle_state;
+
+	set_bit(thread_nr, state);
+}
+
+static inline void atomic_lock_thread_idle(void)
+{
+	int cpu = raw_smp_processor_id();
+	int first = cpu_first_thread_sibling(cpu);
+	unsigned long *state = &paca_ptrs[first]->idle_state;
+
+	while (unlikely(test_and_set_bit_lock(NR_PNV_CORE_IDLE_LOCK_BIT, state)))
+		barrier();
+}
+
+static inline void atomic_unlock_and_stop_thread_idle(void)
+{
+	int cpu = raw_smp_processor_id();
+	int first = cpu_first_thread_sibling(cpu);
+	unsigned long thread = 1UL << cpu_thread_in_core(cpu);
+	unsigned long *state = &paca_ptrs[first]->idle_state;
+	u64 s = READ_ONCE(*state);
+	u64 new, tmp;
+
+	BUG_ON(!(s & PNV_CORE_IDLE_LOCK_BIT));
+	BUG_ON(s & thread);
+
+again:
+	new = (s | thread) & ~PNV_CORE_IDLE_LOCK_BIT;
+	tmp = cmpxchg(state, s, new);
+	if (unlikely(tmp != s)) {
+		s = tmp;
+		goto again;
+	}
+}
+
+static inline void atomic_unlock_thread_idle(void)
+{
+	int cpu = raw_smp_processor_id();
+	int first = cpu_first_thread_sibling(cpu);
+	unsigned long *state = &paca_ptrs[first]->idle_state;
+
+	BUG_ON(!test_bit(NR_PNV_CORE_IDLE_LOCK_BIT, state));
+	clear_bit_unlock(NR_PNV_CORE_IDLE_LOCK_BIT, state);
+}
+
+/* P7 and P8 */
+struct p7_sprs {
+	/* per core */
+	u64 tscr;
+	u64 worc;
+
+	/* per subcore */
+	u64 sdr1;
+	u64 rpr;
+
+	/* per thread */
+	u64 lpcr;
+	u64 hfscr;
+	u64 fscr;
+	u64 purr;
+	u64 spurr;
+	u64 dscr;
+	u64 wort;
+
+	/* per thread SPRs that get lost in shallow states */
+	u64 amr;
+	u64 iamr;
+	u64 amor;
+	u64 uamor;
+};
+
+static unsigned long power7_idle_insn(unsigned long type)
+{
+	int cpu = raw_smp_processor_id();
+	int first = cpu_first_thread_sibling(cpu);
+	unsigned long *state = &paca_ptrs[first]->idle_state;
+	unsigned long thread = 1UL << cpu_thread_in_core(cpu);
+	unsigned long core_thread_mask = (1UL << threads_per_core) - 1;
 	unsigned long srr1;
+	bool full_winkle;
+	struct p7_sprs sprs = {}; /* avoid false use-uninitialised */
+	bool sprs_saved = false;
+	int rc;
 
-	if (!prep_irq_for_idle_irqsoff())
-		return 0;
+	if (unlikely(type != PNV_THREAD_NAP)) {
+		atomic_lock_thread_idle();
+
+		BUG_ON(!(*state & thread));
+		*state &= ~thread;
+
+		if (power7_fastsleep_workaround_entry) {
+			if ((*state & core_thread_mask) == 0) {
+				rc = opal_config_cpu_idle_state(
+						OPAL_CONFIG_IDLE_FASTSLEEP,
+						OPAL_CONFIG_IDLE_APPLY);
+				BUG_ON(rc);
+			}
+		}
+
+		if (type == PNV_THREAD_WINKLE) {
+			sprs.tscr	= mfspr(SPRN_TSCR);
+			sprs.worc	= mfspr(SPRN_WORC);
+
+			sprs.sdr1	= mfspr(SPRN_SDR1);
+			sprs.rpr	= mfspr(SPRN_RPR);
+
+			sprs.lpcr	= mfspr(SPRN_LPCR);
+			if (cpu_has_feature(CPU_FTR_ARCH_207S)) {
+				sprs.hfscr	= mfspr(SPRN_HFSCR);
+				sprs.fscr	= mfspr(SPRN_FSCR);
+			}
+			sprs.purr	= mfspr(SPRN_PURR);
+			sprs.spurr	= mfspr(SPRN_SPURR);
+			sprs.dscr	= mfspr(SPRN_DSCR);
+			sprs.wort	= mfspr(SPRN_WORT);
+
+			sprs_saved = true;
+
+			/*
+			 * Increment winkle counter and set all winkle bits if
+			 * all threads are winkling. This allows wakeup side to
+			 * distinguish between fast sleep and winkle state
+			 * loss. Fast sleep still has to resync the timebase so
+			 * this may not be a really big win.
+			 */
+			*state += 1 << PNV_CORE_IDLE_WINKLE_COUNT_SHIFT;
+			if ((*state & PNV_CORE_IDLE_WINKLE_COUNT_BITS)
+					>> PNV_CORE_IDLE_WINKLE_COUNT_SHIFT
+					== threads_per_core)
+				*state |= PNV_CORE_IDLE_THREAD_WINKLE_BITS;
+			WARN_ON((*state & PNV_CORE_IDLE_WINKLE_COUNT_BITS) == 0);
+		}
+
+		atomic_unlock_thread_idle();
+	}
+
+	if (cpu_has_feature(CPU_FTR_ARCH_207S)) {
+		sprs.amr	= mfspr(SPRN_AMR);
+		sprs.iamr	= mfspr(SPRN_IAMR);
+		sprs.amor	= mfspr(SPRN_AMOR);
+		sprs.uamor	= mfspr(SPRN_UAMOR);
+	}
+
+	local_paca->thread_idle_state = type;
+	srr1 = isa206_idle_insn_mayloss(type);		/* go idle */
+	local_paca->thread_idle_state = PNV_THREAD_RUNNING;
+
+	WARN_ON_ONCE(!srr1);
+	WARN_ON_ONCE(mfmsr() & (MSR_IR|MSR_DR));
+
+	if (cpu_has_feature(CPU_FTR_ARCH_207S)) {
+		if ((srr1 & SRR1_WAKESTATE) != SRR1_WS_NOLOSS) {
+			/*
+			 * We don't need an isync after the mtsprs here because
+			 * the upcoming mtmsrd is execution synchronizing.
+			 */
+			mtspr(SPRN_AMR,		sprs.amr);
+			mtspr(SPRN_IAMR,	sprs.iamr);
+			mtspr(SPRN_AMOR,	sprs.amor);
+			mtspr(SPRN_UAMOR,	sprs.uamor);
+		}
+	}
+
+	if (unlikely((srr1 & SRR1_WAKEMASK_P8) == SRR1_WAKEHMI))
+		hmi_exception_realmode(NULL);
+
+	if (likely((srr1 & SRR1_WAKESTATE) != SRR1_WS_HVLOSS)) {
+		if (unlikely(type != PNV_THREAD_NAP)) {
+			atomic_lock_thread_idle();
+			if (type == PNV_THREAD_WINKLE) {
+				WARN_ON((*state & PNV_CORE_IDLE_WINKLE_COUNT_BITS) == 0);
+				*state -= 1 << PNV_CORE_IDLE_WINKLE_COUNT_SHIFT;
+				*state &= ~(thread << PNV_CORE_IDLE_THREAD_WINKLE_BITS_SHIFT);
+			}
+			atomic_unlock_and_stop_thread_idle();
+		}
+		return srr1;
+	}
+
+	/* HV state loss */
+	BUG_ON(type == PNV_THREAD_NAP);
+
+	atomic_lock_thread_idle();
+
+	full_winkle = false;
+	if (type == PNV_THREAD_WINKLE) {
+		WARN_ON((*state & PNV_CORE_IDLE_WINKLE_COUNT_BITS) == 0);
+		*state -= 1 << PNV_CORE_IDLE_WINKLE_COUNT_SHIFT;
+		if (*state & (thread << PNV_CORE_IDLE_THREAD_WINKLE_BITS_SHIFT)) {
+			*state &= ~(thread << PNV_CORE_IDLE_THREAD_WINKLE_BITS_SHIFT);
+			full_winkle = true;
+			BUG_ON(!sprs_saved);
+		}
+	}
+
+	WARN_ON(*state & thread);
+
+	if ((*state & core_thread_mask) != 0)
+		goto core_woken;
+
+	/* Per-core SPRs */
+	if (full_winkle) {
+		mtspr(SPRN_TSCR,	sprs.tscr);
+		mtspr(SPRN_WORC,	sprs.worc);
+	}
+
+	if (power7_fastsleep_workaround_exit) {
+		rc = opal_config_cpu_idle_state(OPAL_CONFIG_IDLE_FASTSLEEP,
+						OPAL_CONFIG_IDLE_UNDO);
+		BUG_ON(rc);
+	}
+
+	/* TB */
+	if (opal_resync_timebase() != OPAL_SUCCESS)
+		BUG();
+
+core_woken:
+	if (!full_winkle)
+		goto subcore_woken;
+
+	if ((*state & local_paca->subcore_sibling_mask) != 0)
+		goto subcore_woken;
+
+	/* Per-subcore SPRs */
+	mtspr(SPRN_SDR1,	sprs.sdr1);
+	mtspr(SPRN_RPR,		sprs.rpr);
+
+subcore_woken:
+	/*
+	 * isync after restoring shared SPRs and before unlocking. Unlock
+	 * only contains hwsync which does not necessarily do the right
+	 * thing for SPRs.
+	 */
+	isync();
+	atomic_unlock_and_stop_thread_idle();
+
+	/* Fast sleep does not lose SPRs */
+	if (!full_winkle)
+		return srr1;
+
+	/* Per-thread SPRs */
+	mtspr(SPRN_LPCR,	sprs.lpcr);
+	if (cpu_has_feature(CPU_FTR_ARCH_207S)) {
+		mtspr(SPRN_HFSCR,	sprs.hfscr);
+		mtspr(SPRN_FSCR,	sprs.fscr);
+	}
+	mtspr(SPRN_PURR,	sprs.purr);
+	mtspr(SPRN_SPURR,	sprs.spurr);
+	mtspr(SPRN_DSCR,	sprs.dscr);
+	mtspr(SPRN_WORT,	sprs.wort);
+
+	mtspr(SPRN_SPRG3,	local_paca->sprg_vdso);
+
+	/*
+	 * The SLB has to be restored here, but it sometimes still
+	 * contains entries, so the __ variant must be used to prevent
+	 * multi hits.
+	 */
+	__slb_restore_bolted_realmode();
+
+	return srr1;
+}
+
+#ifdef CONFIG_HOTPLUG_CPU
+static unsigned long power7_offline(void)
+{
+	unsigned long srr1;
+
+	mtmsr(MSR_IDLE);
+
+#ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
+	/* Tell KVM we're entering idle. */
+	/******************************************************/
+	/*  N O T E   W E L L    ! ! !    N O T E   W E L L   */
+	/* The following store to HSTATE_HWTHREAD_STATE(r13)  */
+	/* MUST occur in real mode, i.e. with the MMU off,    */
+	/* and the MMU must stay off until we clear this flag */
+	/* and test HSTATE_HWTHREAD_REQ(r13) in               */
+	/* pnv_powersave_wakeup in this file.                 */
+	/* The reason is that another thread can switch the   */
+	/* MMU to a guest context whenever this flag is set   */
+	/* to KVM_HWTHREAD_IN_IDLE, and if the MMU was on,    */
+	/* that would potentially cause this thread to start  */
+	/* executing instructions from guest memory in        */
+	/* hypervisor mode, leading to a host crash or data   */
+	/* corruption, or worse.                              */
+	/******************************************************/
+	local_paca->kvm_hstate.hwthread_state = KVM_HWTHREAD_IN_IDLE;
+#endif
 
 	__ppc64_runlatch_off();
-	srr1 = power7_idle_insn(type);
+	srr1 = power7_idle_insn(power7_offline_type);
 	__ppc64_runlatch_on();
 
-	fini_irq_for_idle_irqsoff();
+	mtmsr(MSR_KERNEL);
 
 	return srr1;
 }
+#endif
 
 void power7_idle_type(unsigned long type)
 {
 	unsigned long srr1;
 
-	srr1 = __power7_idle_type(type);
+	if (!prep_irq_for_idle_irqsoff())
+		return;
+
+	mtmsr(MSR_IDLE);
+	__ppc64_runlatch_off();
+	srr1 = power7_idle_insn(type);
+	__ppc64_runlatch_on();
+	mtmsr(MSR_KERNEL);
+
+	fini_irq_for_idle_irqsoff();
 	irq_set_pending_from_srr1(srr1);
 }
 
@@ -347,33 +567,287 @@ void power7_idle(void)
 	power7_idle_type(PNV_THREAD_NAP);
 }
 
-static unsigned long __power9_idle_type(unsigned long stop_psscr_val,
-				      unsigned long stop_psscr_mask)
+struct p9_sprs {
+	/* per core */
+	u64 ptcr;
+	u64 rpr;
+	u64 tscr;
+	u64 ldbar;
+
+	/* per thread */
+	u64 lpcr;
+	u64 hfscr;
+	u64 fscr;
+	u64 pid;
+	u64 purr;
+	u64 spurr;
+	u64 dscr;
+	u64 wort;
+
+	u64 mmcra;
+	u32 mmcr0;
+	u32 mmcr1;
+	u64 mmcr2;
+
+	/* per thread SPRs that get lost in shallow states */
+	u64 amr;
+	u64 iamr;
+	u64 amor;
+	u64 uamor;
+};
+
+static unsigned long power9_idle_stop(unsigned long psscr, bool mmu_on)
 {
-	unsigned long psscr;
+	int cpu = raw_smp_processor_id();
+	int first = cpu_first_thread_sibling(cpu);
+	unsigned long *state = &paca_ptrs[first]->idle_state;
+	unsigned long core_thread_mask = (1UL << threads_per_core) - 1;
 	unsigned long srr1;
+	unsigned long pls;
+	unsigned long mmcr0 = 0;
+	struct p9_sprs sprs = {}; /* avoid false used-uninitialised */
+	bool sprs_saved = false;
 
-	if (!prep_irq_for_idle_irqsoff())
-		return 0;
+	if (!(psscr & (PSSCR_EC|PSSCR_ESL))) {
+		/* EC=ESL=0 case */
+
+		BUG_ON(!mmu_on);
+
+		/*
+		 * Wake synchronously. SRESET via xscom may still cause
+		 * a 0x100 powersave wakeup with SRR1 reason!
+		 */
+		srr1 = isa300_idle_stop_noloss(psscr);		/* go idle */
+		if (likely(!srr1))
+			return 0;
+
+		/*
+		 * Registers not saved, can't recover!
+		 * This would be a hardware bug
+		 */
+		BUG_ON((srr1 & SRR1_WAKESTATE) != SRR1_WS_NOLOSS);
+
+		goto out;
+	}
+
+	/* EC=ESL=1 case */
+#ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
+	if (cpu_has_feature(CPU_FTR_P9_TM_XER_SO_BUG)) {
+		local_paca->requested_psscr = psscr;
+		/* order setting requested_psscr vs testing dont_stop */
+		smp_mb();
+		if (atomic_read(&local_paca->dont_stop)) {
+			local_paca->requested_psscr = 0;
+			return 0;
+		}
+	}
+#endif
+
+	if (!cpu_has_feature(CPU_FTR_POWER9_DD2_1)) {
+		 /*
+		  * POWER9 DD2 can incorrectly set PMAO when waking up
+		  * after a state-loss idle. Saving and restoring MMCR0
+		  * over idle is a workaround.
+		  */
+		mmcr0		= mfspr(SPRN_MMCR0);
+	}
+	if ((psscr & PSSCR_RL_MASK) >= pnv_first_spr_loss_level) {
+		sprs.lpcr	= mfspr(SPRN_LPCR);
+		sprs.hfscr	= mfspr(SPRN_HFSCR);
+		sprs.fscr	= mfspr(SPRN_FSCR);
+		sprs.pid	= mfspr(SPRN_PID);
+		sprs.purr	= mfspr(SPRN_PURR);
+		sprs.spurr	= mfspr(SPRN_SPURR);
+		sprs.dscr	= mfspr(SPRN_DSCR);
+		sprs.wort	= mfspr(SPRN_WORT);
+
+		sprs.mmcra	= mfspr(SPRN_MMCRA);
+		sprs.mmcr0	= mfspr(SPRN_MMCR0);
+		sprs.mmcr1	= mfspr(SPRN_MMCR1);
+		sprs.mmcr2	= mfspr(SPRN_MMCR2);
+
+		sprs.ptcr	= mfspr(SPRN_PTCR);
+		sprs.rpr	= mfspr(SPRN_RPR);
+		sprs.tscr	= mfspr(SPRN_TSCR);
+		sprs.ldbar	= mfspr(SPRN_LDBAR);
+
+		sprs_saved = true;
+
+		atomic_start_thread_idle();
+	}
+
+	sprs.amr	= mfspr(SPRN_AMR);
+	sprs.iamr	= mfspr(SPRN_IAMR);
+	sprs.amor	= mfspr(SPRN_AMOR);
+	sprs.uamor	= mfspr(SPRN_UAMOR);
+
+	srr1 = isa300_idle_stop_mayloss(psscr);		/* go idle */
+
+#ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
+	local_paca->requested_psscr = 0;
+#endif
 
 	psscr = mfspr(SPRN_PSSCR);
-	psscr = (psscr & ~stop_psscr_mask) | stop_psscr_val;
 
+	WARN_ON_ONCE(!srr1);
+	WARN_ON_ONCE(mfmsr() & (MSR_IR|MSR_DR));
+
+	if ((srr1 & SRR1_WAKESTATE) != SRR1_WS_NOLOSS) {
+		unsigned long mmcra;
+
+		/*
+		 * We don't need an isync after the mtsprs here because the
+		 * upcoming mtmsrd is execution synchronizing.
+		 */
+		mtspr(SPRN_AMR,		sprs.amr);
+		mtspr(SPRN_IAMR,	sprs.iamr);
+		mtspr(SPRN_AMOR,	sprs.amor);
+		mtspr(SPRN_UAMOR,	sprs.uamor);
+
+		/*
+		 * Workaround for POWER9 DD2.0, if we lost resources, the ERAT
+		 * might have been corrupted and needs flushing. We also need
+		 * to reload MMCR0 (see mmcr0 comment above).
+		 */
+		if (!cpu_has_feature(CPU_FTR_POWER9_DD2_1)) {
+			asm volatile(PPC_INVALIDATE_ERAT);
+			mtspr(SPRN_MMCR0, mmcr0);
+		}
+
+		/*
+		 * DD2.2 and earlier need to set then clear bit 60 in MMCRA
+		 * to ensure the PMU starts running.
+		 */
+		mmcra = mfspr(SPRN_MMCRA);
+		mmcra |= PPC_BIT(60);
+		mtspr(SPRN_MMCRA, mmcra);
+		mmcra &= ~PPC_BIT(60);
+		mtspr(SPRN_MMCRA, mmcra);
+	}
+
+	if (unlikely((srr1 & SRR1_WAKEMASK_P8) == SRR1_WAKEHMI))
+		hmi_exception_realmode(NULL);
+
+	/*
+	 * On POWER9, SRR1 bits do not match exactly as expected.
+	 * SRR1_WS_GPRLOSS (10b) can also result in SPR loss, so
+	 * just always test PSSCR for SPR/TB state loss.
+	 */
+	pls = (psscr & PSSCR_PLS) >> PSSCR_PLS_SHIFT;
+	if (likely(pls < pnv_first_spr_loss_level)) {
+		if (sprs_saved)
+			atomic_stop_thread_idle();
+		goto out;
+	}
+
+	/* HV state loss */
+	BUG_ON(!sprs_saved);
+
+	atomic_lock_thread_idle();
+
+	if ((*state & core_thread_mask) != 0)
+		goto core_woken;
+
+	/* Per-core SPRs */
+	mtspr(SPRN_PTCR,	sprs.ptcr);
+	mtspr(SPRN_RPR,		sprs.rpr);
+	mtspr(SPRN_TSCR,	sprs.tscr);
+	mtspr(SPRN_LDBAR,	sprs.ldbar);
+
+	if (pls >= pnv_first_tb_loss_level) {
+		/* TB loss */
+		if (opal_resync_timebase() != OPAL_SUCCESS)
+			BUG();
+	}
+
+	/*
+	 * isync after restoring shared SPRs and before unlocking. Unlock
+	 * only contains hwsync which does not necessarily do the right
+	 * thing for SPRs.
+	 */
+	isync();
+
+core_woken:
+	atomic_unlock_and_stop_thread_idle();
+
+	/* Per-thread SPRs */
+	mtspr(SPRN_LPCR,	sprs.lpcr);
+	mtspr(SPRN_HFSCR,	sprs.hfscr);
+	mtspr(SPRN_FSCR,	sprs.fscr);
+	mtspr(SPRN_PID,		sprs.pid);
+	mtspr(SPRN_PURR,	sprs.purr);
+	mtspr(SPRN_SPURR,	sprs.spurr);
+	mtspr(SPRN_DSCR,	sprs.dscr);
+	mtspr(SPRN_WORT,	sprs.wort);
+
+	mtspr(SPRN_MMCRA,	sprs.mmcra);
+	mtspr(SPRN_MMCR0,	sprs.mmcr0);
+	mtspr(SPRN_MMCR1,	sprs.mmcr1);
+	mtspr(SPRN_MMCR2,	sprs.mmcr2);
+
+	mtspr(SPRN_SPRG3,	local_paca->sprg_vdso);
+
+	if (!radix_enabled())
+		__slb_restore_bolted_realmode();
+
+out:
+	if (mmu_on)
+		mtmsr(MSR_KERNEL);
+
+	return srr1;
+}
+
+#ifdef CONFIG_HOTPLUG_CPU
+static unsigned long power9_offline_stop(unsigned long psscr)
+{
+	unsigned long srr1;
+
+#ifndef CONFIG_KVM_BOOK3S_HV_POSSIBLE
 	__ppc64_runlatch_off();
-	srr1 = power9_idle_stop(psscr);
+	srr1 = power9_idle_stop(psscr, true);
 	__ppc64_runlatch_on();
+#else
+	/*
+	 * Tell KVM we're entering idle.
+	 * This does not have to be done in real mode because the P9 MMU
+	 * is independent per-thread. Some steppings share radix/hash mode
+	 * between threads, but in that case KVM has a barrier sync in real
+	 * mode before and after switching between radix and hash.
+	 *
+	 * kvm_start_guest must still be called in real mode though, hence
+	 * the false argument.
+	 */
+	local_paca->kvm_hstate.hwthread_state = KVM_HWTHREAD_IN_IDLE;
 
-	fini_irq_for_idle_irqsoff();
+	__ppc64_runlatch_off();
+	srr1 = power9_idle_stop(psscr, false);
+	__ppc64_runlatch_on();
+
+	mtmsr(MSR_KERNEL);
+#endif
 
 	return srr1;
 }
+#endif
 
 void power9_idle_type(unsigned long stop_psscr_val,
 				      unsigned long stop_psscr_mask)
 {
+	unsigned long psscr;
 	unsigned long srr1;
 
-	srr1 = __power9_idle_type(stop_psscr_val, stop_psscr_mask);
+	if (!prep_irq_for_idle_irqsoff())
+		return;
+
+	psscr = mfspr(SPRN_PSSCR);
+	psscr = (psscr & ~stop_psscr_mask) | stop_psscr_val;
+
+	__ppc64_runlatch_off();
+	srr1 = power9_idle_stop(psscr, true);
+	__ppc64_runlatch_on();
+
+	fini_irq_for_idle_irqsoff();
+
 	irq_set_pending_from_srr1(srr1);
 }
 
@@ -409,7 +883,7 @@ void pnv_power9_force_smt4_catch(void)
 			atomic_inc(&paca_ptrs[cpu0+thr]->dont_stop);
 	}
 	/* order setting dont_stop vs testing requested_psscr */
-	mb();
+	smp_mb();
 	for (thr = 0; thr < threads_per_core; ++thr) {
 		if (!paca_ptrs[cpu0+thr]->requested_psscr)
 			++awake_threads;
@@ -481,7 +955,6 @@ void pnv_program_cpu_hotplug_lpcr(unsigned int cpu, u64 lpcr_val)
 unsigned long pnv_cpu_offline(unsigned int cpu)
 {
 	unsigned long srr1;
-	u32 idle_states = pnv_get_supported_cpuidle_states();
 
 	__ppc64_runlatch_off();
 
@@ -492,15 +965,8 @@ unsigned long pnv_cpu_offline(unsigned int cpu)
 		psscr = (psscr & ~pnv_deepest_stop_psscr_mask) |
 						pnv_deepest_stop_psscr_val;
 		srr1 = power9_offline_stop(psscr);
-
-	} else if ((idle_states & OPAL_PM_WINKLE_ENABLED) &&
-		   (idle_states & OPAL_PM_LOSE_FULL_CONTEXT)) {
-		srr1 = power7_idle_insn(PNV_THREAD_WINKLE);
-	} else if ((idle_states & OPAL_PM_SLEEP_ENABLED) ||
-		   (idle_states & OPAL_PM_SLEEP_ENABLED_ER1)) {
-		srr1 = power7_idle_insn(PNV_THREAD_SLEEP);
-	} else if (idle_states & OPAL_PM_NAP_ENABLED) {
-		srr1 = power7_idle_insn(PNV_THREAD_NAP);
+	} else if (cpu_has_feature(CPU_FTR_ARCH_206) && power7_offline_type) {
+		srr1 = power7_offline();
 	} else {
 		/* This is the fallback method. We emulate snooze */
 		while (!generic_check_cpu_restart(cpu)) {
@@ -596,33 +1062,44 @@ int validate_psscr_val_mask(u64 *psscr_val, u64 *psscr_mask, u32 flags)
  * @dt_idle_states: Number of idle state entries
  * Returns 0 on success
  */
-static int __init pnv_power9_idle_init(void)
+static void __init pnv_power9_idle_init(void)
 {
 	u64 max_residency_ns = 0;
 	int i;
 
 	/*
-	 * Set pnv_first_deep_stop_state, pnv_deepest_stop_psscr_{val,mask},
-	 * and the pnv_default_stop_{val,mask}.
-	 *
-	 * pnv_first_deep_stop_state should be set to the first stop
-	 * level to cause hypervisor state loss.
-	 *
 	 * pnv_deepest_stop_{val,mask} should be set to values corresponding to
 	 * the deepest stop state.
 	 *
 	 * pnv_default_stop_{val,mask} should be set to values corresponding to
-	 * the shallowest (OPAL_PM_STOP_INST_FAST) loss-less stop state.
+	 * the deepest loss-less (OPAL_PM_STOP_INST_FAST) stop state.
 	 */
-	pnv_first_deep_stop_state = MAX_STOP_STATE;
+	pnv_first_tb_loss_level = MAX_STOP_STATE + 1;
+	pnv_first_spr_loss_level = MAX_STOP_STATE + 1;
 	for (i = 0; i < nr_pnv_idle_states; i++) {
 		int err;
 		struct pnv_idle_states_t *state = &pnv_idle_states[i];
 		u64 psscr_rl = state->psscr_val & PSSCR_RL_MASK;
 
+		if ((state->flags & OPAL_PM_TIMEBASE_STOP) &&
+		     (pnv_first_tb_loss_level > psscr_rl))
+			pnv_first_tb_loss_level = psscr_rl;
+
 		if ((state->flags & OPAL_PM_LOSE_FULL_CONTEXT) &&
-		    pnv_first_deep_stop_state > psscr_rl)
-			pnv_first_deep_stop_state = psscr_rl;
+		     (pnv_first_spr_loss_level > psscr_rl))
+			pnv_first_spr_loss_level = psscr_rl;
+
+		/*
+		 * The idle code does not deal with TB loss occurring
+		 * in a shallower state than SPR loss, so force it to
+		 * behave like SPRs are lost if TB is lost. POWER9 would
+		 * never encouter this, but a POWER8 core would if it
+		 * implemented the stop instruction. So this is for forward
+		 * compatibility.
+		 */
+		if ((state->flags & OPAL_PM_TIMEBASE_STOP) &&
+		     (pnv_first_spr_loss_level > psscr_rl))
+			pnv_first_spr_loss_level = psscr_rl;
 
 		err = validate_psscr_val_mask(&state->psscr_val,
 					      &state->psscr_mask,
@@ -647,6 +1124,7 @@ static int __init pnv_power9_idle_init(void)
 			pnv_default_stop_val = state->psscr_val;
 			pnv_default_stop_mask = state->psscr_mask;
 			default_stop_found = true;
+			WARN_ON(state->flags & OPAL_PM_LOSE_FULL_CONTEXT);
 		}
 	}
 
@@ -666,10 +1144,40 @@ static int __init pnv_power9_idle_init(void)
 			pnv_deepest_stop_psscr_mask);
 	}
 
-	pr_info("cpuidle-powernv: Requested Level (RL) value of first deep stop = 0x%llx\n",
-		pnv_first_deep_stop_state);
+	pr_info("cpuidle-powernv: First stop level that may lose SPRs = 0x%lld\n",
+		pnv_first_spr_loss_level);
 
-	return 0;
+	pr_info("cpuidle-powernv: First stop level that may lose timebase = 0x%lld\n",
+		pnv_first_tb_loss_level);
+}
+
+static void __init pnv_disable_deep_states(void)
+{
+	/*
+	 * The stop-api is unable to restore hypervisor
+	 * resources on wakeup from platform idle states which
+	 * lose full context. So disable such states.
+	 */
+	supported_cpuidle_states &= ~OPAL_PM_LOSE_FULL_CONTEXT;
+	pr_warn("cpuidle-powernv: Disabling idle states that lose full context\n");
+	pr_warn("cpuidle-powernv: Idle power-savings, CPU-Hotplug affected\n");
+
+	if (cpu_has_feature(CPU_FTR_ARCH_300) &&
+	    (pnv_deepest_stop_flag & OPAL_PM_LOSE_FULL_CONTEXT)) {
+		/*
+		 * Use the default stop state for CPU-Hotplug
+		 * if available.
+		 */
+		if (default_stop_found) {
+			pnv_deepest_stop_psscr_val = pnv_default_stop_val;
+			pnv_deepest_stop_psscr_mask = pnv_default_stop_mask;
+			pr_warn("cpuidle-powernv: Offlined CPUs will stop with psscr = 0x%016llx\n",
+				pnv_deepest_stop_psscr_val);
+		} else { /* Fallback to snooze loop for CPU-Hotplug */
+			deepest_stop_found = false;
+			pr_warn("cpuidle-powernv: Offlined CPUs will busy wait\n");
+		}
+	}
 }
 
 /*
@@ -684,10 +1192,8 @@ static void __init pnv_probe_idle_states(void)
 		return;
 	}
 
-	if (cpu_has_feature(CPU_FTR_ARCH_300)) {
-		if (pnv_power9_idle_init())
-			return;
-	}
+	if (cpu_has_feature(CPU_FTR_ARCH_300))
+		pnv_power9_idle_init();
 
 	for (i = 0; i < nr_pnv_idle_states; i++)
 		supported_cpuidle_states |= pnv_idle_states[i].flags;
@@ -807,11 +1313,33 @@ static int pnv_parse_cpuidle_dt(void)
 
 static int __init pnv_init_idle_states(void)
 {
+	int cpu;
 	int rc = 0;
-	supported_cpuidle_states = 0;
+
+	/* Set up PACA fields */
+	for_each_present_cpu(cpu) {
+		struct paca_struct *p = paca_ptrs[cpu];
+
+		p->idle_state = 0;
+		if (cpu == cpu_first_thread_sibling(cpu))
+			p->idle_state = (1 << threads_per_core) - 1;
+
+		if (!cpu_has_feature(CPU_FTR_ARCH_300)) {
+			/* P7/P8 nap */
+			p->thread_idle_state = PNV_THREAD_RUNNING;
+		} else {
+			/* P9 stop */
+#ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
+			p->requested_psscr = 0;
+			atomic_set(&p->dont_stop, 0);
+#endif
+		}
+	}
 
 	/* In case we error out nr_pnv_idle_states will be zero */
 	nr_pnv_idle_states = 0;
+	supported_cpuidle_states = 0;
+
 	if (cpuidle_disable != IDLE_NO_OVERRIDE)
 		goto out;
 	rc = pnv_parse_cpuidle_dt();
@@ -819,27 +1347,40 @@ static int __init pnv_init_idle_states(void)
 		return rc;
 	pnv_probe_idle_states();
 
-	if (!(supported_cpuidle_states & OPAL_PM_SLEEP_ENABLED_ER1)) {
-		patch_instruction(
-			(unsigned int *)pnv_fastsleep_workaround_at_entry,
-			PPC_INST_NOP);
-		patch_instruction(
-			(unsigned int *)pnv_fastsleep_workaround_at_exit,
-			PPC_INST_NOP);
-	} else {
-		/*
-		 * OPAL_PM_SLEEP_ENABLED_ER1 is set. It indicates that
-		 * workaround is needed to use fastsleep. Provide sysfs
-		 * control to choose how this workaround has to be applied.
-		 */
-		device_create_file(cpu_subsys.dev_root,
+	if (!cpu_has_feature(CPU_FTR_ARCH_300)) {
+		if (!(supported_cpuidle_states & OPAL_PM_SLEEP_ENABLED_ER1)) {
+			power7_fastsleep_workaround_entry = false;
+			power7_fastsleep_workaround_exit = false;
+		} else {
+			/*
+			 * OPAL_PM_SLEEP_ENABLED_ER1 is set. It indicates that
+			 * workaround is needed to use fastsleep. Provide sysfs
+			 * control to choose how this workaround has to be
+			 * applied.
+			 */
+			device_create_file(cpu_subsys.dev_root,
 				&dev_attr_fastsleep_workaround_applyonce);
-	}
+		}
+
+		update_subcore_sibling_mask();
+
+		if (supported_cpuidle_states & OPAL_PM_NAP_ENABLED) {
+			ppc_md.power_save = power7_idle;
+			power7_offline_type = PNV_THREAD_NAP;
+		}
 
-	pnv_alloc_idle_core_states();
+		if ((supported_cpuidle_states & OPAL_PM_WINKLE_ENABLED) &&
+			   (supported_cpuidle_states & OPAL_PM_LOSE_FULL_CONTEXT))
+			power7_offline_type = PNV_THREAD_WINKLE;
+		else if ((supported_cpuidle_states & OPAL_PM_SLEEP_ENABLED) ||
+			   (supported_cpuidle_states & OPAL_PM_SLEEP_ENABLED_ER1))
+			power7_offline_type = PNV_THREAD_SLEEP;
+	}
 
-	if (supported_cpuidle_states & OPAL_PM_NAP_ENABLED)
-		ppc_md.power_save = power7_idle;
+	if (supported_cpuidle_states & OPAL_PM_LOSE_FULL_CONTEXT) {
+		if (pnv_save_sprs_for_deep_states())
+			pnv_disable_deep_states();
+	}
 
 out:
 	return 0;
diff --git a/arch/powerpc/platforms/powernv/subcore.c b/arch/powerpc/platforms/powernv/subcore.c
index 45563004feda..1d7a9fd30dd1 100644
--- a/arch/powerpc/platforms/powernv/subcore.c
+++ b/arch/powerpc/platforms/powernv/subcore.c
@@ -183,7 +183,7 @@ static void unsplit_core(void)
 	cpu = smp_processor_id();
 	if (cpu_thread_in_core(cpu) != 0) {
 		while (mfspr(SPRN_HID0) & mask)
-			power7_idle_insn(PNV_THREAD_NAP);
+			power7_idle_type(PNV_THREAD_NAP);
 
 		per_cpu(split_state, cpu).step = SYNC_STEP_UNSPLIT;
 		return;
diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index a0f44f992360..77197110e900 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -2431,7 +2431,9 @@ static void dump_one_paca(int cpu)
 	DUMP(p, irq_happened, "%#-*x");
 	DUMP(p, io_sync, "%#-*x");
 	DUMP(p, irq_work_pending, "%#-*x");
+#ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
 	DUMP(p, nap_state_lost, "%#-*x");
+#endif
 	DUMP(p, sprg_vdso, "%#-*llx");
 
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
@@ -2439,19 +2441,16 @@ static void dump_one_paca(int cpu)
 #endif
 
 #ifdef CONFIG_PPC_POWERNV
-	DUMP(p, core_idle_state_ptr, "%-*px");
-	DUMP(p, thread_idle_state, "%#-*x");
-	DUMP(p, thread_mask, "%#-*x");
-	DUMP(p, subcore_sibling_mask, "%#-*x");
-	DUMP(p, requested_psscr, "%#-*llx");
-	DUMP(p, stop_sprs.pid, "%#-*llx");
-	DUMP(p, stop_sprs.ldbar, "%#-*llx");
-	DUMP(p, stop_sprs.fscr, "%#-*llx");
-	DUMP(p, stop_sprs.hfscr, "%#-*llx");
-	DUMP(p, stop_sprs.mmcr1, "%#-*llx");
-	DUMP(p, stop_sprs.mmcr2, "%#-*llx");
-	DUMP(p, stop_sprs.mmcra, "%#-*llx");
-	DUMP(p, dont_stop.counter, "%#-*x");
+	DUMP(p, idle_state, "%#-*lx");
+	if (!early_cpu_has_feature(CPU_FTR_ARCH_300)) {
+		DUMP(p, thread_idle_state, "%#-*x");
+		DUMP(p, subcore_sibling_mask, "%#-*x");
+	} else {
+#ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
+		DUMP(p, requested_psscr, "%#-*llx");
+		DUMP(p, dont_stop.counter, "%#-*x");
+#endif
+	}
 #endif
 
 	DUMP(p, accounting.utime, "%#-*lx");
-- 
2.20.1

