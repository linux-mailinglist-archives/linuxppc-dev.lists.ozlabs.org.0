Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC823D0F39
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jul 2021 15:09:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GVGBW18FVz3bgK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jul 2021 23:09:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=G6EwJTzi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=suse.com (client-ip=195.135.220.28; helo=smtp-out1.suse.de;
 envelope-from=pmladek@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256
 header.s=susede1 header.b=G6EwJTzi; dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GVGB174Dsz2yL6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Jul 2021 23:08:56 +1000 (AEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 828A4224F6;
 Wed, 21 Jul 2021 13:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1626872933; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GSrlf3q3DEPrwUFBKoxlkF494RI/UIwOR7Ygj8r1Z1I=;
 b=G6EwJTziyXxCA+fg3DWxGGqC6bJ5d6YHoubZTuX+dk4mMy0FOCGMjTx3IJ1hddInQatreK
 Yaj8KfzN1A/0NV6hbqhJ0Jy5681vupjvfb0tY5E7ZqPMou4fI4ZBAqrL27ofRjXF+kzKeF
 buFz9KxxpTVmzNwwVbkvdFcTrfVsfoc=
Received: from suse.cz (pathway.suse.cz [10.100.12.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 1864FA3B8A;
 Wed, 21 Jul 2021 13:08:53 +0000 (UTC)
Date: Wed, 21 Jul 2021 15:08:53 +0200
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Subject: Re: [PATCH printk v4 4/6] printk: remove NMI tracking
Message-ID: <20210721130852.zrjnti6b3fwjgdzj@pathway.suse.cz>
References: <20210715193359.25946-1-john.ogness@linutronix.de>
 <20210715193359.25946-5-john.ogness@linutronix.de>
 <20210721120026.y3dqno24ahw4sazy@pathway.suse.cz>
 <877dhjygvc.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <877dhjygvc.fsf@jogness.linutronix.de>
User-Agent: NeoMutt/20170912 (1.9.0)
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 "Wolfram Sang \(Renesas\)" <wsa+renesas@sang-engineering.com>,
 Paul Mackerras <paulus@samba.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Marc Zyngier <maz@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-arm-kernel@lists.infradead.org,
 Valentin Schneider <valentin.schneider@arm.com>,
 Kees Cook <keescook@chromium.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Vipin Sharma <vipinsh@google.com>, Frederic Weisbecker <frederic@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Nathan Chancellor <nathan@kernel.org>,
 Nick Terrell <terrelln@fb.com>, Thomas Gleixner <tglx@linutronix.de>,
 Vlastimil Babka <vbabka@suse.cz>, Xiongwei Song <sxwjean@gmail.com>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed 2021-07-21 14:52:15, John Ogness wrote:
> On 2021-07-21, Petr Mladek <pmladek@suse.com> wrote:
> >> --- a/kernel/trace/trace.c
> >> +++ b/kernel/trace/trace.c
> >> @@ -9647,7 +9647,7 @@ void ftrace_dump(enum ftrace_dump_mode oops_dump_mode)
> >>  	tracing_off();
> >>  
> >>  	local_irq_save(flags);
> >> -	printk_nmi_direct_enter();
> >> +	printk_deferred_enter();
> >
> > I would prefer to do not manipulate the printk context here anymore,
> > as it was done in v3.
> >
> > printk_nmi_direct_enter() was added here by the commit the commit
> > 03fc7f9c99c1e7ae2925d4 ("printk/nmi: Prevent deadlock when
> > accessing the main log buffer in NMI"). It was _not_ about console
> > handling. The reason was to modify the default behavior under NMI
> > and store the messages directly into the main log buffer.
> >
> > When I think about it. The original fix was not correct. We should have
> > modified the context only when ftrace_dump() was really called under NMI:
> >
> > 	if (in_nmi())
> > 		printk_nmi_direct_enter();
> >
> > By other words. We should try to show the messages on the console
> > when ftrace_dump()/panic() is not called from NMI. It will help
> > to see all messages even when the ftrace buffers are bigger
> > than printk() ones.
> >
> > And we do not need any special handling here for NMI. vprintk()
> > in printk/printk_safe.c will do the right thing for us.
> 
> Agreed. We need to mention this behavior change in the commit
> message. Perhaps this as the commit message:
>
> All NMI contexts are handled the same as the safe context: store the
> message and defer printing. There is no need to have special NMI
> context tracking for this. Using in_nmi() is enough.
> 
> There are several parts of the kernel that are manually calling into
> the printk NMI context tracking in order to cause general printk
> deferred printing:
> 
>     arch/arm/kernel/smp.c
>     arch/powerpc/kexec/crash.c
>     kernel/trace/trace.c
> 
> For arm/kernel/smp.c and powerpc/kexec/crash.c, provide a new
> function pair printk_deferred_enter/exit that explicitly achieves the
> same objective.
> 
> For ftrace, remove general printk deferring. This general deferrment
> was added in commit 03fc7f9c99c1 ("printk/nmi: Prevent deadlock when
> accessing the main log buffer in NMI"), but really should have only
> been deferred when in NMI context. Since vprintk() now checks for
> NMI context when deciding to defer, ftrace does not need any special
> handling.

I would make it less focused on the deferring part and try to explain
the original purpose here, something like:

"For ftrace, remove the printk context manipulation completely. It was
added in commit 03fc7f9c99c1 ("printk/nmi: Prevent deadlock when
accessing the main log buffer in NMI"). The purpose was to enforce
storing messages directly into the ring buffer even in NMI context.
It really should have only modified the behavior in NMI context.
There is no need for a special behavior any longer. All messages are
always stored directly now. The console deferring is handled
transparently in vprintk()."

But I do not resist on it. And feel free to make it shorter.

Best Regards,
Petr
