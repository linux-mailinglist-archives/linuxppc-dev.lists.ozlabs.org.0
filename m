Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA6542ED51
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Oct 2021 11:13:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HW0tL176xz3cBT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Oct 2021 20:13:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.42;
 helo=out30-42.freemail.mail.aliyun.com;
 envelope-from=yun.wang@linux.alibaba.com; receiver=<UNKNOWN>)
Received: from out30-42.freemail.mail.aliyun.com
 (out30-42.freemail.mail.aliyun.com [115.124.30.42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HW0ss5J9Rz305W
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Oct 2021 20:12:48 +1100 (AEDT)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R121e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04357; MF=yun.wang@linux.alibaba.com;
 NM=1; PH=DS; RN=31; SR=0; TI=SMTPD_---0Us6AJpi_1634289146; 
Received: from testdeMacBook-Pro.local(mailfrom:yun.wang@linux.alibaba.com
 fp:SMTPD_---0Us6AJpi_1634289146) by smtp.aliyun-inc.com(127.0.0.1);
 Fri, 15 Oct 2021 17:12:28 +0800
Subject: Re: [PATCH v3 1/2] ftrace: disable preemption between
 ftrace_test_recursion_trylock/unlock()
To: Petr Mladek <pmladek@suse.com>
References: <609b565a-ed6e-a1da-f025-166691b5d994@linux.alibaba.com>
 <7e4738b5-21d4-c4d0-3136-a096bbb5cd2c@linux.alibaba.com>
 <YWhJP41cNwDphYsv@alley>
 <5e907ed3-806b-b0e5-518d-d2f3b265377f@linux.alibaba.com>
 <YWktujP6DcMnRIXT@alley>
From: =?UTF-8?B?546L6LSH?= <yun.wang@linux.alibaba.com>
Message-ID: <3c87e825-e907-cba0-e95f-28878356fc71@linux.alibaba.com>
Date: Fri, 15 Oct 2021 17:12:26 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YWktujP6DcMnRIXT@alley>
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



On 2021/10/15 下午3:28, Petr Mladek wrote:
> On Fri 2021-10-15 11:13:08, 王贇 wrote:
>>
>>
>> On 2021/10/14 下午11:14, Petr Mladek wrote:
>> [snip]
>>>> -	return trace_test_and_set_recursion(ip, parent_ip, TRACE_FTRACE_START, TRACE_FTRACE_MAX);
>>>> +	int bit;
>>>> +
>>>> +	bit = trace_test_and_set_recursion(ip, parent_ip, TRACE_FTRACE_START, TRACE_FTRACE_MAX);
>>>> +	/*
>>>> +	 * The zero bit indicate we are nested
>>>> +	 * in another trylock(), which means the
>>>> +	 * preemption already disabled.
>>>> +	 */
>>>> +	if (bit > 0)
>>>> +		preempt_disable_notrace();
>>>
>>> Is this safe? The preemption is disabled only when
>>> trace_test_and_set_recursion() was called by ftrace_test_recursion_trylock().
>>>
>>> We must either always disable the preemtion when bit >= 0.
>>> Or we have to disable the preemtion already in
>>> trace_test_and_set_recursion().
>>
>> Internal calling of trace_test_and_set_recursion() will disable preemption
>> on succeed, it should be safe.
> 
> trace_test_and_set_recursion() does _not_ disable preemtion!
> It works only because all callers disable the preemption.

Yup.

> 
> It means that the comment is wrong. It is not guarantted that the
> preemption will be disabled. It works only by chance.
> 
> 
>> We can also consider move the logical into trace_test_and_set_recursion()
>> and trace_clear_recursion(), but I'm not very sure about that... ftrace
>> internally already make sure preemption disabled
> 
> How? Because it calls trace_test_and_set_recursion() via the trylock() API?

I mean currently all the direct caller of trace_test_and_set_recursion()
have disabled the preemption as you mentioned above, but yes if anyone later
write some kernel code to call trace_test_and_set_recursion() without
disabling preemption after, then promise broken.

> 
> 
>> , what uncovered is those users who call API trylock/unlock, isn't
>> it?
> 
> And this is exactly the problem. trace_test_and_set_recursion() is in
> a public header. Anyone could use it. And if anyone uses it in the
> future without the trylock() and does not disable the preemtion
> explicitely then we are lost again.
> 
> And it is even more dangerous. The original code disabled the
> preemtion on various layers. As a result, the preemtion was disabled
> several times for sure. It means that the deeper layers were
> always on the safe side.
> 
> With this patch, if the first trace_test_and_set_recursion() caller
> does not disable preemtion then trylock() will not disable it either
> and the entire code is procceed with preemtion enabled.

Yes, what confusing me at first is that I think people who call
trace_test_and_set_recursion() without trylock() can only be a
ftrace hacker, not a user, but in case if anyone can use it without
respect to preemption stuff, then I think the logical should be inside
trace_test_and_set_recursion() rather than trylock().

> 
> 
>>> Finally, the comment confused me a lot. The difference between nesting and
>>> recursion is far from clear. And the code is tricky liky like hell :-)
>>> I propose to add some comments, see below for a proposal.
>> The comments do confusing, I'll make it something like:
>>
>> The zero bit indicate trace recursion happened, whatever
>> the recursively call was made by ftrace handler or ftrace
>> itself, the preemption already disabled.
> 
> I am sorry but it is still confusing. We need to find a better way
> how to clearly explain the difference between the safe and
> unsafe recursion.
> 
> My understanding is that the recursion is:
> 
>   + "unsafe" when the trace code recursively enters the same trace point.
> 
>   + "safe" when ftrace_test_recursion_trylock() is called recursivelly
>     while still processing the same trace entry.

Maybe take some example would be easier to understand...

Currently there are two way of using ftrace_test_recursion_trylock(),
one with TRACE_FTRACE_XXX we mark as A, one with TRACE_LIST_XXX we mark
as B, then:

A followed by B on same context got bit > 0
B followed by A on any context got bit 0
A followed by A on same context got bit > 0
A followed by A followed by A on same context got bit -1
B followed by B on same context got bit > 0
B followed by B followed by B on same context got bit -1

If we get rid of the TRACE_TRANSITION_BIT which allowed recursion for
onetime, then it would be:

A followed by B on same context got bit > 0
B followed by A on any context got bit 0
A followed by A on same context got bit -1
B followed by B on same context got bit -1

So as long as no continuously AAA it's safe?

> 
>>>> +
>>>> +	return bit;
>>>>  }
>>>>  /**
>>>> @@ -222,9 +233,13 @@ static __always_inline int ftrace_test_recursion_trylock(unsigned long ip,
>>>>   * @bit: The return of a successful ftrace_test_recursion_trylock()
>>>>   *
>>>>   * This is used at the end of a ftrace callback.
>>>> + *
>>>> + * Preemption will be enabled (if it was previously enabled).
>>>>   */
>>>>  static __always_inline void ftrace_test_recursion_unlock(int bit)
>>>>  {
>>>> +	if (bit)
>>>
>>> This is not symetric with trylock(). It should be:
>>>
>>> 	if (bit > 0)
>>>
>>> Anyway, trace_clear_recursion() quiently ignores bit != 0
>>
>> Yes, bit == 0 should not happen in here.
> 
> Yes, it "should" not happen. My point is that we could make the API
> more safe. We could do the right thing when
> ftrace_test_recursion_unlock() is called with negative @bit.
> Ideally, we should also warn about the mis-use.

Agree with a WARN here on bit 0.

> 
> 
> Anyway, let's wait for Steven. It seems that he found another problem
> with the API that should be solved first. The fix will probably
> also help to better understand the "safe" vs "unsafe" recursion.

Cool~

Regards,
Michael Wang

> 
> Best Regards,
> Petr
> 
