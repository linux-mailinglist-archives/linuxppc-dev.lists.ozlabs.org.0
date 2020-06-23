Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DB85E206898
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jun 2020 01:45:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49s2vY32FtzDqcT
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jun 2020 09:45:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::444;
 helo=mail-wr1-x444.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Hpd5aQz9; dkim-atps=neutral
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49s2qv5VlMzDqbc
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jun 2020 09:42:03 +1000 (AEST)
Received: by mail-wr1-x444.google.com with SMTP id l10so334275wrr.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jun 2020 16:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vwTtxUIw8cSbs0XUYNIHKiJjMS7jFEJvFUqUA8ohGCA=;
 b=Hpd5aQz9m7tR/wprHi4Kvr6jNyXcUsN+TTDy4r1tbO0ff0To3zpH5JBeU96e5AFUEe
 1Fg6w4D2RMjwQ3uSexjw7ysSyTD3JWxwXlySpJKpROCvY9X9/nNCM4SxoB/uOXO22swA
 A1xHpTaUyCUEkM8SDx9Dz85xCXaNaxvj9h1uYlrCBZBclOuBJ38xqE+XIxsH35TWQYEc
 qxSn9HXRq/YmcwpD7p9Zw5E8gYLCu0BkdcqBG6wF0ZMJVhzVoVK80IJxe+Ar5AiEvail
 TfQOlnmyVGy702nZDi2UgjKfD0A5bTKpp18v+j3+P08pgdubnLRoaESWBMQIsuHUduT3
 hTQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vwTtxUIw8cSbs0XUYNIHKiJjMS7jFEJvFUqUA8ohGCA=;
 b=bRiCvHz3fBqFD2hx7D1kEOZ7yngWC2UgF+tb/T/CUmbUF4bXBuqsC12Xe8fV94ihkr
 D6l4LqHwB2Eb/caIJIAtjf2PVxUEtbRR0p+hidqJus5ZRCrYxWMYRy+gZym/mfVHiHkS
 vUKCTqfTVC12lBQIfbrM5rtEVjNbszty5r42BS9qAtJTosXj5wugJHyKfvgCz7s8SIs5
 tkAYnjlcy4bNL3H/omCf0r0v66z61vhN+2HrI204/6k7BLT9iYSLpeSwADxb2n+UWDv7
 cRgyocg9tjHylSKGjtV/JLdKUT2tU6tKXAN7XRuxHYbxNb+a1J4eltllRke1F5IIUvab
 /KQQ==
X-Gm-Message-State: AOAM533lStZzGgMqmmQC8fUG5eusBu5e5UVAgIrdhZIP4KFL7oRApTQg
 ztF5V/9p0/4P6m70+XZyy6kGFMK4
X-Google-Smtp-Source: ABdhPJwwmfRrgPy4e8rMZamtvi0XjWzEAi5K3ChOHWxd1IqDroBe+Qf0KBBHQpHzwBeLB4oc4UOshw==
X-Received: by 2002:adf:ef89:: with SMTP id d9mr13925474wro.124.1592955719513; 
 Tue, 23 Jun 2020 16:41:59 -0700 (PDT)
Received: from bobo.ibm.com (61-68-186-125.tpgi.com.au. [61.68.186.125])
 by smtp.gmail.com with ESMTPSA id d63sm5878445wmc.22.2020.06.23.16.41.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2020 16:41:59 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/3] powerpc/64s: Fix restore_math unnecessarily changing MSR
Date: Wed, 24 Jun 2020 09:41:38 +1000
Message-Id: <20200623234139.2262227-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200623234139.2262227-1-npiggin@gmail.com>
References: <20200623234139.2262227-1-npiggin@gmail.com>
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
Cc: Anton Blanchard <anton@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>,
 Gustavo Romero <gromero@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Before returning to user, if there are missing FP/VEC/VSX bits from the
user MSR then those registers had been saved and must be restored again
before use. restore_math will decide whether to restore immediately, or
skip the restore and let fp/vec/vsx unavailable faults demand load the
registers.

Each time restore_math restores one of the FP/VSX or VEC register sets
is loaded, an 8-bit counter is incremented (load_fp and load_vec). When
these wrap to zero, restore_math no longer restores that register set
until after they are next demand faulted.

It's quite usual for those counters to have different values, so if one
wraps to zero and restore_math no longer restores its registers or user
MSR bit but the other is not zero yet does not need to be restored
(because the kernel is not frequently using the FPU), then restore_math
will be called and it will also not return in the early exit check.
This causes msr_check_and_set to test and set the MSR at every kernel
exit despite having no work to do.

This can cause workloads (e.g., a NULL syscall microbenchmark) to run
fast for a time while both counters are non-zero, then slow down when
one of the counters reaches zero, then speed up again after the second
counter reaches zero. The cost is significant, about 10% slowdown on a
NULL syscall benchmark, and the jittery behaviour is very undesirable.

Fix this by having restore_math test all conditions first, and only
update MSR if we will be loading registers.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/process.c    | 100 ++++++++++++++++++-------------
 arch/powerpc/kernel/syscall_64.c |   8 +++
 2 files changed, 68 insertions(+), 40 deletions(-)

diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index c6c1add91bf3..4f72aa4ed717 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -471,49 +471,58 @@ EXPORT_SYMBOL(giveup_all);
 
 #ifdef CONFIG_PPC_BOOK3S_64
 #ifdef CONFIG_PPC_FPU
-static int restore_fp(struct task_struct *tsk)
+static bool should_restore_fp(void)
 {
-	if (tsk->thread.load_fp) {
-		load_fp_state(&current->thread.fp_state);
+	if (current->thread.load_fp) {
 		current->thread.load_fp++;
-		return 1;
+		return true;
 	}
-	return 0;
+	return false;
+}
+
+static void do_restore_fp(void)
+{
+	load_fp_state(&current->thread.fp_state);
 }
 #else
-static int restore_fp(struct task_struct *tsk) { return 0; }
+static bool should_restore_fp(void) { return false; }
+static void do_restore_fp(void) { }
 #endif /* CONFIG_PPC_FPU */
 
 #ifdef CONFIG_ALTIVEC
-#define loadvec(thr) ((thr).load_vec)
-static int restore_altivec(struct task_struct *tsk)
+static bool should_restore_altivec(void)
 {
-	if (cpu_has_feature(CPU_FTR_ALTIVEC) && (tsk->thread.load_vec)) {
-		load_vr_state(&tsk->thread.vr_state);
-		tsk->thread.used_vr = 1;
-		tsk->thread.load_vec++;
-
-		return 1;
+	if (cpu_has_feature(CPU_FTR_ALTIVEC) && (current->thread.load_vec)) {
+		current->thread.load_vec++;
+		return true;
 	}
-	return 0;
+	return false;
+}
+
+static void do_restore_altivec(void)
+{
+	load_vr_state(&current->thread.vr_state);
+	current->thread.used_vr = 1;
 }
 #else
-#define loadvec(thr) 0
-static inline int restore_altivec(struct task_struct *tsk) { return 0; }
+static bool should_restore_altivec(void) { return false; }
+static void do_restore_altivec(void) { }
 #endif /* CONFIG_ALTIVEC */
 
 #ifdef CONFIG_VSX
-static int restore_vsx(struct task_struct *tsk)
+static bool should_restore_vsx(void)
 {
-	if (cpu_has_feature(CPU_FTR_VSX)) {
-		tsk->thread.used_vsr = 1;
-		return 1;
-	}
-
-	return 0;
+	if (cpu_has_feature(CPU_FTR_VSX))
+		return true;
+	return false;
+}
+static void do_restore_vsx(void)
+{
+	current->thread.used_vsr = 1;
 }
 #else
-static inline int restore_vsx(struct task_struct *tsk) { return 0; }
+static bool should_restore_vsx(void) { return false; }
+static void do_restore_vsx(void) { }
 #endif /* CONFIG_VSX */
 
 /*
@@ -529,31 +538,42 @@ static inline int restore_vsx(struct task_struct *tsk) { return 0; }
 void notrace restore_math(struct pt_regs *regs)
 {
 	unsigned long msr;
-
-	if (!current->thread.load_fp && !loadvec(current->thread))
-		return;
+	unsigned long new_msr = 0;
 
 	msr = regs->msr;
-	msr_check_and_set(msr_all_available);
 
 	/*
-	 * Only reload if the bit is not set in the user MSR, the bit BEING set
-	 * indicates that the registers are hot
+	 * new_msr tracks the facilities that are to be restored. Only reload
+	 * if the bit is not set in the user MSR (if it is set, the registers
+	 * are live for the user thread).
 	 */
-	if ((!(msr & MSR_FP)) && restore_fp(current))
-		msr |= MSR_FP | current->thread.fpexc_mode;
+	if ((!(msr & MSR_FP)) && should_restore_fp())
+		new_msr |= MSR_FP | current->thread.fpexc_mode;
 
-	if ((!(msr & MSR_VEC)) && restore_altivec(current))
-		msr |= MSR_VEC;
+	if ((!(msr & MSR_VEC)) && should_restore_altivec())
+		new_msr |= MSR_VEC;
 
-	if ((msr & (MSR_FP | MSR_VEC)) == (MSR_FP | MSR_VEC) &&
-			restore_vsx(current)) {
-		msr |= MSR_VSX;
+	if ((!(msr & MSR_VSX)) && should_restore_vsx()) {
+		if (((msr | new_msr) & (MSR_FP | MSR_VEC)) == (MSR_FP | MSR_VEC))
+			new_msr |= MSR_VSX;
 	}
 
-	msr_check_and_clear(msr_all_available);
+	if (new_msr) {
+		msr_check_and_set(new_msr);
+
+		if (new_msr & MSR_FP)
+			do_restore_fp();
+
+		if (new_msr & MSR_VEC)
+			do_restore_altivec();
 
-	regs->msr = msr;
+		if (new_msr & MSR_VSX)
+			do_restore_vsx();
+
+		msr_check_and_clear(new_msr);
+
+		regs->msr |= new_msr;
+	}
 }
 #endif
 
diff --git a/arch/powerpc/kernel/syscall_64.c b/arch/powerpc/kernel/syscall_64.c
index 79edba3ab312..5126f1d3184a 100644
--- a/arch/powerpc/kernel/syscall_64.c
+++ b/arch/powerpc/kernel/syscall_64.c
@@ -206,6 +206,13 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
 			else if (cpu_has_feature(CPU_FTR_ALTIVEC))
 				mathflags |= MSR_VEC;
 
+			/*
+			 * If userspace MSR has all available FP bits set,
+			 * then they are live and no need to restore. If not,
+			 * it means the regs were given up and restore_math
+			 * may decide to restore them (to avoid taking an FP
+			 * fault).
+			 */
 			if ((regs->msr & mathflags) != mathflags)
 				restore_math(regs);
 		}
@@ -277,6 +284,7 @@ notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs, unsigned
 			else if (cpu_has_feature(CPU_FTR_ALTIVEC))
 				mathflags |= MSR_VEC;
 
+			/* See above restore_math comment */
 			if ((regs->msr & mathflags) != mathflags)
 				restore_math(regs);
 		}
-- 
2.23.0

