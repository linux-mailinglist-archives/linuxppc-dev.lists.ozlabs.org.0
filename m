Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B0C3B3210
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Jun 2021 16:58:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G9jtP2Fcrz3bpL
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Jun 2021 00:58:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=Lpfsv0ZX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=suse.com (client-ip=195.135.220.29; helo=smtp-out2.suse.de;
 envelope-from=pmladek@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256
 header.s=susede1 header.b=Lpfsv0ZX; dkim-atps=neutral
X-Greylist: delayed 486 seconds by postgrey-1.36 at boromir;
 Fri, 25 Jun 2021 00:57:41 AEST
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G9jsx5n2Xz2ym7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Jun 2021 00:57:40 +1000 (AEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 422A31FD97;
 Thu, 24 Jun 2021 14:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1624546169; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5Ign43XeMpHmxep3PS/AYugOaZqefaSJ02AcjVPwEHM=;
 b=Lpfsv0ZXIrwaoon9xkE3tJ+qhGb1S6jmx1qTAAAexHj3ASpCFW5TKHtQmjYt3hMasjR7fZ
 0/sucOsNVLyQrQk+Xi8bF3MK+GhYrMl+COXkvb7JwPZrCA+XTEBhIL+d0JKaM7ED00sK8N
 N+kwd6i+KX6gNiDJHVpoQay6wGtL3Wk=
Received: from suse.cz (unknown [10.100.224.162])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 6BA58A3BB4;
 Thu, 24 Jun 2021 14:49:27 +0000 (UTC)
Date: Thu, 24 Jun 2021 16:49:27 +0200
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Subject: Re: [PATCH printk v3 3/6] printk: remove safe buffers
Message-ID: <YNSbd68YJ+0wxayx@alley>
References: <20210624111148.5190-1-john.ogness@linutronix.de>
 <20210624111148.5190-4-john.ogness@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210624111148.5190-4-john.ogness@linutronix.de>
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
Cc: Kees Cook <keescook@chromium.org>, "Paul E. McKenney" <paulmck@kernel.org>,
 Alexey Kardashevskiy <aik@ozlabs.ru>, Nicholas Piggin <npiggin@gmail.com>,
 linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 kexec@lists.infradead.org, Sergey Senozhatsky <senozhatsky@chromium.org>,
 Yue Hu <huyue2@yulong.com>, Paul Mackerras <paulus@samba.org>,
 Eric Biederman <ebiederm@xmission.com>, Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev@lists.ozlabs.org, Andrew Morton <akpm@linux-foundation.org>,
 Tiezhu Yang <yangtiezhu@loongson.cn>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu 2021-06-24 13:17:45, John Ogness wrote:
> With @logbuf_lock removed, the high level printk functions for
> storing messages are lockless. Messages can be stored from any
> context, so there is no need for the NMI and safe buffers anymore.
> Remove the NMI and safe buffers.
> 
> Although the safe buffers are removed, the NMI and safe context
> tracking is still in place. In these contexts, store the message
> immediately but still use irq_work to defer the console printing.
> 
> Since printk recursion tracking is in place, safe context tracking
> for most of printk is not needed. Remove it. Only safe context
> tracking relating to the console lock is left in place. This is
> because the console lock is needed for the actual printing.

Feel free to use:

Reviewed-by: Petr Mladek <pmladek@suse.com>

There are some comments below.

> --- a/kernel/printk/printk.c
> +++ b/kernel/printk/printk.c
> @@ -1852,7 +1839,7 @@ static int console_trylock_spinning(void)
>  	if (console_trylock())
>  		return 1;
>  
> -	printk_safe_enter_irqsave(flags);
> +	local_irq_save(flags);
>  
>  	raw_spin_lock(&console_owner_lock);

This spin_lock is in the printk() path. We must make sure that
it does not cause deadlock.

printk_safe_enter_irqsave(flags) prevented the recursion because
it deferred the console handling.

One danger might be a lockdep report triggered by
raw_spin_lock(&console_owner_lock) itself. But it should be safe.
lockdep is checked before the lock is actually taken
and lockdep should disable itself before printing anything.

Another danger might be any printk() called under the lock.
The code just compares and assigns values to some variables
(static, on stack) so we should be on the safe side.

Well, I would feel more comfortable if we add printk_safe_enter_irqsave()
back around the sections guarded by this lock. It can be done
in a separate patch. The code looks safe at the moment.


> @@ -2664,9 +2648,9 @@ void console_unlock(void)
>  
>  	for (;;) {
>  		size_t ext_len = 0;
> +		int handover;
>  		size_t len;
>  
> -		printk_safe_enter_irqsave(flags);
>  skip:
>  		if (!prb_read_valid(prb, console_seq, &r))
>  			break;
> @@ -2716,19 +2700,22 @@ void console_unlock(void)
>  		 * were to occur on another CPU, it may wait for this one to
>  		 * finish. This task can not be preempted if there is a
>  		 * waiter waiting to take over.
> +		 *
> +		 * Interrupts are disabled because the hand over to a waiter
> +		 * must not be interrupted until the hand over is completed
> +		 * (@console_waiter is cleared).
>  		 */
> +		local_irq_save(flags);
>  		console_lock_spinning_enable();

Same here. console_lock_spinning_enable() takes console_owner_lock.
I would feel more comfortable if we added printk_safe_enter_irqsave(flags)
inside console_lock_spinning_enable() around the locked code. The code
is safe at the moment but...

>  
>  		stop_critical_timings();	/* don't trace print latency */
>  		call_console_drivers(ext_text, ext_len, text, len);
>  		start_critical_timings();
>  
> -		if (console_lock_spinning_disable_and_check()) {
> -			printk_safe_exit_irqrestore(flags);
> +		handover = console_lock_spinning_disable_and_check();

Same here. Also console_lock_spinning_disable_and_check() takes
console_owner_lock. It looks safe at the moment but...


> +		local_irq_restore(flags);
> +		if (handover)
>  			return;
> -		}
> -
> -		printk_safe_exit_irqrestore(flags);
>  
>  		if (do_cond_resched)
>  			cond_resched();

> --- a/kernel/printk/printk_safe.c
> +++ b/kernel/printk/printk_safe.c
> @@ -369,7 +70,10 @@ asmlinkage int vprintk(const char *fmt, va_list args)
>  	 * Use the main logbuf even in NMI. But avoid calling console
>  	 * drivers that might have their own locks.
>  	 */
> -	if ((this_cpu_read(printk_context) & PRINTK_NMI_DIRECT_CONTEXT_MASK)) {
> +	if (this_cpu_read(printk_context) &
> +	    (PRINTK_NMI_DIRECT_CONTEXT_MASK |
> +	     PRINTK_NMI_CONTEXT_MASK |
> +	     PRINTK_SAFE_CONTEXT_MASK)) {
>  		unsigned long flags;
>  		int len;
>  

There is the following code right below:

		printk_safe_enter_irqsave(flags);
		len = vprintk_store(0, LOGLEVEL_DEFAULT, NULL, fmt, args);
		printk_safe_exit_irqrestore(flags);
		defer_console_output();
		return len;

printk_safe_enter_irqsave(flags) is not needed here. Any nested
printk() ends here as well.

Against this can be done in a separate patch. Well, the commit message
mentions that the printk_safe context is removed everywhere except
for the code manipulating console lock. But is it just a detail.

Best Regards,
Petr
