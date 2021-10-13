Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D0A42B9F5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Oct 2021 10:11:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HTlcM3cKbz3c4b
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Oct 2021 19:11:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.130;
 helo=out30-130.freemail.mail.aliyun.com;
 envelope-from=yun.wang@linux.alibaba.com; receiver=<UNKNOWN>)
Received: from out30-130.freemail.mail.aliyun.com
 (out30-130.freemail.mail.aliyun.com [115.124.30.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HTlbx0L9hz2xXK
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Oct 2021 19:11:22 +1100 (AEDT)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R641e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04423; MF=yun.wang@linux.alibaba.com;
 NM=1; PH=DS; RN=31; SR=0; TI=SMTPD_---0UrfoBuS_1634112670; 
Received: from testdeMacBook-Pro.local(mailfrom:yun.wang@linux.alibaba.com
 fp:SMTPD_---0UrfoBuS_1634112670) by smtp.aliyun-inc.com(127.0.0.1);
 Wed, 13 Oct 2021 16:11:12 +0800
Subject: Re: [RESEND PATCH v2 1/2] ftrace: disable preemption between
 ftrace_test_recursion_trylock/unlock()
To: Miroslav Benes <mbenes@suse.cz>
References: <b1d7fe43-ce84-0ed7-32f7-ea1d12d0b716@linux.alibaba.com>
 <75ee86ac-02f2-d687-ab1e-9c8c33032495@linux.alibaba.com>
 <alpine.LSU.2.21.2110130948120.5647@pobox.suse.cz>
From: =?UTF-8?B?546L6LSH?= <yun.wang@linux.alibaba.com>
Message-ID: <d5fbd49a-55c5-a9f5-6600-707c8d749312@linux.alibaba.com>
Date: Wed, 13 Oct 2021 16:11:10 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <alpine.LSU.2.21.2110130948120.5647@pobox.suse.cz>
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
 Jiri Kosina <jikos@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Borislav Petkov <bp@alien8.de>, Nicholas Piggin <npiggin@gmail.com>,
 Josh Poimboeuf <jpoimboe@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Masami Hiramatsu <mhiramat@kernel.org>,
 Colin Ian King <colin.king@canonical.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 2021/10/13 下午3:55, Miroslav Benes wrote:
>> diff --git a/include/linux/trace_recursion.h b/include/linux/trace_recursion.h
>> index a9f9c57..101e1fb 100644
>> --- a/include/linux/trace_recursion.h
>> +++ b/include/linux/trace_recursion.h
>> @@ -208,13 +208,29 @@ static __always_inline void trace_clear_recursion(int bit)
>>   * Use this for ftrace callbacks. This will detect if the function
>>   * tracing recursed in the same context (normal vs interrupt),
>>   *
>> + * The ftrace_test_recursion_trylock() will disable preemption,
>> + * which is required for the variant of synchronize_rcu() that is
>> + * used to allow patching functions where RCU is not watching.
>> + * See klp_synchronize_transition() for more details.
>> + *
> 
> I think that you misunderstood. Steven proposed to put the comment before 
> ftrace_test_recursion_trylock() call site in klp_ftrace_handler().

Oh, I see... thanks for pointing out :-)

> 
>>   * Returns: -1 if a recursion happened.
[snip]
>>  }
> 
> Side note... the comment will eventually conflict with peterz's 
> https://lore.kernel.org/all/20210929152429.125997206@infradead.org/.

Steven, would you like to share your opinion on this patch?

If klp_synchronize_transition() will be removed anyway, the comments
will be meaningless and we can just drop it :-P

Regards,
Michael Wang


> 
> Miroslav
> 
