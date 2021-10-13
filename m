Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9107942B9BE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Oct 2021 09:56:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HTlGD1lwBz303t
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Oct 2021 18:56:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=Ej27NFvh;
	dkim=fail reason="signature verification failed" header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=+w9Az0Z3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=195.135.220.28; helo=smtp-out1.suse.de;
 envelope-from=mbenes@suse.cz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256
 header.s=susede2_rsa header.b=Ej27NFvh; 
 dkim=pass header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=+w9Az0Z3; 
 dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HTlFS5Ly3z2yPk
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Oct 2021 18:55:23 +1100 (AEDT)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 99BD022296;
 Wed, 13 Oct 2021 07:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1634111719; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=i7IGip/6gbVvmHRaMhrhBlPAbqtmi4yf9VEPWWlaFeE=;
 b=Ej27NFvhi/+3F1LnXiuEvJ3SmzHirAxauJBsGjgulCIyOssPQw6F6KwTNa9IaM5Au65bVy
 pwr2XAZtxLt0rxZlJr0A7utwkQQTqhil/0XYYwHKx8ILmEECDzgVsKv24qdJ71W4uV3deH
 oxQvor4tfFIz/5mrWPBwtKjE3PhLc20=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1634111719;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=i7IGip/6gbVvmHRaMhrhBlPAbqtmi4yf9VEPWWlaFeE=;
 b=+w9Az0Z3KJ2VxO6gzBE7ap3QeAyDlZfweavR7c1nDpq45ogh1GvakBs8gocNDgbltKk/J+
 vJikc3lgCt4lGSCQ==
Received: from pobox.suse.cz (pobox.suse.cz [10.100.2.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 5FC20A3B88;
 Wed, 13 Oct 2021 07:55:18 +0000 (UTC)
Date: Wed, 13 Oct 2021 09:55:18 +0200 (CEST)
From: Miroslav Benes <mbenes@suse.cz>
To: =?ISO-2022-JP?Q?=1B$B2&lV=1B=28J?= <yun.wang@linux.alibaba.com>
Subject: Re: [RESEND PATCH v2 1/2] ftrace: disable preemption between
 ftrace_test_recursion_trylock/unlock()
In-Reply-To: <75ee86ac-02f2-d687-ab1e-9c8c33032495@linux.alibaba.com>
Message-ID: <alpine.LSU.2.21.2110130948120.5647@pobox.suse.cz>
References: <b1d7fe43-ce84-0ed7-32f7-ea1d12d0b716@linux.alibaba.com>
 <75ee86ac-02f2-d687-ab1e-9c8c33032495@linux.alibaba.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, live-patching@vger.kernel.org,
 linux-riscv@lists.infradead.org, Paul Mackerras <paulus@samba.org>,
 Joe Lawrence <joe.lawrence@redhat.com>, Helge Deller <deller@gmx.de>,
 x86@kernel.org, linux-csky@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 Petr Mladek <pmladek@suse.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Jiri Kosina <jikos@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Borislav Petkov <bp@alien8.de>, Nicholas Piggin <npiggin@gmail.com>,
 Josh Poimboeuf <jpoimboe@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Masami Hiramatsu <mhiramat@kernel.org>,
 Colin Ian King <colin.king@canonical.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> diff --git a/include/linux/trace_recursion.h b/include/linux/trace_recursion.h
> index a9f9c57..101e1fb 100644
> --- a/include/linux/trace_recursion.h
> +++ b/include/linux/trace_recursion.h
> @@ -208,13 +208,29 @@ static __always_inline void trace_clear_recursion(int bit)
>   * Use this for ftrace callbacks. This will detect if the function
>   * tracing recursed in the same context (normal vs interrupt),
>   *
> + * The ftrace_test_recursion_trylock() will disable preemption,
> + * which is required for the variant of synchronize_rcu() that is
> + * used to allow patching functions where RCU is not watching.
> + * See klp_synchronize_transition() for more details.
> + *

I think that you misunderstood. Steven proposed to put the comment before 
ftrace_test_recursion_trylock() call site in klp_ftrace_handler().

>   * Returns: -1 if a recursion happened.
>   *           >= 0 if no recursion
>   */
>  static __always_inline int ftrace_test_recursion_trylock(unsigned long ip,
>  							 unsigned long parent_ip)
>  {
> -	return trace_test_and_set_recursion(ip, parent_ip, TRACE_FTRACE_START, TRACE_FTRACE_MAX);
> +	int bit;
> +
> +	bit = trace_test_and_set_recursion(ip, parent_ip, TRACE_FTRACE_START, TRACE_FTRACE_MAX);
> +	/*
> +	 * The zero bit indicate we are nested
> +	 * in another trylock(), which means the
> +	 * preemption already disabled.
> +	 */
> +	if (bit > 0)
> +		preempt_disable_notrace();
> +
> +	return bit;
>  }

[...]

> diff --git a/kernel/livepatch/patch.c b/kernel/livepatch/patch.c
> index e8029ae..6e66ccd 100644
> --- a/kernel/livepatch/patch.c
> +++ b/kernel/livepatch/patch.c
> @@ -52,11 +52,6 @@ static void notrace klp_ftrace_handler(unsigned long ip,

Here

>  	bit = ftrace_test_recursion_trylock(ip, parent_ip);
>  	if (WARN_ON_ONCE(bit < 0))
>  		return;
> -	/*
> -	 * A variant of synchronize_rcu() is used to allow patching functions
> -	 * where RCU is not watching, see klp_synchronize_transition().
> -	 */
> -	preempt_disable_notrace();
> 
>  	func = list_first_or_null_rcu(&ops->func_stack, struct klp_func,
>  				      stack_node);
> @@ -120,7 +115,6 @@ static void notrace klp_ftrace_handler(unsigned long ip,
>  	klp_arch_set_pc(fregs, (unsigned long)func->new_func);
> 
>  unlock:
> -	preempt_enable_notrace();
>  	ftrace_test_recursion_unlock(bit);
>  }

Side note... the comment will eventually conflict with peterz's 
https://lore.kernel.org/all/20210929152429.125997206@infradead.org/.

Miroslav
