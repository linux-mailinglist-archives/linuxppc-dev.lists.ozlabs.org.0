Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8153D7F2186
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Nov 2023 00:40:47 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=mBgU9yMf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SZ3sn3J1Tz3cW2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Nov 2023 10:40:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=mBgU9yMf;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SZ3rx0jNSz3bvB
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Nov 2023 10:40:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1700523598;
	bh=7QPI8VWUdEu12oGh43xGASH6N9c46ghh6+F90698EPk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=mBgU9yMf+frz1VCwrwrAQTWZKq+rpDynmWKDewvJIib145Ltkew3xZQ0ze9kad0IS
	 tyI6IlB3AFEj/vKjZO5D+EfnyDP4BJI0NNyg9uqi9vQkRT+5ZcUqbCj6bTDoBmJA0k
	 RXZxE9CumvDD8Kg+Rre/51WOy5caoFg2iN71bzTOxNp3vMYlXRQ961SE9YlyeFos59
	 PJKA1Z42/IhHhmuzy45owZDvHv/mlFIa0HyHyIbwPvWw3OHVF20Io4WY1oXIw5sDbH
	 jflZOD69CwG5KtssfvOnpvS2+h0s+XG3Qu3korfu2XRZ6HbJJclcynRCdWhtaVY3ny
	 qSjOCL1LZ5yYg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SZ3rs440Qz4wd7;
	Tue, 21 Nov 2023 10:39:57 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Timothy Pearson <tpearson@raptorengineering.com>
Subject: Re: [PATCH v2] powerpc: Don't clobber fr0/vs0 during fp|altivec
 register  save
In-Reply-To: <439072392.48800901.1700498743840.JavaMail.zimbra@raptorengineeringinc.com>
References: <1921539696.48534988.1700407082933.JavaMail.zimbra@raptorengineeringinc.com>
 <877cmc7ve9.fsf@mail.lhotse>
 <439072392.48800901.1700498743840.JavaMail.zimbra@raptorengineeringinc.com>
Date: Tue, 21 Nov 2023 10:39:52 +1100
Message-ID: <874jhg6lkn.fsf@mail.lhotse>
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

Timothy Pearson <tpearson@raptorengineering.com> writes:
> ----- Original Message -----
>> From: "Michael Ellerman" <mpe@ellerman.id.au>
...
>> 
>> But we now have a new path, because io-uring can call copy_process() via
>> create_io_thread() from the signal handling path. That's OK if the signal is
>> handled as we return from a syscall, but it's not OK if the signal is handled
>> due to some other interrupt.
>> 
>> Which is:
>> 
>> interrupt_return_srr_user()
>>  interrupt_exit_user_prepare()
>>    interrupt_exit_user_prepare_main()
>>      do_notify_resume()
>>        get_signal()
>>          task_work_run()
>>            create_worker_cb()
>>              create_io_worker()
>>                copy_process()
>>                  dup_task_struct()
>>                    arch_dup_task_struct()
>>                      flush_all_to_thread()
>>                        save_all()
>>                          if (tsk->thread.regs->msr & MSR_FP)
>>                            save_fpu()
>>                            # fr0 is clobbered and potentially live in userspace
>> 
>> 
>> So tldr I think the corruption is only an issue since io-uring started doing
>> the clone via signal, which I think matches the observed timeline of this bug
>> appearing.
>
> I agree the corruption really only started showing up in earnest on
> io_uring clone-via-signal, as this was confirmed several times in the
> course of debugging.

Thanks.

> Note as well that I may very well have a wrong call order in the
> commit message, since I was relying on a couple of WARN_ON() macros I
> inserted to check for a similar (but not identical) condition and
> didn't spend much time getting new traces after identifying the root
> cause.

Yep no worries. I'll reword it to incorporate the full path from my mail.

> I went back and grabbed some real world system-wide stack traces, since I now know what to trigger on.  A typical example is:
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

fr0 is not live there.

__giveup_fpu() does roughly:

	msr = tsk->thread.regs->msr;
	msr &= ~(MSR_FP|MSR_FE0|MSR_FE1);
        msr &= ~MSR_VSX;
	tsk->thread.regs = msr;

ie. it clears the FP etc. bits from the task's MSR. That means the FP
state will be reloaded from the thread struct before the task is run again.

Also on that path we're switching to another task, so we'll be reloading
the other task's FP state before returning to userspace.

So I don't see any bug there.

There's only two places that call save_fpu() and skip the giveup logic,
which is save_all() and kvmppc_save_user_regs().

save_all() is only called via clone() so I think that's unable to
actually cause visible register corruption as I described in my previous
mail.

I thought the KVM case was similar, as it's called via an ioctl, but
I'll have to talk to Nick as his mail indicates otherwise.

cheers
