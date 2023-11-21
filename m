Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFAEC7F2306
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Nov 2023 02:24:50 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=WOqx1RsR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SZ69r4r0Jz3d8N
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Nov 2023 12:24:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=WOqx1RsR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=raptorengineering.com (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org)
Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SZ68y1BNZz3bYx
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Nov 2023 12:24:02 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 42E178285669;
	Mon, 20 Nov 2023 19:23:59 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id sW56W62J5lEC; Mon, 20 Nov 2023 19:23:58 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 13EC982857F6;
	Mon, 20 Nov 2023 19:23:58 -0600 (CST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 13EC982857F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1700529838; bh=6wgLgNL21hmd4mvVX7kKnn+P3JT1JuCUdVe5076o16I=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=WOqx1RsRd2eSdqDmGhk/ipkOXilfUh9vP1yuskDKOv19yiE2aZP03UU/20EbsIoEL
	 hZS6xgNhs4/wUw4+Jth5b/kn+BcdGFttMk7EEYiKAqQOQNnz7PocLK64kMX6ltmKf8
	 z5mjw/AId8qyZFgWMpn7zI+9Y9VuMfoCdZJWclIU=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id yShHFOYeSis1; Mon, 20 Nov 2023 19:23:57 -0600 (CST)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id D083A8285669;
	Mon, 20 Nov 2023 19:23:57 -0600 (CST)
Date: Mon, 20 Nov 2023 19:23:57 -0600 (CST)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Message-ID: <608737213.48890358.1700529837699.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <874jhg6lkn.fsf@mail.lhotse>
References: <1921539696.48534988.1700407082933.JavaMail.zimbra@raptorengineeringinc.com> <877cmc7ve9.fsf@mail.lhotse> <439072392.48800901.1700498743840.JavaMail.zimbra@raptorengineeringinc.com> <874jhg6lkn.fsf@mail.lhotse>
Subject: Re: [PATCH v2] powerpc: Don't clobber fr0/vs0 during fp|altivec
 register  save
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC119 (Linux)/8.5.0_GA_3042)
Thread-Topic: powerpc: Don't clobber fr0/vs0 during fp|altivec register save
Thread-Index: 3JPZhG7uJ/dvg8ONaRi3ytoX/GuIYg==
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
> To: "Timothy Pearson" <tpearson@raptorengineering.com>
> Cc: "Jens Axboe" <axboe@kernel.dk>, "regressions" <regressions@lists.linux.dev>, "npiggin" <npiggin@gmail.com>,
> "christophe leroy" <christophe.leroy@csgroup.eu>, "linuxppc-dev" <linuxppc-dev@lists.ozlabs.org>
> Sent: Monday, November 20, 2023 5:39:52 PM
> Subject: Re: [PATCH v2] powerpc: Don't clobber fr0/vs0 during fp|altivec register  save

> Timothy Pearson <tpearson@raptorengineering.com> writes:
>> ----- Original Message -----
>>> From: "Michael Ellerman" <mpe@ellerman.id.au>
> ...
>>> 
>>> But we now have a new path, because io-uring can call copy_process() via
>>> create_io_thread() from the signal handling path. That's OK if the signal is
>>> handled as we return from a syscall, but it's not OK if the signal is handled
>>> due to some other interrupt.
>>> 
>>> Which is:
>>> 
>>> interrupt_return_srr_user()
>>>  interrupt_exit_user_prepare()
>>>    interrupt_exit_user_prepare_main()
>>>      do_notify_resume()
>>>        get_signal()
>>>          task_work_run()
>>>            create_worker_cb()
>>>              create_io_worker()
>>>                copy_process()
>>>                  dup_task_struct()
>>>                    arch_dup_task_struct()
>>>                      flush_all_to_thread()
>>>                        save_all()
>>>                          if (tsk->thread.regs->msr & MSR_FP)
>>>                            save_fpu()
>>>                            # fr0 is clobbered and potentially live in userspace
>>> 
>>> 
>>> So tldr I think the corruption is only an issue since io-uring started doing
>>> the clone via signal, which I think matches the observed timeline of this bug
>>> appearing.
>>
>> I agree the corruption really only started showing up in earnest on
>> io_uring clone-via-signal, as this was confirmed several times in the
>> course of debugging.
> 
> Thanks.
> 
>> Note as well that I may very well have a wrong call order in the
>> commit message, since I was relying on a couple of WARN_ON() macros I
>> inserted to check for a similar (but not identical) condition and
>> didn't spend much time getting new traces after identifying the root
>> cause.
> 
> Yep no worries. I'll reword it to incorporate the full path from my mail.
> 
>> I went back and grabbed some real world system-wide stack traces, since I now
>> know what to trigger on.  A typical example is:
>>
>> interrupt_return_srr_user()
>>  interrupt_exit_user_prepare()
>>   interrupt_exit_user_prepare_main()
>>    schedule()
>>     __schedule()
>>      __switch_to()
>>       giveup_all()
>>        # tsk->thread.regs->msr MSR_FP is still set here
>>        __giveup_fpu()
>>         save_fpu()
>>         # fr0 is clobbered and potentially live in userspace
> 
> fr0 is not live there.
> 
> __giveup_fpu() does roughly:
> 
>	msr = tsk->thread.regs->msr;
>	msr &= ~(MSR_FP|MSR_FE0|MSR_FE1);
>        msr &= ~MSR_VSX;
>	tsk->thread.regs = msr;
> 
> ie. it clears the FP etc. bits from the task's MSR. That means the FP
> state will be reloaded from the thread struct before the task is run again.
> 
> Also on that path we're switching to another task, so we'll be reloading
> the other task's FP state before returning to userspace.
> 
> So I don't see any bug there.

Yeah, you're right.  I was trying to get traces while doing something else, and didn't think that all the way through, sorry. :)  It's not going to be super easy to get a real trace (I was triggering the WARN_ON() from of fr0 getting set to to FPSCR), so let's just assume it's mainly the path you manually found above and update the commit message accordingly.

> There's only two places that call save_fpu() and skip the giveup logic,
> which is save_all() and kvmppc_save_user_regs().

Now that's interesting as well, since it might explain some issues I've seen for years on a specific QEMU workload.  Once this is backported to stable I'll need to get the kernels updated on those boxes and see if the issues disappear...
