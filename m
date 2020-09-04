Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AC90A25D5BF
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Sep 2020 12:15:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BjYTH3JcDzDrBJ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Sep 2020 20:15:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1;
 helo=galois.linutronix.de; envelope-from=tglx@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=dZBSlId5; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=eoru9GuS; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BjYR94NNczDr8D
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Sep 2020 20:13:25 +1000 (AEST)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1599214396;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z8OvW6DJXZpgU3aKJ+ArJf6u2HaUfprFbOOK8smF874=;
 b=dZBSlId5W09VtfHcoWhseB5XiTBbGXWSjSWG5XFU58ZWYuqDdtM4Ipu9mNGZY+ddAn37dS
 AxDs/0r1rhHicd824BDPwytOgDf8f17n5gdpXS06ccu1J8J02/S3Px3uFgDRLoGRl+PjKM
 bU83O/2nJ/tSYGIE4CElngX6XiPbSOHvrFIlF/46BHUlEwSBUrrrMnzuy1Ks/8KOesKn82
 yzz5TXpXJFv9IUUrWA8fr+U2kWyVy8VmvS31HDRYjYZ0xy05l0NK41J5gNkBa6AjMjEEvi
 SqxPITHKMuMWLYE38SvauwgernJ2tQIyJdf2qZxYvlL917z72wWol9JRX9XuYQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1599214396;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z8OvW6DJXZpgU3aKJ+ArJf6u2HaUfprFbOOK8smF874=;
 b=eoru9GuSlO3Zvk6GwC/O3LrVM2/p6u5L16LR2oCIwbP9/NjUC2FQtUYVwbzdk2rHLSP1Ta
 igirNT0+2/4DKxDw==
To: Andy Lutomirski <luto@kernel.org>
Subject: Re: ptrace_syscall_32 is failing
In-Reply-To: <CALCETrUuyXpG0Vhrb-9m-G8J94+2bGqdrJkKfz+-5z7dsGLK8Q@mail.gmail.com>
References: <CALCETrWXvAMA7tQ3XZdAk2FixKfzQ_0fBmyNVyyPHVAomLvrWQ@mail.gmail.com>
 <CAMzpN2hmR+0-Yse1csbiVOiqgZ0e+VRkCBBXUKoPSTSMOOOFAQ@mail.gmail.com>
 <CALCETrXY1x0MReMoTOG2awcZvr4c7gp99JVNthK37vUUk-kyew@mail.gmail.com>
 <87k0xdjbtt.fsf@nanos.tec.linutronix.de>
 <CALCETrUpjUPPvnPuS9fP4jgid7U_qdU_yTKSq9PjJ=z2w9HvHg@mail.gmail.com>
 <87blioinub.fsf@nanos.tec.linutronix.de>
 <CALCETrUuyXpG0Vhrb-9m-G8J94+2bGqdrJkKfz+-5z7dsGLK8Q@mail.gmail.com>
Date: Fri, 04 Sep 2020 12:13:15 +0200
Message-ID: <87mu254zpg.fsf@nanos.tec.linutronix.de>
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
Cc: linux-s390 <linux-s390@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Vasily Gorbik <gor@linux.ibm.com>, Brian Gerst <brgerst@gmail.com>,
 Heiko Carstens <hca@linux.ibm.com>, X86 ML <x86@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Paul Mackerras <paulus@samba.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Andy Lutomirski <luto@kernel.org>, Will Deacon <will@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Andy,

On Wed, Sep 02 2020 at 09:49, Andy Lutomirski wrote:
> On Wed, Sep 2, 2020 at 1:29 AM Thomas Gleixner <tglx@linutronix.de> wrote:
>>
>> But you might tell me where exactly you want to inject the SIGTRAP in
>> the syscall exit code flow.
>
> It would be a bit complicated.  Definitely after any signals from the
> syscall are delivered.  Right now, I think that we don't deliver a
> SIGTRAP on the instruction boundary after SYSCALL while
> single-stepping.  (I think we used to, but only sometimes, and now we
> are at least consistent.)  This is because IRET will not trap if it
> starts with TF clear and ends up setting it.  (I asked Intel to
> document this, and I think they finally did, although I haven't gotten
> around to reading the new docs.  Certainly the old docs as of a year
> or two ago had no description whatsoever of how TF changes worked.)
>
> Deciding exactly *when* a trap should occur would be nontrivial -- we
> can't trap on sigreturn() from a SIGTRAP, for example.
>
> So this isn't fully worked out.

Oh well.

>> >> I don't think we want that in general. The current variant is perfectly
>> >> fine for everything except the 32bit fast syscall nonsense. Also
>> >> irqentry_entry/exit is not equivalent to the syscall_enter/exit
>> >> counterparts.
>> >
>> > If there are any architectures in which actual work is needed to
>> > figure out whether something is a syscall in the first place, they'll
>> > want to do the usual kernel entry work before the syscall entry work.
>>
>> That's low level entry code which does not require RCU, lockdep, tracing
>> or whatever muck we setup before actual work can be done.
>>
>> arch_asm_entry()
>>   ...
>>   arch_c_entry(cause) {
>>     switch(cause) {
>>       case EXCEPTION: arch_c_exception(...);
>>       case SYSCALL: arch_c_syscall(...);
>>       ...
>>     }
>
> You're assuming that figuring out the cause doesn't need the kernel
> entry code to run first.  In the case of the 32-bit vDSO fast
> syscalls, we arguably don't know whether an entry is a syscall until
> we have done a user memory access.  Logically, we're doing:
>
> if (get_user() < 0) {
>   /* Not a syscall.  This is actually a silly operation that sets AX =
> -EFAULT and returns.  Do not audit or invoke ptrace. */
> } else {
>   /* This actually is a syscall. */
> }

Yes, that's what I've addressed with providing split interfaces.

>> You really want to differentiate between exception and syscall
>> entry/exit.
>>
>
> Why do we want to distinguish between exception and syscall
> entry/exit?  For the enter part, AFAICS the exception case boils down
> to enter_from_user_mode() and the syscall case is:
>
>         enter_from_user_mode(regs);
>         instrumentation_begin();
>
>         local_irq_enable();
>         ti_work = READ_ONCE(current_thread_info()->flags);
>         if (ti_work & SYSCALL_ENTER_WORK)
>                 syscall = syscall_trace_enter(regs, syscall, ti_work);
>         instrumentation_end();
>
> Which would decompose quite nicely as a regular (non-syscall) entry
> plus the syscall part later.

There is a difference between syscall entry and exception entry at least
in my view:

syscall:
                enter_from_user_mode(regs);
                local_irq_enable();

exception:
                enter_from_user_mode(regs);

>> we'd have:
>>
>>   arch_c_entry()
>>      irqentry_enter();
>>      local_irq_enble();
>>      nr = syscall_enter_from_user_mode_work();
>>      ...
>>
>> which enforces two calls for sane entries and more code in arch/....
>
> This is why I still like my:
>
> arch_c_entry()
>   irqentry_enter_from_user_mode();
>   generic_syscall();
>   exit...

So what we have now (with my patch applied) is either:

1) arch_c_entry()
        nr = syscall_enter_from_user_mode();
        arch_handle_syscall(nr);
        syscall_exit_to_user_mode();

or for that extra 32bit fast syscall thing:

2) arch_c_entry()
        syscall_enter_from_user_mode_prepare();
        arch_do_stuff();
        nr = syscall_enter_from_user_mode_work();
        arch_handle_syscall(nr);
        syscall_exit_to_user_mode();

So for sane cases you just use #1.

Ideally we'd not need arch_handle_syscall(nr) at all, but that does not
work with multiple ABIs supported, i.e. the compat muck.

The only way we could make that work is to have:

    syscall_enter_exit(regs, mode)
      nr = syscall_enter_from_user_mode();
      arch_handle_syscall(mode, nr);
      syscall_exit_to_user_mode();

and then arch_c_entry() becomes:

    syscall_enter_exit(regs, mode);

which means that arch_handle_syscall() would have to evaluate the mode
and chose the appropriate syscall table. Not sure whether that's a win.

Thanks,

        tglx


