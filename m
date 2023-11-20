Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CA74E7F1908
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Nov 2023 17:46:44 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=VUYpWH3+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SYth25M5tz3cc6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Nov 2023 03:46:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=VUYpWH3+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=raptorengineering.com (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org)
Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SYtg61XPjz3c5H
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Nov 2023 03:45:53 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 817958285162;
	Mon, 20 Nov 2023 10:45:47 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id cfgjffGtSyHg; Mon, 20 Nov 2023 10:45:46 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 33E1C828516D;
	Mon, 20 Nov 2023 10:45:46 -0600 (CST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 33E1C828516D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1700498746; bh=E9LVuQ9xMrWlxuivtOEla3p+fsRdVQ42Yim8JIvJpPU=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=VUYpWH3+5HWSSQ2ONHPi/p4TJfuF2QulvYGrdhJGdcxvQAZzvNBmV2PHGKDXcMux+
	 jWjmQTsPkuRkU9ZMV7/GJD85V4n++wrpKUj12Mvv82YR1JIjhSn4MEyqvtWKC52zVm
	 FHRtZvUhRM/nGSodC7bAQ3cHCiDcb+LrGqajc2D4=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id kbBG8KuwkeRb; Mon, 20 Nov 2023 10:45:46 -0600 (CST)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id F368F8285162;
	Mon, 20 Nov 2023 10:45:45 -0600 (CST)
Date: Mon, 20 Nov 2023 10:45:43 -0600 (CST)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Message-ID: <439072392.48800901.1700498743840.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <877cmc7ve9.fsf@mail.lhotse>
References: <1921539696.48534988.1700407082933.JavaMail.zimbra@raptorengineeringinc.com> <877cmc7ve9.fsf@mail.lhotse>
Subject: Re: [PATCH v2] powerpc: Don't clobber fr0/vs0 during fp|altivec
 register  save
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC119 (Linux)/8.5.0_GA_3042)
Thread-Topic: powerpc: Don't clobber fr0/vs0 during fp|altivec register save
Thread-Index: G5/9GcCQX3rPVvgf0RpaijJXf2mDxQ==
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



----- Original Message -----
> From: "Michael Ellerman" <mpe@ellerman.id.au>
> To: "Timothy Pearson" <tpearson@raptorengineering.com>, "Jens Axboe" <axboe@kernel.dk>, "regressions"
> <regressions@lists.linux.dev>, "npiggin" <npiggin@gmail.com>, "christophe leroy" <christophe.leroy@csgroup.eu>,
> "linuxppc-dev" <linuxppc-dev@lists.ozlabs.org>
> Sent: Monday, November 20, 2023 1:10:06 AM
> Subject: Re: [PATCH v2] powerpc: Don't clobber fr0/vs0 during fp|altivec register  save

> Hi Timothy,
> 
> Great work debugging this. I think your fix is good, but I want to understand it
> a bit more to make sure I can explain why we haven't seen it outside of
> io-uring.
> If this can be triggered outside of io-uring then I have even more backporting
> in my future :}
> 
> Typically save_fpu() is called from __giveup_fpu() which saves the FP regs and
> also *turns off FP* in the tasks MSR, meaning the kernel will reload the FP regs
> from the thread struct before letting the task use FP again. So in that case
> save_fpu() is free to clobber fr0 because the FP regs no longer hold live values
> for the task.
> 
> There is another case though, which is the path via:
>  copy_process()
>    dup_task_struct()
>      arch_dup_task_struct()
>        flush_all_to_thread()
>          save_all()
> 
> That path saves the FP regs but leaves them live. That's meant as an
> optimisation for a process that's using FP/VSX and then calls fork(), leaving
> the regs live means the parent process doesn't have to take a fault after the
> fork to get its FP regs back.
> 
> That path does clobber fr0, but fr0 is volatile across a syscall, and the only
> way to reach copy_process() from userspace is via a syscall. So in normal usage
> fr0 being clobbered across a syscall shouldn't cause data corruption.
> 
> Even if we handle a signal on the return from the fork() syscall, the worst that
> happens is that the task's thread struct holds the clobbered fr0, but the task
> doesn't care (because fr0 is volatile across the syscall anyway).
> 
> That path is something like:
> 
> system_call_vectored_common()
>  system_call_exception()
>    sys_fork()
>      kernel_clone()
>        copy_process()
>          dup_task_struct()
>            arch_dup_task_struct()
>              flush_all_to_thread()
>                save_all()
>                  if (tsk->thread.regs->msr & MSR_FP)
>                    save_fpu()
>                    # does not clear MSR_FP from regs->msr
>  syscall_exit_prepare()
>    interrupt_exit_user_prepare_main()
>      do_notify_resume()
>        get_signal()
>        handle_rt_signal64()
>          prepare_setup_sigcontext()
>            flush_fp_to_thread()
>              if (tsk->thread.regs->msr & MSR_FP)
>                giveup_fpu()
>                  __giveup_fpu
>                    save_fpu()
>                    # clobbered fr0 is saved, but task considers it volatile
>                    # across syscall anyway
> 
> 
> But we now have a new path, because io-uring can call copy_process() via
> create_io_thread() from the signal handling path. That's OK if the signal is
> handled as we return from a syscall, but it's not OK if the signal is handled
> due to some other interrupt.
> 
> Which is:
> 
> interrupt_return_srr_user()
>  interrupt_exit_user_prepare()
>    interrupt_exit_user_prepare_main()
>      do_notify_resume()
>        get_signal()
>          task_work_run()
>            create_worker_cb()
>              create_io_worker()
>                copy_process()
>                  dup_task_struct()
>                    arch_dup_task_struct()
>                      flush_all_to_thread()
>                        save_all()
>                          if (tsk->thread.regs->msr & MSR_FP)
>                            save_fpu()
>                            # fr0 is clobbered and potentially live in userspace
> 
> 
> So tldr I think the corruption is only an issue since io-uring started doing
> the clone via signal, which I think matches the observed timeline of this bug
> appearing.

I agree the corruption really only started showing up in earnest on io_uring clone-via-signal, as this was confirmed several times in the course of debugging.  Bear in mind however that we have seen very, very rare crashes over several years in other tasks, and I am starting to think this bug might be the root cause (see below).

Note as well that I may very well have a wrong call order in the commit message, since I was relying on a couple of WARN_ON() macros I inserted to check for a similar (but not identical) condition and didn't spend much time getting new traces after identifying the root cause.

I went back and grabbed some real world system-wide stack traces, since I now know what to trigger on.  A typical example is:

interrupt_return_srr_user()
 interrupt_exit_user_prepare()
  interrupt_exit_user_prepare_main()
   schedule()
    __schedule()
     __switch_to()
      giveup_all()
       # tsk->thread.regs->msr MSR_FP is still set here
       __giveup_fpu()
        save_fpu()
        # fr0 is clobbered and potentially live in userspace

This indicates that the pending signal is not actually required, it simply makes triggering much more likely.  Both the pending signal and the _TIF_NEED_RESCHED paths give up control and end up in the same overall position of trigging down-call routines that assume the FPU state is valid.

perl and bash seem to be affected to some degree, though current builds don't use enough VSX instructions rapidly enough to cause crashes with any significant probability.  That said, over many years of running POWER at datacenter scale I have seen enough random bash/perl crashes in the logs to recognize the pattern; I think this has been a low-grade issue for a long time, but with an infantismally small chance of happening it was seen as random noise / hardware issues / other rare bugs in various programs.
