Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6266325A230
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Sep 2020 02:11:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bh49c65LWzDqWM
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Sep 2020 10:11:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=luto@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=TMu2S3Iz; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bh47g3D55zDqQQ
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Sep 2020 10:09:51 +1000 (AEST)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6111F20E65
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Sep 2020 00:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599005388;
 bh=ue8KFmWAURt4lhvOfblC/6hWxuPhGkaF5B0T2fLxa7I=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=TMu2S3IzHfz+o6ohiqDLBmmcmE/E3rINy8vvAXGieza4ImIhAEf776UnghnDuHvzd
 5RUSUwl4gq1gDaK4mi1DBXXH+ZDeKELWu02LXQKCNxeqTYN929b+1mZTWtyLPaPna1
 +yVVQs19uJk+DPC0V7/4RRNdHi/w9iCHs5rjuS/c=
Received: by mail-wm1-f44.google.com with SMTP id e11so1988956wme.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Sep 2020 17:09:48 -0700 (PDT)
X-Gm-Message-State: AOAM532lly8WfSC9JLso2sixYuGR34BovNrIQzp8dac2FmgSeJWLTcqS
 lUovpObEJnza7XzhL3ulAuRmwVZCdMQMUepbiwwgIA==
X-Google-Smtp-Source: ABdhPJyyfibJgmTm5WYzNGqNFdu9nOVgGk+6VQWbLUP3cCSoL53YNiq4XcCEUyla/kGQQVBTYc7jpCQ/5AYmCiDL+Ho=
X-Received: by 2002:a1c:7e02:: with SMTP id z2mr4078821wmc.138.1599005386776; 
 Tue, 01 Sep 2020 17:09:46 -0700 (PDT)
MIME-Version: 1.0
References: <CALCETrWXvAMA7tQ3XZdAk2FixKfzQ_0fBmyNVyyPHVAomLvrWQ@mail.gmail.com>
 <CAMzpN2hmR+0-Yse1csbiVOiqgZ0e+VRkCBBXUKoPSTSMOOOFAQ@mail.gmail.com>
 <CALCETrXY1x0MReMoTOG2awcZvr4c7gp99JVNthK37vUUk-kyew@mail.gmail.com>
 <87k0xdjbtt.fsf@nanos.tec.linutronix.de>
In-Reply-To: <87k0xdjbtt.fsf@nanos.tec.linutronix.de>
From: Andy Lutomirski <luto@kernel.org>
Date: Tue, 1 Sep 2020 17:09:35 -0700
X-Gmail-Original-Message-ID: <CALCETrUpjUPPvnPuS9fP4jgid7U_qdU_yTKSq9PjJ=z2w9HvHg@mail.gmail.com>
Message-ID: <CALCETrUpjUPPvnPuS9fP4jgid7U_qdU_yTKSq9PjJ=z2w9HvHg@mail.gmail.com>
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

On Tue, Sep 1, 2020 at 4:50 PM Thomas Gleixner <tglx@linutronix.de> wrote:
>
> On Sun, Aug 30 2020 at 08:52, Andy Lutomirski wrote:
> >> > [RUN]    SYSCALL
> >> > [FAIL]    Initial args are wrong (nr=29, args=0 0 0 0 0 4289172732)
> >> > [RUN]    SYSCALL
> >> > [OK]    Args after SIGUSR1 are correct (ax = -514)
> >> > [OK]    Child got SIGUSR1
> >> > [RUN]    Step again
> >> > [OK]    pause(2) restarted correctly
> >>
> >> Bisected to commit 0b085e68f407 ("x86/entry: Consolidate 32/64 bit
> >> syscall entry").
> >> It looks like it is because syscall_enter_from_user_mode() is called
> >> before reading the 6th argument from the user stack.
>
> Bah.I don't know how I managed to miss that part and interestingly
> enough that none of the robots caught that either
>
> > Thomas, can we revert the syscall_enter() and syscall_exit() part of
> > the series?
>
> Hrm.
>
> > I think that they almost work for x86, but not quite as
> > indicated by this bug.  Even if we imagine we can somehow hack around
> > this bug, I imagine we're going to find other problems with this
> > model, e.g. the potential upcoming exit problem I noted in my review.
>
> What's the upcoming problem?

If we ever want to get single-stepping fully correct across syscalls,
we might need to inject SIGTRAP on syscall return. This would be more
awkward if we can't run instrumentable code after the syscall part of
the syscall is done.

>
> > I really think the model should be:
> >
> > void do_syscall_whatever(...)
> > {
> >   irqentry_enter(...);
> >   instrumentation_begin();
> >
> >   /* Do whatever arch ABI oddities are needed on entry. */
> >
> >   Then either:
> >   syscall_begin(arch, nr, regs);
> >   dispatch the syscall;
> >   syscall_end(arch, nr, regs);
> >
> >   Or just:
> >   generic_do_syscall(arch, nr, regs);
> >
> >   /* Do whatever arch ABI oddities are needed on exit from the syscall. */
> >
> >   instrumentation_end();
> >   irqentry_exit(...);
> > }
>
> I don't think we want that in general. The current variant is perfectly
> fine for everything except the 32bit fast syscall nonsense. Also
> irqentry_entry/exit is not equivalent to the syscall_enter/exit
> counterparts.

If there are any architectures in which actual work is needed to
figure out whether something is a syscall in the first place, they'll
want to do the usual kernel entry work before the syscall entry work.
Maybe your patch actually makes this possible -- I haven't digested
all the details yet.

Who advised you to drop the arch parameter?

> ---
>  arch/x86/entry/common.c      |   29 ++++++++++++++++--------
>  include/linux/entry-common.h |   51 +++++++++++++++++++++++++++++++++++--------
>  kernel/entry/common.c        |   35 ++++++++++++++++++++++++-----
>  3 files changed, 91 insertions(+), 24 deletions(-)
>
> --- a/arch/x86/entry/common.c
> +++ b/arch/x86/entry/common.c
> @@ -60,16 +60,10 @@
>  #if defined(CONFIG_X86_32) || defined(CONFIG_IA32_EMULATION)
>  static __always_inline unsigned int syscall_32_enter(struct pt_regs *regs)
>  {
> -       unsigned int nr = (unsigned int)regs->orig_ax;
> -
>         if (IS_ENABLED(CONFIG_IA32_EMULATION))
>                 current_thread_info()->status |= TS_COMPAT;
> -       /*
> -        * Subtlety here: if ptrace pokes something larger than 2^32-1 into
> -        * orig_ax, the unsigned int return value truncates it.  This may
> -        * or may not be necessary, but it matches the old asm behavior.
> -        */
> -       return (unsigned int)syscall_enter_from_user_mode(regs, nr);
> +
> +       return (unsigned int)regs->orig_ax;
>  }
>
>  /*
> @@ -91,15 +85,29 @@ static __always_inline void do_syscall_3
>  {
>         unsigned int nr = syscall_32_enter(regs);
>
> +       /*
> +        * Subtlety here: if ptrace pokes something larger than 2^32-1 into
> +        * orig_ax, the unsigned int return value truncates it.  This may
> +        * or may not be necessary, but it matches the old asm behavior.
> +        */
> +       nr = (unsigned int)syscall_enter_from_user_mode(regs, nr);
> +
>         do_syscall_32_irqs_on(regs, nr);
>         syscall_exit_to_user_mode(regs);
>  }
>
>  static noinstr bool __do_fast_syscall_32(struct pt_regs *regs)
>  {
> -       unsigned int nr = syscall_32_enter(regs);
> +       unsigned int nr = syscall_32_enter(regs);
>         int res;
>
> +       /*
> +        * This cannot use syscall_enter_from_user_mode() as it has to
> +        * fetch EBP before invoking any of the syscall entry work
> +        * functions.
> +        */
> +       syscall_enter_from_user_mode_prepare(regs);

I'm getting lost in all these "enter" functions...
