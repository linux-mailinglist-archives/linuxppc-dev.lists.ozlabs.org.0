Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D20EE345C29
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 11:47:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F4SkJ65KCz3bVf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 21:47:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=oHzwm0gb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=suse.com (client-ip=195.135.220.15; helo=mx2.suse.de;
 envelope-from=pmladek@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256
 header.s=susede1 header.b=oHzwm0gb; dkim-atps=neutral
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F4Sjt31bZz304X
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 21:47:12 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1616496429; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NaRa85INpsZEqfLCsgSNBVcWiWiVhHqblotAh21dc+g=;
 b=oHzwm0gbjvu2H5TBXXIAZpZ2mBJqANURQ9iX6ikT28yQVji58JxGeeppjss0XrZM1ZZWea
 caTlRvhtIaZKPvfm2oLB1aYphDNG6LDGwjb1hEScbeSQxt3V1REGNc9Ip/XFnnXpxWMwqN
 Rq4yFjFTmENEiqJ9XtTZAmurd9j+EgY=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8A7A0AD6D;
 Tue, 23 Mar 2021 10:47:09 +0000 (UTC)
Date: Tue, 23 Mar 2021 11:47:06 +0100
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Subject: Re: [PATCH next v1 2/3] printk: remove safe buffers
Message-ID: <YFnHKlCvIA2nI41c@alley>
References: <20210316233326.10778-1-john.ogness@linutronix.de>
 <20210316233326.10778-3-john.ogness@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210316233326.10778-3-john.ogness@linutronix.de>
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
 Peter Zijlstra <peterz@infradead.org>, Paul Mackerras <paulus@samba.org>,
 Tiezhu Yang <yangtiezhu@loongson.cn>, Rafael Aquini <aquini@redhat.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>, Yue Hu <huyue2@yulong.com>,
 Jordan Niethe <jniethe5@gmail.com>, Kees Cook <keescook@chromium.org>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Alistair Popple <alistair@popple.id.au>,
 "Guilherme G. Piccoli" <gpiccoli@canonical.com>,
 Nicholas Piggin <npiggin@gmail.com>, Steven Rostedt <rostedt@goodmis.org>,
 Thomas Gleixner <tglx@linutronix.de>, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Eric Biederman <ebiederm@xmission.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed 2021-03-17 00:33:25, John Ogness wrote:
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

I have two more questions after actually checking the entire patch.
See below.

> --- a/kernel/printk/printk.c
> +++ b/kernel/printk/printk.c
> @@ -1084,7 +1069,6 @@ void __init setup_log_buf(int early)
>  	struct printk_record r;
>  	size_t new_descs_size;
>  	size_t new_infos_size;
> -	unsigned long flags;
>  	char *new_log_buf;
>  	unsigned int free;
>  	u64 seq;
> @@ -1142,8 +1126,6 @@ void __init setup_log_buf(int early)
>  		 new_descs, ilog2(new_descs_count),
>  		 new_infos);
>  
> -	printk_safe_enter_irqsave(flags);
> -
>  	log_buf_len = new_log_buf_len;
>  	log_buf = new_log_buf;
>  	new_log_buf_len = 0;
> @@ -1159,8 +1141,6 @@ void __init setup_log_buf(int early)
>  	 */
>  	prb = &printk_rb_dynamic;
>  
> -	printk_safe_exit_irqrestore(flags);

This will allow to add new messages from the IRQ context when we
are copying them to the new buffer. They might get lost in
the small race window.

Also the messages from NMI might get lost because they are not
longer stored in the per-CPU buffer.

A possible solution might be to do something like this:

	prb_for_each_record(0, &printk_rb_static, seq, &r)
		free -= add_to_rb(&printk_rb_dynamic, &r);

	prb = &printk_rb_dynamic;

	/*
	 * Copy the remaining messages that might have appeared
	 * from IRQ or NMI context after we ended copying and
	 * before we switched the buffers. They must be finalized
	 * because only one CPU is up at this stage.
	 */
	prb_for_each_record(seq, &printk_rb_static, seq, &r)
		free -= add_to_rb(&printk_rb_dynamic, &r);


> -
>  	if (seq != prb_next_seq(&printk_rb_static)) {
>  		pr_err("dropped %llu messages\n",
>  		       prb_next_seq(&printk_rb_static) - seq);
> @@ -2666,7 +2631,6 @@ void console_unlock(void)
>  		size_t ext_len = 0;
>  		size_t len;
>  
> -		printk_safe_enter_irqsave(flags);
>  skip:
>  		if (!prb_read_valid(prb, console_seq, &r))
>  			break;
> @@ -2711,6 +2675,8 @@ void console_unlock(void)
>  				printk_time);
>  		console_seq++;
>  
> +		printk_safe_enter_irqsave(flags);

What is the purpose of the printk_safe context here, please?

I guess that you wanted to prevent calling console drivers
recursively. But it is already serialized by console_lock().

IMHO, the only risk is when manipulating console_sem->lock
or console_owner_lock. But they are already guarded by
printk_safe context, for example, in console_lock() or
console_lock_spinning_enable().

Do I miss something, please?


> +
>  		/*
>  		 * While actively printing out messages, if another printk()
>  		 * were to occur on another CPU, it may wait for this one to
> @@ -2745,8 +2711,6 @@ void console_unlock(void)
>  	 * flush, no worries.
>  	 */
>  	retry = prb_read_valid(prb, console_seq, NULL);
> -	printk_safe_exit_irqrestore(flags);
> -
>  	if (retry && console_trylock())
>  		goto again;
>  }

Heh, all these patches feels like stripping printk of an armour. I hope
that we trained it enough to be flexible and avoid any damage.

Best Regards,
Petr
