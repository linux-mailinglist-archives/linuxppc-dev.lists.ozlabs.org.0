Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C50545AAFE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 19:13:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HzC161H5yz3bjR
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Nov 2021 05:12:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=rDKnGBQT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=rDKnGBQT; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HzC0N3Y9Gz2ynj
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Nov 2021 05:12:19 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8B7C060F6E;
 Tue, 23 Nov 2021 18:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1637691136;
 bh=ejGNmRgjKYc29iUJ60kugz1Heujo78Y0oUFUg9M5W/4=;
 h=Subject:To:Cc:From:Date:From;
 b=rDKnGBQTnjPJxj1L1u6afcKFAUabTUvzz1e5zHgXXHjKswH41SRfm+gUZ4uCGIdeD
 H1aVArf/VWgE1NEAcNl106kSayIzLwQGumY3+P56jzHu+FX2gGz8zKBqmzJhhIKcyS
 lExR0tuD1JDkdj1V7xhtatI6ZXziXOksQTAZuxNM=
Subject: Patch "signal/powerpc: On swapcontext failure force SIGSEGV" has been
 added to the 5.15-stable tree
To: benh@kernel.crashing.org, ebiederm@xmission.com, gregkh@linuxfoundation.org,
 linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, paulus@samba.org,
 tmb@iki.fi
From: <gregkh@linuxfoundation.org>
Date: Tue, 23 Nov 2021 19:11:54 +0100
Message-ID: <163769111410071@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
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
Cc: stable-commits@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


This is a note to let you know that I've just added the patch titled

    signal/powerpc: On swapcontext failure force SIGSEGV

to the 5.15-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     signal-powerpc-on-swapcontext-failure-force-sigsegv.patch
and it can be found in the queue-5.15 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From 83a1f27ad773b1d8f0460d3a676114c7651918cc Mon Sep 17 00:00:00 2001
From: "Eric W. Biederman" <ebiederm@xmission.com>
Date: Wed, 20 Oct 2021 12:43:53 -0500
Subject: signal/powerpc: On swapcontext failure force SIGSEGV

From: Eric W. Biederman <ebiederm@xmission.com>

commit 83a1f27ad773b1d8f0460d3a676114c7651918cc upstream.

If the register state may be partial and corrupted instead of calling
do_exit, call force_sigsegv(SIGSEGV).  Which properly kills the
process with SIGSEGV and does not let any more userspace code execute,
instead of just killing one thread of the process and potentially
confusing everything.

Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: linuxppc-dev@lists.ozlabs.org
History-tree: git://git.kernel.org/pub/scm/linux/kernel/git/tglx/history.git
Fixes: 756f1ae8a44e ("PPC32: Rework signal code and add a swapcontext system call.")
Fixes: 04879b04bf50 ("[PATCH] ppc64: VMX (Altivec) support & signal32 rework, from Ben Herrenschmidt")
Link: https://lkml.kernel.org/r/20211020174406.17889-7-ebiederm@xmission.com
Signed-off-by: Eric W. Biederman <ebiederm@xmission.com>
Cc: Thomas Backlund <tmb@iki.fi>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/powerpc/kernel/signal_32.c |    6 ++++--
 arch/powerpc/kernel/signal_64.c |    9 ++++++---
 2 files changed, 10 insertions(+), 5 deletions(-)

--- a/arch/powerpc/kernel/signal_32.c
+++ b/arch/powerpc/kernel/signal_32.c
@@ -1062,8 +1062,10 @@ SYSCALL_DEFINE3(swapcontext, struct ucon
 	 * or if another thread unmaps the region containing the context.
 	 * We kill the task with a SIGSEGV in this situation.
 	 */
-	if (do_setcontext(new_ctx, regs, 0))
-		do_exit(SIGSEGV);
+	if (do_setcontext(new_ctx, regs, 0)) {
+		force_sigsegv(SIGSEGV);
+		return -EFAULT;
+	}
 
 	set_thread_flag(TIF_RESTOREALL);
 	return 0;
--- a/arch/powerpc/kernel/signal_64.c
+++ b/arch/powerpc/kernel/signal_64.c
@@ -703,15 +703,18 @@ SYSCALL_DEFINE3(swapcontext, struct ucon
 	 * We kill the task with a SIGSEGV in this situation.
 	 */
 
-	if (__get_user_sigset(&set, &new_ctx->uc_sigmask))
-		do_exit(SIGSEGV);
+	if (__get_user_sigset(&set, &new_ctx->uc_sigmask)) {
+		force_sigsegv(SIGSEGV);
+		return -EFAULT;
+	}
 	set_current_blocked(&set);
 
 	if (!user_read_access_begin(new_ctx, ctx_size))
 		return -EFAULT;
 	if (__unsafe_restore_sigcontext(current, NULL, 0, &new_ctx->uc_mcontext)) {
 		user_read_access_end();
-		do_exit(SIGSEGV);
+		force_sigsegv(SIGSEGV);
+		return -EFAULT;
 	}
 	user_read_access_end();
 


Patches currently in stable-queue which might be from ebiederm@xmission.com are

queue-5.15/signal-vm86_32-properly-send-sigsegv-when-the-vm86-state-cannot-be-saved.patch
queue-5.15/signal-don-t-always-set-sa_immutable-for-forced-signals.patch
queue-5.15/signal-x86-in-emulate_vsyscall-force-a-signal-instead-of-calling-do_exit.patch
queue-5.15/ipc-warn-if-trying-to-remove-ipc-object-which-is-absent.patch
queue-5.15/signal-replace-force_sigsegv-sigsegv-with-force_fatal_sig-sigsegv.patch
queue-5.15/signal-powerpc-on-swapcontext-failure-force-sigsegv.patch
queue-5.15/exit-syscall_user_dispatch-send-ordinary-signals-on-failure.patch
queue-5.15/signal-s390-use-force_sigsegv-in-default_trap_handler.patch
queue-5.15/signal-implement-force_fatal_sig.patch
queue-5.15/signal-sparc32-in-setup_rt_frame-and-setup_fram-use-force_fatal_sig.patch
queue-5.15/signal-sparc32-exit-with-a-fatal-signal-when-try_to_clear_window_buffer-fails.patch
queue-5.15/shm-extend-forced-shm-destroy-to-support-objects-from-several-ipc-nses.patch
queue-5.15/signal-replace-force_fatal_sig-with-force_exit_sig-when-in-doubt.patch
