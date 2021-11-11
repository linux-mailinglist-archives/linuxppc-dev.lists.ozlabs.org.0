Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F1E44D565
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Nov 2021 11:56:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HqdvF5hZwz2ywJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Nov 2021 21:56:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=valentin.schneider@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4Hqdtr07lpz2yMq
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Nov 2021 21:56:17 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 54C17D6E;
 Thu, 11 Nov 2021 02:56:14 -0800 (PST)
Received: from e113632-lin (e113632-lin.cambridge.arm.com [10.1.196.57])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3BE0E3F70D;
 Thu, 11 Nov 2021 02:56:12 -0800 (PST)
From: Valentin Schneider <valentin.schneider@arm.com>
To: Marco Elver <elver@google.com>
Subject: Re: [PATCH v2 2/5] preempt/dynamic: Introduce preempt mode accessors
In-Reply-To: <YYzaLTtf1tFbqDSn@elver.google.com>
References: <20211110202448.4054153-1-valentin.schneider@arm.com>
 <20211110202448.4054153-3-valentin.schneider@arm.com>
 <YYzaLTtf1tFbqDSn@elver.google.com>
Date: Thu, 11 Nov 2021 10:56:06 +0000
Message-ID: <874k8jrmex.mognet@arm.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 Frederic Weisbecker <frederic@kernel.org>, Mike Galbraith <efault@gmx.de>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, Paul Mackerras <paulus@samba.org>,
 Steven Rostedt <rostedt@goodmis.org>, Masahiro Yamada <masahiroy@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, Ingo Molnar <mingo@kernel.org>,
 Dmitry Vyukov <dvyukov@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/11/21 09:54, Marco Elver wrote:
> On Wed, Nov 10, 2021 at 08:24PM +0000, Valentin Schneider wrote:
> [...]
>> +#ifdef CONFIG_PREEMPT_DYNAMIC
>> +
>> +extern bool is_preempt_none(void);
>> +extern bool is_preempt_voluntary(void);
>> +extern bool is_preempt_full(void);
>> +
>> +#else
>> +
>> +#define is_preempt_none() IS_ENABLED(CONFIG_PREEMPT_NONE)
>> +#define is_preempt_voluntary() IS_ENABLED(CONFIG_PREEMPT_VOLUNTARY)
>> +#define is_preempt_full() IS_ENABLED(CONFIG_PREEMPT)
>> +
>> +#endif
>> +
>> +#define is_preempt_rt() IS_ENABLED(CONFIG_PREEMPT_RT)
>> +
>
> Can these callables be real functions in all configs, making the
> !DYNAMIC ones just static inline bool ones? That'd catch invalid use in
> #if etc. in all configs.
>

Ack

>>  /*
>>   * Does a critical section need to be broken due to another
>>   * task waiting?: (technically does not depend on CONFIG_PREEMPTION,
>> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
>> index 97047aa7b6c2..9db7f77e53c3 100644
>> --- a/kernel/sched/core.c
>> +++ b/kernel/sched/core.c
>> @@ -6638,6 +6638,17 @@ static void __init preempt_dynamic_init(void)
>>      }
>>  }
>>
>> +#define PREEMPT_MODE_ACCESSOR(mode) \
>> +	bool is_preempt_##mode(void)						 \
>> +	{									 \
>> +		WARN_ON_ONCE(preempt_dynamic_mode == preempt_dynamic_undefined); \
>> +		return preempt_dynamic_mode == preempt_dynamic_##mode;		 \
>> +	}
>
> This needs an EXPORT_SYMBOL, so it's usable from modules like the
> kcsan_test module.

Ah, wasn't sure about that one, thanks!
