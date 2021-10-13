Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D649942B281
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Oct 2021 04:05:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HTbTw38mdz30Qr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Oct 2021 13:05:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.43;
 helo=out30-43.freemail.mail.aliyun.com;
 envelope-from=yun.wang@linux.alibaba.com; receiver=<UNKNOWN>)
Received: from out30-43.freemail.mail.aliyun.com
 (out30-43.freemail.mail.aliyun.com [115.124.30.43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HTbTQ20JHz2yL7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Oct 2021 13:05:11 +1100 (AEDT)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R171e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04394; MF=yun.wang@linux.alibaba.com;
 NM=1; PH=DS; RN=31; SR=0; TI=SMTPD_---0UrdlKN._1634090692; 
Received: from testdeMacBook-Pro.local(mailfrom:yun.wang@linux.alibaba.com
 fp:SMTPD_---0UrdlKN._1634090692) by smtp.aliyun-inc.com(127.0.0.1);
 Wed, 13 Oct 2021 10:04:54 +0800
Subject: Re: [PATCH 1/2] ftrace: disable preemption on the testing of recursion
To: Steven Rostedt <rostedt@goodmis.org>
References: <8c7de46d-9869-aa5e-2bb9-5dbc2eda395e@linux.alibaba.com>
 <a8756482-024c-c858-b3d1-1ffa9a5eb3f7@linux.alibaba.com>
 <20211012084331.06b8dd23@gandalf.local.home>
From: =?UTF-8?B?546L6LSH?= <yun.wang@linux.alibaba.com>
Message-ID: <1eab20c1-d69b-f94b-92ff-4329d0aff6a2@linux.alibaba.com>
Date: Wed, 13 Oct 2021 10:04:52 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211012084331.06b8dd23@gandalf.local.home>
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
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, live-patching@vger.kernel.org,
 linux-riscv@lists.infradead.org, Miroslav Benes <mbenes@suse.cz>,
 Paul Mackerras <paulus@samba.org>, Joe Lawrence <joe.lawrence@redhat.com>,
 Helge Deller <deller@gmx.de>, x86@kernel.org, linux-csky@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, Petr Mladek <pmladek@suse.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Jiri Kosina <jikos@kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>,
 Josh Poimboeuf <jpoimboe@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Masami Hiramatsu <mhiramat@kernel.org>,
 Colin Ian King <colin.king@canonical.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 2021/10/12 下午8:43, Steven Rostedt wrote:
> On Tue, 12 Oct 2021 13:40:08 +0800
> 王贇 <yun.wang@linux.alibaba.com> wrote:
> 
>> --- a/include/linux/trace_recursion.h
>> +++ b/include/linux/trace_recursion.h
>> @@ -214,7 +214,14 @@ static __always_inline void trace_clear_recursion(int bit)
>>  static __always_inline int ftrace_test_recursion_trylock(unsigned long ip,
>>  							 unsigned long parent_ip)
>>  {
>> -	return trace_test_and_set_recursion(ip, parent_ip, TRACE_FTRACE_START, TRACE_FTRACE_MAX);
>> +	int bit;
>> +
>> +	preempt_disable_notrace();
> 
> The recursion test does not require preemption disabled, it uses the task
> struct, not per_cpu variables, so you should not disable it before the test.
> 
> 	bit = trace_test_and_set_recursion(ip, parent_ip, TRACE_FTRACE_START, TRACE_FTRACE_MAX);
> 	if (bit >= 0)
> 		preempt_disable_notrace();
> 
> And if the bit is zero, it means a recursion check was already done by
> another caller (ftrace handler does the check, followed by calling perf),
> and you really don't even need to disable preemption in that case.
> 
> 	if (bit > 0)
> 		preempt_disable_notrace();
> 
> And on the unlock, have:
> 
>  static __always_inline void ftrace_test_recursion_unlock(int bit)
>  {
> 	if (bit)
> 		preempt_enable_notrace();
>  	trace_clear_recursion(bit);
>  }
> 
> But maybe that's over optimizing ;-)

I see, while the user can still check smp_processor_id() after trylock
return bit 0...

I guess Peter's point at very beginning is to prevent such cases, since
kernel for production will not have preemption debug on, and such issue
won't get report but could cause trouble which really hard to trace down
, way to eliminate such issue once for all sounds attractive, isn't it?

Regards,
Michael Wang

> 
> -- Steve
> 
> 
>> +	bit = trace_test_and_set_recursion(ip, parent_ip, TRACE_FTRACE_START, TRACE_FTRACE_MAX);
>> +	if (bit < 0)
>> +		preempt_enable_notrace();
>> +
>> +	return bit;
>>  }
