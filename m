Return-Path: <linuxppc-dev+bounces-3087-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3B29C36FB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Nov 2024 04:23:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XmvyB181cz2yGZ;
	Mon, 11 Nov 2024 14:23:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=43.155.80.173
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731295394;
	cv=none; b=SBDoAcIehSf6YbX+TgPo2PD9DGLYHu4Xf9N+e+aeN230V+OX8KqKoJlMk0MSWUiG++llWKmhVjyRxTrl8uqMTfY/8RZ1EXfBA9CsaVPMJ6o9+wtp4x2ZmvAtAcbg96z88wSNaEyVGt4d8yR0YS05aPPxbBlGG3RkWmpQjFJ+sg7WvvZXVarO0hnoGNWIKINMH4GFP3gSg7b9yalIva9+Bk0/jIL0U7RPEzwxvVe7a3+wTzudVktWeBJH2ksiBvHLW2tTEZfJYA3Uf7fYg+I7fYM8nE0WA+TrD/QZM8cRCy7PtPYAFLace2dfXQ487sD8jmhUE34kEpf/5f5jgXJAMg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731295394; c=relaxed/relaxed;
	bh=clzNFNx5Kl7dQTK4LQ99TxpjA4n4tOo7htrJxU6vYYU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=idLB4Afddxr1U7F6nsSq/IAW2DiSUlBIRtgTY9meZ0qx0S2lIRMzceetausN3OgMES+lm02sRuSLITFRtOFkNcWEnPkoE0+uodacvyx5YI7+fw6DFX+hMi36uYpH+JL1MKWMicUSnHrRqre+5UXYA96da0msCKyA4rVXimwngHHiRAMFIFOn8l7cdsZvizEV97RMfk7loK70XlwHqRU7yvFvWfmYcQLv8H2qM+3nPJB/EdGrppF+D+QtopExTQzkAKNkrG0KWFdtIxtcfXWPIKNaCq1Tf/q/2Eq3BnjpK1Hy+PJN726JrsDGn5pObQD+Uc1k5/NBn7Ne6e1Wm1gJhQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=shingroup.cn; spf=pass (client-ip=43.155.80.173; helo=bg5.exmail.qq.com; envelope-from=luming.yu@shingroup.cn; receiver=lists.ozlabs.org) smtp.mailfrom=shingroup.cn
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=shingroup.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=shingroup.cn (client-ip=43.155.80.173; helo=bg5.exmail.qq.com; envelope-from=luming.yu@shingroup.cn; receiver=lists.ozlabs.org)
Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.155.80.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xmvy86vvHz2xjv
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Nov 2024 14:23:12 +1100 (AEDT)
X-QQ-mid: bizesmtpsz5t1731295337tbelslj
X-QQ-Originating-IP: oSKWjFQ2QFU3uf3v/YaUB+xwzwIus0Rs9ZSUn0gWrn4=
Received: from HX09040029.powercore.com.cn ( [116.233.136.127])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 11 Nov 2024 11:22:02 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3230749710390263555
From: Luming Yu <luming.yu@shingroup.cn>
To: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	luming.yu@gmail.com
Cc: Luming Yu <luming.yu@shingroup.cn>
Subject: [PATCH v2 5/8] powerpc/entry: add irqentry_state and generic entry support
Date: Mon, 11 Nov 2024 11:19:34 +0800
Message-ID: <B8D89E4E26FBB584+20241111031934.1579-10-luming.yu@shingroup.cn>
X-Mailer: git-send-email 2.42.0.windows.2
In-Reply-To: <20241111031934.1579-2-luming.yu@shingroup.cn>
References: <20241111031934.1579-2-luming.yu@shingroup.cn>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpsz:shingroup.cn:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: NuQRJUP0KJGkzLuTsvrGVe1Ue/IhCowR6uPPvTSIyLMhMIOX6AsZopRn
	ImkR3wdg/ilqTuxwG/+XmXVQ/n5sbA+vKgPJN8RGiUGEzKVFhdiZxLH9K9AA+PcOi9C+zJc
	HeOt24s21QsgZ4XqScRCETKlk6uTdzS9TP8JC9vBXj5C29LMxlnlwo8o8hJkaskfZQYqgjo
	BVuNVnbcQWbX1CMisMlx+VzItD5z8s4jYEcpU85vBgj8lPFOrFQvcnjYOOnr0W8jcU0Iuhd
	ogSXUVyTJLt/X7t35fbOa0BBB1WWCJbGy3+G0ByJBCn/Ogxawy7jTABd/M0SL8Gki3UVRfi
	EYUzPp1mDb6VHl1Rf6piqwHeu63ftgZLJH7NWwE6aHuwG3pL3B3MJQnXGxEiGYZxD7Y7ePu
	3YdmcAzDNxueh56y7X0yceID06EcId0g/twNOaBwoiBlqk6N0AijB6n/9E4PmFTIv45t94R
	70YKAu5mA+kF4RBkVBoxy21A81eGUmmf1Mh3NuYWyxBteNi9mGSWz6KHbbixCDR4VVyPeHa
	JZamtFLlfPPe9yoZdec3JNsyzulJ3jNMbJMXOWGw5Z7FXv71eykAhGL6EJDc9QhU4Fgce+v
	7xWRvIKjcKZRkx0CC19mW4wg0fpkc74mwthxxM0DOeWd7cbPwJY6+3i52x4ucNXF52Rjd7v
	7ImpSRQWSUARKjrOhZvBXA7KCJ0JgHBS9NnjrBiTrVMx6IU7O5TqD5f479wFtjUyNsiKmgb
	SeDtdaLmV+0nsDGeFRfi2f4ERoFXR9Gfs2ATN0ikrd/PNYzu8fqLK+H0o1aAg1hlA1+np4y
	EFVHRtfeLhDMDOr/OEJdZdnOb1klWT1u4a8v3ZKThuConN2awvdvBU6Y8zd0pPzNz2e3G2Q
	iZhPXXCZvJg7vRPjJ8UhICoHlIc6pzTvt5WFpDgnrYjJebq9s1mVrjdolmt86cpasZw0gP8
	wqHNHHBsd0gb9ELWO1ADr4+mcAWx4FnFGtlGNSDT0wdirOUeBAXWyGI9hwgylrmPjBUc=
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
X-QQ-RECHKSPAM: 0
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
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


