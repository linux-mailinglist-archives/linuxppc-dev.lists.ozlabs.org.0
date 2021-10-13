Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A52A42B25E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Oct 2021 03:47:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HTb4Z5FFCz3086
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Oct 2021 12:47:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.133;
 helo=out30-133.freemail.mail.aliyun.com;
 envelope-from=yun.wang@linux.alibaba.com; receiver=<UNKNOWN>)
Received: from out30-133.freemail.mail.aliyun.com
 (out30-133.freemail.mail.aliyun.com [115.124.30.133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HTb433Wz3z2yHC
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Oct 2021 12:46:41 +1100 (AEDT)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R861e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04357; MF=yun.wang@linux.alibaba.com;
 NM=1; PH=DS; RN=31; SR=0; TI=SMTPD_---0UrdGZLQ_1634089590; 
Received: from testdeMacBook-Pro.local(mailfrom:yun.wang@linux.alibaba.com
 fp:SMTPD_---0UrdGZLQ_1634089590) by smtp.aliyun-inc.com(127.0.0.1);
 Wed, 13 Oct 2021 09:46:32 +0800
Subject: Re: [PATCH 2/2] ftrace: prevent preemption in
 perf_ftrace_function_call()
To: Peter Zijlstra <peterz@infradead.org>
References: <8c7de46d-9869-aa5e-2bb9-5dbc2eda395e@linux.alibaba.com>
 <7ec34e08-a357-58d6-2ce4-c7472d8b0381@linux.alibaba.com>
 <YWVvfBybqjKuifum@hirez.programming.kicks-ass.net>
From: =?UTF-8?B?546L6LSH?= <yun.wang@linux.alibaba.com>
Message-ID: <1193d016-ec4d-2b29-4d33-5a04ca85c14d@linux.alibaba.com>
Date: Wed, 13 Oct 2021 09:45:45 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YWVvfBybqjKuifum@hirez.programming.kicks-ass.net>
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
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, live-patching@vger.kernel.org,
 linux-riscv@lists.infradead.org, Miroslav Benes <mbenes@suse.cz>,
 Paul Mackerras <paulus@samba.org>, Joe Lawrence <joe.lawrence@redhat.com>,
 Helge Deller <deller@gmx.de>, x86@kernel.org, linux-csky@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, Petr Mladek <pmladek@suse.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Jiri Kosina <jikos@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Borislav Petkov <bp@alien8.de>,
 Nicholas Piggin <npiggin@gmail.com>, Josh Poimboeuf <jpoimboe@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Colin Ian King <colin.king@canonical.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 2021/10/12 下午7:20, Peter Zijlstra wrote:
> On Tue, Oct 12, 2021 at 01:40:31PM +0800, 王贇 wrote:
> 
>> diff --git a/kernel/trace/trace_event_perf.c b/kernel/trace/trace_event_perf.c
>> index 6aed10e..33c2f76 100644
>> --- a/kernel/trace/trace_event_perf.c
>> +++ b/kernel/trace/trace_event_perf.c
>> @@ -441,12 +441,19 @@ void perf_trace_buf_update(void *record, u16 type)
>>  	if (!rcu_is_watching())
>>  		return;
>>
>> +	/*
>> +	 * Prevent CPU changing from now on. rcu must
>> +	 * be in watching if the task was migrated and
>> +	 * scheduled.
>> +	 */
>> +	preempt_disable_notrace();
>> +
>>  	if ((unsigned long)ops->private != smp_processor_id())
>> -		return;
>> +		goto out;
>>
>>  	bit = ftrace_test_recursion_trylock(ip, parent_ip);
>>  	if (bit < 0)
>> -		return;
>> +		goto out;
>>
>>  	event = container_of(ops, struct perf_event, ftrace_ops);
>>
> 
> This seems rather daft, wouldn't it be easier to just put that check
> under the recursion thing?

In case if the condition matched, extra lock/unlock will be introduced,
but I guess that's acceptable since this seems unlikely to happen :-P

Will move the check in v2.

Regards,
Michael Wang

> 
