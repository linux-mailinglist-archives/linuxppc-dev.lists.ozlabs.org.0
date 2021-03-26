Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E349C34A62C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Mar 2021 12:13:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F6K8M6KpVz3bwp
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Mar 2021 22:13:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=IM/b29la;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=4oEUatYS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=193.142.43.55;
 helo=galois.linutronix.de; envelope-from=john.ogness@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=IM/b29la; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=4oEUatYS; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F6K7v6tHfz3bcw
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Mar 2021 22:12:43 +1100 (AEDT)
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1616757158;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7RxLJNwSY/A5SoVhWSfv2pmplPu4MvBBsF6rRlDKAJ0=;
 b=IM/b29laeEiAoFSv+02zMVKnUvwBIVAYGQtqO0mk287ab7q370BFBxTgBvdwauorRqW8ka
 3OJTWc6XhWgKfbDrAHBDen1simtfKPKuZ0bI0IzpM/JJ8IQZGEj0CkfkWYeM95aI6XN7kJ
 rpbuADUHsCTRy9HYjgv/l5qjydPZM3lVD4xoSAEqVO4cZ9Gs3Z3RQwwTgpAXom9fvnVW6N
 e8JW42vfPbqQtgX88zR5Q+fSxvePgbmIl8WXh0TodTDQQhjjTPElXgbUXKhbR1mq4NdYkS
 rZL0cj2H+Q0xPWIg0papxzdKddU2Zi25SnLz6tG9E3HhWvd0Crn9JV9qVbUC5A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1616757158;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7RxLJNwSY/A5SoVhWSfv2pmplPu4MvBBsF6rRlDKAJ0=;
 b=4oEUatYSA7YP5RGM/INPugkii8zZ4EjltzCG2fwMvg7n0iLo1Rqh0Z4Do/UMMnpfULteXb
 re5uVkGdenKtW2Bg==
To: Petr Mladek <pmladek@suse.com>
Subject: Re: [PATCH next v1 2/3] printk: remove safe buffers
In-Reply-To: <YFnHKlCvIA2nI41c@alley>
References: <20210316233326.10778-1-john.ogness@linutronix.de>
 <20210316233326.10778-3-john.ogness@linutronix.de> <YFnHKlCvIA2nI41c@alley>
Date: Fri, 26 Mar 2021 12:12:37 +0100
Message-ID: <87pmzmi2xm.fsf@jogness.linutronix.de>
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
 Peter Zijlstra <peterz@infradead.org>, Paul Mackerras <paulus@samba.org>,
 Tiezhu Yang <yangtiezhu@loongson.cn>, Rafael Aquini <aquini@redhat.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>, Yue Hu <huyue2@yulong.com>,
 Jordan Niethe <jniethe5@gmail.com>, Kees Cook <keescook@chromium.org>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Alistair Popple <alistair@popple.id.au>, "Guilherme G.
 Piccoli" <gpiccoli@canonical.com>, Nicholas Piggin <npiggin@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>, Thomas Gleixner <tglx@linutronix.de>,
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Eric Biederman <ebiederm@xmission.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2021-03-23, Petr Mladek <pmladek@suse.com> wrote:
>> --- a/kernel/printk/printk.c
>> +++ b/kernel/printk/printk.c
>> @@ -1142,8 +1126,6 @@ void __init setup_log_buf(int early)
>>  		 new_descs, ilog2(new_descs_count),
>>  		 new_infos);
>>  
>> -	printk_safe_enter_irqsave(flags);
>> -
>>  	log_buf_len = new_log_buf_len;
>>  	log_buf = new_log_buf;
>>  	new_log_buf_len = 0;
>> @@ -1159,8 +1141,6 @@ void __init setup_log_buf(int early)
>>  	 */
>>  	prb = &printk_rb_dynamic;
>>  
>> -	printk_safe_exit_irqrestore(flags);
>
> This will allow to add new messages from the IRQ context when we
> are copying them to the new buffer. They might get lost in
> the small race window.
>
> Also the messages from NMI might get lost because they are not
> longer stored in the per-CPU buffer.
>
> A possible solution might be to do something like this:
>
> 	prb_for_each_record(0, &printk_rb_static, seq, &r)
> 		free -= add_to_rb(&printk_rb_dynamic, &r);
>
> 	prb = &printk_rb_dynamic;
>
> 	/*
> 	 * Copy the remaining messages that might have appeared
> 	 * from IRQ or NMI context after we ended copying and
> 	 * before we switched the buffers. They must be finalized
> 	 * because only one CPU is up at this stage.
> 	 */
> 	prb_for_each_record(seq, &printk_rb_static, seq, &r)
> 		free -= add_to_rb(&printk_rb_dynamic, &r);

OK. I'll probably rework it some and combine it with the "dropped" test
so that we can identify if messages were dropped during the transition
(because of static ringbuffer overrun).

>> -
>>  	if (seq != prb_next_seq(&printk_rb_static)) {
>>  		pr_err("dropped %llu messages\n",
>>  		       prb_next_seq(&printk_rb_static) - seq);
>> @@ -2666,7 +2631,6 @@ void console_unlock(void)
>>  		size_t ext_len = 0;
>>  		size_t len;
>>  
>> -		printk_safe_enter_irqsave(flags);
>>  skip:
>>  		if (!prb_read_valid(prb, console_seq, &r))
>>  			break;
>> @@ -2711,6 +2675,8 @@ void console_unlock(void)
>>  				printk_time);
>>  		console_seq++;
>>  
>> +		printk_safe_enter_irqsave(flags);
>
> What is the purpose of the printk_safe context here, please?

console_lock_spinning_enable() needs to be called with interrupts
disabled. I should have just used local_irq_save().

I could add local_irq_save() to console_lock_spinning_enable() and
restore them at the end of console_lock_spinning_disable_and_check(),
but then I would need to add a @flags argument to both functions. I
think it is simpler to just do the disable/enable from the caller,
console_unlock().

BTW, I could not find any sane way of disabling interrupts via a
raw_spin_lock_irqsave() of @console_owner_lock because of the how it is
used with lockdep. In particular for
console_lock_spinning_disable_and_check().

John Ogness
