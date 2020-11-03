Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 669C82A427F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 11:42:41 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CQRFB4WLyzDqWL
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 21:42:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=suse.com (client-ip=195.135.220.15; helo=mx2.suse.de;
 envelope-from=pmladek@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256
 header.s=susede1 header.b=XSdNy7mx; dkim-atps=neutral
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by lists.ozlabs.org (Postfix) with ESMTP id 4CQRCB42ThzDqV8
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Nov 2020 21:40:52 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1604400051;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OpLXhG7xm+V2xdBg1+KjOIVd448NLhIB6otcbwQQTDI=;
 b=XSdNy7mxSwPPbuLKLXZRfCFfjOJHautUQu++n50tMCvpfkaBXlr+bOunNRM8+xoxvQYvi5
 mY40GKHAydPd5jnotGgN8FQylfnmTxCAY7Xg9pOTx1xVd1OxQtnbCqyriarK0Ndrtzt94h
 IzlzFUKI+hnTAEK+ASYY8dP7/EOox/U=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CFA08ACD8;
 Tue,  3 Nov 2020 10:40:50 +0000 (UTC)
Date: Tue, 3 Nov 2020 11:40:49 +0100
From: Petr Mladek <pmladek@suse.com>
To: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH 11/11 v2] ftrace: Add recording of functions that caused
 recursion
Message-ID: <20201103104049.GN20201@alley>
References: <20201030213142.096102821@goodmis.org>
 <20201030214014.801706340@goodmis.org>
 <20201102164147.GJ20201@alley>
 <20201102120907.457ad2f7@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201102120907.457ad2f7@gandalf.local.home>
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
Cc: Anton Vorontsov <anton@enomsg.org>, linux-doc@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Guo Ren <guoren@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 live-patching@vger.kernel.org, Miroslav Benes <mbenes@suse.cz>,
 Ingo Molnar <mingo@kernel.org>, linux-s390@vger.kernel.org,
 Joe Lawrence <joe.lawrence@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Helge Deller <deller@gmx.de>, x86@kernel.org, linux-csky@vger.kernel.org,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Kees Cook <keescook@chromium.org>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Jiri Kosina <jikos@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Josh Poimboeuf <jpoimboe@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>, Tony Luck <tony.luck@intel.com>,
 linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Masami Hiramatsu <mhiramat@kernel.org>, Colin Cross <ccross@android.com>,
 Paul Mackerras <paulus@samba.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon 2020-11-02 12:09:07, Steven Rostedt wrote:
> On Mon, 2 Nov 2020 17:41:47 +0100
> Petr Mladek <pmladek@suse.com> wrote:
> 
> > On Fri 2020-10-30 17:31:53, Steven Rostedt wrote:
> > > From: "Steven Rostedt (VMware)" <rostedt@goodmis.org>
> > > 
> > > This adds CONFIG_FTRACE_RECORD_RECURSION that will record to a file
> > > "recursed_functions" all the functions that caused recursion while a
> > > callback to the function tracer was running.
> > >   
> > 
> > > --- /dev/null
> > > +++ b/kernel/trace/trace_recursion_record.c
> > > +	if (index >= CONFIG_FTRACE_RECORD_RECURSION_SIZE)
> > > +		return;
> > > +
> > > +	for (i = index - 1; i >= 0; i--) {
> > > +		if (recursed_functions[i].ip == ip) {
> > > +			cached_function = ip;
> > > +			return;
> > > +		}
> > > +	}
> > > +
> > > +	cached_function = ip;
> > > +
> > > +	/*
> > > +	 * We only want to add a function if it hasn't been added before.
> > > +	 * Add to the current location before incrementing the count.
> > > +	 * If it fails to add, then increment the index (save in i)
> > > +	 * and try again.
> > > +	 */
> > > +	old = cmpxchg(&recursed_functions[index].ip, 0, ip);
> > > +	if (old != 0) {
> > > +		/* Did something else already added this for us? */
> > > +		if (old == ip)
> > > +			return;
> > > +		/* Try the next location (use i for the next index) */
> > > +		i = index + 1;  
> > 
> > What about
> > 
> > 		index++;
> > 
> > We basically want to run the code again with index + 1 limit.
> 
> But something else could update nr_records, and we want to use that if
> nr_records is greater than i.
> 
> Now, we could swap the use case, and have
> 
> 	int index = 0;
> 
> 	[..]
> 	i = atomic_read(&nr_records);
> 	if (i > index)
> 		index = i;
> 
> 	[..]
> 
> 		index++;
> 		goto again;
> 
> 
> > 
> > Maybe, it even does not make sense to check the array again
> > and we should just try to store the value into the next slot.
> 
> We do this dance to prevent duplicates.

I see.

My code was wrong. It reserved slot for the new "ip" by cmpxchg
on nr_records. The "ip" was stored later so that any parallel
call need not see that it is a dumplicate.

Your code reserves the slot by cmpxchg of "ip".
Any parallel call would fail to take the slot and see
the "ip" in the next iteration.

Best Regards,
Petr
