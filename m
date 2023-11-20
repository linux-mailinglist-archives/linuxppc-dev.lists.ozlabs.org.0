Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 616467F0C92
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Nov 2023 08:11:14 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=M0npMICO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SYdw027P5z3cZw
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Nov 2023 18:11:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=M0npMICO;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SYdv75YKTz30LM
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Nov 2023 18:10:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1700464217;
	bh=NqO1UU1D8tElDwfe1YSZdsclmYNmcaXXWIsZ2CYUcYk=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=M0npMICOltT3UP3Hc9V43hgz+68tulgo6LXGNSVLCleD5F3Bqea783kPtTFhwMJhJ
	 G2ecR6TZy4dLiJ6MX3xp5QOs1+QA53vVWDB3+4SoWYCDhtQKtXIOJCqP3O0bt6BW/d
	 sVqoQMPYwOw1yypCkAB6AzwjK3az9zShIr46Fwq7RieQ1HABbO+E9d5T3Hi8CrlI0n
	 iwr/iHAft8bi7h3iCD5xCHK4i7Ygfdte5/5kDzseyc984nq3K9yR2TTbAXdGy+BTx2
	 Hlhka0Xrm9epxGDT3RstjDHkJ8+UNXc3Dwjjrjzhc8KjO+TWrnGTJ+21WtuxLsBYl1
	 n7Pj1dehE2G1g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SYdtt6vkJz4x5n;
	Mon, 20 Nov 2023 18:10:13 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Timothy Pearson <tpearson@raptorengineering.com>, Jens Axboe
 <axboe@kernel.dk>, regressions <regressions@lists.linux.dev>, npiggin
 <npiggin@gmail.com>, christophe leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v2] powerpc: Don't clobber fr0/vs0 during fp|altivec
 register  save
In-Reply-To: <1921539696.48534988.1700407082933.JavaMail.zimbra@raptorengineeringinc.com>
References: <1921539696.48534988.1700407082933.JavaMail.zimbra@raptorengineeringinc.com>
Date: Mon, 20 Nov 2023 18:10:06 +1100
Message-ID: <877cmc7ve9.fsf@mail.lhotse>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Timothy,

Great work debugging this. I think your fix is good, but I want to understand it
a bit more to make sure I can explain why we haven't seen it outside of io-uring.
If this can be triggered outside of io-uring then I have even more backporting
in my future :}

Typically save_fpu() is called from __giveup_fpu() which saves the FP regs and
also *turns off FP* in the tasks MSR, meaning the kernel will reload the FP regs
from the thread struct before letting the task use FP again. So in that case
save_fpu() is free to clobber fr0 because the FP regs no longer hold live values
for the task.

There is another case though, which is the path via:
  copy_process()
    dup_task_struct()
      arch_dup_task_struct()
        flush_all_to_thread()
          save_all()

That path saves the FP regs but leaves them live. That's meant as an
optimisation for a process that's using FP/VSX and then calls fork(), leaving
the regs live means the parent process doesn't have to take a fault after the
fork to get its FP regs back.

That path does clobber fr0, but fr0 is volatile across a syscall, and the only
way to reach copy_process() from userspace is via a syscall. So in normal usage
fr0 being clobbered across a syscall shouldn't cause data corruption.

Even if we handle a signal on the return from the fork() syscall, the worst that
happens is that the task's thread struct holds the clobbered fr0, but the task
doesn't care (because fr0 is volatile across the syscall anyway).

That path is something like:

system_call_vectored_common()
  system_call_exception()
    sys_fork()
      kernel_clone()
        copy_process()
          dup_task_struct()
            arch_dup_task_struct()
              flush_all_to_thread()
                save_all()
                  if (tsk->thread.regs->msr & MSR_FP)
                    save_fpu()
                    # does not clear MSR_FP from regs->msr
  syscall_exit_prepare()
    interrupt_exit_user_prepare_main()
      do_notify_resume()
        get_signal()
        handle_rt_signal64()
          prepare_setup_sigcontext()
            flush_fp_to_thread()
              if (tsk->thread.regs->msr & MSR_FP)
                giveup_fpu()
                  __giveup_fpu
                    save_fpu()
                    # clobbered fr0 is saved, but task considers it volatile
                    # across syscall anyway


But we now have a new path, because io-uring can call copy_process() via
create_io_thread() from the signal handling path. That's OK if the signal is
handled as we return from a syscall, but it's not OK if the signal is handled
due to some other interrupt.

Which is:

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
                            # fr0 is clobbered and potentially live in userspace


So tldr I think the corruption is only an issue since io-uring started doing
the clone via signal, which I think matches the observed timeline of this bug
appearing.

Gotta run home, will have a closer look at the actual patch later on.

cheers


Timothy Pearson <tpearson@raptorengineering.com> writes:
> During floating point and vector save to thread data fr0/vs0 are clobbered
> by the FPSCR/VSCR store routine.  This leads to userspace register corruption
> and application data corruption / crash under the following rare condition:
>
>  * A userspace thread is executing with VSX/FP mode enabled
>  * The userspace thread is making active use of fr0 and/or vs0
>  * An IPI is taken in kernel mode, forcing the userspace thread to reschedule
>  * The userspace thread is interrupted by the IPI before accessing data it
>    previously stored in fr0/vs0
>  * The thread being switched in by the IPI has a pending signal
>
> If these exact criteria are met, then the following sequence happens:
>
>  * The existing thread FP storage is still valid before the IPI, due to a
>    prior call to save_fpu() or store_fp_state().  Note that the current
>    fr0/vs0 registers have been clobbered, so the FP/VSX state in registers
>    is now invalid pending a call to restore_fp()/restore_altivec().
>  * IPI -- FP/VSX register state remains invalid
>  * interrupt_exit_user_prepare_main() calls do_notify_resume(),
>    due to the pending signal
>  * do_notify_resume() eventually calls save_fpu() via giveup_fpu(), which
>    merrily reads and saves the invalid FP/VSX state to thread local storage.
>  * interrupt_exit_user_prepare_main() calls restore_math(), writing the invalid
>    FP/VSX state back to registers.
>  * Execution is released to userspace, and the application crashes or corrupts
>    data.
>
> Without the pending signal, do_notify_resume() is never called, therefore the
> invalid register state does't matter as it is overwritten nearly immediately
> by interrupt_exit_user_prepare_main() calling restore_math() before return
> to userspace.
>
> Restore fr0/vs0 after FPSCR/VSCR store has completed for both the fp and
> altivec register save paths.
>
> Tested under QEMU in kvm mode, running on a Talos II workstation with dual
> POWER9 DD2.2 CPUs.
>
> Closes: https://lore.kernel.org/all/480932026.45576726.1699374859845.JavaMail.zimbra@raptorengineeringinc.com/
> Closes: https://lore.kernel.org/linuxppc-dev/480221078.47953493.1700206777956.JavaMail.zimbra@raptorengineeringinc.com/
> Tested-by: Timothy Pearson <tpearson@raptorengineering.com>
> Tested-by: Jens Axboe <axboe@kernel.dk>
> Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
> ---
>  arch/powerpc/kernel/fpu.S    | 13 +++++++++++++
>  arch/powerpc/kernel/vector.S |  2 ++
>  2 files changed, 15 insertions(+)
>
> diff --git a/arch/powerpc/kernel/fpu.S b/arch/powerpc/kernel/fpu.S
> index 6a9acfb690c9..2f8f3f93cbb6 100644
> --- a/arch/powerpc/kernel/fpu.S
> +++ b/arch/powerpc/kernel/fpu.S
> @@ -23,6 +23,15 @@
>  #include <asm/feature-fixups.h>
>  
>  #ifdef CONFIG_VSX
> +#define __REST_1FPVSR(n,c,base)						\
> +BEGIN_FTR_SECTION							\
> +	b	2f;							\
> +END_FTR_SECTION_IFSET(CPU_FTR_VSX);					\
> +	REST_FPR(n,base);						\
> +	b	3f;							\
> +2:	REST_VSR(n,c,base);						\
> +3:
> +
>  #define __REST_32FPVSRS(n,c,base)					\
>  BEGIN_FTR_SECTION							\
>  	b	2f;							\
> @@ -41,9 +50,11 @@ END_FTR_SECTION_IFSET(CPU_FTR_VSX);					\
>  2:	SAVE_32VSRS(n,c,base);						\
>  3:
>  #else
> +#define __REST_1FPVSR(n,b,base)		REST_FPR(n, base)
>  #define __REST_32FPVSRS(n,b,base)	REST_32FPRS(n, base)
>  #define __SAVE_32FPVSRS(n,b,base)	SAVE_32FPRS(n, base)
>  #endif
> +#define REST_1FPVSR(n,c,base)   __REST_1FPVSR(n,__REG_##c,__REG_##base)
>  #define REST_32FPVSRS(n,c,base) __REST_32FPVSRS(n,__REG_##c,__REG_##base)
>  #define SAVE_32FPVSRS(n,c,base) __SAVE_32FPVSRS(n,__REG_##c,__REG_##base)
>  
> @@ -67,6 +78,7 @@ _GLOBAL(store_fp_state)
>  	SAVE_32FPVSRS(0, R4, R3)
>  	mffs	fr0
>  	stfd	fr0,FPSTATE_FPSCR(r3)
> +	REST_1FPVSR(0, R4, R3)
>  	blr
>  EXPORT_SYMBOL(store_fp_state)
>  
> @@ -138,4 +150,5 @@ _GLOBAL(save_fpu)
>  2:	SAVE_32FPVSRS(0, R4, R6)
>  	mffs	fr0
>  	stfd	fr0,FPSTATE_FPSCR(r6)
> +	REST_1FPVSR(0, R4, R6)
>  	blr
> diff --git a/arch/powerpc/kernel/vector.S b/arch/powerpc/kernel/vector.S
> index 4094e4c4c77a..80b3f6e476b6 100644
> --- a/arch/powerpc/kernel/vector.S
> +++ b/arch/powerpc/kernel/vector.S
> @@ -33,6 +33,7 @@ _GLOBAL(store_vr_state)
>  	mfvscr	v0
>  	li	r4, VRSTATE_VSCR
>  	stvx	v0, r4, r3
> +	lvx	v0, 0, r3
>  	blr
>  EXPORT_SYMBOL(store_vr_state)
>  
> @@ -109,6 +110,7 @@ _GLOBAL(save_altivec)
>  	mfvscr	v0
>  	li	r4,VRSTATE_VSCR
>  	stvx	v0,r4,r7
> +	lvx	v0,0,r7
>  	blr
>  
>  #ifdef CONFIG_VSX
> -- 
> 2.39.2

