Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8294E42B3A8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Oct 2021 05:34:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HTdRx1MF4z3bT7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Oct 2021 14:34:05 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HTdRR1qFvz2yM7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Oct 2021 14:33:36 +1100 (AEDT)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R121e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04400; MF=yun.wang@linux.alibaba.com;
 NM=1; PH=DS; RN=31; SR=0; TI=SMTPD_---0Ure8YWn_1634096007; 
Received: from testdeMacBook-Pro.local(mailfrom:yun.wang@linux.alibaba.com
 fp:SMTPD_---0Ure8YWn_1634096007) by smtp.aliyun-inc.com(127.0.0.1);
 Wed, 13 Oct 2021 11:33:29 +0800
Subject: Re: [PATCH v2 0/2] fix & prevent the missing preemption disabling
To: Steven Rostedt <rostedt@goodmis.org>
References: <8c7de46d-9869-aa5e-2bb9-5dbc2eda395e@linux.alibaba.com>
 <1a8e8d73-b508-f90b-0d82-eb2da45a720e@linux.alibaba.com>
 <20211012232658.7dac3f43@oasis.local.home>
From: =?UTF-8?B?546L6LSH?= <yun.wang@linux.alibaba.com>
Message-ID: <69e9cf98-883c-0016-4b07-12afbf138094@linux.alibaba.com>
Date: Wed, 13 Oct 2021 11:33:27 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211012232658.7dac3f43@oasis.local.home>
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



On 2021/10/13 上午11:26, Steven Rostedt wrote:
> Please start a new thread when sending new versions. v2 should not be a
> reply to v1. If you want to reference v1, just add it to the cover
> letter with a link tag:
> 
> Link: https://lore.kernel.org/all/8c7de46d-9869-aa5e-2bb9-5dbc2eda395e@linux.alibaba.com/

Ok, I'll resend it with link then.

Regards,
Michael Wang


> 
> -- Steve
> 
> 
> On Wed, 13 Oct 2021 11:16:56 +0800
> 王贇 <yun.wang@linux.alibaba.com> wrote:
> 
>> The testing show that perf_ftrace_function_call() are using smp_processor_id()
>> with preemption enabled, all the checking on CPU could be wrong after preemption.
>>
>> As Peter point out, the section between ftrace_test_recursion_trylock/unlock()
>> pair require the preemption to be disabled as 'Documentation/trace/ftrace-uses.rst'
>> explained, but currently the work is done outside of the helpers.
>>
>> Patch 1/2 will make sure preemption disabled after trylock() succeed,
>> patch 2/2 will do smp_processor_id() checking after trylock to address the
>> issue.
>>
>> Michael Wang (2):
>>   ftrace: disable preemption between ftrace_test_recursion_trylock/unlock()
>>   ftrace: do CPU checking after preemption disabled
>>
>>  arch/csky/kernel/probes/ftrace.c     |  2 --
>>  arch/parisc/kernel/ftrace.c          |  2 --
>>  arch/powerpc/kernel/kprobes-ftrace.c |  2 --
>>  arch/riscv/kernel/probes/ftrace.c    |  2 --
>>  arch/x86/kernel/kprobes/ftrace.c     |  2 --
>>  include/linux/trace_recursion.h      | 22 +++++++++++++++++++++-
>>  kernel/livepatch/patch.c             |  6 ------
>>  kernel/trace/trace_event_perf.c      |  6 +++---
>>  kernel/trace/trace_functions.c       |  5 -----
>>  9 files changed, 24 insertions(+), 25 deletions(-)
>>
