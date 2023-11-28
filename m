Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A8A7FBA9C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Nov 2023 13:58:07 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=nEmWAsL5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SfjDX72lPz3bx0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Nov 2023 23:58:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=nEmWAsL5;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SfjCf3rPYz30gn
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Nov 2023 23:57:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1701176228;
	bh=er6Oh6offgcNAY51EXJxZpsGEuXH3YL1hPp6+sR+LG0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=nEmWAsL5yZbjkfPft+8OXOvPcLVqQZSOJFIGQQTVG0x0nu3EjaLgnGiIYi6A65X32
	 hjGxOGh/JIC8nkuyX8Caru8lsMa9SimPKCY/qvbSuKiFoGIaLYx8y8ZrhH0jqgT6ai
	 CmYQA690WV+wIGRAaLdNWG5Kq3qy+gwtl0auBJP5NAnaLVj3mcQhdkKaw7cziv9s0c
	 YpTkBAbUDoUdOZP2hKfJ7Go5CR6mCFEbJWNmO3mw4WgcSq+U6lkApOTIIHA4oQkArs
	 bslGLuAvResdfgMaE6GqqgK+VTZ8ezTWRUHgaGXMyKka6N4bTLQsEJojYX9fZsDgl6
	 6Q4ZIXCwPBvHw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SfjCP0QjVz4wbh;
	Tue, 28 Nov 2023 23:57:04 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Timothy Pearson <tpearson@raptorengineering.com>
Subject: Re: [PATCH v2] powerpc: Don't clobber fr0/vs0 during fp|altivec
 register  save
In-Reply-To: <874jh64xlb.fsf@mail.lhotse>
References: <1921539696.48534988.1700407082933.JavaMail.zimbra@raptorengineeringinc.com>
 <877cmc7ve9.fsf@mail.lhotse>
 <439072392.48800901.1700498743840.JavaMail.zimbra@raptorengineeringinc.com>
 <874jhg6lkn.fsf@mail.lhotse>
 <1294229534.48922001.1700539832331.JavaMail.zimbra@raptorengineeringinc.com>
 <87leaqjs8x.fsf@mail.lhotse>
 <1340817182.49635143.1700784119445.JavaMail.zimbra@raptorengineeringinc.com>
 <1276384468.50536225.1701110354677.JavaMail.zimbra@raptorengineeringinc.com>
 <874jh64xlb.fsf@mail.lhotse>
Date: Tue, 28 Nov 2023 23:57:01 +1100
Message-ID: <87v89m2fz6.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Jens Axboe <axboe@kernel.dk>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, regressions <regressions@lists.linux.dev>, npiggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <mpe@ellerman.id.au> writes:
> Timothy Pearson <tpearson@raptorengineering.com> writes:
>
>> Just wanted to check back and see if this patch was going to be queued
>> up soon?  We're still having to work around / advertise the data
>> destruction issues the underlying bug is causing on e.g. Debian
>> Stable.
>
> Yeah I'll apply it this week, so it will be in rc4.

I reworked the change log to include the exact call path I identified
instead of the more high level description you had. And tweaked a few
other bits of wording and so on, apparently fr0 is a kernelism, the ABI
and binutils calls it f0.

I'm not sure how wedded you were to your change log, so if you dislike
my edits let me know and we can come up with a joint one.

The actual patch is unchanged.

cheers


From 5e1d824f9a283cbf90f25241b66d1f69adb3835b Mon Sep 17 00:00:00 2001
From: Timothy Pearson <tpearson@raptorengineering.com>
Date: Sun, 19 Nov 2023 09:18:02 -0600
Subject: [PATCH] powerpc: Don't clobber f0/vs0 during fp|altivec register save

During floating point and vector save to thread data f0/vs0 are
clobbered by the FPSCR/VSCR store routine. This has been obvserved to
lead to userspace register corruption and application data corruption
with io-uring.

Fix it by restoring f0/vs0 after FPSCR/VSCR store has completed for
all the FP, altivec, VMX register save paths.

Tested under QEMU in kvm mode, running on a Talos II workstation with
dual POWER9 DD2.2 CPUs.

Additional detail (mpe):

Typically save_fpu() is called from __giveup_fpu() which saves the FP
regs and also *turns off FP* in the tasks MSR, meaning the kernel will
reload the FP regs from the thread struct before letting the task use FP
again. So in that case save_fpu() is free to clobber f0 because the FP
regs no longer hold live values for the task.

There is another case though, which is the path via:
  sys_clone()
    ...
    copy_process()
      dup_task_struct()
        arch_dup_task_struct()
          flush_all_to_thread()
            save_all()

That path saves the FP regs but leaves them live. That's meant as an
optimisation for a process that's using FP/VSX and then calls fork(),
leaving the regs live means the parent process doesn't have to take a
fault after the fork to get its FP regs back. The optimisation was added
in commit 8792468da5e1 ("powerpc: Add the ability to save FPU without
giving it up").

That path does clobber f0, but f0 is volatile across function calls,
and typically programs reach copy_process() from userspace via a syscall
wrapper function. So in normal usage f0 being clobbered across a
syscall doesn't cause visible data corruption.

But there is now a new path, because io-uring can call copy_process()
via create_io_thread() from the signal handling path. That's OK if the
signal is handled as part of syscall return, but it's not OK if the
signal is handled due to some other interrupt.

That path is:

interrupt_return_srr_user()
  interrupt_exit_user_prepare()
    interrupt_exit_user_prepare_main()
      do_notify_resume()
        get_signal()
          task_work_run()
            create_worker_cb()
              create_io_worker()
                copy_process()
                  dup_task_struct()
                    arch_dup_task_struct()
                      flush_all_to_thread()
                        save_all()
                          if (tsk->thread.regs->msr & MSR_FP)
                            save_fpu()
                            # f0 is clobbered and potentially live in userspace

Note the above discussion applies equally to save_altivec().

Fixes: 8792468da5e1 ("powerpc: Add the ability to save FPU without giving it up")
Cc: stable@vger.kernel.org # v4.6+
Closes: https://lore.kernel.org/all/480932026.45576726.1699374859845.JavaMail.zimbra@raptorengineeringinc.com/
Closes: https://lore.kernel.org/linuxppc-dev/480221078.47953493.1700206777956.JavaMail.zimbra@raptorengineeringinc.com/
Tested-by: Timothy Pearson <tpearson@raptorengineering.com>
Tested-by: Jens Axboe <axboe@kernel.dk>
Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
[mpe: Reword change log to describe exact path of corruption & other minor tweaks]
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://msgid.link/1921539696.48534988.1700407082933.JavaMail.zimbra@raptorengineeringinc.com
---
 arch/powerpc/kernel/fpu.S    | 13 +++++++++++++
 arch/powerpc/kernel/vector.S |  2 ++
 2 files changed, 15 insertions(+)

diff --git a/arch/powerpc/kernel/fpu.S b/arch/powerpc/kernel/fpu.S
index 6a9acfb690c9..2f8f3f93cbb6 100644
--- a/arch/powerpc/kernel/fpu.S
+++ b/arch/powerpc/kernel/fpu.S
@@ -23,6 +23,15 @@
 #include <asm/feature-fixups.h>
 
 #ifdef CONFIG_VSX
+#define __REST_1FPVSR(n,c,base)						\
+BEGIN_FTR_SECTION							\
+	b	2f;							\
+END_FTR_SECTION_IFSET(CPU_FTR_VSX);					\
+	REST_FPR(n,base);						\
+	b	3f;							\
+2:	REST_VSR(n,c,base);						\
+3:
+
 #define __REST_32FPVSRS(n,c,base)					\
 BEGIN_FTR_SECTION							\
 	b	2f;							\
@@ -41,9 +50,11 @@ END_FTR_SECTION_IFSET(CPU_FTR_VSX);					\
 2:	SAVE_32VSRS(n,c,base);						\
 3:
 #else
+#define __REST_1FPVSR(n,b,base)		REST_FPR(n, base)
 #define __REST_32FPVSRS(n,b,base)	REST_32FPRS(n, base)
 #define __SAVE_32FPVSRS(n,b,base)	SAVE_32FPRS(n, base)
 #endif
+#define REST_1FPVSR(n,c,base)   __REST_1FPVSR(n,__REG_##c,__REG_##base)
 #define REST_32FPVSRS(n,c,base) __REST_32FPVSRS(n,__REG_##c,__REG_##base)
 #define SAVE_32FPVSRS(n,c,base) __SAVE_32FPVSRS(n,__REG_##c,__REG_##base)
 
@@ -67,6 +78,7 @@ _GLOBAL(store_fp_state)
 	SAVE_32FPVSRS(0, R4, R3)
 	mffs	fr0
 	stfd	fr0,FPSTATE_FPSCR(r3)
+	REST_1FPVSR(0, R4, R3)
 	blr
 EXPORT_SYMBOL(store_fp_state)
 
@@ -138,4 +150,5 @@ _GLOBAL(save_fpu)
 2:	SAVE_32FPVSRS(0, R4, R6)
 	mffs	fr0
 	stfd	fr0,FPSTATE_FPSCR(r6)
+	REST_1FPVSR(0, R4, R6)
 	blr
diff --git a/arch/powerpc/kernel/vector.S b/arch/powerpc/kernel/vector.S
index 4094e4c4c77a..80b3f6e476b6 100644
--- a/arch/powerpc/kernel/vector.S
+++ b/arch/powerpc/kernel/vector.S
@@ -33,6 +33,7 @@ _GLOBAL(store_vr_state)
 	mfvscr	v0
 	li	r4, VRSTATE_VSCR
 	stvx	v0, r4, r3
+	lvx	v0, 0, r3
 	blr
 EXPORT_SYMBOL(store_vr_state)
 
@@ -109,6 +110,7 @@ _GLOBAL(save_altivec)
 	mfvscr	v0
 	li	r4,VRSTATE_VSCR
 	stvx	v0,r4,r7
+	lvx	v0,0,r7
 	blr
 
 #ifdef CONFIG_VSX
-- 
2.41.0


