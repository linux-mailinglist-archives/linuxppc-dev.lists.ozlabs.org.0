Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A91A7F220A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Nov 2023 01:19:56 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=b2DpM135;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SZ4ky2CrWz3clc
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Nov 2023 11:19:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=b2DpM135;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SZ4k41Hzqz3bvB
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Nov 2023 11:19:06 +1100 (AEDT)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-6cb66f23eddso1503447b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Nov 2023 16:19:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700525942; x=1701130742; darn=lists.ozlabs.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SN/OohZNMCwJlJlSuuwQc5xuwem9Qdkr9XpRThmJm6I=;
        b=b2DpM135wUMxFCmp7ohRKvRlSYsIZsAXacRRy2Vv5hnoTx8s5yCWw7hi/gRFdI4+G1
         5+F8RQybF4013Q64DWJhv+oPM37xM4tj7zlB01rEmn3awTRow0Aw8cwVt8OoDtsrRDgA
         7M8JxWS+xyzVWrZ79HkJVneNOWQFquNvSm75UER39VnUpws+jtSvipx1dXRR7Ki1yB96
         yNKiNteJc6i+jl/XdAmE/BtszViG+fFwPuYLjxMihyRYaT89tWdtwhtOEK4A6dLA78Jo
         1iibxpfTssvPeeB6TaKsCD+m4pQCXZaRHvJXCV2XhNMD94KnGvgt6AbP1QAJaut6U9aM
         E9bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700525942; x=1701130742;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SN/OohZNMCwJlJlSuuwQc5xuwem9Qdkr9XpRThmJm6I=;
        b=UMDrtMcq/vAyyrPQyuyLgEtpoDwJ6uw4rODOmF/wN9wbVYzTgKBx7BkcByPHfS9q9E
         ZZ5cf6zdbTZ6qZwc+KeyRv/EUHvB500NmYvnLZoBMS2HOEtfUvdlORpgagy43qjYeEXA
         DHqtIiBz3GLSskdV69ZRtLHCA+nOpyzl2jWZtCYcSvNlwWgUtcnxKg56XMcXiEppdrdi
         MtjHlSGTbYi0ye+UEwAAv7Rk68YldKJhJOOk2Zkgy2m7X6v1pQchbJZM6wsQa3QiepQm
         jT538d7I5zNbSnstc7rgpUmpVSCedEnaNiWabxp4sIjHoLQsW4viHYd5ktMSeqJ0+CF7
         AkaQ==
X-Gm-Message-State: AOJu0YwaF9PLgoykiA/eIs43R6ePMMqcpi9TI4u4DNyyNLDwO+bMaKOz
	aBJtXPQG0EQX5kjK/0BGpyA=
X-Google-Smtp-Source: AGHT+IEwiTItc6jyfJ/YFTqZl2gcdBXk7tva5FECSW3MZ4Bo6L/H0RYYCzvhc7pnxGZO2bVNVrOMtg==
X-Received: by 2002:a05:6a00:a88:b0:6c3:1b7d:dac9 with SMTP id b8-20020a056a000a8800b006c31b7ddac9mr7653602pfl.34.1700525942147;
        Mon, 20 Nov 2023 16:19:02 -0800 (PST)
Received: from localhost (203-219-179-16.tpgi.com.au. [203.219.179.16])
        by smtp.gmail.com with ESMTPSA id u2-20020a631402000000b005b4b70738e5sm6686508pgl.8.2023.11.20.16.18.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Nov 2023 16:19:01 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 21 Nov 2023 10:18:52 +1000
Message-Id: <CX424SO03Y1Q.2YCS9G1C3IAOW@wheely>
To: "Timothy Pearson" <tpearson@raptorengineering.com>, "Michael Ellerman"
 <mpe@ellerman.id.au>
Subject: Re: [PATCH v2] powerpc: Don't clobber fr0/vs0 during fp|altivec
 register  save
From: "Nicholas Piggin" <npiggin@gmail.com>
X-Mailer: aerc 0.15.2
References: <1921539696.48534988.1700407082933.JavaMail.zimbra@raptorengineeringinc.com> <877cmc7ve9.fsf@mail.lhotse> <439072392.48800901.1700498743840.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <439072392.48800901.1700498743840.JavaMail.zimbra@raptorengineeringinc.com>
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
Cc: Jens Axboe <axboe@kernel.dk>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, regressions <regressions@lists.linux.dev>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue Nov 21, 2023 at 2:45 AM AEST, Timothy Pearson wrote:
>
>
> ----- Original Message -----
> > From: "Michael Ellerman" <mpe@ellerman.id.au>
> > To: "Timothy Pearson" <tpearson@raptorengineering.com>, "Jens Axboe" <a=
xboe@kernel.dk>, "regressions"
> > <regressions@lists.linux.dev>, "npiggin" <npiggin@gmail.com>, "christop=
he leroy" <christophe.leroy@csgroup.eu>,
> > "linuxppc-dev" <linuxppc-dev@lists.ozlabs.org>
> > Sent: Monday, November 20, 2023 1:10:06 AM
> > Subject: Re: [PATCH v2] powerpc: Don't clobber fr0/vs0 during fp|altive=
c register  save
>
> > Hi Timothy,
> >=20
> > Great work debugging this. I think your fix is good, but I want to unde=
rstand it
> > a bit more to make sure I can explain why we haven't seen it outside of
> > io-uring.
> > If this can be triggered outside of io-uring then I have even more back=
porting
> > in my future :}
> >=20
> > Typically save_fpu() is called from __giveup_fpu() which saves the FP r=
egs and
> > also *turns off FP* in the tasks MSR, meaning the kernel will reload th=
e FP regs
> > from the thread struct before letting the task use FP again. So in that=
 case
> > save_fpu() is free to clobber fr0 because the FP regs no longer hold li=
ve values
> > for the task.
> >=20
> > There is another case though, which is the path via:
> >  copy_process()
> >    dup_task_struct()
> >      arch_dup_task_struct()
> >        flush_all_to_thread()
> >          save_all()
> >=20
> > That path saves the FP regs but leaves them live. That's meant as an
> > optimisation for a process that's using FP/VSX and then calls fork(), l=
eaving
> > the regs live means the parent process doesn't have to take a fault aft=
er the
> > fork to get its FP regs back.
> >=20
> > That path does clobber fr0, but fr0 is volatile across a syscall, and t=
he only
> > way to reach copy_process() from userspace is via a syscall. So in norm=
al usage
> > fr0 being clobbered across a syscall shouldn't cause data corruption.
> >=20
> > Even if we handle a signal on the return from the fork() syscall, the w=
orst that
> > happens is that the task's thread struct holds the clobbered fr0, but t=
he task
> > doesn't care (because fr0 is volatile across the syscall anyway).
> >=20
> > That path is something like:
> >=20
> > system_call_vectored_common()
> >  system_call_exception()
> >    sys_fork()
> >      kernel_clone()
> >        copy_process()
> >          dup_task_struct()
> >            arch_dup_task_struct()
> >              flush_all_to_thread()
> >                save_all()
> >                  if (tsk->thread.regs->msr & MSR_FP)
> >                    save_fpu()
> >                    # does not clear MSR_FP from regs->msr
> >  syscall_exit_prepare()
> >    interrupt_exit_user_prepare_main()
> >      do_notify_resume()
> >        get_signal()
> >        handle_rt_signal64()
> >          prepare_setup_sigcontext()
> >            flush_fp_to_thread()
> >              if (tsk->thread.regs->msr & MSR_FP)
> >                giveup_fpu()
> >                  __giveup_fpu
> >                    save_fpu()
> >                    # clobbered fr0 is saved, but task considers it vola=
tile
> >                    # across syscall anyway
> >=20
> >=20
> > But we now have a new path, because io-uring can call copy_process() vi=
a
> > create_io_thread() from the signal handling path. That's OK if the sign=
al is
> > handled as we return from a syscall, but it's not OK if the signal is h=
andled
> > due to some other interrupt.
> >=20
> > Which is:
> >=20
> > interrupt_return_srr_user()
> >  interrupt_exit_user_prepare()
> >    interrupt_exit_user_prepare_main()
> >      do_notify_resume()
> >        get_signal()
> >          task_work_run()
> >            create_worker_cb()
> >              create_io_worker()
> >                copy_process()
> >                  dup_task_struct()
> >                    arch_dup_task_struct()
> >                      flush_all_to_thread()
> >                        save_all()
> >                          if (tsk->thread.regs->msr & MSR_FP)
> >                            save_fpu()
> >                            # fr0 is clobbered and potentially live in u=
serspace
> >=20
> >=20
> > So tldr I think the corruption is only an issue since io-uring started =
doing
> > the clone via signal, which I think matches the observed timeline of th=
is bug
> > appearing.
>
> I agree the corruption really only started showing up in earnest on io_ur=
ing clone-via-signal, as this was confirmed several times in the course of =
debugging.  Bear in mind however that we have seen very, very rare crashes =
over several years in other tasks, and I am starting to think this bug migh=
t be the root cause (see below).
>
> Note as well that I may very well have a wrong call order in the commit m=
essage, since I was relying on a couple of WARN_ON() macros I inserted to c=
heck for a similar (but not identical) condition and didn't spend much time=
 getting new traces after identifying the root cause.
>
> I went back and grabbed some real world system-wide stack traces, since I=
 now know what to trigger on.  A typical example is:
>
> interrupt_return_srr_user()
>  interrupt_exit_user_prepare()
>   interrupt_exit_user_prepare_main()
>    schedule()
>     __schedule()
>      __switch_to()
>       giveup_all()
>        # tsk->thread.regs->msr MSR_FP is still set here
>        __giveup_fpu()
>         save_fpu()
>         # fr0 is clobbered and potentially live in userspace
>
> This indicates that the pending signal is not actually required, it simpl=
y makes triggering much more likely.  Both the pending signal and the _TIF_=
NEED_RESCHED paths give up control and end up in the same overall position =
of trigging down-call routines that assume the FPU state is valid.

That seems probably true, but that's on the other side of the equation,
I think? Because __giveup_fpu does clear MSR[FP] before any context
switch or return to user is possile.

*After* we have clobbered fr0 without clearing MSR_FP from the user msr,
then yes any context switch or return to user will cause uerspace to
next run with a clobbered fr0. But getting to that fr0/msr state
requires the flush_all_to_thread(), and that needs to be called in a
path where user fr0 must not be clobbered. I don't see one other than
io-uring yet.

[ KVM via kvmppc_save_user_regs() (which is basically the same as
flush_all_to_thread()) can do it. Not via the fr0 clobber in save_fpu,
because this is called via a VCPU run ioctl, but KVM will later clobber
all FP/VEC registers via running guest code. So we clobber non-volatile
regs as well. This wouldn't be causing random corruption and crashes
though, only possibly bugs in code that runs KVM guests. ]

Thanks,
Nick

>
> perl and bash seem to be affected to some degree, though current builds d=
on't use enough VSX instructions rapidly enough to cause crashes with any s=
ignificant probability.  That said, over many years of running POWER at dat=
acenter scale I have seen enough random bash/perl crashes in the logs to re=
cognize the pattern; I think this has been a low-grade issue for a long tim=
e, but with an infantismally small chance of happening it was seen as rando=
m noise / hardware issues / other rare bugs in various programs.

