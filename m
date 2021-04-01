Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA9C351511
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 15:20:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FB3hW0s4Sz3bqw
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Apr 2021 00:20:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=w4oEaTFx;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=GSHqJTUL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=193.142.43.55;
 helo=galois.linutronix.de; envelope-from=john.ogness@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=w4oEaTFx; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=GSHqJTUL; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FB3gy6fk3z303M
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Apr 2021 00:19:58 +1100 (AEDT)
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1617283194;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ropfd/50hZwFHygWvoKwWUv09SHlJREMcmKg0y/1COk=;
 b=w4oEaTFxHJvv3fqbRVPTIUlUbLzczXOhRKdyeF4GvLQP185Tberl86XRlFEJoX/AGcs+1N
 PFWuHAkJaPq/eyChQAN8RQHAy6FcaTZP/itmUCwpRj6Ws413xT6OkUB++KuMIpsSNjxhGR
 M1NS9Avk4diwz5/PMur9fUzzJRwKj4n9cS+HQVzXKva8E9UKXjamvB/9kntsOuCcwAbfqe
 bqvr0W/f0ltISNaSfpoBFOUG6HYkv5SBd0YTPHiT5W3ZZ+2HOC/ZcTZR88sMXHKtf4QcaD
 6qjwd/JpUfsZWIwddumcLQVSi8CRRObqQ+1vk3FB5GI300dd9g9I4nNwUOmV5Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1617283194;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ropfd/50hZwFHygWvoKwWUv09SHlJREMcmKg0y/1COk=;
 b=GSHqJTUL1+ALVe/5Kh9GKkiAVzFtP+9xFkfM37puBv2WdO1AxshdgLE2Iv9js81yEIcZ3L
 eUZabLq8YYv87HBg==
To: Petr Mladek <pmladek@suse.com>
Subject: Re: [PATCH printk v2 2/5] printk: remove safe buffers
In-Reply-To: <YGW63/elFr/gYW1u@alley>
References: <20210330153512.1182-1-john.ogness@linutronix.de>
 <20210330153512.1182-3-john.ogness@linutronix.de> <YGW63/elFr/gYW1u@alley>
Date: Thu, 01 Apr 2021 15:19:52 +0200
Message-ID: <87a6qiqgzr.fsf@jogness.linutronix.de>
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

On 2021-04-01, Petr Mladek <pmladek@suse.com> wrote:
>> --- a/kernel/printk/printk.c
>> +++ b/kernel/printk/printk.c
>> @@ -1142,24 +1128,37 @@ void __init setup_log_buf(int early)
>>  		 new_descs, ilog2(new_descs_count),
>>  		 new_infos);
>>  
>> -	printk_safe_enter_irqsave(flags);
>> +	local_irq_save(flags);
>
> IMHO, we actually do not have to disable IRQ here. We already copy
> messages that might appear in the small race window in NMI. It would
> work the same way also for IRQ context.

We do not have to, but why open up this window? We are still in early
boot and interrupts have always been disabled here. I am not happy that
this window even exists. I really prefer to keep it NMI-only.

>> --- a/lib/nmi_backtrace.c
>> +++ b/lib/nmi_backtrace.c
>> @@ -75,12 +75,6 @@ void nmi_trigger_cpumask_backtrace(const cpumask_t *mask,
>>  		touch_softlockup_watchdog();
>>  	}
>>  
>> -	/*
>> -	 * Force flush any remote buffers that might be stuck in IRQ context
>> -	 * and therefore could not run their irq_work.
>> -	 */
>> -	printk_safe_flush();
>
> Sigh, this reminds me that the nmi_safe buffers serialized backtraces
> from all CPUs.
>
> I am afraid that we have to put back the spinlock into
> nmi_cpu_backtrace().

Please no. That spinlock is a disaster. It can cause deadlocks with
other cpu-locks (such as in kdb) and it will cause a major problem for
atomic consoles. We need to be very careful about introducing locks
where NMIs are waiting on other CPUs.

> It has been repeatedly added and removed depending
> on whether the backtrace was printed into the main log buffer
> or into the per-CPU buffers. Last time it was removed by
> the commit 03fc7f9c99c1e7ae2925d ("printk/nmi: Prevent deadlock
> when accessing the main log buffer in NMI").
>
> It should be safe because there should not be any other locks in the
> code path. Note that only one backtrace might be triggered at the same
> time, see @backtrace_flag in nmi_trigger_cpumask_backtrace().

It is adding a lock around a lockless ringbuffer. For me that is a step
backwards.

> We _must_ serialize it somehow[*]. The lock in nmi_cpu_backtrace()
> looks less evil than the nmi_safe machinery. nmi_safe() shrinks
> too long backtraces, lose timestamps, needs to be explicitely
> flushed here and there, is a non-trivial code.
>
> [*] Non-serialized bactraces are real mess. Caller-id is visible
>     only on consoles or via syslogd interface. And it is not much
>     convenient.

Caller-id solves this problem and is easy to sort for anyone with
`grep'. Yes, it is a shame that `dmesg' does not show it, but directly
using any of the printk interfaces does show it (kmsg_dump, /dev/kmsg,
syslog, console).

>     I get this with "echo l >/proc/sysrq-trigger" and this patchset:

Of course. Without caller-id, it is a mess. But this has nothing to do
with NMI. The same problem exists for WARN_ON() on multiple CPUs
simultaneously. If the user is not using caller-id, they are
lost. Caller-id is the current solution to the interlaced logs.

For the long term, we should introduce a printk-context API that allows
callers to perfectly pack their multi-line output into a single
entry. We discussed [0][1] this back in August 2020.

John Ogness

[0] https://lore.kernel.org/lkml/472f2e553805b52d9834d64e4056db965edee329.camel@perches.com
[1] offlist message-id: 87d03k9ymz.fsf@jogness.linutronix.de
