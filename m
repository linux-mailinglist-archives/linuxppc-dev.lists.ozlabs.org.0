Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D342A44D56B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Nov 2021 11:57:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HqdwC5v3Tz3cZd
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Nov 2021 21:57:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=valentin.schneider@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4Hqdvn16V0z2ypB
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Nov 2021 21:57:08 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 41DEDD6E;
 Thu, 11 Nov 2021 02:57:07 -0800 (PST)
Received: from e113632-lin (e113632-lin.cambridge.arm.com [10.1.196.57])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 292E93F70D;
 Thu, 11 Nov 2021 02:57:05 -0800 (PST)
From: Valentin Schneider <valentin.schneider@arm.com>
To: Marco Elver <elver@google.com>
Subject: Re: [PATCH v2 4/5] kscan: Use preemption model accessors
In-Reply-To: <YYzeOQNFmuieCk3T@elver.google.com>
References: <20211110202448.4054153-1-valentin.schneider@arm.com>
 <20211110202448.4054153-5-valentin.schneider@arm.com>
 <YYzeOQNFmuieCk3T@elver.google.com>
Date: Thu, 11 Nov 2021 10:57:02 +0000
Message-ID: <871r3nrmdd.mognet@arm.com>
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

On 11/11/21 10:11, Marco Elver wrote:
> Subject s/kscan/kcsan/
>

Woops...

> On Wed, Nov 10, 2021 at 08:24PM +0000, Valentin Schneider wrote:
>> Per PREEMPT_DYNAMIC, checking CONFIG_PREEMPT doesn't tell you the actual
>> preemption model of the live kernel. Use the newly-introduced accessors
>> instead.
>>
>> Signed-off-by: Valentin Schneider <valentin.schneider@arm.com>
>
> Reviewed-by: Marco Elver <elver@google.com>
>
> Though it currently doesn't compile as a module due to missing
> EXPORT_SYMBOL of is_preempt*().
>
>> ---
>>  kernel/kcsan/kcsan_test.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/kernel/kcsan/kcsan_test.c b/kernel/kcsan/kcsan_test.c
>> index dc55fd5a36fc..14d811eb9a21 100644
>> --- a/kernel/kcsan/kcsan_test.c
>> +++ b/kernel/kcsan/kcsan_test.c
>> @@ -1005,13 +1005,13 @@ static const void *nthreads_gen_params(const void *prev, char *desc)
>>      else
>>              nthreads *= 2;
>>
>> -	if (!IS_ENABLED(CONFIG_PREEMPT) || !IS_ENABLED(CONFIG_KCSAN_INTERRUPT_WATCHER)) {
>> +	if (!is_preempt_full() || !IS_ENABLED(CONFIG_KCSAN_INTERRUPT_WATCHER)) {
>>              /*
>>               * Without any preemption, keep 2 CPUs free for other tasks, one
>>               * of which is the main test case function checking for
>>               * completion or failure.
>>               */
>> -		const long min_unused_cpus = IS_ENABLED(CONFIG_PREEMPT_NONE) ? 2 : 0;
>> +		const long min_unused_cpus = is_preempt_none() ? 2 : 0;
>>              const long min_required_cpus = 2 + min_unused_cpus;
>>
>>              if (num_online_cpus() < min_required_cpus) {
>> --
>> 2.25.1
