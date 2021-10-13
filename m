Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D665442B273
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Oct 2021 03:53:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HTbD82rDFz2yM4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Oct 2021 12:53:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.54;
 helo=out30-54.freemail.mail.aliyun.com;
 envelope-from=yun.wang@linux.alibaba.com; receiver=<UNKNOWN>)
Received: from out30-54.freemail.mail.aliyun.com
 (out30-54.freemail.mail.aliyun.com [115.124.30.54])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HTbCj1xsDz2yK3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Oct 2021 12:53:20 +1100 (AEDT)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R191e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04357; MF=yun.wang@linux.alibaba.com;
 NM=1; PH=DS; RN=31; SR=0; TI=SMTPD_---0UrdeUV._1634089981; 
Received: from testdeMacBook-Pro.local(mailfrom:yun.wang@linux.alibaba.com
 fp:SMTPD_---0UrdeUV._1634089981) by smtp.aliyun-inc.com(127.0.0.1);
 Wed, 13 Oct 2021 09:53:02 +0800
Subject: Re: [PATCH 1/2] ftrace: disable preemption on the testing of recursion
To: Steven Rostedt <rostedt@goodmis.org>, Miroslav Benes <mbenes@suse.cz>
References: <8c7de46d-9869-aa5e-2bb9-5dbc2eda395e@linux.alibaba.com>
 <a8756482-024c-c858-b3d1-1ffa9a5eb3f7@linux.alibaba.com>
 <alpine.LSU.2.21.2110121421260.3394@pobox.suse.cz>
 <20211012082920.1f8d6557@gandalf.local.home>
From: =?UTF-8?B?546L6LSH?= <yun.wang@linux.alibaba.com>
Message-ID: <6ca59cdd-e378-b8c6-7ac6-472568f1af97@linux.alibaba.com>
Date: Wed, 13 Oct 2021 09:52:16 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211012082920.1f8d6557@gandalf.local.home>
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
 linux-riscv@lists.infradead.org, Paul Mackerras <paulus@samba.org>,
 Joe Lawrence <joe.lawrence@redhat.com>, Helge Deller <deller@gmx.de>,
 x86@kernel.org, linux-csky@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 Petr Mladek <pmladek@suse.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Jiri Kosina <jikos@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Borislav Petkov <bp@alien8.de>, Josh Poimboeuf <jpoimboe@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Colin Ian King <colin.king@canonical.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 2021/10/12 下午8:29, Steven Rostedt wrote:
> On Tue, 12 Oct 2021 14:24:43 +0200 (CEST)
> Miroslav Benes <mbenes@suse.cz> wrote:
> 
>>> +++ b/kernel/livepatch/patch.c
>>> @@ -52,11 +52,6 @@ static void notrace klp_ftrace_handler(unsigned long ip,
>>>  	bit = ftrace_test_recursion_trylock(ip, parent_ip);
>>>  	if (WARN_ON_ONCE(bit < 0))
>>>  		return;
>>> -	/*
>>> -	 * A variant of synchronize_rcu() is used to allow patching functions
>>> -	 * where RCU is not watching, see klp_synchronize_transition().
>>> -	 */
>>> -	preempt_disable_notrace();
>>>
>>>  	func = list_first_or_null_rcu(&ops->func_stack, struct klp_func,
>>>  				      stack_node);
>>> @@ -120,7 +115,6 @@ static void notrace klp_ftrace_handler(unsigned long ip,
>>>  	klp_arch_set_pc(fregs, (unsigned long)func->new_func);
>>>
>>>  unlock:
>>> -	preempt_enable_notrace();
>>>  	ftrace_test_recursion_unlock(bit);
>>>  }  
>>
>> I don't like this change much. We have preempt_disable there not because 
>> of ftrace_test_recursion, but because of RCU. ftrace_test_recursion was 
>> added later. Yes, it would work with the change, but it would also hide 
>> things which should not be hidden in my opinion.
> 
> Agreed, but I believe the change is fine, but requires a nice comment to
> explain what you said above.
> 
> Thus, before the "ftrace_test_recursion_trylock()" we need:
> 
> 	/*
> 	 * The ftrace_test_recursion_trylock() will disable preemption,
> 	 * which is required for the variant of synchronize_rcu() that is
> 	 * used to allow patching functions where RCU is not watching.
> 	 * See klp_synchronize_transition() for more details.
> 	 */

Will be in v2 too :-)

Regards,
Michael Wang

> 
> -- Steve
> 
