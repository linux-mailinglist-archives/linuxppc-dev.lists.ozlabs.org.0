Return-Path: <linuxppc-dev+bounces-5605-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 500F5A1DBF2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jan 2025 19:14:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yhc4z08lvz30CF;
	Tue, 28 Jan 2025 05:14:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=194.107.17.57
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738001666;
	cv=none; b=d440r4fxAURbMRpFxokEhat4mHZfdHx3aENHbADcfprGoKX9egot/MZXCVTtDeICY6hDCSk6cAf/DpTYBMdvB6yJG7m9JajPzaJ9RnIZ6v5fi98g6EsOuhQMpQMX+r26uB/l2bFvWuGksXhUqSaQX8RUV67Q4sNNd6V07iz3aXLKUs1X2JfCE/HVXtlRKkOk+OWOVX0/uAQKSJ92vgZKWdoD/o9984RoLbjJbAFI5TIydO1Y4vEZ06arIrU4FRPlHTaPSARzs1BxI1verSsQJ5HcUC6CwR2sqrQ90WattgPoHPr43TZ4Xg7nBp+PrPAm35gneRD5twuBc19z6xVHxw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738001666; c=relaxed/relaxed;
	bh=Zd0eO3IRnPkkQ+x2W79ZAUgvBiOwEWOpy+Jm0UzoZgI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=SqORnu5mKSGsJXHI+KEc7rVCm2pLluIGHpCFABgSmL81PwPLz+0DwT03qF6esyE1JfFQAemX0Zr2DehKoskDho6gqeeJZLGHewo7cFbODgoQEIQDLo8PWU7cSmSBPJPkw7Dx3U8oJufe6Z10F9dsSD0dGxfzSW7virRYRZzDCkyVKHZgx7ThyFcI1XVVB1Wy2nOy89TTRD4r+uqViZbr5UYc8Lr9wxoNr9oWJZhbhQn/NJw2fWeAldhMweqtytLzWbha0y2+g2KwsM81brpuUmO9Ra64YKRnePJ/405m+X+3gMqM+ESgE0IonI6pWcxonV1DZJilZ73JCo2g1Pflxw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=strace.io; spf=pass (client-ip=194.107.17.57; helo=vmicros1.altlinux.org; envelope-from=ldv@altlinux.org; receiver=lists.ozlabs.org) smtp.mailfrom=altlinux.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=strace.io
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=altlinux.org (client-ip=194.107.17.57; helo=vmicros1.altlinux.org; envelope-from=ldv@altlinux.org; receiver=lists.ozlabs.org)
Received: from vmicros1.altlinux.org (vmicros1.altlinux.org [194.107.17.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yhc4y04nXz3013
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jan 2025 05:14:25 +1100 (AEDT)
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
	by vmicros1.altlinux.org (Postfix) with ESMTP id 5CC7072C8CC;
	Mon, 27 Jan 2025 21:14:24 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
	id 47C637CCB3A; Mon, 27 Jan 2025 20:14:24 +0200 (IST)
Date: Mon, 27 Jan 2025 20:14:24 +0200
From: "Dmitry V. Levin" <ldv@strace.io>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Alexey Gladkov <legion@kernel.org>,
	Eugene Syromyatnikov <evgsyr@gmail.com>,
	Oleg Nesterov <oleg@redhat.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>, linuxppc-dev@lists.ozlabs.org,
	strace-devel@lists.strace.io, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] powerpc: fix inconsistencies in syscall error return
 handling
Message-ID: <20250127181424.GB1373@strace.io>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250127181322.GA1373@strace.io>
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Since the introduction of SECCOMP_RET_TRACE support, the kernel supports
simultaneously both the generic kernel -ERRORCODE return value ABI and
the powerpc sc syscall return ABI for PTRACE_EVENT_SECCOMP tracers.
This change is an attempt to address the code inconsistencies in syscall
error return handling that were introduced as a side effect of the dual
ABI support.

Signed-off-by: Dmitry V. Levin <ldv@strace.io>
---
 arch/powerpc/kernel/ptrace/ptrace.c | 23 ++++++++++++++++++++---
 arch/powerpc/kernel/signal.c        | 11 +++--------
 arch/powerpc/kernel/syscall.c       |  6 +++---
 3 files changed, 26 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/kernel/ptrace/ptrace.c b/arch/powerpc/kernel/ptrace/ptrace.c
index 727ed4a14545..3778775bf6ba 100644
--- a/arch/powerpc/kernel/ptrace/ptrace.c
+++ b/arch/powerpc/kernel/ptrace/ptrace.c
@@ -207,7 +207,7 @@ static int do_seccomp(struct pt_regs *regs)
 	 * syscall parameter. This is different to the ptrace ABI where
 	 * both r3 and orig_gpr3 contain the first syscall parameter.
 	 */
-	regs->gpr[3] = -ENOSYS;
+	syscall_set_return_value(current, regs, -ENOSYS, 0);
 
 	/*
 	 * We use the __ version here because we have already checked
@@ -215,8 +215,18 @@ static int do_seccomp(struct pt_regs *regs)
 	 * have already loaded -ENOSYS into r3, or seccomp has put
 	 * something else in r3 (via SECCOMP_RET_ERRNO/TRACE).
 	 */
-	if (__secure_computing(NULL))
+	if (__secure_computing(NULL)) {
+
+		/*
+		 * Traditionally, both the generic kernel -ERRORCODE return
+		 * value ABI and the powerpc sc syscall return ABI is
+		 * supported.  For consistency, if the former is detected,
+		 * convert it to the latter.
+		 */
+		if (!trap_is_scv(regs) && IS_ERR_VALUE(regs->gpr[3]))
+			syscall_set_return_value(current, regs, regs->gpr[3], 0);
 		return -1;
+	}
 
 	/*
 	 * The syscall was allowed by seccomp, restore the register
@@ -226,6 +236,13 @@ static int do_seccomp(struct pt_regs *regs)
 	 * allow the syscall to proceed.
 	 */
 	regs->gpr[3] = regs->orig_gpr3;
+	if (!trap_is_scv(regs)) {
+		/*
+		 * Clear SO bit that was set in this function earlier by
+		 * syscall_set_return_value.
+		 */
+		regs->ccr &= ~0x10000000L;
+	}
 
 	return 0;
 }
@@ -315,7 +332,7 @@ long do_syscall_trace_enter(struct pt_regs *regs)
 	 * If we are aborting explicitly, or if the syscall number is
 	 * now invalid, set the return value to -ENOSYS.
 	 */
-	regs->gpr[3] = -ENOSYS;
+	syscall_set_return_value(current, regs, -ENOSYS, 0);
 	return -1;
 }
 
diff --git a/arch/powerpc/kernel/signal.c b/arch/powerpc/kernel/signal.c
index aa17e62f3754..1a38d6bcaed6 100644
--- a/arch/powerpc/kernel/signal.c
+++ b/arch/powerpc/kernel/signal.c
@@ -19,6 +19,7 @@
 #include <asm/unistd.h>
 #include <asm/debug.h>
 #include <asm/tm.h>
+#include <asm/syscall.h>
 
 #include "signal.h"
 
@@ -229,14 +230,8 @@ static void check_syscall_restart(struct pt_regs *regs, struct k_sigaction *ka,
 		regs_add_return_ip(regs, -4);
 		regs->result = 0;
 	} else {
-		if (trap_is_scv(regs)) {
-			regs->result = -EINTR;
-			regs->gpr[3] = -EINTR;
-		} else {
-			regs->result = -EINTR;
-			regs->gpr[3] = EINTR;
-			regs->ccr |= 0x10000000;
-		}
+		regs->result = -EINTR;
+		syscall_set_return_value(current, regs, -EINTR, 0);
 	}
 }
 
diff --git a/arch/powerpc/kernel/syscall.c b/arch/powerpc/kernel/syscall.c
index be159ad4b77b..2fe47191e509 100644
--- a/arch/powerpc/kernel/syscall.c
+++ b/arch/powerpc/kernel/syscall.c
@@ -122,7 +122,7 @@ notrace long system_call_exception(struct pt_regs *regs, unsigned long r0)
 		if (unlikely(trap_is_unsupported_scv(regs))) {
 			/* Unsupported scv vector */
 			_exception(SIGILL, regs, ILL_ILLOPC, regs->nip);
-			return regs->gpr[3];
+			return regs_return_value(regs);
 		}
 		/*
 		 * We use the return value of do_syscall_trace_enter() as the
@@ -133,13 +133,13 @@ notrace long system_call_exception(struct pt_regs *regs, unsigned long r0)
 		 */
 		r0 = do_syscall_trace_enter(regs);
 		if (unlikely(r0 >= NR_syscalls))
-			return regs->gpr[3];
+			return regs_return_value(regs);
 
 	} else if (unlikely(r0 >= NR_syscalls)) {
 		if (unlikely(trap_is_unsupported_scv(regs))) {
 			/* Unsupported scv vector */
 			_exception(SIGILL, regs, ILL_ILLOPC, regs->nip);
-			return regs->gpr[3];
+			return regs_return_value(regs);
 		}
 		return -ENOSYS;
 	}
-- 
ldv

