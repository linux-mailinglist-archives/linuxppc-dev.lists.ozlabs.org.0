Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB7C43AA85
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Oct 2021 04:53:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hdbx72Sw5z305K
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Oct 2021 13:53:31 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hdbwc4LwCz2xvf
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Oct 2021 13:53:01 +1100 (AEDT)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R691e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04426; MF=yun.wang@linux.alibaba.com;
 NM=1; PH=DS; RN=31; SR=0; TI=SMTPD_---0Utj7nbU_1635216761; 
Received: from testdeMacBook-Pro.local(mailfrom:yun.wang@linux.alibaba.com
 fp:SMTPD_---0Utj7nbU_1635216761) by smtp.aliyun-inc.com(127.0.0.1);
 Tue, 26 Oct 2021 10:52:42 +0800
Subject: Re: [PATCH v4 0/2] fix & prevent the missing preemption disabling
To: Steven Rostedt <rostedt@goodmis.org>
References: <32a36348-69ee-6464-390c-3a8d6e9d2b53@linux.alibaba.com>
 <71c21f78-9c44-fdb2-f8e2-d8544b3421bd@linux.alibaba.com>
 <20211025224233.61b8e088@rorschach.local.home>
From: =?UTF-8?B?546L6LSH?= <yun.wang@linux.alibaba.com>
Message-ID: <de35eedf-8558-233d-ca59-7c636bbb2da3@linux.alibaba.com>
Date: Tue, 26 Oct 2021 10:52:41 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211025224233.61b8e088@rorschach.local.home>
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



On 2021/10/26 上午10:42, Steven Rostedt wrote:
> On Tue, 26 Oct 2021 10:09:12 +0800
> 王贇 <yun.wang@linux.alibaba.com> wrote:
> 
>> Just a ping, to see if there are any more comments :-P
> 
> I guess you missed what went into mainline (and your name found a bug
> in my perl script for importing patches ;-)
> 
>   https://lore.kernel.org/all/20211019091344.65629198@gandalf.local.home/

Cool~ Missing some chinese font maybe, that's fine :-)

> 
> Which means patch 1 needs to change:
>> +	/*
>> +	 * Disable preemption to fulfill the promise.
>> +	 *
>> +	 * Don't worry about the bit 0 cases, they indicate
>> +	 * the disabling behaviour has already been done by
>> +	 * internal call previously.
>> +	 */
>> +	preempt_disable_notrace();
>> +
>>  	return bit + 1;
>>  }
>>
>> +/*
>> + * Preemption will be enabled (if it was previously enabled).
>> + */
>>  static __always_inline void trace_clear_recursion(int bit)
>>  {
>>  	if (!bit)
>>  		return;
>>
>> +	if (bit > 0)
>> +		preempt_enable_notrace();
>> +
> 
> Where this wont work anymore.
> 
> Need to preempt disable and enable always.

Yup, will rebase on the latest changes~

Regards,
Michael Wang

> 
> -- Steve
> 
> 
>>  	barrier();
>>  	bit--;
>>  	trace_recursion_clear(bit);
>> @@ -209,7 +227,7 @@ static __always_inline void trace_clear_recursion(int bit)
>>   * tracing recursed in the same context (normal vs interrupt),
>>   *
