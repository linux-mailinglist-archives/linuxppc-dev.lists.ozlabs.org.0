Return-Path: <linuxppc-dev+bounces-2141-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B9999B095
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Oct 2024 06:01:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XQVCG6wJQz3brD;
	Sat, 12 Oct 2024 15:00:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=43.155.80.173
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728705642;
	cv=none; b=Xaae/9A2rE6aJpqEaXaZrp5rA/s0sIljmKso88HITcnzlfkzNj7DRISa4a6gBLxtKXf3fGoRLrYDqwJhDkkFnqYuNRrqL3xB/cEzCKH9LpnKh3Y8DUf3PBT4Cka1Js6kGQg9jtFUD5qDNJeUXdx5lGJTVjHMt5GwmRXJUXcnX+Qa5YFCaTNEu2CFadA35uzrO7HCTKkbM1EuTBOybLrNLjLxXIUj5Cbgi57xjupOYJvo+RI/UF0qieMWmZiDtXIIjILOpHCjQguyWPmHtCDZbUCX1BKJQuiOckQdf2ZpC1W+4MRxKzo1F4+npfMD7jNEfrT3U+/2CUYFTvYis/7P3w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728705642; c=relaxed/relaxed;
	bh=v7F76A/IUwLtJwdwp9Vkes3MupdfT/HaDbFy5r18vrI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XLU4Ym275B4SCNMykZ0HD0gw6Nyuk2n5VI6RoY5BetACKlBI4T5TLGGy3b8r7Pwv+jBi22wXj4LexXGDUQq5qyndODG4r4GeJtWAc+H70Ys4bY7+TO2XBa087vCfZMgR4Pncd+08rfepqXTKomP4KS6V6CO4KXfiaCJ9HDERoex8xv05WN+jkuHqvDGyancSvNc+koOh25MfmERX3YDRk1DNXqXpqGOyUDEHWc0DllhOdjtfjUB6RbTCbBXMNfHCh9jJqWqrtqZb6JS950DfbqA4Ok3iMkA76eH+G3OOPfeFqNpTQjonjZN/HUv0iJ1k8GbKoOwZ9Tmcs33bk9HrSA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=shingroup.cn; spf=pass (client-ip=43.155.80.173; helo=bg5.exmail.qq.com; envelope-from=luming.yu@shingroup.cn; receiver=lists.ozlabs.org) smtp.mailfrom=shingroup.cn
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=shingroup.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=shingroup.cn (client-ip=43.155.80.173; helo=bg5.exmail.qq.com; envelope-from=luming.yu@shingroup.cn; receiver=lists.ozlabs.org)
Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.155.80.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XQVCF4cdlz3c2Z
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Oct 2024 15:00:41 +1100 (AEDT)
X-QQ-mid: bizesmtpsz3t1728705577tvyp9oy
X-QQ-Originating-IP: ktAc4TLhgPbAJf2VCYmJ9mFR3xgze7PlFqnoxoe3bX8=
Received: from HX09040029.powercore.com.cn ( [180.171.104.254])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 12 Oct 2024 11:59:36 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7415559016572217119
From: Luming Yu <luming.yu@shingroup.cn>
To: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	jialong.yang@shingroup.cn,
	luming.yu@gmail.com
Cc: Luming Yu <luming.yu@shingroup.cn>
Subject: [PATCH 2/7] powerpc/entry: cleanup syscall entry
Date: Sat, 12 Oct 2024 11:56:16 +0800
Message-ID: <F28C8E204E4D574B+20241012035621.1245-4-luming.yu@shingroup.cn>
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
X-QQ-XMAILINFO: MHnK18vH4U17ySY0TbF5JPIH2lZTn3cyhEjPwQoPHdBr5IVJ7lvGf3iD
	b6EF5Tcv13FsCxdLt6I0kxzPGe7lmjzG0e8dO6dVC24HHdtfQnUuE/vnrTsKckNzOWoTGO7
	lkNVPf2NQVS0brcZtqehmPQDHMNYKCbDfAboy4WlIgdkBZYa8Zf+AfgZrxdvbh/flEEwSlG
	Vz2T8Sqw3Ck+sksRUrrKgkDdgzsAnN0jlzkaJJlbtGWdYWbJe3tOLXx6AoKw1rVaQHEXXXS
	jLqZaLp7mV/4Oc1cdfIP+YEzTbhGm4BLgQsNgQm7EarHrWor2OxGVg21Q8V1YSSlag24PI6
	0VWYOTW2g4mxJYXiwnUFT0pq384EAX712vyn86TIGCq5wsfH4GhVfgpMYIPLAurucxp+mKV
	FwdDWmqRJdI/hatrLztNZb9Oei5XiX/ZNNVoiRwqToBHzXchFhouYQk5B0QLNUhPNrIlkS/
	HhapBpwvai9h4i8HHv2mcwYGsYC8kUTHvqrKobE9N9hebg2RbEcwr2Id1u5/ITLwj7800Me
	2EKbey2EIqMBw7+PAPvxGrHBnVekYJLAnsSyBoo1j2+927HMqojmr31UGPY9pP0JoETHT1c
	ktDpkJPIqT30ZEsSMFRbPox9tSLSjOKwFQVsWe5WgQB3+ClJK/ghoU0HKFn+BuSBAqyvEts
	QmA1D5WshCsvGQEG8+UsETD6whvUEAwT+q/LjwwbdZjwnbL320wE4XkCOdi2mgSeUETP3wn
	W4iB9+JdPtz/saHc7eLpOdJ1WreRVhB3YtMbr9kS2nxlCiqig7RNMihRehK+O2bE68h8CKq
	j1VyF8q06gyXaJVqjn8JFulUaQoHtXGT96T/yvZ4jmJwn4xs+XN4f9/+CG4/qTh/8DCq4EC
	jCuob4+R7dxU0GooaLvxTavpKNvuOb8MzA9bAMYTLVxdC31eyp4VswRoyzi26gTfm+8ZiJu
	bib6TMJjqmLJRsA==
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
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


