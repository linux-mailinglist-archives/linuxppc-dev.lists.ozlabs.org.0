Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7870342EEF1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Oct 2021 12:36:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HW2kF5vqwz3c8y
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Oct 2021 21:36:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=Kgq5rJkd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=suse.com (client-ip=195.135.220.28; helo=smtp-out1.suse.de;
 envelope-from=pmladek@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256
 header.s=susede1 header.b=Kgq5rJkd; dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HW2fJ4C1Tz2yKB
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Oct 2021 21:32:55 +1100 (AEDT)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 8F2FE21A5F;
 Fri, 15 Oct 2021 07:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1634282942; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ajbOHu+rClKJMCVN9IOrg9A779y/UiP4OhkzJFOjSQ0=;
 b=Kgq5rJkdVrVP4IDhfsKBOlKRbJj/ElwH9MtJu3TB/6DSQyKaBrnGTAZEUIHTm9Wg9/R9yP
 gS+2GjVcOOgJ8gcQFMUqXpN0t0LxD5W1VSXuJRJZSg5ELwNykVEIFOvyYognnuQg7wAlZK
 xUQAgCSdgE9t8+fHmbr613MI5spEt8o=
Received: from suse.cz (unknown [10.100.224.162])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 7FDD2A3B84;
 Fri, 15 Oct 2021 07:29:01 +0000 (UTC)
Date: Fri, 15 Oct 2021 09:28:58 +0200
From: Petr Mladek <pmladek@suse.com>
To: =?utf-8?B?546L6LSH?= <yun.wang@linux.alibaba.com>
Subject: Re: [PATCH v3 1/2] ftrace: disable preemption between
 ftrace_test_recursion_trylock/unlock()
Message-ID: <YWktujP6DcMnRIXT@alley>
References: <609b565a-ed6e-a1da-f025-166691b5d994@linux.alibaba.com>
 <7e4738b5-21d4-c4d0-3136-a096bbb5cd2c@linux.alibaba.com>
 <YWhJP41cNwDphYsv@alley>
 <5e907ed3-806b-b0e5-518d-d2f3b265377f@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5e907ed3-806b-b0e5-518d-d2f3b265377f@linux.alibaba.com>
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
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, live-patching@vger.kernel.org,
 linux-riscv@lists.infradead.org, Miroslav Benes <mbenes@suse.cz>,
 Paul Mackerras <paulus@samba.org>, Joe Lawrence <joe.lawrence@redhat.com>,
 Helge Deller <deller@gmx.de>, x86@kernel.org, linux-csky@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Jiri Kosina <jikos@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Borislav Petkov <bp@alien8.de>, Nicholas Piggin <npiggin@gmail.com>,
 Josh Poimboeuf <jpoimboe@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Masami Hiramatsu <mhiramat@kernel.org>,
 Colin Ian King <colin.king@canonical.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri 2021-10-15 11:13:08, 王贇 wrote:
> 
> 
> On 2021/10/14 下午11:14, Petr Mladek wrote:
> [snip]
> >> -	return trace_test_and_set_recursion(ip, parent_ip, TRACE_FTRACE_START, TRACE_FTRACE_MAX);
> >> +	int bit;
> >> +
> >> +	bit = trace_test_and_set_recursion(ip, parent_ip, TRACE_FTRACE_START, TRACE_FTRACE_MAX);
> >> +	/*
> >> +	 * The zero bit indicate we are nested
> >> +	 * in another trylock(), which means the
> >> +	 * preemption already disabled.
> >> +	 */
> >> +	if (bit > 0)
> >> +		preempt_disable_notrace();
> > 
> > Is this safe? The preemption is disabled only when
> > trace_test_and_set_recursion() was called by ftrace_test_recursion_trylock().
> > 
> > We must either always disable the preemtion when bit >= 0.
> > Or we have to disable the preemtion already in
> > trace_test_and_set_recursion().
> 
> Internal calling of trace_test_and_set_recursion() will disable preemption
> on succeed, it should be safe.

trace_test_and_set_recursion() does _not_ disable preemtion!
It works only because all callers disable the preemption.

It means that the comment is wrong. It is not guarantted that the
preemption will be disabled. It works only by chance.


> We can also consider move the logical into trace_test_and_set_recursion()
> and trace_clear_recursion(), but I'm not very sure about that... ftrace
> internally already make sure preemption disabled

How? Because it calls trace_test_and_set_recursion() via the trylock() API?


> , what uncovered is those users who call API trylock/unlock, isn't
> it?

And this is exactly the problem. trace_test_and_set_recursion() is in
a public header. Anyone could use it. And if anyone uses it in the
future without the trylock() and does not disable the preemtion
explicitely then we are lost again.

And it is even more dangerous. The original code disabled the
preemtion on various layers. As a result, the preemtion was disabled
several times for sure. It means that the deeper layers were
always on the safe side.

With this patch, if the first trace_test_and_set_recursion() caller
does not disable preemtion then trylock() will not disable it either
and the entire code is procceed with preemtion enabled.


> > Finally, the comment confused me a lot. The difference between nesting and
> > recursion is far from clear. And the code is tricky liky like hell :-)
> > I propose to add some comments, see below for a proposal.
> The comments do confusing, I'll make it something like:
> 
> The zero bit indicate trace recursion happened, whatever
> the recursively call was made by ftrace handler or ftrace
> itself, the preemption already disabled.

I am sorry but it is still confusing. We need to find a better way
how to clearly explain the difference between the safe and
unsafe recursion.

My understanding is that the recursion is:

  + "unsafe" when the trace code recursively enters the same trace point.

  + "safe" when ftrace_test_recursion_trylock() is called recursivelly
    while still processing the same trace entry.

> >> +
> >> +	return bit;
> >>  }
> >>  /**
> >> @@ -222,9 +233,13 @@ static __always_inline int ftrace_test_recursion_trylock(unsigned long ip,
> >>   * @bit: The return of a successful ftrace_test_recursion_trylock()
> >>   *
> >>   * This is used at the end of a ftrace callback.
> >> + *
> >> + * Preemption will be enabled (if it was previously enabled).
> >>   */
> >>  static __always_inline void ftrace_test_recursion_unlock(int bit)
> >>  {
> >> +	if (bit)
> > 
> > This is not symetric with trylock(). It should be:
> > 
> > 	if (bit > 0)
> > 
> > Anyway, trace_clear_recursion() quiently ignores bit != 0
> 
> Yes, bit == 0 should not happen in here.

Yes, it "should" not happen. My point is that we could make the API
more safe. We could do the right thing when
ftrace_test_recursion_unlock() is called with negative @bit.
Ideally, we should also warn about the mis-use.


Anyway, let's wait for Steven. It seems that he found another problem
with the API that should be solved first. The fix will probably
also help to better understand the "safe" vs "unsafe" recursion.

Best Regards,
Petr
