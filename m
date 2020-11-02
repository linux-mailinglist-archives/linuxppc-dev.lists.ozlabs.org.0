Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CAC2A30FE
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Nov 2020 18:11:04 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CPzvn1JqyzDqRb
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 04:11:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=k05g=ei=goodmis.org=rostedt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=goodmis.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CPzsl5KhSzDq9G
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Nov 2020 04:09:15 +1100 (AEDT)
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2E96B2071A;
 Mon,  2 Nov 2020 17:09:09 +0000 (UTC)
Date: Mon, 2 Nov 2020 12:09:07 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Petr Mladek <pmladek@suse.com>
Subject: Re: [PATCH 11/11 v2] ftrace: Add recording of functions that caused
 recursion
Message-ID: <20201102120907.457ad2f7@gandalf.local.home>
In-Reply-To: <20201102164147.GJ20201@alley>
References: <20201030213142.096102821@goodmis.org>
 <20201030214014.801706340@goodmis.org>
 <20201102164147.GJ20201@alley>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Mon, 2 Nov 2020 17:41:47 +0100
Petr Mladek <pmladek@suse.com> wrote:

> On Fri 2020-10-30 17:31:53, Steven Rostedt wrote:
> > From: "Steven Rostedt (VMware)" <rostedt@goodmis.org>
> > 
> > This adds CONFIG_FTRACE_RECORD_RECURSION that will record to a file
> > "recursed_functions" all the functions that caused recursion while a
> > callback to the function tracer was running.
> >   
> 
> > --- /dev/null
> > +++ b/kernel/trace/trace_recursion_record.c
> > @@ -0,0 +1,220 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +#include <linux/seq_file.h>
> > +#include <linux/kallsyms.h>
> > +#include <linux/module.h>
> > +#include <linux/ftrace.h>
> > +#include <linux/fs.h>
> > +
> > +#include "trace_output.h"
> > +
> > +struct recursed_functions {
> > +	unsigned long		ip;
> > +	unsigned long		parent_ip;
> > +};
> > +
> > +static struct recursed_functions recursed_functions[CONFIG_FTRACE_RECORD_RECURSION_SIZE];  
> 
> The code tries to be lockless safe as much as possible. It would make
> sense to allign the array.

Hmm, is there an arch where the compiler would put an array of structures
with two unsigned long, misaligned?

> 
> 
> > +static atomic_t nr_records;
> > +
> > +/*
> > + * Cache the last found function. Yes, updates to this is racey, but
> > + * so is memory cache ;-)
> > + */
> > +static unsigned long cached_function;
> > +
> > +void ftrace_record_recursion(unsigned long ip, unsigned long parent_ip)
> > +{
> > +	int index;
> > +	int i = 0;
> > +	unsigned long old;
> > +
> > + again:
> > +	/* First check the last one recorded */
> > +	if (ip == cached_function)
> > +		return;
> > +
> > +	index = atomic_read(&nr_records);
> > +	/* nr_records is -1 when clearing records */
> > +	smp_mb__after_atomic();
> > +	if (index < 0)
> > +		return;
> > +
> > +	/* See below */
> > +	if (i > index)
> > +		index = i;  
> 
> This looks like a complicated way to do index++ via "i" variable.
> I guess that it was needed only in some older variant of the code.
> See below.

Because we reread the index above, and index could be bigger than i (more
than index + 1).

> 
> > +	if (index >= CONFIG_FTRACE_RECORD_RECURSION_SIZE)
> > +		return;
> > +
> > +	for (i = index - 1; i >= 0; i--) {
> > +		if (recursed_functions[i].ip == ip) {
> > +			cached_function = ip;
> > +			return;
> > +		}
> > +	}
> > +
> > +	cached_function = ip;
> > +
> > +	/*
> > +	 * We only want to add a function if it hasn't been added before.
> > +	 * Add to the current location before incrementing the count.
> > +	 * If it fails to add, then increment the index (save in i)
> > +	 * and try again.
> > +	 */
> > +	old = cmpxchg(&recursed_functions[index].ip, 0, ip);
> > +	if (old != 0) {
> > +		/* Did something else already added this for us? */
> > +		if (old == ip)
> > +			return;
> > +		/* Try the next location (use i for the next index) */
> > +		i = index + 1;  
> 
> What about
> 
> 		index++;
> 
> We basically want to run the code again with index + 1 limit.

But something else could update nr_records, and we want to use that if
nr_records is greater than i.

Now, we could swap the use case, and have

	int index = 0;

	[..]
	i = atomic_read(&nr_records);
	if (i > index)
		index = i;

	[..]

		index++;
		goto again;


> 
> Maybe, it even does not make sense to check the array again
> and we should just try to store the value into the next slot.

We do this dance to prevent duplicates.

But you are correct, that this went through a few iterations. And the first
ones didn't have the cmpxchg on the ip itself, and that could make it so
that we don't need this index = i dance.

> 
> > +		goto again;
> > +	}
> > +
> > +	recursed_functions[index].parent_ip = parent_ip;  
> 
> WRITE_ONCE() ?

Does it really matter?

> 
> > +
> > +	/*
> > +	 * It's still possible that we could race with the clearing
> > +	 *    CPU0                                    CPU1
> > +	 *    ----                                    ----
> > +	 *                                       ip = func
> > +	 *  nr_records = -1;
> > +	 *  recursed_functions[0] = 0;
> > +	 *                                       i = -1
> > +	 *                                       if (i < 0)
> > +	 *  nr_records = 0;
> > +	 *  (new recursion detected)
> > +	 *      recursed_functions[0] = func
> > +	 *                                            cmpxchg(recursed_functions[0],
> > +	 *                                                    func, 0)
> > +	 *
> > +	 * But the worse that could happen is that we get a zero in
> > +	 * the recursed_functions array, and it's likely that "func" will
> > +	 * be recorded again.
> > +	 */
> > +	i = atomic_read(&nr_records);
> > +	smp_mb__after_atomic();
> > +	if (i < 0)
> > +		cmpxchg(&recursed_functions[index].ip, ip, 0);
> > +	else if (i <= index)
> > +		atomic_cmpxchg(&nr_records, i, index + 1);  
> 
> This looks weird. It would shift nr_records past the record added
> in this call. It might skip many slots that were zeroed when clearing.
> Also we do not know if our entry was not zeroed as well.
> 
> I would suggest to do it some other way (not even compile tested):
> 
> void ftrace_record_recursion(unsigned long ip, unsigned long parent_ip)
> {
> 	int index, old_index;
> 	int i = 0;
> 	unsigned long old_ip;
> 
>  again:
> 	/* First check the last one recorded. */
> 	if (ip == READ_ONCE(cached_function))
> 		return;
> 
> 	index = atomic_read(&nr_records);
> 	/* nr_records is -1 when clearing records. */
> 	smp_mb__after_atomic();
> 	if (index < 0)
> 		return;
> 
> 	/* Already cached? */
> 	for (i = index - 1; i >= 0; i--) {
> 		if (recursed_functions[i].ip == ip) {
> 			WRITE_ONCE(cached_function, ip);
> 			return;
> 		}
> 	}
> 
> 	if (index >= CONFIG_FTRACE_RECORD_RECURSION_SIZE)
> 		return;
> 
> 	/*
> 	 * Try to reserve the slot. It might be already taken
> 	 * or the entire cache cleared.
> 	 */
> 	old_index = atomic_cmpxchg(&nr_records, index, index + 1);
> 	if (old_index != index)
> 		goto again;
> 
> 	/*
> 	 * Be careful. The entire cache might have been cleared and reused in
> 	 * the meantime. Replace only empty slot.
> 	 */
> 	old_ip = cmpxchg(&recursed_functions[index].ip, 0, ip);
> 	if (old_ip != 0)
> 		goto again;
> 
> 	old_ip = cmpxchg(&recursed_functions[index].parent_ip, 0, parrent_ip);
> 	if (old_ip != 0)
> 		goto again;
> 
> 	/*
> 	 * No ip is better than non-consistent one. The race with
> 	 * clearing should be rare and not worth a perfect solution.
> 	 */
> 	if (READ_ONCE(recursed_functions[index].ip) != ip) {
> 		cmpxchg(&recursed_functions[index].ip, ip, 0UL)
> 		goto again;
> 	}
> }

Let me go and rewrite it, this time considering the cmpxchg in the ip
update code. I may end up with what you have above ;-)


> 
> The last check probably is not needed. Inconsistent entries
> should be prevented by the way how this func is called:
> 
> 		static atomic_t paranoid_test;				\
> 		if (!atomic_read(&paranoid_test)) {			\
> 			atomic_inc(&paranoid_test);			\
> 			ftrace_record_recursion(ip, pip);		\
> 			atomic_dec(&paranoid_test);			\
> 		}							\
> 
> 
> 
> 
> The rest of the patchset looks fine. I do not feel comfortable to give
> it Reviewed-by because I did not review it in depth.
> 
> I spent more time with the above lockless code. I took it is a
> training. I need to improve this skill to feel more comfortable with
> the lockless printk ring buffer ;-)

Yeah, everything becomes exponentially complex when you make it lockless
with multiple concurrent writers.

-- Steve
