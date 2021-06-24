Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE533B32B5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Jun 2021 17:36:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G9kkm5Vtwz3btG
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Jun 2021 01:36:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=X440mlyx;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Sk5fVzsx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1;
 helo=galois.linutronix.de; envelope-from=john.ogness@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=X440mlyx; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=Sk5fVzsx; 
 dkim-atps=neutral
X-Greylist: delayed 15850 seconds by postgrey-1.36 at boromir;
 Fri, 25 Jun 2021 01:36:08 AEST
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G9kkJ1Rp6z3c02
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Jun 2021 01:36:07 +1000 (AEST)
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1624548957;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cnGrieUbujWdjeESGTNL4zI8bpCaykCad9TLoO0NgzE=;
 b=X440mlyxOfY0l+O6I6VQVplfM6lJHk48nwLBwuBz6w5egyUun8KR9oAbbsSxx0G2tldbac
 +rDoNSprzi9uO1TNuUNSF/J1x11nrSbRwK6BRIs2HVPPJMGqszaFgInryCw4EqLL8m8ttt
 rSd+DMxUS3NAYGpAv073q2OQzdu6fV1J59wg9zOQotD8O3J5TC1iCrOjkGtJvWbWkUlY4t
 waWdCG/lR4XTehi++htdLi4sgfrz+GqV25zoAI3twp5xKa6e2whADE+wPFtI21fqE0b79x
 MUXbiAWCeXyXtdWMqlxMMYh1siZI/FNUEZ0zJCi8E9kbL8k/W6rLzBqAF5Uajw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1624548957;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cnGrieUbujWdjeESGTNL4zI8bpCaykCad9TLoO0NgzE=;
 b=Sk5fVzsxRS3y1IRl2xYTV2TXNGf2kUa1cw+/mM4u06ApaxCKSAoHIvZFq5mBMNQXB8Rt6b
 nIDyXXDXd4fDCBBQ==
To: Petr Mladek <pmladek@suse.com>
Subject: Re: [PATCH printk v3 3/6] printk: remove safe buffers
In-Reply-To: <YNSbd68YJ+0wxayx@alley>
References: <20210624111148.5190-1-john.ogness@linutronix.de>
 <20210624111148.5190-4-john.ogness@linutronix.de> <YNSbd68YJ+0wxayx@alley>
Date: Thu, 24 Jun 2021 17:41:56 +0206
Message-ID: <8735t7mg0z.fsf@jogness.linutronix.de>
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
Cc: Kees Cook <keescook@chromium.org>, "Paul E.
 McKenney" <paulmck@kernel.org>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>, kexec@lists.infradead.org,
 Sergey Senozhatsky <senozhatsky@chromium.org>, Yue Hu <huyue2@yulong.com>,
 Paul Mackerras <paulus@samba.org>, Eric Biederman <ebiederm@xmission.com>,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Tiezhu Yang <yangtiezhu@loongson.cn>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2021-06-24, Petr Mladek <pmladek@suse.com> wrote:
>> --- a/kernel/printk/printk.c
>> +++ b/kernel/printk/printk.c
>> @@ -1852,7 +1839,7 @@ static int console_trylock_spinning(void)
>>  	if (console_trylock())
>>  		return 1;
>>  
>> -	printk_safe_enter_irqsave(flags);
>> +	local_irq_save(flags);
>>  
>>  	raw_spin_lock(&console_owner_lock);
>
> This spin_lock is in the printk() path. We must make sure that
> it does not cause deadlock.
>
> printk_safe_enter_irqsave(flags) prevented the recursion because
> it deferred the console handling.
>
> One danger might be a lockdep report triggered by
> raw_spin_lock(&console_owner_lock) itself. But it should be safe.
> lockdep is checked before the lock is actually taken
> and lockdep should disable itself before printing anything.
>
> Another danger might be any printk() called under the lock.
> The code just compares and assigns values to some variables
> (static, on stack) so we should be on the safe side.
>
> Well, I would feel more comfortable if we add printk_safe_enter_irqsave()
> back around the sections guarded by this lock. It can be done
> in a separate patch. The code looks safe at the moment.

You are correct. printk_safe should also be wrapping @console_owner_lock
locking.

>> @@ -2716,19 +2700,22 @@ void console_unlock(void)
>>  		 * were to occur on another CPU, it may wait for this one to
>>  		 * finish. This task can not be preempted if there is a
>>  		 * waiter waiting to take over.
>> +		 *
>> +		 * Interrupts are disabled because the hand over to a waiter
>> +		 * must not be interrupted until the hand over is completed
>> +		 * (@console_waiter is cleared).
>>  		 */
>> +		local_irq_save(flags);
>>  		console_lock_spinning_enable();
>
> Same here. console_lock_spinning_enable() takes console_owner_lock.
> I would feel more comfortable if we added printk_safe_enter_irqsave(flags)
> inside console_lock_spinning_enable() around the locked code. The code
> is safe at the moment but...

Agreed.

>>  		stop_critical_timings();	/* don't trace print latency */
>>  		call_console_drivers(ext_text, ext_len, text, len);
>>  		start_critical_timings();
>>  
>> -		if (console_lock_spinning_disable_and_check()) {
>> -			printk_safe_exit_irqrestore(flags);
>> +		handover = console_lock_spinning_disable_and_check();
>
> Same here. Also console_lock_spinning_disable_and_check() takes
> console_owner_lock. It looks safe at the moment but...

Agreed.

>> --- a/kernel/printk/printk_safe.c
>> +++ b/kernel/printk/printk_safe.c
>> @@ -369,7 +70,10 @@ asmlinkage int vprintk(const char *fmt, va_list args)
>>  	 * Use the main logbuf even in NMI. But avoid calling console
>>  	 * drivers that might have their own locks.
>>  	 */
>> -	if ((this_cpu_read(printk_context) & PRINTK_NMI_DIRECT_CONTEXT_MASK)) {
>> +	if (this_cpu_read(printk_context) &
>> +	    (PRINTK_NMI_DIRECT_CONTEXT_MASK |
>> +	     PRINTK_NMI_CONTEXT_MASK |
>> +	     PRINTK_SAFE_CONTEXT_MASK)) {
>>  		unsigned long flags;
>>  		int len;
>>  
>
> There is the following code right below:
>
> 		printk_safe_enter_irqsave(flags);
> 		len = vprintk_store(0, LOGLEVEL_DEFAULT, NULL, fmt, args);
> 		printk_safe_exit_irqrestore(flags);
> 		defer_console_output();
> 		return len;
>
> printk_safe_enter_irqsave(flags) is not needed here. Any nested
> printk() ends here as well.

Ah, I missed that one. Good eye!

> Against this can be done in a separate patch. Well, the commit message
> mentions that the printk_safe context is removed everywhere except
> for the code manipulating console lock. But is it just a detail.

I would prefer a v4 with these fixes:

- wrap @console_owner_lock with printk_safe usage

- remove unnecessary printk_safe usage from printk_safe.c

- update commit message to say that safe context tracking is left in
  place for both the console and console_owner locks

John Ogness
