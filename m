Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6A7351599
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 16:17:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FB4yk4sCXz3byj
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Apr 2021 01:17:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=sAGpnWoR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=suse.com (client-ip=195.135.220.15; helo=mx2.suse.de;
 envelope-from=pmladek@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256
 header.s=susede1 header.b=sAGpnWoR; dkim-atps=neutral
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FB4yJ3JBGz304X
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Apr 2021 01:17:26 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1617286643; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jqkspPJgjUOY8WK6NquH8gMu9twXFV1Zzy3PuqHPEMI=;
 b=sAGpnWoR+OPtXK93MUCMZKg/UX/GxmCvxKF78csUnPQcymJ8GCTH/W/TcoFVo5hQG5qS4Z
 dx3AEc9CNy2NLfj1nIbDRqtcqKjVh0Yj75OeDqMoTq7vkJu2RfYRPSnWaHxt7nj1mqXjmE
 C40kkoXihMNxwnKB80Yuan65BOGG6Y4=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 40E43B1F7;
 Thu,  1 Apr 2021 14:17:23 +0000 (UTC)
Date: Thu, 1 Apr 2021 16:17:20 +0200
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Subject: Re: [PATCH printk v2 2/5] printk: remove safe buffers
Message-ID: <YGXV8LJarjUJDhvy@alley>
References: <20210330153512.1182-1-john.ogness@linutronix.de>
 <20210330153512.1182-3-john.ogness@linutronix.de>
 <YGW63/elFr/gYW1u@alley> <87a6qiqgzr.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87a6qiqgzr.fsf@jogness.linutronix.de>
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
Cc: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>, Paul Mackerras <paulus@samba.org>,
 Tiezhu Yang <yangtiezhu@loongson.cn>, Rafael Aquini <aquini@redhat.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>, Yue Hu <huyue2@yulong.com>,
 Jordan Niethe <jniethe5@gmail.com>, Kees Cook <keescook@chromium.org>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Alistair Popple <alistair@popple.id.au>,
 "Guilherme G. Piccoli" <gpiccoli@canonical.com>,
 Nicholas Piggin <npiggin@gmail.com>, Steven Rostedt <rostedt@goodmis.org>,
 Thomas Gleixner <tglx@linutronix.de>, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Eric Biederman <ebiederm@xmission.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu 2021-04-01 15:19:52, John Ogness wrote:
> On 2021-04-01, Petr Mladek <pmladek@suse.com> wrote:
> >> --- a/kernel/printk/printk.c
> >> +++ b/kernel/printk/printk.c
> >> @@ -1142,24 +1128,37 @@ void __init setup_log_buf(int early)
> >>  		 new_descs, ilog2(new_descs_count),
> >>  		 new_infos);
> >>  
> >> -	printk_safe_enter_irqsave(flags);
> >> +	local_irq_save(flags);
> >
> > IMHO, we actually do not have to disable IRQ here. We already copy
> > messages that might appear in the small race window in NMI. It would
> > work the same way also for IRQ context.
> 
> We do not have to, but why open up this window? We are still in early
> boot and interrupts have always been disabled here. I am not happy that
> this window even exists. I really prefer to keep it NMI-only.

Fair enough.

> >> --- a/lib/nmi_backtrace.c
> >> +++ b/lib/nmi_backtrace.c
> >> @@ -75,12 +75,6 @@ void nmi_trigger_cpumask_backtrace(const cpumask_t *mask,
> >>  		touch_softlockup_watchdog();
> >>  	}
> >>  
> >> -	/*
> >> -	 * Force flush any remote buffers that might be stuck in IRQ context
> >> -	 * and therefore could not run their irq_work.
> >> -	 */
> >> -	printk_safe_flush();
> >
> > Sigh, this reminds me that the nmi_safe buffers serialized backtraces
> > from all CPUs.
> >
> > I am afraid that we have to put back the spinlock into
> > nmi_cpu_backtrace().
> 
> Please no. That spinlock is a disaster. It can cause deadlocks with
> other cpu-locks (such as in kdb)

Could you please explain more the kdb case?
I am curious what locks might depend on each other here.

> and it will cause a major problem for atomic consoles.

AFAIK, you are going to add a special lock that would allow
nesting on the same CPU. It should possible and safe
to use is also for synchronizing the backtraces here.


> We need to be very careful about introducing locks
> where NMIs are waiting on other CPUs.

I agree.


> > It has been repeatedly added and removed depending
> > on whether the backtrace was printed into the main log buffer
> > or into the per-CPU buffers. Last time it was removed by
> > the commit 03fc7f9c99c1e7ae2925d ("printk/nmi: Prevent deadlock
> > when accessing the main log buffer in NMI").
> >
> > It should be safe because there should not be any other locks in the
> > code path. Note that only one backtrace might be triggered at the same
> > time, see @backtrace_flag in nmi_trigger_cpumask_backtrace().
> 
> It is adding a lock around a lockless ringbuffer. For me that is a step
> backwards.
> 
> > We _must_ serialize it somehow[*]. The lock in nmi_cpu_backtrace()
> > looks less evil than the nmi_safe machinery. nmi_safe() shrinks
> > too long backtraces, lose timestamps, needs to be explicitely
> > flushed here and there, is a non-trivial code.
> >
> > [*] Non-serialized bactraces are real mess. Caller-id is visible
> >     only on consoles or via syslogd interface. And it is not much
> >     convenient.
> 
> Caller-id solves this problem and is easy to sort for anyone with
> `grep'. Yes, it is a shame that `dmesg' does not show it, but directly
> using any of the printk interfaces does show it (kmsg_dump, /dev/kmsg,
> syslog, console).

True but frankly, the current situation is _far_ from convenient:

   + consoles do not show it by default
   + none userspace tool (dmesg, journalctl, crash) is able to show it
   + grep is a nightmare, especially if you have more than handful of CPUs

Yes, everything is solvable but not easily.

> >     I get this with "echo l >/proc/sysrq-trigger" and this patchset:
> 
> Of course. Without caller-id, it is a mess. But this has nothing to do
> with NMI. The same problem exists for WARN_ON() on multiple CPUs
> simultaneously. If the user is not using caller-id, they are
> lost. Caller-id is the current solution to the interlaced logs.

Sure. But in reality, the risk of mixed WARN_ONs is small. While
this patch makes backtraces from all CPUs always unusable without
caller_id and non-trivial effort.


> For the long term, we should introduce a printk-context API that allows
> callers to perfectly pack their multi-line output into a single
> entry. We discussed [0][1] this back in August 2020.

We need a "short" term solution. There are currently 3 solutions:

1. Keep nmi_safe() and all the hacks around.

2. Serialize nmi_cpu_backtrace() by a spin lock and later by
   the special lock used also by atomic consoles.

3. Tell complaining people how to sort the messed logs.


My preference:

I most prefer 2nd solution until I see a realistic scenario
of a possible deadlock with the current kernel code.

I would still prefer 1st solution over 3rd one until we improve
kernel/userspace support for sorting the log by the caller id.

Best Regards,
Petr
