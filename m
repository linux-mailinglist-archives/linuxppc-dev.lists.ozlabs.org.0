Return-Path: <linuxppc-dev+bounces-2138-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A0A99B08F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Oct 2024 06:00:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XQVCB6LH4z3brd;
	Sat, 12 Oct 2024 15:00:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=114.132.58.6
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728705638;
	cv=none; b=ejLTPiA09Cg/NbSGgwe8idtKuyQ+ZyufP4mfKO0CDY6d4HwX+7RxYM2kNvczpX0s68RaNKBg4Y3AnG7o1EZR9udGioZAm2eWvtVJgZdgS8H6+BBj/hyo617xrMopAGDmZNK6Rw2HS0blsOLhYVn/NMxsnp8pfK0mw2D4ecaPRfqev69dEtjOCnVZKbU7YLmAwv8c1L6EeSbkQ2OaoIRM8bYL+MxiUK3fCnfpJzC3egwdenyo58E0s9Rf3OipVGmtKcrQyMDGf8Nk7pB1Sy8rpN6/UDFz2fYVQiC/V70U6t6/e2ncZ7bcXUuuF9Vab+BSqYhvgtZ2ILmA4o5gmMVFDg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728705638; c=relaxed/relaxed;
	bh=clzNFNx5Kl7dQTK4LQ99TxpjA4n4tOo7htrJxU6vYYU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=csEW8O/XSP27us34maI6Zf7vtxyixJk4D25R2LaY6IGyuaAaRShTgMkhsTLF5RTwbi3FRGJcQfmoAnPGy+v7paYboNG7HYrbc7D9tfgntJAheJM/424ZWwvgFE7WGrZSOLWH6RJASU4Nm5Qh5lX2uxIkdCYy6DCC+A2oOyOkofcBaYG9K9WthPaKRZuSm8nvNBBmc6E3UWhme+KyOeK01Ub+ODflmZKFyY5Uz19GB8h0VMOfebkYzs4+xz7ibnzZBhHfkt3kdc/T6AQ0EBIc1HUNqMznoS8/9NgS+AehkHP3+H4ZOrPtkDJOu8bbgosRNgHwsrIU8Xk4/V0ON7+i3g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=shingroup.cn; spf=pass (client-ip=114.132.58.6; helo=bg1.exmail.qq.com; envelope-from=luming.yu@shingroup.cn; receiver=lists.ozlabs.org) smtp.mailfrom=shingroup.cn
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=shingroup.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=shingroup.cn (client-ip=114.132.58.6; helo=bg1.exmail.qq.com; envelope-from=luming.yu@shingroup.cn; receiver=lists.ozlabs.org)
Received: from bg1.exmail.qq.com (bg1.exmail.qq.com [114.132.58.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XQVC9108jz3brD
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Oct 2024 15:00:36 +1100 (AEDT)
X-QQ-mid: bizesmtpsz3t1728705585tru68vi
X-QQ-Originating-IP: dPzeGZMY/guyAa0JyerkWJKSZdNWTaVlJKwJFdT4Hu0=
Received: from HX09040029.powercore.com.cn ( [180.171.104.254])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 12 Oct 2024 11:59:43 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1889317134298449464
From: Luming Yu <luming.yu@shingroup.cn>
To: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	jialong.yang@shingroup.cn,
	luming.yu@gmail.com
Cc: Luming Yu <luming.yu@shingroup.cn>
Subject: [PATCH 5/7] powerpc/entry: add irqentry_state and generic entry support
Date: Sat, 12 Oct 2024 11:56:19 +0800
Message-ID: <5ADB50C5F6678977+20241012035621.1245-7-luming.yu@shingroup.cn>
X-Mailer: git-send-email 2.42.0.windows.2
In-Reply-To: <20241012035621.1245-3-luming.yu@shingroup.cn>
References: <20241012035621.1245-3-luming.yu@shingroup.cn>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpsz:shingroup.cn:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: OZOGECUHcopq1p3DJjt/esgaKLlu2WyzxeCTRpWsGWmve4b86vYBJV4i
	rpcODtBuXPYhIO7Yp4pisJCPhW1ksDwfgjgKoOYhbilQzwvQFPrzLsRgpBBrJ3RDCCp9EdU
	yWKLQY0a/U8wrUk0V7p0sZET4wR4AaYv1c9QyzsXsZbE2Q+DoKtppy0281TjKZ4xwhho5Cc
	429Mh9a124OPhfYqdWZd9T3eMiw0ies4ArXkltGFoygkd/jxv77Tw5qG0fjbx4qysqbaOZf
	JL+bIE3ViJbLosNHpSVQ0V90/LQRipEZBigyba+pascyHSQpCOkiL0nJiA7ohIWf7k/KL28
	rBDkBG6dlS3bYzLPEihZp/FcDkwJa8bLy7+mFrJXA02pgaCQ1r8hDG+jt8+7V44C5movm6t
	JB1C4KgarRcxy9SSF5q1SEtVq3scUbTmLlSmi149C5Qi/6be1pl1s6GOTOX1RdlRI0k7JsU
	HnsfnsMl73XvGivQs31iQ6bp2sg1SNm4RO4SLtx4NlLtnzKjvhBTUjCCrNfLlsV20SXGOS+
	KUkI/phKg6H4SjOCjnq7FBf4pMtyaBjJ5l6Ej81Ar/ZKiuscfIsoqj3IE6WNLmixMkIWfbP
	rMGV4L04T4+RaLUoH2cCHVUR7CwE4jH9n+SJimYLp/owO9/c/x2nr2P5rnqICYcJNec7GHS
	dk6kFB6l/XmTQDpksiI6iAuG2GXGgeaBLRd3VwI4Q+Xj4xfxucsS2kp1MsAKXKIQNSKZ/sP
	bGjwL4BhysC6rX6jejpsFt4RpjxSBaQsieoKb83wPDpXZSYyckVzmM0eTjj0OFJUpGnosIo
	NcHw7ri3eBXuyDkMH2iHg+PZINbmCHOSalHOOIhcqOY6/4heKa+7FRsAxYyBqzk3NsbRKrw
	3UPps9e9D0qaDhKYwUX4Dlk9ShsB/4h2rTXje1bJm7ZxHOByEL1eR24N9FlvlHbROmzWfbk
	vqaNtYbzn0N8W7Q==
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

generic irq entry support via generic irqentry is added for powerpc.
There may be duplciate calls and missing callbacks requires further
work.

Signed-off-by: Luming Yu <luming.yu@shingroup.cn>
---
 arch/powerpc/include/asm/entry-common.h | 32 ++++++++++++++++
 arch/powerpc/kernel/interrupt.c         | 51 +++++--------------------
 arch/powerpc/kernel/signal.c            |  7 ++++
 arch/powerpc/kernel/syscall.c           |  2 -
 4 files changed, 49 insertions(+), 43 deletions(-)

diff --git a/arch/powerpc/include/asm/entry-common.h b/arch/powerpc/include/asm/entry-common.h
index 51f1eb767696..faa829e15b5d 100644
--- a/arch/powerpc/include/asm/entry-common.h
+++ b/arch/powerpc/include/asm/entry-common.h
@@ -3,6 +3,7 @@
 #define ARCH_POWERPC_ENTRY_COMMON_H
 
 #include <linux/user-return-notifier.h>
+#include <asm/switch_to.h>
 
 static inline void arch_exit_to_user_mode_prepare(struct pt_regs *regs,
 						  unsigned long ti_work)
@@ -13,4 +14,35 @@ static inline void arch_exit_to_user_mode_prepare(struct pt_regs *regs,
 
 #define arch_exit_to_user_mode_prepare arch_exit_to_user_mode_prepare
 
+static inline void arch_exit_to_user_mode_work(struct pt_regs *regs,
+						unsigned long ti_work)
+{
+
+	if (IS_ENABLED(CONFIG_PPC_BOOK3S_64) && IS_ENABLED(CONFIG_PPC_FPU)) {
+		if (IS_ENABLED(CONFIG_PPC_TRANSACTIONAL_MEM) &&
+				unlikely((ti_work & _TIF_RESTORE_TM))) {
+			restore_tm_state(regs);
+		} else {
+			unsigned long mathflags = MSR_FP;
+
+			if (cpu_has_feature(CPU_FTR_VSX))
+				mathflags |= MSR_VEC | MSR_VSX;
+			else if (cpu_has_feature(CPU_FTR_ALTIVEC))
+				mathflags |= MSR_VEC;
+
+			/*
+			 * If userspace MSR has all available FP bits set,
+			 * then they are live and no need to restore. If not,
+			 * it means the regs were given up and restore_math
+			 * may decide to restore them (to avoid taking an FP
+			 * fault).
+			 */
+			if ((regs->msr & mathflags) != mathflags)
+				restore_math(regs);
+		}
+	}
+}
+
+#define arch_exit_to_user_mode_work arch_exit_to_user_mode_work
+
 #endif
diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
index 609ba48034de..42af9217136d 100644
--- a/arch/powerpc/kernel/interrupt.c
+++ b/arch/powerpc/kernel/interrupt.c
@@ -3,6 +3,7 @@
 #include <linux/context_tracking.h>
 #include <linux/err.h>
 #include <linux/compat.h>
+#include <linux/entry-common.h>
 #include <linux/sched/debug.h> /* for show_regs */
 
 #include <asm/kup.h>
@@ -183,47 +184,11 @@ interrupt_exit_user_prepare_main(unsigned long ret, struct pt_regs *regs)
 
 again:
 	ti_flags = read_thread_flags();
-	while (unlikely(ti_flags & (_TIF_USER_WORK_MASK & ~_TIF_RESTORE_TM))) {
-		local_irq_enable();
-		if (ti_flags & _TIF_NEED_RESCHED) {
-			schedule();
-		} else {
-			/*
-			 * SIGPENDING must restore signal handler function
-			 * argument GPRs, and some non-volatiles (e.g., r1).
-			 * Restore all for now. This could be made lighter.
-			 */
-			if (ti_flags & _TIF_SIGPENDING)
-				ret |= _TIF_RESTOREALL;
-			do_notify_resume(regs, ti_flags);
-		}
-		local_irq_disable();
-		ti_flags = read_thread_flags();
-	}
 
-	if (IS_ENABLED(CONFIG_PPC_BOOK3S_64) && IS_ENABLED(CONFIG_PPC_FPU)) {
-		if (IS_ENABLED(CONFIG_PPC_TRANSACTIONAL_MEM) &&
-				unlikely((ti_flags & _TIF_RESTORE_TM))) {
-			restore_tm_state(regs);
-		} else {
-			unsigned long mathflags = MSR_FP;
-
-			if (cpu_has_feature(CPU_FTR_VSX))
-				mathflags |= MSR_VEC | MSR_VSX;
-			else if (cpu_has_feature(CPU_FTR_ALTIVEC))
-				mathflags |= MSR_VEC;
-
-			/*
-			 * If userspace MSR has all available FP bits set,
-			 * then they are live and no need to restore. If not,
-			 * it means the regs were given up and restore_math
-			 * may decide to restore them (to avoid taking an FP
-			 * fault).
-			 */
-			if ((regs->msr & mathflags) != mathflags)
-				restore_math(regs);
-		}
-	}
+	if (ti_flags & _TIF_SIGPENDING)
+		ret |= _TIF_RESTOREALL;
+	if (unlikely(ti_flags & EXIT_TO_USER_MODE_WORK))
+		ti_flags = exit_to_user_mode_loop(regs, ti_flags);
 
 	check_return_regs_valid(regs);
 
@@ -297,11 +262,15 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
 	}
 
 	local_irq_disable();
-	ret = interrupt_exit_user_prepare_main(ret, regs);
+	if (ti_flags & _TIF_RESTOREALL)
+		ret |= _TIF_RESTOREALL;
 
+	if (ti_flags & _TIF_SIGPENDING)
+		ret |= _TIF_RESTOREALL;
 #ifdef CONFIG_PPC64
 	regs->exit_result = ret;
 #endif
+	syscall_exit_to_user_mode(regs);
 
 	return ret;
 }
diff --git a/arch/powerpc/kernel/signal.c b/arch/powerpc/kernel/signal.c
index aa17e62f3754..da21e7fef46a 100644
--- a/arch/powerpc/kernel/signal.c
+++ b/arch/powerpc/kernel/signal.c
@@ -11,6 +11,7 @@
 #include <linux/uprobes.h>
 #include <linux/key.h>
 #include <linux/context_tracking.h>
+#include <linux/entry-common.h>
 #include <linux/livepatch.h>
 #include <linux/syscalls.h>
 #include <asm/hw_breakpoint.h>
@@ -368,3 +369,9 @@ void signal_fault(struct task_struct *tsk, struct pt_regs *regs,
 		printk_ratelimited(regs->msr & MSR_64BIT ? fm64 : fm32, tsk->comm,
 				   task_pid_nr(tsk), where, ptr, regs->nip, regs->link);
 }
+
+void arch_do_signal_or_restart(struct pt_regs *regs)
+{
+	BUG_ON(regs != current->thread.regs);
+	do_signal(current);
+}
diff --git a/arch/powerpc/kernel/syscall.c b/arch/powerpc/kernel/syscall.c
index e0338bd8d383..97f158d13944 100644
--- a/arch/powerpc/kernel/syscall.c
+++ b/arch/powerpc/kernel/syscall.c
@@ -185,8 +185,6 @@ notrace long system_call_exception(struct pt_regs *regs, unsigned long r0)
 	 * So the resulting 6 or 7 bits of entropy is seen in SP[9:4] or SP[9:3].
 	 */
 	choose_random_kstack_offset(mftb());
-	/*common entry*/
-	syscall_exit_to_user_mode(regs);
 
 	return ret;
 }
-- 
2.42.0.windows.2


