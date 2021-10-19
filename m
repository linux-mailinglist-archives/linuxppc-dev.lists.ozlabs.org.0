Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49DD6432E79
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Oct 2021 08:42:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HYPLD6Fydz3cRP
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Oct 2021 17:42:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=teDjFL9l;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=suse.com (client-ip=195.135.220.29; helo=smtp-out2.suse.de;
 envelope-from=pmladek@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256
 header.s=susede1 header.b=teDjFL9l; dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HYPKX4BbWz2yPY
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Oct 2021 17:41:34 +1100 (AEDT)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id AA04B1FD8D;
 Tue, 19 Oct 2021 06:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1634625687; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yiCf/K6bKrAWm+H5GwYg06T7whuQxu5z+Eyutq5ePEE=;
 b=teDjFL9lr91NMRNc6Iv52QSxJj4QGuwwqDT3OOPMzK0CBm/3l5zawNGoKRXzDeN51cXEJP
 MSlwF/JcwJeOLxY3hgNh8mmlyB20AXu0yYaXblNFINe8pkmoTcCpXT4iQCyA+bOZUlhR5W
 yl7nzpiJ+YDINXRghZ+OA0t106VXXYU=
Received: from suse.cz (unknown [10.100.216.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 0F30AA3B81;
 Tue, 19 Oct 2021 06:41:26 +0000 (UTC)
Date: Tue, 19 Oct 2021 08:41:23 +0200
From: Petr Mladek <pmladek@suse.com>
To: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH] tracing: Have all levels of checks prevent recursion
Message-ID: <YW5ok3CfNoRMfVQ5@alley>
References: <20211015110035.14813389@gandalf.local.home>
 <YW1KKCFallDG+E01@alley>
 <20211018220203.064a42ed@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211018220203.064a42ed@gandalf.local.home>
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
Cc: =?utf-8?B?546L6LSH?= <yun.wang@linux.alibaba.com>,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Paul Mackerras <paulus@samba.org>, Jisheng Zhang <jszhang@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, live-patching@vger.kernel.org,
 linux-riscv@lists.infradead.org, Miroslav Benes <mbenes@suse.cz>,
 Joe Lawrence <joe.lawrence@redhat.com>, Helge Deller <deller@gmx.de>,
 x86@kernel.org, linux-csky@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Jiri Kosina <jikos@kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>,
 Josh Poimboeuf <jpoimboe@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-parisc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Masami Hiramatsu <mhiramat@kernel.org>,
 Guo Ren <guoren@kernel.org>, Colin Ian King <colin.king@canonical.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon 2021-10-18 22:02:03, Steven Rostedt wrote:
> On Mon, 18 Oct 2021 12:19:20 +0200
> Petr Mladek <pmladek@suse.com> wrote:
> 
> > > -
> > >  	bit = trace_get_context_bit() + start;
> > >  	if (unlikely(val & (1 << bit))) {
> > >  		/*
> > >  		 * It could be that preempt_count has not been updated during
> > >  		 * a switch between contexts. Allow for a single recursion.
> > >  		 */
> > > -		bit = TRACE_TRANSITION_BIT;
> > > +		bit = TRACE_CTX_TRANSITION + start;  
> >
> 
> [..]
> 
> > Could we please update the comment? I mean to say if it is a race
> > or if we trace a function that should not get traced.
> 
> What do you think of this change?
> 
> diff --git a/include/linux/trace_recursion.h b/include/linux/trace_recursion.h
> index 1d8cce02c3fb..24f284eb55a7 100644
> --- a/include/linux/trace_recursion.h
> +++ b/include/linux/trace_recursion.h
> @@ -168,8 +168,12 @@ static __always_inline int trace_test_and_set_recursion(unsigned long ip, unsign
>  	bit = trace_get_context_bit() + start;
>  	if (unlikely(val & (1 << bit))) {
>  		/*
> -		 * It could be that preempt_count has not been updated during
> -		 * a switch between contexts. Allow for a single recursion.
> +		 * If an interrupt occurs during a trace, and another trace
> +		 * happens in that interrupt but before the preempt_count is
> +		 * updated to reflect the new interrupt context, then this
> +		 * will think a recursion occurred, and the event will be dropped.
> +		 * Let a single instance happen via the TRANSITION_BIT to
> +		 * not drop those events.
>  		 */
>  		bit = TRACE_TRANSITION_BIT;
>  		if (val & (1 << bit)) {
> 
> 

Looks good to me. Thanks for the update.

Feel free to postpone this change. I do not want to complicate
upstreaming the fix for stable. I am sorry if I already
complicated it.

Best Regards,
Petr
