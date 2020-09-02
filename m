Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE8625B212
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Sep 2020 18:52:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BhVNN50bSzDqjW
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Sep 2020 02:52:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=luto@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=yCKm0wrV; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BhVK4679dzDr0r
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Sep 2020 02:49:28 +1000 (AEST)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 91B1620BED
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Sep 2020 16:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599065365;
 bh=XR0ioxTHhgnmW+APV6MJ8653PvIb+IbdXMJ/L262yIQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=yCKm0wrVB74qj3jw82cs0MgZUIlwGzPQXQFP6ZuO40pNawuw4cIufN3xECk17Q68D
 +XJK88TBkbspRcpkaD+qfTrn1Yj8kN01YzDEIW+cTtdjW9IQd/vWVAcNf2HS+YpAQw
 Qub36Ra1vc8yn5M1Qyepr+GdktruN1W9YMf13gzM=
Received: by mail-wr1-f41.google.com with SMTP id x14so82971wrl.12
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 02 Sep 2020 09:49:25 -0700 (PDT)
X-Gm-Message-State: AOAM533pj/dn+Z8iLR1s+cymbmBj6b7fPnX4cc0ZGfTqpoixqzmE5Yyt
 lkZ9Rg7mzDSB+P9prVeqIgqmrgMIl6TXpVLjQX60bQ==
X-Google-Smtp-Source: ABdhPJzuKT0sfcowI/nWvlApJfMvKhzeXclG1LZhrt0Xb8lws/Eopixjlgz5qHcNlR7RUw8PQzrZUHdg4O8Gmb7W1mQ=
X-Received: by 2002:adf:ce8e:: with SMTP id r14mr7992214wrn.257.1599065364055; 
 Wed, 02 Sep 2020 09:49:24 -0700 (PDT)
MIME-Version: 1.0
References: <CALCETrWXvAMA7tQ3XZdAk2FixKfzQ_0fBmyNVyyPHVAomLvrWQ@mail.gmail.com>
 <CAMzpN2hmR+0-Yse1csbiVOiqgZ0e+VRkCBBXUKoPSTSMOOOFAQ@mail.gmail.com>
 <CALCETrXY1x0MReMoTOG2awcZvr4c7gp99JVNthK37vUUk-kyew@mail.gmail.com>
 <87k0xdjbtt.fsf@nanos.tec.linutronix.de>
 <CALCETrUpjUPPvnPuS9fP4jgid7U_qdU_yTKSq9PjJ=z2w9HvHg@mail.gmail.com>
 <87blioinub.fsf@nanos.tec.linutronix.de>
In-Reply-To: <87blioinub.fsf@nanos.tec.linutronix.de>
From: Andy Lutomirski <luto@kernel.org>
Date: Wed, 2 Sep 2020 09:49:12 -0700
X-Gmail-Original-Message-ID: <CALCETrUuyXpG0Vhrb-9m-G8J94+2bGqdrJkKfz+-5z7dsGLK8Q@mail.gmail.com>
Message-ID: <CALCETrUuyXpG0Vhrb-9m-G8J94+2bGqdrJkKfz+-5z7dsGLK8Q@mail.gmail.com>
Subject: Re: ptrace_syscall_32 is failing
To: Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
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

On Wed, Sep 2, 2020 at 1:29 AM Thomas Gleixner <tglx@linutronix.de> wrote:
>
> On Tue, Sep 01 2020 at 17:09, Andy Lutomirski wrote:
> > On Tue, Sep 1, 2020 at 4:50 PM Thomas Gleixner <tglx@linutronix.de> wrote:
> >> > I think that they almost work for x86, but not quite as
> >> > indicated by this bug.  Even if we imagine we can somehow hack around
> >> > this bug, I imagine we're going to find other problems with this
> >> > model, e.g. the potential upcoming exit problem I noted in my review.
> >>
> >> What's the upcoming problem?
> >
> > If we ever want to get single-stepping fully correct across syscalls,
> > we might need to inject SIGTRAP on syscall return. This would be more
> > awkward if we can't run instrumentable code after the syscall part of
> > the syscall is done.
>
> We run a lot of instrumentable code after sys_foo() returns. Otherwise
> all the TIF work would not be possible at all.
>
> But you might tell me where exactly you want to inject the SIGTRAP in
> the syscall exit code flow.

It would be a bit complicated.  Definitely after any signals from the
syscall are delivered.  Right now, I think that we don't deliver a
SIGTRAP on the instruction boundary after SYSCALL while
single-stepping.  (I think we used to, but only sometimes, and now we
are at least consistent.)  This is because IRET will not trap if it
starts with TF clear and ends up setting it.  (I asked Intel to
document this, and I think they finally did, although I haven't gotten
around to reading the new docs.  Certainly the old docs as of a year
or two ago had no description whatsoever of how TF changes worked.)

Deciding exactly *when* a trap should occur would be nontrivial -- we
can't trap on sigreturn() from a SIGTRAP, for example.

So this isn't fully worked out.

>
> >> I don't think we want that in general. The current variant is perfectly
> >> fine for everything except the 32bit fast syscall nonsense. Also
> >> irqentry_entry/exit is not equivalent to the syscall_enter/exit
> >> counterparts.
> >
> > If there are any architectures in which actual work is needed to
> > figure out whether something is a syscall in the first place, they'll
> > want to do the usual kernel entry work before the syscall entry work.
>
> That's low level entry code which does not require RCU, lockdep, tracing
> or whatever muck we setup before actual work can be done.
>
> arch_asm_entry()
>   ...
>   arch_c_entry(cause) {
>     switch(cause) {
>       case EXCEPTION: arch_c_exception(...);
>       case SYSCALL: arch_c_syscall(...);
>       ...
>     }

You're assuming that figuring out the cause doesn't need the kernel
entry code to run first.  In the case of the 32-bit vDSO fast
syscalls, we arguably don't know whether an entry is a syscall until
we have done a user memory access.  Logically, we're doing:

if (get_user() < 0) {
  /* Not a syscall.  This is actually a silly operation that sets AX =
-EFAULT and returns.  Do not audit or invoke ptrace. */
} else {
  /* This actually is a syscall. */
}

So we really do want to stick arch code between the
enter_from_user_mode() and the audit check.  We *can't* audit because
we don't know the syscall args.  Now maybe we could invent new
semantics for this in which a fault here is still somehow a syscall,
but I think that would be a real ABI change and would want very
careful thought.  And it would be weird -- syscalls are supposed to
actually call the syscall handler, aren't they?  (Arguably we should
go back in time and make this a SIGSEGV.  We have the infrastructure
to do this cleanly, but when I wrote the code I just copied the ABI
from code that was before my time.  Even so, it would be an exception,
not a syscall.)

>
> You really want to differentiate between exception and syscall
> entry/exit.
>

Why do we want to distinguish between exception and syscall
entry/exit?  For the enter part, AFAICS the exception case boils down
to enter_from_user_mode() and the syscall case is:

        enter_from_user_mode(regs);
        instrumentation_begin();

        local_irq_enable();
        ti_work = READ_ONCE(current_thread_info()->flags);
        if (ti_work & SYSCALL_ENTER_WORK)
                syscall = syscall_trace_enter(regs, syscall, ti_work);
        instrumentation_end();

Which would decompose quite nicely as a regular (non-syscall) entry
plus the syscall part later.

> The splitting of syscall_enter_from_user_mode() is only necessary for
> that 32bit fast syscall thing on x86 and there is no point to open code
> it with two calls for e.g. do_syscall_64().
>
> > Maybe your patch actually makes this possible -- I haven't digested
> > all the details yet.
> >
> > Who advised you to drop the arch parameter?
>
> Kees, IIRC, but I would have to search through the gazillions of mail
> threads to be sure.
>
> >> +       syscall_enter_from_user_mode_prepare(regs);
> >
> > I'm getting lost in all these "enter" functions...
>
> It's not that hard.
>
>      syscall_enter_from_user_mode_prepare()
> +    syscall_enter_from_user_mode_work()
> =    syscall_enter_from_user_mode()
>
> That's exactly what you suggested just with the difference that it is
> explicit for syscalls and not using irqentry_enter/exit().
>
> If we would do that then instead of having a single call for sane
> syscall pathes:
>
>   arch_c_entry()
>      nr = syscall_enter_from_user_mode();
>
> or for that 32bit fast syscall nonsense the split variant:
>
>   arch_c_entry()
>      syscall_enter_from_user_mode_prepare();
>      do_fast_syscall_muck();
>      nr = syscall_enter_from_user_mode_work();
>
> we'd have:
>
>   arch_c_entry()
>      irqentry_enter();
>      local_irq_enble();
>      nr = syscall_enter_from_user_mode_work();
>      ...
>
> which enforces two calls for sane entries and more code in arch/....

This is why I still like my:

arch_c_entry()
  irqentry_enter_from_user_mode();
  generic_syscall();
  exit...
}
