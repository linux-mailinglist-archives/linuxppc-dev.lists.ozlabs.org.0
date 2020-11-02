Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A8E2A3027
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Nov 2020 17:43:46 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CPzJH249MzDqSD
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 03:43:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=suse.com (client-ip=195.135.220.15; helo=mx2.suse.de;
 envelope-from=pmladek@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256
 header.s=susede1 header.b=Ujz9LMja; dkim-atps=neutral
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by lists.ozlabs.org (Postfix) with ESMTP id 4CPzGJ5YpgzDqQD
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Nov 2020 03:41:53 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1604335310;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZZ1+8t7uf1F7l3ZBHb45iCoO7eWd2o1ycVfihIUusH8=;
 b=Ujz9LMjaN8SJhVxn50rnawrrA86tblFVcms0tvPZ6z30qdXkdWdaV8CVc/AUzHzdbFv1V2
 IhoFIoAHPiRb7IWyVB1j/sUcCmK6cyUWjPXJIQKp023Mx82tNgLktFrqUxCnDxWjn5Juhp
 fYdZ2HuY/J5qgBTErdjQxOEKWWeOSL4=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 13AC8AC65;
 Mon,  2 Nov 2020 16:41:50 +0000 (UTC)
Date: Mon, 2 Nov 2020 17:41:47 +0100
From: Petr Mladek <pmladek@suse.com>
To: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH 11/11 v2] ftrace: Add recording of functions that caused
 recursion
Message-ID: <20201102164147.GJ20201@alley>
References: <20201030213142.096102821@goodmis.org>
 <20201030214014.801706340@goodmis.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201030214014.801706340@goodmis.org>
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

On Fri 2020-10-30 17:31:53, Steven Rostedt wrote:
> From: "Steven Rostedt (VMware)" <rostedt@goodmis.org>
> 
> This adds CONFIG_FTRACE_RECORD_RECURSION that will record to a file
> "recursed_functions" all the functions that caused recursion while a
> callback to the function tracer was running.
> 

> --- /dev/null
> +++ b/kernel/trace/trace_recursion_record.c
> @@ -0,0 +1,220 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/seq_file.h>
> +#include <linux/kallsyms.h>
> +#include <linux/module.h>
> +#include <linux/ftrace.h>
> +#include <linux/fs.h>
> +
> +#include "trace_output.h"
> +
> +struct recursed_functions {
> +	unsigned long		ip;
> +	unsigned long		parent_ip;
> +};
> +
> +static struct recursed_functions recursed_functions[CONFIG_FTRACE_RECORD_RECURSION_SIZE];

The code tries to be lockless safe as much as possible. It would make
sense to allign the array.


> +static atomic_t nr_records;
> +
> +/*
> + * Cache the last found function. Yes, updates to this is racey, but
> + * so is memory cache ;-)
> + */
> +static unsigned long cached_function;
> +
> +void ftrace_record_recursion(unsigned long ip, unsigned long parent_ip)
> +{
> +	int index;
> +	int i = 0;
> +	unsigned long old;
> +
> + again:
> +	/* First check the last one recorded */
> +	if (ip == cached_function)
> +		return;
> +
> +	index = atomic_read(&nr_records);
> +	/* nr_records is -1 when clearing records */
> +	smp_mb__after_atomic();
> +	if (index < 0)
> +		return;
> +
> +	/* See below */
> +	if (i > index)
> +		index = i;

This looks like a complicated way to do index++ via "i" variable.
I guess that it was needed only in some older variant of the code.
See below.

> +	if (index >= CONFIG_FTRACE_RECORD_RECURSION_SIZE)
> +		return;
> +
> +	for (i = index - 1; i >= 0; i--) {
> +		if (recursed_functions[i].ip == ip) {
> +			cached_function = ip;
> +			return;
> +		}
> +	}
> +
> +	cached_function = ip;
> +
> +	/*
> +	 * We only want to add a function if it hasn't been added before.
> +	 * Add to the current location before incrementing the count.
> +	 * If it fails to add, then increment the index (save in i)
> +	 * and try again.
> +	 */
> +	old = cmpxchg(&recursed_functions[index].ip, 0, ip);
> +	if (old != 0) {
> +		/* Did something else already added this for us? */
> +		if (old == ip)
> +			return;
> +		/* Try the next location (use i for the next index) */
> +		i = index + 1;

What about

		index++;

We basically want to run the code again with index + 1 limit.

Maybe, it even does not make sense to check the array again
and we should just try to store the value into the next slot.

> +		goto again;
> +	}
> +
> +	recursed_functions[index].parent_ip = parent_ip;

WRITE_ONCE() ?

> +
> +	/*
> +	 * It's still possible that we could race with the clearing
> +	 *    CPU0                                    CPU1
> +	 *    ----                                    ----
> +	 *                                       ip = func
> +	 *  nr_records = -1;
> +	 *  recursed_functions[0] = 0;
> +	 *                                       i = -1
> +	 *                                       if (i < 0)
> +	 *  nr_records = 0;
> +	 *  (new recursion detected)
> +	 *      recursed_functions[0] = func
> +	 *                                            cmpxchg(recursed_functions[0],
> +	 *                                                    func, 0)
> +	 *
> +	 * But the worse that could happen is that we get a zero in
> +	 * the recursed_functions array, and it's likely that "func" will
> +	 * be recorded again.
> +	 */
> +	i = atomic_read(&nr_records);
> +	smp_mb__after_atomic();
> +	if (i < 0)
> +		cmpxchg(&recursed_functions[index].ip, ip, 0);
> +	else if (i <= index)
> +		atomic_cmpxchg(&nr_records, i, index + 1);

This looks weird. It would shift nr_records past the record added
in this call. It might skip many slots that were zeroed when clearing.
Also we do not know if our entry was not zeroed as well.

I would suggest to do it some other way (not even compile tested):

void ftrace_record_recursion(unsigned long ip, unsigned long parent_ip)
{
	int index, old_index;
	int i = 0;
	unsigned long old_ip;

 again:
	/* First check the last one recorded. */
	if (ip == READ_ONCE(cached_function))
		return;

	index = atomic_read(&nr_records);
	/* nr_records is -1 when clearing records. */
	smp_mb__after_atomic();
	if (index < 0)
		return;

	/* Already cached? */
	for (i = index - 1; i >= 0; i--) {
		if (recursed_functions[i].ip == ip) {
			WRITE_ONCE(cached_function, ip);
			return;
		}
	}

	if (index >= CONFIG_FTRACE_RECORD_RECURSION_SIZE)
		return;

	/*
	 * Try to reserve the slot. It might be already taken
	 * or the entire cache cleared.
	 */
	old_index = atomic_cmpxchg(&nr_records, index, index + 1);
	if (old_index != index)
		goto again;

	/*
	 * Be careful. The entire cache might have been cleared and reused in
	 * the meantime. Replace only empty slot.
	 */
	old_ip = cmpxchg(&recursed_functions[index].ip, 0, ip);
	if (old_ip != 0)
		goto again;

	old_ip = cmpxchg(&recursed_functions[index].parent_ip, 0, parrent_ip);
	if (old_ip != 0)
		goto again;

	/*
	 * No ip is better than non-consistent one. The race with
	 * clearing should be rare and not worth a perfect solution.
	 */
	if (READ_ONCE(recursed_functions[index].ip) != ip) {
		cmpxchg(&recursed_functions[index].ip, ip, 0UL)
		goto again;
	}
}

The last check probably is not needed. Inconsistent entries
should be prevented by the way how this func is called:

		static atomic_t paranoid_test;				\
		if (!atomic_read(&paranoid_test)) {			\
			atomic_inc(&paranoid_test);			\
			ftrace_record_recursion(ip, pip);		\
			atomic_dec(&paranoid_test);			\
		}							\




The rest of the patchset looks fine. I do not feel comfortable to give
it Reviewed-by because I did not review it in depth.

I spent more time with the above lockless code. I took it is a
training. I need to improve this skill to feel more comfortable with
the lockless printk ring buffer ;-)

Best Regards,
Petr
