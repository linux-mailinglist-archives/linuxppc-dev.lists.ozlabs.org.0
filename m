Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1579242E722
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Oct 2021 05:13:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HVrvg5Z7jz3c7x
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Oct 2021 14:13:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.44;
 helo=out30-44.freemail.mail.aliyun.com;
 envelope-from=yun.wang@linux.alibaba.com; receiver=<UNKNOWN>)
Received: from out30-44.freemail.mail.aliyun.com
 (out30-44.freemail.mail.aliyun.com [115.124.30.44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HVrvF3Hnyz2yKQ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Oct 2021 14:13:27 +1100 (AEDT)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R171e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04407; MF=yun.wang@linux.alibaba.com;
 NM=1; PH=DS; RN=31; SR=0; TI=SMTPD_---0Us2T5JW_1634267588; 
Received: from testdeMacBook-Pro.local(mailfrom:yun.wang@linux.alibaba.com
 fp:SMTPD_---0Us2T5JW_1634267588) by smtp.aliyun-inc.com(127.0.0.1);
 Fri, 15 Oct 2021 11:13:09 +0800
Subject: Re: [PATCH v3 1/2] ftrace: disable preemption between
 ftrace_test_recursion_trylock/unlock()
To: Petr Mladek <pmladek@suse.com>
References: <609b565a-ed6e-a1da-f025-166691b5d994@linux.alibaba.com>
 <7e4738b5-21d4-c4d0-3136-a096bbb5cd2c@linux.alibaba.com>
 <YWhJP41cNwDphYsv@alley>
From: =?UTF-8?B?546L6LSH?= <yun.wang@linux.alibaba.com>
Message-ID: <5e907ed3-806b-b0e5-518d-d2f3b265377f@linux.alibaba.com>
Date: Fri, 15 Oct 2021 11:13:08 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YWhJP41cNwDphYsv@alley>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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



On 2021/10/14 下午11:14, Petr Mladek wrote:
[snip]
>> -	return trace_test_and_set_recursion(ip, parent_ip, TRACE_FTRACE_START, TRACE_FTRACE_MAX);
>> +	int bit;
>> +
>> +	bit = trace_test_and_set_recursion(ip, parent_ip, TRACE_FTRACE_START, TRACE_FTRACE_MAX);
>> +	/*
>> +	 * The zero bit indicate we are nested
>> +	 * in another trylock(), which means the
>> +	 * preemption already disabled.
>> +	 */
>> +	if (bit > 0)
>> +		preempt_disable_notrace();
> 
> Is this safe? The preemption is disabled only when
> trace_test_and_set_recursion() was called by ftrace_test_recursion_trylock().
> 
> We must either always disable the preemtion when bit >= 0.
> Or we have to disable the preemtion already in
> trace_test_and_set_recursion().

Internal calling of trace_test_and_set_recursion() will disable preemption
on succeed, it should be safe.

We can also consider move the logical into trace_test_and_set_recursion()
and trace_clear_recursion(), but I'm not very sure about that... ftrace
internally already make sure preemption disabled, what uncovered is those
users who call API trylock/unlock, isn't it?

> 
> 
> Finally, the comment confused me a lot. The difference between nesting and
> recursion is far from clear. And the code is tricky liky like hell :-)
> I propose to add some comments, see below for a proposal.
The comments do confusing, I'll make it something like:

The zero bit indicate trace recursion happened, whatever
the recursively call was made by ftrace handler or ftrace
itself, the preemption already disabled.

Will this one looks better to you?

> 
>> +
>> +	return bit;
>>  }
>>  /**
>> @@ -222,9 +233,13 @@ static __always_inline int ftrace_test_recursion_trylock(unsigned long ip,
>>   * @bit: The return of a successful ftrace_test_recursion_trylock()
>>   *
>>   * This is used at the end of a ftrace callback.
>> + *
>> + * Preemption will be enabled (if it was previously enabled).
>>   */
>>  static __always_inline void ftrace_test_recursion_unlock(int bit)
>>  {
>> +	if (bit)
> 
> This is not symetric with trylock(). It should be:
> 
> 	if (bit > 0)
> 
> Anyway, trace_clear_recursion() quiently ignores bit != 0

Yes, bit == 0 should not happen in here.

> 
> 
>> +		preempt_enable_notrace();
>>  	trace_clear_recursion(bit);
>>  }
> 
> 
> Below is my proposed patch that tries to better explain the recursion
> check:
> 
> From 20d69f11e2683262fa0043b803999061cbac543f Mon Sep 17 00:00:00 2001
> From: Petr Mladek <pmladek@suse.com>
> Date: Thu, 14 Oct 2021 16:57:39 +0200
> Subject: [PATCH] trace: Better describe the recursion check return values
> 
> The trace recursion check might be called recursively by different
> layers of the tracing code. It is safe recursion and the check
> is even optimized for this case.
> 
> The problematic recursion is when the traced function is called
> by the tracing code. This is properly detected.
> 
> Try to explain this difference a better way.
> 
> Signed-off-by: Petr Mladek <pmladek@suse.com>
> ---
>  include/linux/trace_recursion.h | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/trace_recursion.h b/include/linux/trace_recursion.h
> index a9f9c5714e65..b5efb804efdf 100644
> --- a/include/linux/trace_recursion.h
> +++ b/include/linux/trace_recursion.h
> @@ -159,13 +159,27 @@ extern void ftrace_record_recursion(unsigned long ip, unsigned long parent_ip);
>  # define do_ftrace_record_recursion(ip, pip)	do { } while (0)
>  #endif
>  
> +/*
> + * trace_test_and_set_recursion() is called on several layers
> + * of the ftrace code when handling the same ftrace entry.
> + * These calls might be nested/recursive.
> + *
> + * It uses TRACE_LIST_*BITs to distinguish between this
> + * internal recursion and recursion caused by calling
> + * the traced function by the ftrace code.
> + *
> + * Returns: > 0 when no recursion
> + *          0 when called recursively internally (safe)

The 0 can also happened when ftrace handler recursively called trylock()
under the same context, or not?

Regards,
Michael Wang

> + *	    -1 when the traced function was called recursively from
> + *             the ftrace handler (unsafe)
> + */
>  static __always_inline int trace_test_and_set_recursion(unsigned long ip, unsigned long pip,
>  							int start, int max)
>  {
>  	unsigned int val = READ_ONCE(current->trace_recursion);
>  	int bit;
>  
> -	/* A previous recursion check was made */
> +	/* Called recursively internally by different ftrace code layers? */
>  	if ((val & TRACE_CONTEXT_MASK) > max)
>  		return 0;

>  
> 
