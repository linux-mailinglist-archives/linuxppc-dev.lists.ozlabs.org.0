Return-Path: <linuxppc-dev+bounces-3083-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 624449C36F4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Nov 2024 04:22:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XmvxM0NB0z2xst;
	Mon, 11 Nov 2024 14:22:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=43.154.197.177
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731295350;
	cv=none; b=WeeUgX4xY0OXzAHAPwaXm+oZslQRAzOFzi08kQsYcwnXSVCfaYXiURIhZ107QgEfWWoQ4SpYfeJ/mOsc/dNYUNSakKuId0dLKNc0BpocVpMtdSpdNxxk0zPnhwrwBaK3UeV64gFrVXk48J79/KCGrJS5i4FYBYA7DNowgqJao28eUneG4jXMsudTRGc5MUOQpFqzR+8Y/iC4XaPeiTU4Vsz8ql5dbWKye9n2RASHmNK5CJRymX9xx09FPt2FqNHnolfBW6upRgmqVudsgQaoltasumoGuvw+27gsvfsyKHVYGFTPeqGJLZUB7VLU5/06duOneUaMrRdP4hOoT3aZJA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731295350; c=relaxed/relaxed;
	bh=v7F76A/IUwLtJwdwp9Vkes3MupdfT/HaDbFy5r18vrI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jtdW5aNZumH1JLvXGjysMyL6mNoTfwoPumjmvcZheuExFDsEF4cnb50lShYoItJoJk0npzG+ssnpnQeY+K/ce9LnTNg/626bBrRzrlm+e3X475G2TFTdSDyPMrMrgtYeW/ZGYvtni79yg9q64fKDax5pdBs+N52hOEgP0PHvAyX1149XrhnQ8hpIJSI8oDDRpFeW9/zvrmHWUoJadSzPvqlT9UTJUwcheDVmXGT46P/utbzx+vPthVfPf8yObUDruBmH5lyFRkXlVtiS0W7Te/1NDRT2AIdMy7Gsn11K5jezQJoBl7bwVmsWdiZ1apOpLmtaMFslG46G/dHHbdxhzQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=shingroup.cn; spf=pass (client-ip=43.154.197.177; helo=bg5.exmail.qq.com; envelope-from=luming.yu@shingroup.cn; receiver=lists.ozlabs.org) smtp.mailfrom=shingroup.cn
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=shingroup.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=shingroup.cn (client-ip=43.154.197.177; helo=bg5.exmail.qq.com; envelope-from=luming.yu@shingroup.cn; receiver=lists.ozlabs.org)
Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.154.197.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XmvxJ4Thhz2xs0
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Nov 2024 14:22:28 +1100 (AEDT)
X-QQ-mid: bizesmtpsz5t1731295287t86m7ga
X-QQ-Originating-IP: /LUL+HLIGB/NES8ocSMYmMlww42rJYMefiuMTCsbuMs=
Received: from HX09040029.powercore.com.cn ( [116.233.136.127])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 11 Nov 2024 11:21:07 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13334988639752082623
From: Luming Yu <luming.yu@shingroup.cn>
To: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	luming.yu@gmail.com
Cc: Luming Yu <luming.yu@shingroup.cn>
Subject: [PATCH v2 2/8] powerpc/entry: cleanup syscall entry
Date: Mon, 11 Nov 2024 11:19:28 +0800
Message-ID: <A71D1C71E9993C21+20241111031934.1579-4-luming.yu@shingroup.cn>
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
X-QQ-XMAILINFO: OSUW9vQLVhiZTclshFBubYPkDXTre72zm5Z76+KDIiBHvx7fGO8F35RM
	BDfwguD52sfRLyiWUlTS4EQCV0tFcb7mnIJjqVcBBN0DiMZiMbdxquh5uWK3QqGRCkb7q26
	3QN1oxGtuvaMzrs5FadLSQH2Gqo604tu2JNQttfSdFXUWPzdgu3unp5SnZp4wX+KSsGux9w
	9ngJDgxINebSZZxFzYKoG8nbCp4QeeQeTW+0Qh8bCJLRopxsvJMdCxCpGUQgURa7Tp3zuX1
	7TQKstB+WxdZ0X7O1elqe2dbYitfmECcQ5lwsa+trXETHwID/unNHEeyY0yXthqYM//r1d9
	Vyvhp60LCHOHPxvpsEv3N0Oj0PyhLEGWZZ8WtYNEAh7T5zoEomgWHR9RO1FI51okbM3kyzp
	dqwoO40ZYtkph95g7XRM0wgO/mVPiFzmmtibZAk1BD3XKA8q3wsI0CxL4gQ26ZEvSDeGUjP
	zy5FbKiOpgJRGesfR3pQ2THOHgkLrfITxg/4zXs8l7NbigsbiE1AAe24IJg+zuP5Kn9658t
	4gtlppOWlIdczvHVtmn0K0Z9le320/m6phwkA4Ovuz/F8dad+86OLg2+roruyaO9i6huYWP
	XrM8lst14YBPcH/7RnzFxUxVG2L81OqT1kNcw3K/gbCjN+U7w5lqzc6jBQapImK+w7e8E2y
	9cEupsHn3HRSxFxiPw8/8evDwptoZCwibR3lSdUS+tY8j5OzRpssmVgYmbQxt+5Kwxswlt8
	po8vIXGpDQC80o/k8Die7QBa1VL2aaR+wtLKkuL8FtQkeerSahyen/ge7Oe+Js2sXkDVGng
	1jvmfQ8xoes3IxlU4th3cKQgFHiJXy5FzR0VcAi7Oqoia9oMAVPP69rdsCK5TUPhCnYxsAg
	EwxJFiiQLNDnfR8qVGop9lAHZ7wVrnLcuGLkmcrqceDBKUFphF9a5JzSoj/OrGzPR3mvD4/
	J6CAIM1aml4KcC/L7JvFuTFD622l0+Ce8lOA9/+kDoDE1TQ==
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
X-QQ-RECHKSPAM: 0
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

cleanup do_syscall_trace_enter/leave and do_seccomp.

Signed-off-by: Luming Yu <luming.yu@shingroup.cn>
---
 arch/powerpc/kernel/interrupt.c     |   5 -
 arch/powerpc/kernel/ptrace/ptrace.c | 141 ----------------------------
 2 files changed, 146 deletions(-)

diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
index c4f6d3c69ba9..8c532cecbc60 100644
--- a/arch/powerpc/kernel/interrupt.c
+++ b/arch/powerpc/kernel/interrupt.c
@@ -293,11 +293,6 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
 		regs->gpr[3] = r3;
 	}
 
-	if (unlikely(ti_flags & _TIF_SYSCALL_DOTRACE)) {
-		do_syscall_trace_leave(regs);
-		ret |= _TIF_RESTOREALL;
-	}
-
 	local_irq_disable();
 	ret = interrupt_exit_user_prepare_main(ret, regs);
 
diff --git a/arch/powerpc/kernel/ptrace/ptrace.c b/arch/powerpc/kernel/ptrace/ptrace.c
index 727ed4a14545..6cd180bc36ab 100644
--- a/arch/powerpc/kernel/ptrace/ptrace.c
+++ b/arch/powerpc/kernel/ptrace/ptrace.c
@@ -21,9 +21,6 @@
 #include <asm/switch_to.h>
 #include <asm/debug.h>
 
-#define CREATE_TRACE_POINTS
-#include <trace/events/syscalls.h>
-
 #include "ptrace-decl.h"
 
 /*
@@ -195,144 +192,6 @@ long arch_ptrace(struct task_struct *child, long request,
 	return ret;
 }
 
-#ifdef CONFIG_SECCOMP
-static int do_seccomp(struct pt_regs *regs)
-{
-	if (!test_thread_flag(TIF_SECCOMP))
-		return 0;
-
-	/*
-	 * The ABI we present to seccomp tracers is that r3 contains
-	 * the syscall return value and orig_gpr3 contains the first
-	 * syscall parameter. This is different to the ptrace ABI where
-	 * both r3 and orig_gpr3 contain the first syscall parameter.
-	 */
-	regs->gpr[3] = -ENOSYS;
-
-	/*
-	 * We use the __ version here because we have already checked
-	 * TIF_SECCOMP. If this fails, there is nothing left to do, we
-	 * have already loaded -ENOSYS into r3, or seccomp has put
-	 * something else in r3 (via SECCOMP_RET_ERRNO/TRACE).
-	 */
-	if (__secure_computing(NULL))
-		return -1;
-
-	/*
-	 * The syscall was allowed by seccomp, restore the register
-	 * state to what audit expects.
-	 * Note that we use orig_gpr3, which means a seccomp tracer can
-	 * modify the first syscall parameter (in orig_gpr3) and also
-	 * allow the syscall to proceed.
-	 */
-	regs->gpr[3] = regs->orig_gpr3;
-
-	return 0;
-}
-#else
-static inline int do_seccomp(struct pt_regs *regs) { return 0; }
-#endif /* CONFIG_SECCOMP */
-
-/**
- * do_syscall_trace_enter() - Do syscall tracing on kernel entry.
- * @regs: the pt_regs of the task to trace (current)
- *
- * Performs various types of tracing on syscall entry. This includes seccomp,
- * ptrace, syscall tracepoints and audit.
- *
- * The pt_regs are potentially visible to userspace via ptrace, so their
- * contents is ABI.
- *
- * One or more of the tracers may modify the contents of pt_regs, in particular
- * to modify arguments or even the syscall number itself.
- *
- * It's also possible that a tracer can choose to reject the system call. In
- * that case this function will return an illegal syscall number, and will put
- * an appropriate return value in regs->r3.
- *
- * Return: the (possibly changed) syscall number.
- */
-long do_syscall_trace_enter(struct pt_regs *regs)
-{
-	u32 flags;
-
-	flags = read_thread_flags() & (_TIF_SYSCALL_EMU | _TIF_SYSCALL_TRACE);
-
-	if (flags) {
-		int rc = ptrace_report_syscall_entry(regs);
-
-		if (unlikely(flags & _TIF_SYSCALL_EMU)) {
-			/*
-			 * A nonzero return code from
-			 * ptrace_report_syscall_entry() tells us to prevent
-			 * the syscall execution, but we are not going to
-			 * execute it anyway.
-			 *
-			 * Returning -1 will skip the syscall execution. We want
-			 * to avoid clobbering any registers, so we don't goto
-			 * the skip label below.
-			 */
-			return -1;
-		}
-
-		if (rc) {
-			/*
-			 * The tracer decided to abort the syscall. Note that
-			 * the tracer may also just change regs->gpr[0] to an
-			 * invalid syscall number, that is handled below on the
-			 * exit path.
-			 */
-			goto skip;
-		}
-	}
-
-	/* Run seccomp after ptrace; allow it to set gpr[3]. */
-	if (do_seccomp(regs))
-		return -1;
-
-	/* Avoid trace and audit when syscall is invalid. */
-	if (regs->gpr[0] >= NR_syscalls)
-		goto skip;
-
-	if (unlikely(test_thread_flag(TIF_SYSCALL_TRACEPOINT)))
-		trace_sys_enter(regs, regs->gpr[0]);
-
-	if (!is_32bit_task())
-		audit_syscall_entry(regs->gpr[0], regs->gpr[3], regs->gpr[4],
-				    regs->gpr[5], regs->gpr[6]);
-	else
-		audit_syscall_entry(regs->gpr[0],
-				    regs->gpr[3] & 0xffffffff,
-				    regs->gpr[4] & 0xffffffff,
-				    regs->gpr[5] & 0xffffffff,
-				    regs->gpr[6] & 0xffffffff);
-
-	/* Return the possibly modified but valid syscall number */
-	return regs->gpr[0];
-
-skip:
-	/*
-	 * If we are aborting explicitly, or if the syscall number is
-	 * now invalid, set the return value to -ENOSYS.
-	 */
-	regs->gpr[3] = -ENOSYS;
-	return -1;
-}
-
-void do_syscall_trace_leave(struct pt_regs *regs)
-{
-	int step;
-
-	audit_syscall_exit(regs);
-
-	if (unlikely(test_thread_flag(TIF_SYSCALL_TRACEPOINT)))
-		trace_sys_exit(regs, regs->result);
-
-	step = test_thread_flag(TIF_SINGLESTEP);
-	if (step || test_thread_flag(TIF_SYSCALL_TRACE))
-		ptrace_report_syscall_exit(regs, step);
-}
-
 void __init pt_regs_check(void);
 
 /*
-- 
2.42.0.windows.2


