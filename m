Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B0FB87F24D3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Nov 2023 05:27:48 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=ADLcADmV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SZBDy43t3z2xpx
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Nov 2023 15:27:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=ADLcADmV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=raptorengineering.com (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org)
Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SZBD55xKRz3cHf
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Nov 2023 15:27:01 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id C8A9A8284E12;
	Mon, 20 Nov 2023 22:26:58 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id 6fLGJjT-9b_4; Mon, 20 Nov 2023 22:26:56 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id A665182857F6;
	Mon, 20 Nov 2023 22:26:56 -0600 (CST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com A665182857F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1700540816; bh=97VCJw9TeCFrTRV5ThjMp7+IapYPtKTxtdNGF1e7hqI=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=ADLcADmV1JFSFijtqYqe/30oNwCNYBpLaK8vHDx1piWljSsE4Z8TCihHA6PD+mAkw
	 O3UfxY1TSQpsVKmmqbdlLJA6ghbq8AqumjjjEVyM7jAXZOJ48q4qm7vlqg7F8bJKmY
	 yR1g+J6jVYGBAVGyDcjzH8eLSLGOR0TtKw7mAEiw=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id QTTljFFp8K5c; Mon, 20 Nov 2023 22:26:56 -0600 (CST)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 6F3818284E12;
	Mon, 20 Nov 2023 22:26:56 -0600 (CST)
Date: Mon, 20 Nov 2023 22:26:54 -0600 (CST)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Message-ID: <558977252.48925254.1700540814404.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <1294229534.48922001.1700539832331.JavaMail.zimbra@raptorengineeringinc.com>
References: <1921539696.48534988.1700407082933.JavaMail.zimbra@raptorengineeringinc.com> <877cmc7ve9.fsf@mail.lhotse> <439072392.48800901.1700498743840.JavaMail.zimbra@raptorengineeringinc.com> <874jhg6lkn.fsf@mail.lhotse> <1294229534.48922001.1700539832331.JavaMail.zimbra@raptorengineeringinc.com>
Subject: Re: [PATCH v2] powerpc: Don't clobber fr0/vs0 during fp|altivec
 register  save
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC119 (Linux)/8.5.0_GA_3042)
Thread-Topic: powerpc: Don't clobber fr0/vs0 during fp|altivec register save
Thread-Index: o5SeDrCF+sPiXk0vknbS77i3C3t7PHByIwb+
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
> From: "Timothy Pearson" <tpearson@raptorengineeringinc.com>
> To: "Michael Ellerman" <mpe@ellerman.id.au>
> Cc: "Jens Axboe" <axboe@kernel.dk>, "regressions" <regressions@lists.linux.dev>, "npiggin" <npiggin@gmail.com>,
> "christophe leroy" <christophe.leroy@csgroup.eu>, "linuxppc-dev" <linuxppc-dev@lists.ozlabs.org>
> Sent: Monday, November 20, 2023 10:10:32 PM
> Subject: Re: [PATCH v2] powerpc: Don't clobber fr0/vs0 during fp|altivec register  save

> ----- Original Message -----
>> From: "Michael Ellerman" <mpe@ellerman.id.au>
>> To: "Timothy Pearson" <tpearson@raptorengineering.com>
>> Cc: "Jens Axboe" <axboe@kernel.dk>, "regressions" <regressions@lists.linux.dev>,
>> "npiggin" <npiggin@gmail.com>,
>> "christophe leroy" <christophe.leroy@csgroup.eu>, "linuxppc-dev"
>> <linuxppc-dev@lists.ozlabs.org>
>> Sent: Monday, November 20, 2023 5:39:52 PM
>> Subject: Re: [PATCH v2] powerpc: Don't clobber fr0/vs0 during fp|altivec
>> register  save
> 
>> Timothy Pearson <tpearson@raptorengineering.com> writes:
>>> ----- Original Message -----
>>>> From: "Michael Ellerman" <mpe@ellerman.id.au>
>> ...
>>>> 
>>>> But we now have a new path, because io-uring can call copy_process() via
>>>> create_io_thread() from the signal handling path. That's OK if the signal is
>>>> handled as we return from a syscall, but it's not OK if the signal is handled
>>>> due to some other interrupt.
>>>> 
>>>> Which is:
>>>> 
>>>> interrupt_return_srr_user()
>>>>  interrupt_exit_user_prepare()
>>>>    interrupt_exit_user_prepare_main()
>>>>      do_notify_resume()
>>>>        get_signal()
>>>>          task_work_run()
>>>>            create_worker_cb()
>>>>              create_io_worker()
>>>>                copy_process()
>>>>                  dup_task_struct()
>>>>                    arch_dup_task_struct()
>>>>                      flush_all_to_thread()
>>>>                        save_all()
>>>>                          if (tsk->thread.regs->msr & MSR_FP)
>>>>                            save_fpu()
>>>>                            # fr0 is clobbered and potentially live in userspace
>>>> 
>>>> 
>>>> So tldr I think the corruption is only an issue since io-uring started doing
>>>> the clone via signal, which I think matches the observed timeline of this bug
>>>> appearing.
>>>
>>> I agree the corruption really only started showing up in earnest on
>>> io_uring clone-via-signal, as this was confirmed several times in the
>>> course of debugging.
>> 
>> Thanks.
>> 
>>> Note as well that I may very well have a wrong call order in the
>>> commit message, since I was relying on a couple of WARN_ON() macros I
>>> inserted to check for a similar (but not identical) condition and
>>> didn't spend much time getting new traces after identifying the root
>>> cause.
>> 
>> Yep no worries. I'll reword it to incorporate the full path from my mail.
>> 
>>> I went back and grabbed some real world system-wide stack traces, since I now
>>> know what to trigger on.  A typical example is:
>>>
>>> interrupt_return_srr_user()
>>>  interrupt_exit_user_prepare()
>>>   interrupt_exit_user_prepare_main()
>>>    schedule()
>>>     __schedule()
>>>      __switch_to()
>>>       giveup_all()
>>>        # tsk->thread.regs->msr MSR_FP is still set here
>>>        __giveup_fpu()
>>>         save_fpu()
>>>         # fr0 is clobbered and potentially live in userspace
>> 
>> fr0 is not live there.
> <snip>
>> ie. it clears the FP etc. bits from the task's MSR. That means the FP
>> state will be reloaded from the thread struct before the task is run again.
> 
> So a little more detail on this, just to put it to rest properly vs. assuming
> hand analysis caught every possible pathway. :)
> 
> The debugging that generates this stack trace also verifies the following in
> __giveup_fpu():
> 
> 1.) tsk->thread.fp_state.fpr doesn't contain the FPSCR contents prior to calling
> save_fpu()
> 2.) tsk->thread.fp_state.fpr contains the FPSCR contents directly after calling
> save_fpu()
> 3.) MSR_FP is set both in the task struct and in the live MSR.
> 
> Only if all three conditions are met will it generate the trace.  This is a
> generalization of the hack I used to find the problem in the first place.
> 
> If the state will subsequently be reloaded from the thread struct, that means
> we're reloading the registers from the thread struct that we just verified was
> corrupted by the earlier save_fpu() call.  There are only two ways I can see
> for that to be true -- one is if the registers were already clobbered when
> giveup_all() was entered, and the other is if save_fpu() went ahead and
> clobbered them right here inside giveup_all().
> 
> To see which scenario we were dealing with, I added a bit more instrumentation
> to dump the current register state if MSR_FP bit was already set in registers
> (i.e. not dumping data from task struct, but using the live FPU registers
> instead), and sure enough the registers are corrupt on entry, so something else
> has already called save_fpu() before we even hit giveup_all() in this call
> chain.
> 
> Unless I'm missing something, doesn't this effectively mean that anything
> interrupting a task can hit this bug?  Or, put another way, I'm seeing several
> processes hit this exact call chain with the corrupt register going back out to
> userspace without io_uring even in the mix, so there seems to be another
> pathway in play.  These traces are from a qemu guest, in case it matters given
> the kvm path is possibly susceptible.
> 
> Just a few things to think about.  The FPU patch itself definitely resolves the
> problems; I used a sledgehammer approach *specifically* so that there is no
> place for a rare call sequence we didn't consider to hit it again down the
> line. :)

For reference, a couple of traces that are verified to hit the conditions above when I leave the debugging unrestricted system-wide:

From perl:

[  100.735133] NIP [c00000000001b0d8] __giveup_fpu+0xc8/0x280
[  100.735162] LR [c00000000001b084] __giveup_fpu+0x74/0x280
[  100.735190] Call Trace:
[  100.735205] [c000000008ac7710] [c000000008ac7830] 0xc000000008ac7830 (unreliable)
[  100.735251] [c000000008ac7a10] [c00000000001c094] giveup_all+0x84/0x120
[  100.735289] [c000000008ac7a40] [c00000000001cb08] __switch_to+0x128/0x2e0
[  100.735327] [c000000008ac7aa0] [c00000000101e0d0] __schedule+0x1020/0x11c0
[  100.735362] [c000000008ac7b90] [c00000000101e3f8] schedule+0x188/0x1f0
[  100.735397] [c000000008ac7c10] [c00000000063a834] pipe_read+0x3c4/0x5c0
[  100.735437] [c000000008ac7cf0] [c00000000062a9cc] vfs_read+0x18c/0x360
[  100.735505] [c000000008ac7dc0] [c00000000062b9e4] ksys_read+0xf4/0x150
[  100.735540] [c000000008ac7e10] [c00000000002fca4] system_call_exception+0x294/0x2e0
[  100.735581] [c000000008ac7e50] [c00000000000d0dc] system_call_vectored_common+0x15c/0x2ec

From mariadbd:

[  129.374710] NIP [c00000000001b0d8] __giveup_fpu+0xc8/0x280
[  129.374743] LR [c00000000001b084] __giveup_fpu+0x74/0x280
[  129.374774] Call Trace:
[  129.374791] [c000000018dbf680] [0000000000000001] 0x1 (unreliable)
[  129.374833] [c000000018dbf980] [c00000000001c094] giveup_all+0x84/0x120
[  129.374873] [c000000018dbf9b0] [c00000000001cb08] __switch_to+0x128/0x2e0
[  129.374915] [c000000018dbfa10] [c00000000101e0d0] __schedule+0x1020/0x11c0
[  129.374958] [c000000018dbfb00] [c00000000101e3f8] schedule+0x188/0x1f0
[  129.374996] [c000000018dbfb80] [c0000000002ba240] futex_wait_queue+0x80/0xf0
[  129.375051] [c000000018dbfbc0] [c0000000002baf70] __futex_wait+0xc0/0x180
[  129.375102] [c000000018dbfca0] [c0000000002bb0c4] futex_wait+0x94/0x150
[  129.375161] [c000000018dbfd60] [c0000000002b5d5c] do_futex+0x11c/0x320
[  129.375214] [c000000018dbfd90] [c0000000002b6130] sys_futex+0x1d0/0x240
[  129.375261] [c000000018dbfe10] [c00000000002fca4] system_call_exception+0x294/0x2e0
[  129.375307] [c000000018dbfe50] [c00000000000d0dc] system_call_vectored_common+0x15c/0x2ec

Another from mariadbd (this one takes out the server in this particular run, but that's just because it "lost" the race with the io_uring worker spawn):

[  136.342361] NIP [c00000000001b0d8] __giveup_fpu+0xc8/0x280
[  136.342416] LR [c00000000001b084] __giveup_fpu+0x74/0x280
[  136.342467] Call Trace:
[  136.342491] [c000000018dbf8d0] [000000000000002b] 0x2b (unreliable)
[  136.342557] [c000000018dbfbd0] [c00000000001c094] giveup_all+0x84/0x120
[  136.342620] [c000000018dbfc00] [c00000000001cb08] __switch_to+0x128/0x2e0
[  136.342685] [c000000018dbfc60] [c00000000101e0d0] __schedule+0x1020/0x11c0
[  136.342752] [c000000018dbfd50] [c00000000101e3f8] schedule+0x188/0x1f0
[  136.342818] [c000000018dbfdd0] [c00000000002e92c] interrupt_exit_user_prepare_main+0x7c/0x2e0
[  136.342907] [c000000018dbfe20] [c00000000002ee18] interrupt_exit_user_prepare+0x88/0xa0
[  136.342983] [c000000018dbfe50] [c00000000000d954] interrupt_return_srr_user+0x8/0x12c
