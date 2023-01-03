Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A56465BB52
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Jan 2023 08:39:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NmPkw2FKZz3bmQ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Jan 2023 18:39:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=wTzy/rAC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=wTzy/rAC;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NmPjy2LR7z2xWc
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Jan 2023 18:38:45 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 1B180B80E1C;
	Tue,  3 Jan 2023 07:38:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B2A6C433EF;
	Tue,  3 Jan 2023 07:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1672731516;
	bh=Erihbp1cPAKxMFJS5VvKguxAzuVz2fd3BpRZpJdcXPM=;
	h=Subject:To:Cc:From:Date:From;
	b=wTzy/rACpzd4OLIBRbJfvut9yrJzbcblI+ONk1H9U6ED2IxERSOAZbTKFhtqCN832
	 NJySkh0LL1EWUxbFXpc21BI9LrjFpUiW7nzm5A6tp/HO41CakUstzOhbxtxO9GEJtu
	 3qOtaOIrWdPJWGqIFl4Z3wQTm7RlqP43NAU5l5XI=
Subject: Patch "powerpc: add support for TIF_NOTIFY_SIGNAL" has been added to the 5.10-stable tree
To: axboe@kernel.dk,gregkh@linuxfoundation.org,linuxppc-dev@lists.ozlabs.org,mpe@ellerman.id.au
From: <gregkh@linuxfoundation.org>
Date: Tue, 03 Jan 2023 08:36:30 +0100
Message-ID: <1672731390128145@kroah.com>
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


This is a note to let you know that I've just added the patch titled

    powerpc: add support for TIF_NOTIFY_SIGNAL

to the 5.10-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     powerpc-add-support-for-tif_notify_signal.patch
and it can be found in the queue-5.10 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From 616d38f834d91a5af2e3afb08f12ecb8b32e4a96 Mon Sep 17 00:00:00 2001
From: Jens Axboe <axboe@kernel.dk>
Date: Thu, 22 Oct 2020 20:11:56 -0600
Subject: powerpc: add support for TIF_NOTIFY_SIGNAL

From: Jens Axboe <axboe@kernel.dk>

[ Upstream commit 900f0713fdd730fab0f0bfa4a8ca4db2a8985bbe ]

Wire up TIF_NOTIFY_SIGNAL handling for powerpc.

Cc: linuxppc-dev@lists.ozlabs.org
Acked-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Jens Axboe <axboe@kernel.dk>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/powerpc/include/asm/thread_info.h |    5 ++++-
 arch/powerpc/kernel/signal.c           |    2 +-
 2 files changed, 5 insertions(+), 2 deletions(-)

--- a/arch/powerpc/include/asm/thread_info.h
+++ b/arch/powerpc/include/asm/thread_info.h
@@ -96,6 +96,7 @@ void arch_setup_new_exec(void);
 #define TIF_SYSCALL_TRACE	0	/* syscall trace active */
 #define TIF_SIGPENDING		1	/* signal pending */
 #define TIF_NEED_RESCHED	2	/* rescheduling necessary */
+#define TIF_NOTIFY_SIGNAL	3	/* signal notifications exist */
 #define TIF_SYSCALL_EMU		4	/* syscall emulation active */
 #define TIF_RESTORE_TM		5	/* need to restore TM FP/VEC/VSX */
 #define TIF_PATCH_PENDING	6	/* pending live patching update */
@@ -121,6 +122,7 @@ void arch_setup_new_exec(void);
 #define _TIF_SYSCALL_TRACE	(1<<TIF_SYSCALL_TRACE)
 #define _TIF_SIGPENDING		(1<<TIF_SIGPENDING)
 #define _TIF_NEED_RESCHED	(1<<TIF_NEED_RESCHED)
+#define _TIF_NOTIFY_SIGNAL	(1<<TIF_NOTIFY_SIGNAL)
 #define _TIF_POLLING_NRFLAG	(1<<TIF_POLLING_NRFLAG)
 #define _TIF_32BIT		(1<<TIF_32BIT)
 #define _TIF_RESTORE_TM		(1<<TIF_RESTORE_TM)
@@ -142,7 +144,8 @@ void arch_setup_new_exec(void);
 
 #define _TIF_USER_WORK_MASK	(_TIF_SIGPENDING | _TIF_NEED_RESCHED | \
 				 _TIF_NOTIFY_RESUME | _TIF_UPROBE | \
-				 _TIF_RESTORE_TM | _TIF_PATCH_PENDING)
+				 _TIF_RESTORE_TM | _TIF_PATCH_PENDING | \
+				 _TIF_NOTIFY_SIGNAL)
 #define _TIF_PERSYSCALL_MASK	(_TIF_RESTOREALL|_TIF_NOERROR)
 
 /* Bits in local_flags */
--- a/arch/powerpc/kernel/signal.c
+++ b/arch/powerpc/kernel/signal.c
@@ -318,7 +318,7 @@ void do_notify_resume(struct pt_regs *re
 	if (thread_info_flags & _TIF_PATCH_PENDING)
 		klp_update_patch_state(current);
 
-	if (thread_info_flags & _TIF_SIGPENDING) {
+	if (thread_info_flags & (_TIF_SIGPENDING | _TIF_NOTIFY_SIGNAL)) {
 		BUG_ON(regs != current->thread.regs);
 		do_signal(current);
 	}


Patches currently in stable-queue which might be from axboe@kernel.dk are

queue-5.10/x86-process-setup-io_threads-more-like-normal-user-space-threads.patch
queue-5.10/powerpc-add-support-for-tif_notify_signal.patch
queue-5.10/eventfd-provide-a-eventfd_signal_mask-helper.patch
queue-5.10/fs-provide-locked-helper-variant-of-close_fd_get_file.patch
queue-5.10/relay-fix-type-mismatch-when-allocating-memory-in-re.patch
queue-5.10/eventfd-change-int-to-__u64-in-eventfd_signal-ifndef.patch
queue-5.10/io_uring-pass-in-epoll_uring_wake-for-eventfd-signaling-and-wakeups.patch
queue-5.10/blk-mq-fix-possible-memleak-when-register-hctx-faile.patch
queue-5.10/fix-handling-of-nd-depth-on-lookup_cached-failures-in-try_to_unlazy.patch
queue-5.10/net-provide-__sys_shutdown_sock-that-takes-a-socket.patch
queue-5.10/task_work-unconditionally-run-task_work-from-get_signal.patch
queue-5.10/openrisc-add-support-for-tif_notify_signal.patch
queue-5.10/signal-add-task_sigpending-helper.patch
queue-5.10/net-remove-cmsg-restriction-from-io_uring-based-send-recvmsg-calls.patch
queue-5.10/alpha-add-support-for-tif_notify_signal.patch
queue-5.10/nios32-add-support-for-tif_notify_signal.patch
queue-5.10/ia64-don-t-call-handle_signal-unless-there-s-actually-a-signal-queued.patch
queue-5.10/task_work-remove-legacy-twa_signal-path.patch
queue-5.10/revert-proc-don-t-allow-async-path-resolution-of-proc-self-components.patch
queue-5.10/m68k-add-support-for-tif_notify_signal.patch
queue-5.10/s390-add-support-for-tif_notify_signal.patch
queue-5.10/um-add-support-for-tif_notify_signal.patch
queue-5.10/tools-headers-uapi-sync-openat2.h-with-the-kernel-sources.patch
queue-5.10/kernel-provide-create_io_thread-helper.patch
queue-5.10/iov_iter-add-helper-to-save-iov_iter-state.patch
queue-5.10/arc-unbork-5.11-bootup-fix-snafu-in-_tif_notify_signal-handling.patch
queue-5.10/arch-ensure-parisc-powerpc-handle-pf_io_worker-in-copy_thread.patch
queue-5.10/csky-add-support-for-tif_notify_signal.patch
queue-5.10/arm-add-support-for-tif_notify_signal.patch
queue-5.10/kernel-stop-masking-signals-in-create_io_thread.patch
queue-5.10/fs-expose-lookup_cached-through-openat2-resolve_cached.patch
queue-5.10/task_work-add-helper-for-more-targeted-task_work-canceling.patch
queue-5.10/nds32-add-support-for-tif_notify_signal.patch
queue-5.10/signal-kill-jobctl_task_work.patch
queue-5.10/hexagon-add-support-for-tif_notify_signal.patch
queue-5.10/sh-add-support-for-tif_notify_signal.patch
queue-5.10/riscv-add-support-for-tif_notify_signal.patch
queue-5.10/h8300-add-support-for-tif_notify_signal.patch
queue-5.10/io_uring-import-5.15-stable-io_uring.patch
queue-5.10/sparc-add-support-for-tif_notify_signal.patch
queue-5.10/blktrace-fix-output-non-blktrace-event-when-blk_clas.patch
queue-5.10/eventpoll-add-epoll_uring_wake-poll-wakeup-flag.patch
queue-5.10/parisc-add-support-for-tif_notify_signal.patch
queue-5.10/entry-add-support-for-tif_notify_signal.patch
queue-5.10/x86-wire-up-tif_notify_signal.patch
queue-5.10/task_work-use-tif_notify_signal-if-available.patch
queue-5.10/drbd-fix-an-invalid-memory-access-caused-by-incorrec.patch
queue-5.10/kernel-don-t-call-do_exit-for-pf_io_worker-threads.patch
queue-5.10/kernel-allow-fork-with-tif_notify_signal-pending.patch
queue-5.10/pata_ipx4xx_cf-fix-unsigned-comparison-with-less-tha.patch
queue-5.10/mips-add-support-for-tif_notify_signal.patch
queue-5.10/xtensa-add-support-for-tif_notify_signal.patch
queue-5.10/c6x-add-support-for-tif_notify_signal.patch
queue-5.10/microblaze-add-support-for-tif_notify_signal.patch
queue-5.10/net-add-accept-helper-not-installing-fd.patch
queue-5.10/ia64-add-support-for-tif_notify_signal.patch
queue-5.10/arm64-add-support-for-tif_notify_signal.patch
queue-5.10/arc-add-support-for-tif_notify_signal.patch
queue-5.10/revert-proc-don-t-allow-async-path-resolution-of-proc-thread-self-components.patch
queue-5.10/fs-make-do_renameat2-take-struct-filename.patch
queue-5.10/kernel-remove-checking-for-tif_notify_signal.patch
queue-5.10/arch-setup-pf_io_worker-threads-like-pf_kthread.patch
queue-5.10/nvme-pci-fix-mempool-alloc-size.patch
queue-5.10/fs-add-support-for-lookup_cached.patch
