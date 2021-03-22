Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 287BC345228
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Mar 2021 22:59:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F47gq4fs7z30L4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 08:59:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=hWZn1OEP;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=CRPWbEDw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1;
 helo=galois.linutronix.de; envelope-from=john.ogness@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=hWZn1OEP; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=CRPWbEDw; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F47gN3c3gz2y8N
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 08:58:56 +1100 (AEDT)
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1616450328;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Iet1Wjr63GOcypmPYTq4T14ZukHB3u7jxBY+aVGKYYw=;
 b=hWZn1OEPRtuWZTKgMnYPjGIok1vIyTctIQZGZ6w/gvzyu38zCLZRs0rP9Ld3AFrAYjsdQe
 LPb1O/m0YREF9nWyNXiWpxJRtjvD1vliM5odx5pV7lvLTfnfG6pV6T2qyZSsh3Upl9Wcbc
 XswU2iFrZ50/MSWD3bBuw2BwTyF8JQ/1TbC8wssrTXY2cZk8peWr1fggRtl2VUFe+1EBgH
 APX1XMEVv5RIRBqmYlI1jY46v/MwBj5JvZIP5jVcc8vFSE/ihpLFRid2DCHwMmq/iI2wTu
 w2LsHAkd/icYsF9porOlMj1Yc0IOVHbHMtqmZHHgv8il23b1PqhtabwpAQfFLQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1616450328;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Iet1Wjr63GOcypmPYTq4T14ZukHB3u7jxBY+aVGKYYw=;
 b=CRPWbEDwimqHHhUntjKMWJlbWmp0m4OGXo7z/b2dtmIHKsux6P7hlRrO9Y3AeDGb3cbI3E
 OtE/XeeV+5OMVICw==
To: Petr Mladek <pmladek@suse.com>
Subject: Re: [PATCH next v1 2/3] printk: remove safe buffers
In-Reply-To: <YFjbwxhZNnC52aSP@alley>
References: <20210316233326.10778-1-john.ogness@linutronix.de>
 <20210316233326.10778-3-john.ogness@linutronix.de>
 <YFbY8kF7ilYoxvYp@google.com> <87k0pzmoao.fsf@jogness.linutronix.de>
 <YFjbwxhZNnC52aSP@alley>
Date: Mon, 22 Mar 2021 22:58:47 +0100
Message-ID: <87ft0mg8a0.fsf@jogness.linutronix.de>
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
Cc: Rafael Aquini <aquini@redhat.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Paul Mackerras <paulus@samba.org>, Tiezhu Yang <yangtiezhu@loongson.cn>,
 Peter Zijlstra <peterz@infradead.org>, Yue Hu <huyue2@yulong.com>,
 Jordan Niethe <jniethe5@gmail.com>, Kees Cook <keescook@chromium.org>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Alistair Popple <alistair@popple.id.au>, "Guilherme G.
 Piccoli" <gpiccoli@canonical.com>, Nicholas Piggin <npiggin@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>, Thomas Gleixner <tglx@linutronix.de>,
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Eric Biederman <ebiederm@xmission.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2021-03-22, Petr Mladek <pmladek@suse.com> wrote:
> On Mon 2021-03-22 12:16:15, John Ogness wrote:
>> On 2021-03-21, Sergey Senozhatsky <senozhatsky@chromium.org> wrote:
>> >> @@ -369,7 +70,10 @@ __printf(1, 0) int vprintk_func(const char *fmt, va_list args)
>> >>  	 * Use the main logbuf even in NMI. But avoid calling console
>> >>  	 * drivers that might have their own locks.
>> >>  	 */
>> >> -	if ((this_cpu_read(printk_context) & PRINTK_NMI_DIRECT_CONTEXT_MASK)) {
>> >> +	if (this_cpu_read(printk_context) &
>> >> +	    (PRINTK_NMI_DIRECT_CONTEXT_MASK |
>> >> +	     PRINTK_NMI_CONTEXT_MASK |
>> >> +	     PRINTK_SAFE_CONTEXT_MASK)) {
>> >
>> > Do we need printk_nmi_direct_enter/exit() and
>> > PRINTK_NMI_DIRECT_CONTEXT_MASK?  Seems like all printk_safe() paths
>> > are now DIRECT - we store messages to the prb, but don't call console
>> > drivers.
>>
>> I was planning on waiting until the kthreads are introduced, in which
>> case printk_safe.c is completely removed.
>
> You want to keep printk_safe() context because it prevents calling
> consoles even in normal context. Namely, it prevents deadlock by
> recursively taking, for example, sem->lock in console_lock() or
> console_owner_lock in console_trylock_spinning(). Am I right?

Correct.

>> But I suppose I could switch
>> the 1 printk_nmi_direct_enter() user to printk_nmi_enter() so that
>> PRINTK_NMI_DIRECT_CONTEXT_MASK can be removed now. I would do this in a
>> 4th patch of the series.
>
> Yes, please unify the PRINTK_NMI_CONTEXT. One is enough.

Agreed. (But I'll go even further. See below.)

> I wonder if it would make sense to go even further at this stage.
> There will still be 4 contexts that modify the printk behavior after
> this patchset:
>
>   + printk_count set by printk_enter()/exit()
>       + prevents: infinite recursion
>       + context: any context
>       + action: skips entire printk at 3rd recursion level
>
>   + prink_context set by printk_safe_enter()/exit()
>       + prevents: dead lock caused by recursion into some
> 		console code in any context
>       + context: any
>       + action: skips console call at 1st recursion level

Technically, at this point printk_safe_enter() behavior is identical to
printk_nmi_enter(). Namely, prevent any recursive printk calls from
calling into the console code.

>   + printk_context set by printk_nmi_enter()/exit()
>       + prevents: dead lock caused by any console lock recursion
>       + context: NMI
>       + action: skips console calls at 0th recursion level
>
>   + kdb_trap_printk
>       + redirects printk() to kdb_printk() in kdb context
>
>
> What is possible?
>
> 1. We could get rid of printk_nmi_enter()/exit() and
>    PRINTK_NMI_CONTEXT completely already now. It is enough
>    to check in_nmi() in printk_func().
>
>    printk_nmi_enter() was added by the commit 42a0bb3f71383b457a7db362
>    ("printk/nmi: generic solution for safe printk in NMI"). It was
>    really needed to modify @printk_func pointer.
>
>    We did not remove it later when printk_function became a real
>    function. The idea was to track all printk contexts in a single
>    variable. But we never added kdb context.
>
>    It might make sense to remove it now. Peter Zijstra would be happy.
>    There already were some churns with tracking printk_context in NMI.
>    For example, see
>    https://lore.kernel.org/r/20200219150744.428764577@infradead.org
>
>    IMHO, it does not make sense to wait until the entire console-stuff
>    rework is done in this case.

Agreed. in_nmi() within vprintk_emit() is enough to detect if the
console code should be skipped:

    if (!in_sched && !in_nmi()) {
        ...
    }

> 2. I thought about unifying printk_safe_enter()/exit() and
>    printk_enter()/exit(). They both count recursion with
>    IRQs disabled, have similar name. But they are used
>    different way.
>
>    But better might be to rename printk_safe_enter()/exit() to
>    console_enter()/exit() or to printk_deferred_enter()/exit().
>    It would make more clear what it does now. And it might help
>    to better distinguish it from the new printk_enter()/exit().
>
>    This patchset actually splits the original printk_safe()
>    functionality into two:
>
>        + printk_count prevents infinite recursion
>        + printk_deferred_enter() deffers console handling.
>
>    I am not sure if it is worth it. But it might help people (even me)
>    when digging into the printk history. Different name will help to
>    understand the functionality at the given time.

I am also not sure if it is worth the extra "noise" just to give the
function a more appropriate name. The plan is to remove it completely
soon anyway. My vote is to leave the name as it is.

But I am willing to do the rename in an addtional patch if you
want. printk_deferred_enter() sounds fine to me. Please confirm if you
want me to do this.

John Ogness
