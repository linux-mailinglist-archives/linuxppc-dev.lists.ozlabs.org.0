Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE5A2A47CB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 15:16:13 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CQWzX4rdGzDqfr
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Nov 2020 01:16:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=suse.com (client-ip=195.135.220.15; helo=mx2.suse.de;
 envelope-from=pmladek@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256
 header.s=susede1 header.b=IN3VErPd; dkim-atps=neutral
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by lists.ozlabs.org (Postfix) with ESMTP id 4CQWsQ4vPhzDqHL
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Nov 2020 01:10:48 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1604412645;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ba9qeE3P97TbQ2yvwB2ubaFiLUcB36w6IpkZF8tbKnk=;
 b=IN3VErPdp1WBPWe8s7Z/Hom6zeEPN00JGakf0pmbE0tHXmmxXEWD5++Vr61N/M6YEB54w7
 TkpVK9DRs5pQGU2sXeGrOyjWu6VljkU4rvLr/rLgtbNpT6gEfg2GSAQckNPRAvbykm4vni
 bo/mIe9ANXQW2mhX2JkXe/I7Xbftp1o=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C3BEFABF4;
 Tue,  3 Nov 2020 14:10:44 +0000 (UTC)
Date: Tue, 3 Nov 2020 15:10:43 +0100
From: Petr Mladek <pmladek@suse.com>
To: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH 11/11 v2.2] ftrace: Add recording of functions that
 caused recursion
Message-ID: <20201103141043.GO20201@alley>
References: <20201030213142.096102821@goodmis.org>
 <20201030214014.801706340@goodmis.org>
 <20201102164147.GJ20201@alley>
 <20201102123721.4fcce2cb@gandalf.local.home>
 <20201102124606.72bd89c5@gandalf.local.home>
 <20201102142254.7e148f8a@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201102142254.7e148f8a@gandalf.local.home>
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

On Mon 2020-11-02 14:23:14, Steven Rostedt wrote:
> From c532ff6b048dd4a12943b05c7b8ce30666c587c8 Mon Sep 17 00:00:00 2001
> From: "Steven Rostedt (VMware)" <rostedt@goodmis.org>
> Date: Thu, 29 Oct 2020 15:27:06 -0400
> Subject: [PATCH] ftrace: Add recording of functions that caused recursion
> 
> This adds CONFIG_FTRACE_RECORD_RECURSION that will record to a file
> "recursed_functions" all the functions that caused recursion while a
> callback to the function tracer was running.
> 
> diff --git a/include/linux/trace_recursion.h b/include/linux/trace_recursion.h
> index ac3d73484cb2..1cba5fe8777a 100644
> --- a/include/linux/trace_recursion.h
> +++ b/include/linux/trace_recursion.h
> @@ -142,7 +142,28 @@ static __always_inline int trace_get_context_bit(void)
>  			pc & HARDIRQ_MASK ? TRACE_CTX_IRQ : TRACE_CTX_SOFTIRQ;
>  }
>  
> -static __always_inline int trace_test_and_set_recursion(int start, int max)
> +#ifdef CONFIG_FTRACE_RECORD_RECURSION
> +extern void ftrace_record_recursion(unsigned long ip, unsigned long parent_ip);
> +/*
> +* The paranoid_test check can cause dropped reports (unlikely), but
> +* if the recursion is common, it will likely still be recorded later.
> +* But the paranoid_test is needed to make sure we don't crash.
> +*/
> +# define do_ftrace_record_recursion(ip, pip)				\
> +	do {								\
> +		static atomic_t paranoid_test;				\
> +		if (!atomic_read(&paranoid_test)) {			\
> +			atomic_inc(&paranoid_test);			\
> +			ftrace_record_recursion(ip, pip);		\
> +			atomic_dec(&paranoid_test);			\

BTW: What is actually the purpose of paranoid_test, please?

It prevents nested ftrace_record_recursion() calls on the same CPU
(recursion, nesting from IRQ, NMI context).

Parallel calls from different CPUs are still possible:

CPU0					CPU1
if (!atomic_read(&paranoid_test))	if (!atomic_read(&paranoid_test))
   // passes				  // passes
   atomic_inc(&paranoid_test);            atomic_inc(&paranoid_test);


I do not see how a nested call could cause crash while a parallel
one would be OK.


> --- /dev/null
> +++ b/kernel/trace/trace_recursion_record.c
> @@ -0,0 +1,236 @@
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
> +	int index = 0;
> +	int i;
> +	unsigned long old;
> +
> + again:
> +	/* First check the last one recorded */
> +	if (ip == cached_function)
> +		return;
> +
> +	i = atomic_read(&nr_records);
> +	/* nr_records is -1 when clearing records */
> +	smp_mb__after_atomic();
> +	if (i < 0)
> +		return;
> +
> +	/*
> +	 * If there's two writers and this writer comes in second,
> +	 * the cmpxchg() below to update the ip will fail. Then this
> +	 * writer will try again. It is possible that index will now
> +	 * be greater than nr_records. This is because the writer
> +	 * that succeeded has not updated the nr_records yet.
> +	 * This writer could keep trying again until the other writer
> +	 * updates nr_records. But if the other writer takes an
> +	 * interrupt, and that interrupt locks up that CPU, we do
> +	 * not want this CPU to lock up due to the recursion protection,
> +	 * and have a bug report showing this CPU as the cause of
> +	 * locking up the computer. To not lose this record, this
> +	 * writer will simply use the next position to update the
> +	 * recursed_functions, and it will update the nr_records
> +	 * accordingly.
> +	 */
> +	if (index < i)
> +		index = i;
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
> +		index++;
> +		goto again;
> +	}
> +
> +	recursed_functions[index].parent_ip = parent_ip;
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

Are you aware of the following race, please?

CPU0					CPU1

ftrace_record_recursion()

   i = atomic_read(&nr_records);
   // i = 20   (for example)
   if (i < index)
     index = i;
     // index = 20;

					recursed_function_open()
					atomic_set(&nr_records, -1);
					memset(recursed_functions, 0, );
					atomic_set(&nr_records, 0);

   // successfully store ip at index == 20
   cmpxchg(&recursed_functions[index].ip, 0, ip);
   recursed_functions[index].parent_ip = parent_ip;

   // check race with clearing
   i = atomic_read(&nr_records);
   // i == 0
   if (i < 0)
      // no
   else
	atomic_cmpxchg(&nr_records, i, index + 1);

RESULT:

   + nr_records == 21
   + and slots 0..19 are zeroed


I played with the code and ended with head entangled by chicken & egg
like problems.

I believe that a solution might be a combined atomic variable from
nr_records + cleanup_count.

ftrace_record_recursion() would be allowed to increase nr_records
only when cleanup_count is still the same. cleanup_count would
be incremented together with clearing nr_records.


Well, I am not sure if it is worth the effort. The race is rather
theoretical. In the worst case, the cache might contain many
zero values.

Anyway, it is yet another experience for me that lockless algorithms
are more tricky that one would expect.

Best Regards,
Petr
