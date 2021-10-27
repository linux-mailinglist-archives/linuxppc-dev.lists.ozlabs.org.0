Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB5C43C08F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Oct 2021 05:10:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HfDG32XX7z3bhx
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Oct 2021 14:10:19 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HfDFc5hNKz2xXf
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Oct 2021 14:09:51 +1100 (AEDT)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R991e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04400; MF=yun.wang@linux.alibaba.com;
 NM=1; PH=DS; RN=30; SR=0; TI=SMTPD_---0UtqSqrG_1635304169; 
Received: from testdeMacBook-Pro.local(mailfrom:yun.wang@linux.alibaba.com
 fp:SMTPD_---0UtqSqrG_1635304169) by smtp.aliyun-inc.com(127.0.0.1);
 Wed, 27 Oct 2021 11:09:31 +0800
Subject: Re: [PATCH v6 1/2] ftrace: disable preemption when recursion locked
To: Steven Rostedt <rostedt@goodmis.org>
References: <df8e9b3e-504c-635d-4e92-99cdf9f05479@linux.alibaba.com>
 <78c95844-16b7-8904-b48d-3b2ccd76a352@linux.alibaba.com>
 <20211026225552.72a7ee79@rorschach.local.home>
From: =?UTF-8?B?546L6LSH?= <yun.wang@linux.alibaba.com>
Message-ID: <e8bb4220-4895-e55d-4aea-cdd265fdfd38@linux.alibaba.com>
Date: Wed, 27 Oct 2021 11:09:29 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211026225552.72a7ee79@rorschach.local.home>
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
 Joe Lawrence <joe.lawrence@redhat.com>, Helge Deller <deller@gmx.de>,
 x86@kernel.org, linux-csky@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 Petr Mladek <pmladek@suse.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Jiri Kosina <jikos@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Borislav Petkov <bp@alien8.de>, Josh Poimboeuf <jpoimboe@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 2021/10/27 上午10:55, Steven Rostedt wrote:
> On Wed, 27 Oct 2021 10:34:13 +0800
> 王贇 <yun.wang@linux.alibaba.com> wrote:
> 
>> +/*
>> + * Preemption will be enabled (if it was previously enabled).
>> + */
>>  static __always_inline void trace_clear_recursion(int bit)
>>  {
>> +	WARN_ON_ONCE(bit < 0);
> 
> Can you send a v7 without the WARN_ON.
> 
> This is an extremely hot path, and this will cause noticeable overhead.
> 
> If something were to call this with bit < 0, then it would crash and
> burn rather quickly.

I see, if the problem will be notified anyway then it's fine, v7 on the way.

Regards,
Michael Wang

> 
> -- Steve
> 
> 
>> +
>> +	preempt_enable_notrace();
>>  	barrier();
>>  	trace_recursion_clear(bit);
>>  }
