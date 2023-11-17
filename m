Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B397EED82
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Nov 2023 09:27:29 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=Hs/iKoZm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SWqlM4KJNz3dGr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Nov 2023 19:27:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=Hs/iKoZm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=raptorengineering.com (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org)
Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SWqkX1XVWz3c5L
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Nov 2023 19:26:44 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 6CF91828552E;
	Fri, 17 Nov 2023 02:26:41 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id Ne5MXNaKb25Z; Fri, 17 Nov 2023 02:26:40 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id DE5778285534;
	Fri, 17 Nov 2023 02:26:39 -0600 (CST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com DE5778285534
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1700209599; bh=r9DrFMTq3Sm9cdwAOOllAD43tYaUZCxnt+AB1b45xsQ=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=Hs/iKoZmlJEDL2Aqcv7KvjZ9JCCSK7n0/wy/lP8bv+/EAe4sAlaweO08nN9kftt2q
	 k97P0kr0KGBm3QaddDXBSQt3bXwAwEgvVLmbV4SQALfB/v/rTVzN5GUz7ozge5IXsE
	 wVoV8VRK/5SfAJ3OFHlCPx9k8YaNOyH65si4dEpY=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id dLdOvBTOPhSM; Fri, 17 Nov 2023 02:26:39 -0600 (CST)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id B4B13828552E;
	Fri, 17 Nov 2023 02:26:39 -0600 (CST)
Date: Fri, 17 Nov 2023 02:26:37 -0600 (CST)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: Timothy Pearson <tpearson@raptorengineering.com>
Message-ID: <838324337.47961735.1700209597749.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <868826327.47960095.1700209229200.JavaMail.zimbra@raptorengineeringinc.com>
References: <1654757454.47202735.1699948827325.JavaMail.zimbra@raptorengineeringinc.com> <87pm0c7cr6.fsf@mail.lhotse> <480221078.47953493.1700206777956.JavaMail.zimbra@raptorengineeringinc.com> <CX0XGLS2M4KG.1WIPX82OSTTRT@wheely> <868826327.47960095.1700209229200.JavaMail.zimbra@raptorengineeringinc.com>
Subject: Re: [PATCH] powerpc: Fix data corruption on IPI
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC119 (Linux)/8.5.0_GA_3042)
Thread-Topic: powerpc: Fix data corruption on IPI
Thread-Index: Tchr9wd/0jxg9/pWCcqZ96BI2SOpHRw8pUlM
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, npiggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



----- Original Message -----
> From: "Timothy Pearson" <tpearson@raptorengineering.com>
> To: "npiggin" <npiggin@gmail.com>
> Cc: "linuxppc-dev" <linuxppc-dev@lists.ozlabs.org>
> Sent: Friday, November 17, 2023 2:20:29 AM
> Subject: Re: [PATCH] powerpc: Fix data corruption on IPI

> ----- Original Message -----
>> From: "npiggin" <npiggin@gmail.com>
>> To: "Timothy Pearson" <tpearson@raptorengineering.com>, "Michael Ellerman"
>> <mpe@ellerman.id.au>
>> Cc: "linuxppc-dev" <linuxppc-dev@lists.ozlabs.org>
>> Sent: Friday, November 17, 2023 2:01:12 AM
>> Subject: Re: [PATCH] powerpc: Fix data corruption on IPI
> 
>> On Fri Nov 17, 2023 at 5:39 PM AEST, Timothy Pearson wrote:
>>>
>>>
>>> ----- Original Message -----
>>> > From: "Michael Ellerman" <mpe@ellerman.id.au>
>>> > To: "Timothy Pearson" <tpearson@raptorengineering.com>, "linuxppc-dev"
>>> > <linuxppc-dev@lists.ozlabs.org>
>>> > Cc: "Jens Axboe" <axboe@kernel.dk>
>>> > Sent: Tuesday, November 14, 2023 6:14:37 AM
>>> > Subject: Re: [PATCH] powerpc: Fix data corruption on IPI
>>>
>>> > Hi Timothy,
>>> > 
>>> > Thanks for debugging this, but I'm unclear why this is helping because
>>> > we should already have a full barrier (hwsync) on both the sending and
>>> > receiving side.
>>> > 
>>> > More below.
>>>
>>> I've spent another few days poking at this, and think I might finally have
>>> something more solid in terms of what exactly is happening, but would like some
>>> feedback on the concept / how best to fix the potential problem.
>>>
>>> As background, there are several worker threads both in userspace and in kernel
>>> mode.  Crucially, the main MariaDB data processing thread (the one that handles
>>> tasks like flushing dirty pages to disk) always runs on the same core as the
>>> io_uring kernel thread that picks up I/O worker creation requests and handles
>>> them via create_worker_cb().
>>>
>>> Changes in the ~5.12 era switched away from a delayed worker setup.  io_uring
>>> currently sets up the new process with create_io_thread(), and immediately uses
>>> an IPI to forcibly schedule the new process.  Because of the way the two
>>> threads interact, the new process ends up grabbing the CPU from the running
>>> MariaDB user thread; I've never seen it schedule on a different core.  If the
>>> timing is right in this process, things get trampled on in userspace and the
>>> database server either crashes or throws a corruption fault.
>>>
>>> Through extensive debugging, I've narrowed this down to invalid state in the VSX
>>> registers on return to the MariaDB user thread from the new kernel thread.  For
>>> some reason, it seems we don't restore FP state on return from the PF_IO_WORKER
>>> thread, and something in the kernel was busy writing new data to them.
>>>
>>> A direct example I was able to observe is as follows:
>>>
>>> xxspltd vs0,vs0,0      <-- vs0 now zeroed out
>>> xori    r9,r9,1        <-- Presumably we switch to the new kernel thread here
>>> due to the IPI
>>> slwi    r9,r9,7        <-- On userspace thread resume, vs0 now contains the
>>> value 0x820040000000000082004000
>>> xxswapd vs8,vs0        <-- vs8 now has the wrong value
>>> stxvd2x vs8,r3,r12     <-- userspace is now getting stepped on
>>> stw     r9,116(r3)
>>> stxvd2x vs8,r3,r0
>>> ...
>>> CRASH
>> 
>> Nice find, that looks pretty conclusive.
>> 
>>> This is a very difficult race to hit, but MariaDB naturally does repetitive
>>> operations with VSX registers so it does eventually fail.  I ended up with a
>>> tight loop around glibc operations that use VSX to trigger the failure reliably
>>> enough to even understand what was going on.
>>>
>>> As I am not as familiar with this part of the Linux kernel as with most other
>>> areas, what is the expected save/restore path for the FP/VSX registers around
>>> an IPI and associated forced thread switch?  If restore_math() is in the return
>>> path, note that MSR_FP is set in regs->msr.
>> 
>> Context switching these FP/vec registers should be pretty robust in
>> general because it's not just io-uring that uses them. io-uring could
>> be using some uncommon kernel code that uses the registers incorrectly
>> though I guess.
>> 
>>>
>>> Second question: should we even be using the VSX registers at all in kernel
>>> space?  Is this a side effect of io_uring interacting so closely with userspace
>>> threads, or something else entirely?
>>>
>>> If I can get pointed somewhat in the right direction I'm ready to develop the
>>> rest of the fix for this issue...just trying to avoid another several days of
>>> slogging through the source to see what it's supposed to be doing in the first
>>> place. :)
>> 
>> Kernel can use FP/VEC/VSX registers but it has to enable and disable
>> explicitly. Such kernel code also should not be preemptible.
>> 
>> enable|disable_kernel_fp|altivec|vsx().
>> 
>> Maybe try run the test with ppc_strict_facility_enable boot option to
>> start with.
>> 
>> If no luck with that, maybe put WARN_ON(preemptible()); checks also in
>> the disable_kernel_* functions.
>> 
>> You could also add an enable/disable counter for each, and make sure it
>> is balanced on context switch or kernel->userspace exit.
>> 
>> Thanks,
>> Nick
> 
> Will do, thanks for the hints!
> 
> I had a debug idea just as I sent the earlier message, and was able to confirm
> the kernel is purposefully restoring the bad data in at least one spot in the
> thread's history, though curiously *not* right before everything goes off the
> rails.  I also dumped the entire kernel binary and confirmed it isn't touching
> the vs* registers, so overall this is leaning more toward a bad value being
> restored than kernel code inadvertently making use of the vector registers.
> 
> An I missing anything other than do_restore_fp() that could touch the vs*
> registers around an interrupt-driven task switch?

One other piece of this puzzle -- I'm running this via qemu in kvm mode.  I noticed there is some code that touches FP state in the kvm tree, any way we could be having a problem lower down the stack (i.e. at hypervisor level) that would manifest this way in the guest?

I can try to test on bare metal tomorrow to rule that out one way or the other.
