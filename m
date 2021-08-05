Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 392033E0CE3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Aug 2021 05:47:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GgF110Zjgz3ck8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Aug 2021 13:47:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=mGVTHKFa;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=86MJ/1Do;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1;
 helo=galois.linutronix.de; envelope-from=john.ogness@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=mGVTHKFa; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=86MJ/1Do; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GgF0X6Yxjz30G8
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Aug 2021 13:46:52 +1000 (AEST)
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1628135204;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Uk5CAK1ofKH4/IrVtMIiLz8ZUZ925UDJRRzDYZI2vDw=;
 b=mGVTHKFa39+pFN2vjyvDnOkW7UyNhwn6C5SPH1m5CSlBOrEc9s6E73EomrlR/KPRE7kzWI
 q92fxtGTZTwnVRjluB00r4plp7y4pEAyDMRTapzwjcD2KyO4I49teT0glwxZz/vD8cmGRx
 gBnt1qLw13BWoxyoTxL+OW6ngTdGbWPo6EiFKg5gMfu4BrsLS3YIvLq3qTxO0XQAYYtsep
 fIjGUI0Onp3VfN/NYNmK1FMEMZgetbfw/aBgAp4efMAEIECbZR+qAxy02DSptuvBO1BIPB
 ACbOwCeXpvlA96KwIxE5M1ojitMxsSY+0Ge8kP2vLY8EQezGCdCP4YvWCLVbfA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1628135204;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Uk5CAK1ofKH4/IrVtMIiLz8ZUZ925UDJRRzDYZI2vDw=;
 b=86MJ/1DoOSnpngKET2bKmE2kIiPxxoqcvs+HqG5oHdfSFQrQx/m9o1L0SjnZQPmCqVoRDB
 ckN+EL5bxz0l8QDA==
To: Daniel Thompson <daniel.thompson@linaro.org>,
 Petr Mladek <pmladek@suse.com>
Subject: Re: [PATCH printk v1 03/10] kgdb: delay roundup if holding printk
 cpulock
In-Reply-To: <20210804150431.qtra3wvh2n4m6j64@maple.lan>
References: <20210803131301.5588-1-john.ogness@linutronix.de>
 <20210803131301.5588-4-john.ogness@linutronix.de>
 <20210803142558.cz7apumpgijs5y4y@maple.lan>
 <87tuk635rb.fsf@jogness.linutronix.de>
 <20210804113159.lsnoyylifg6v5i35@maple.lan> <YQqEJtmNFxVxH3U/@alley>
 <20210804150431.qtra3wvh2n4m6j64@maple.lan>
Date: Thu, 05 Aug 2021 05:52:43 +0206
Message-ID: <87tuk4lfj0.fsf@jogness.linutronix.de>
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
Cc: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>,
 Douglas Anderson <dianders@chromium.org>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Chengyang Fan <cy.fan@huawei.com>, Bhaskar Chowdhury <unixbhaskar@gmail.com>,
 x86@kernel.org, Ingo Molnar <mingo@redhat.com>,
 kgdb-bugreport@lists.sourceforge.net, Nicholas Piggin <npiggin@gmail.com>,
 Borislav Petkov <bp@alien8.de>, Steven Rostedt <rostedt@goodmis.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Jason Wessel <jason.wessel@windriver.com>, linuxppc-dev@lists.ozlabs.org,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2021-08-04, Daniel Thompson <daniel.thompson@linaro.org> wrote:
> On Wed, Aug 04, 2021 at 02:12:22PM +0200, Petr Mladek wrote:
>> On Wed 2021-08-04 12:31:59, Daniel Thompson wrote:
>> > On Tue, Aug 03, 2021 at 05:36:32PM +0206, John Ogness wrote:
>> > > On 2021-08-03, Daniel Thompson <daniel.thompson@linaro.org> wrote:
>> > > > On Tue, Aug 03, 2021 at 03:18:54PM +0206, John Ogness wrote:
>> > > >> kgdb makes use of its own cpulock (@dbg_master_lock, @kgdb_active)
>> > > >> during cpu roundup. This will conflict with the printk cpulock.
>> > > >
>> > > > When the full vision is realized what will be the purpose of the printk
>> > > > cpulock?
>> > > >
>> > > > I'm asking largely because it's current role is actively unhelpful
>> > > > w.r.t. kdb. It is possible that cautious use of in_dbg_master() might
>> > > > be a better (and safer) solution. However it sounds like there is a
>> > > > larger role planned for the printk cpulock...
>> > > 
>> > > The printk cpulock is used as a synchronization mechanism for
>> > > implementing atomic consoles, which need to be able to safely interrupt
>> > > the console write() activity at any time and immediately continue with
>> > > their own printing. The ultimate goal is to move all console printing
>> > > into per-console dedicated kthreads, so the primary function of the
>> > > printk cpulock is really to immediately _stop_ the CPU/kthread
>> > > performing write() in order to allow write_atomic() (from any context on
>> > > any CPU) to safely and reliably take over.
>> > 
>> > I see.
>> > 
>> > Is there any mileage in allowing in_dbg_master() to suppress taking
>> > the console lock?
>> > 
>> > There's a couple of reasons to worry about the current approach.
>> > 
>> > The first is that we don't want this code to trigger in the case when
>> > kgdb is enabled and kdb is not since it is only kdb (a self-hosted
>> > debugger) than uses the consoles. This case is relatively trivial to
>> > address since we can rename it kdb_roundup_delay() and alter the way it
>> > is conditionally compiled.

Well, _I_ want this code to trigger even without kdb. The printk cpulock
is meant to be the innermost locking for the entire kernel. No code is
allowed to block/spin on any kind of lock if holding the printk
cpulock. This is the only way to guarantee the functionality of the
atomic consoles.

For example, if the kernel were to crash while inside kgdb code, we want
to see the backtrace.

Since kgdb _does_ take locks (spinning on @dbg_slave_lock during roundup
and the master's own cpu lock as a retry loop on @dbg_master_lock),
clearly it is not allowed to hold the printk cpulock. The simplest
solution I could find was just to make sure kgdb_cpu_enter() isn't
called while holding the printk cpulock.

>> > The second is more of a problem however. kdb will only call into the
>> > console code from the debug master. By default this is the CPU that
>> > takes the debug trap so initial prints will work fine. However it is
>> > possible to switch to a different master (so we can read per-CPU
>> > registers and things like that). This will result in one of the CPUs
>> > that did the IPI round up calling into console code and this is unsafe
>> > in that instance.

It is only unsafe if a CPU enters "kgdb/kdb context" while holding the
printk cpulock. That is what I want to prevent.

>> > There are a couple of tricks we could adopt to work around this but
>> > given the slightly odd calling context for kdb (all CPUs quiesced, no
>> > log interleaving possible) it sounds like it would remain safe to
>> > bypass the lock if in_dbg_master() is true.
>> > 
>> > Bypassing an inconvenient lock might sound icky but:
>> > 
>> > 1. If the lock is not owned by any CPU then what kdb will do is safe.

No. The printk cpulock exists for low-level synchronization. The atomic
consoles need this synchronization. (For example, the 8250 needs this
for correct tracking of its interrupt register, even for
serial8250_put_poll_char().)

>> > 2. If the lock is owned by any CPU then we have quiesced it anyway
>> >    and this makes is safe for the owning CPU to share its ownership
>> >    (since it isn't much different to recursive acquisition on a single
>> >    CPU)

Quiescing the printk cpulock is not permitted.

Just because it is kdb, does not mean that the atomic consoles were
interrupted in a convenient place. The whole purpose of the atomic
consoles is so that we can have guaranteed console output from _any_
context and _any_ line of code in the kernel.

>> I think about the following:
>> 
>> void kgdb_roundup_cpus(void)
>> {
>> 	__printk_cpu_lock();
>> 	__kgdb_roundup_cpus();
>> }
>> 
>> , where __printk_cpu_lock() waits/takes printk_cpu_lock()
>> 	__kgdb_roundup_cpus() is the original kgdb_roundup_cpus();
>> 
>> 
>> The idea is that kgdb_roundup_cpus() caller takes the printk_cpu lock.
>> The owner will be well defined.
>> 
>> As a result any other CPU will not be able to take the printk_cpu lock
>> as long as it is owned by the kgdb lock. But as you say, kgdb will
>> make sure that everything is serialized at this stage. So that
>> the original raw_printk_cpu_lock_irqsave() might just disable
>> IRQs when called under debugger.
>> 
>> Does it make any sense?
>
> Yes but I think it is still has problems.
>
> Primarily is doesn't solve the issue I raised. It would still be unsafe
> to change debug master: we can guarantee the initial master owns the
> lock but if it has been multiply acquired we cannot transfer ownership
> when we want to change master.
>
> Additionally it will delay the round up of cores that do not own the
> lock. The quiescing is never atomic and the operator needs to know
> that but the longer CPUs are allows to execute for the more confusing
> things can become for the operator.
>
> Finally on machines without an NMI this could cause trouble with the
> interrupt disable in raw_printk_cpu_lock_irqsave() (or any outer level
> interrupt disable). If the master get the lock then the other processes
> will become incapable of being rounded up if they are waiting for the
> printk lock).

I am also not happy with such a solution. Aside from Daniel's comments,
it also violates the basic principle of the printk cpulock by allowing
further locking while holding the print cpulock. That is a recipe for
deadlock.

>> I have to say that it is a bit hairy. But it looks slightly better
>> than the delayed/repeated IPI proposed by this patch.
>
> I'd like to reserve judgement for now which one is least worst...
> largely because if the purpose of the lock simply to prevent interleaving
> of console output then the debugger quiescing code should already have
> this covered.
>
> It leaves me wondering if a change like the one below is sufficient
> (based on code without John's patches but hopefully still clear enough).
> I've given the new code it's own branch which it doesn't, strictly
> speaking, need but it is easier to comment this way... and perhaps also
> just a little easier for people who have not set CONFIG_KGDB to
> ignore ;-).
>
> ~~~
> diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
> index 142a58d124d9..41a7e103bb66 100644
> --- a/kernel/printk/printk.c
> +++ b/kernel/printk/printk.c
> @@ -3599,6 +3599,18 @@ int __printk_cpu_trylock(void)
>                 /* This CPU is already the owner. */
>                 atomic_inc(&printk_cpulock_nested);
>                 return 1;
> +       } else if (in_dbg_master()) {
> +               /*
> +                * If we are executing as the primary CPU and with the debugger
> +                * active than all other CPUs in the system are quiesced by
> +                * the time kdb winds up calling this function. To execute this
> +                * branch then the lock must be owned by one of the quiesced CPUs.
> +                * Happily, because it is quiesced and cannot release it, it is
> +                * safe for us to allow the lock to be taken from a different CPU!
> +                * The lock will be released prior to resuming the real owner.
> +                */
> +               atomic_inc(&printk_cpulock_nested);
> +               return 1;
>         }
>  
>         return 0;
> ~~~

Being in kgdb/kdb context is similar to being in atomic console
context. (Of course, they are both using cpu locks.) But the contexts
are not the same. It is incorrect to handle them as the same.

We need to decide who is inside of who. Either printk is the innermost,
in which case the printk cpulock cannot be held when calling
kgdb_cpu_enter(). Or kgdb is the innermost, meaning that the atomic
consoles are no longer atomic/reliable while in kgdb.

I prefer and am pushing for the first, but am willing to accept the
second (i.e. that kgdb is the innermost function of the kernel).

> PS In the interested of full disclosure there is a special case
>    in the debugger to allow it to try to cope if it fails to
>    quiesce a CPU and I deliberately omitted this from the long
>    comment above. That special case is expected to be unstable
>    but since the alternative is likely to be a permanent deadlock
>    without any indication of why we choose to take the risk of
>    continuing. Personally I don't recommend reasoning about
>    console safety based on this emergency case hence omitting the
>    comment.

John Ogness
