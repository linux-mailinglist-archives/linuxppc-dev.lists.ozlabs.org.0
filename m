Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF1D459339
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Nov 2021 17:37:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HyXxr2PNfz3c8Z
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 03:37:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=valentin.schneider@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4HyXxQ3q5xz2ymw
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Nov 2021 03:37:28 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 57A04ED1;
 Mon, 22 Nov 2021 08:37:25 -0800 (PST)
Received: from e113632-lin (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5A2243F66F;
 Mon, 22 Nov 2021 08:37:23 -0800 (PST)
From: Valentin Schneider <valentin.schneider@arm.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
 linuxppc-dev@lists.ozlabs.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v2 2/5] preempt/dynamic: Introduce preempt mode accessors
In-Reply-To: <2f22c57d-9bf0-3cc1-f0f1-61ecdf5dfa52@csgroup.eu>
References: <20211110202448.4054153-1-valentin.schneider@arm.com>
 <20211110202448.4054153-3-valentin.schneider@arm.com>
 <2f22c57d-9bf0-3cc1-f0f1-61ecdf5dfa52@csgroup.eu>
Date: Mon, 22 Nov 2021 16:37:16 +0000
Message-ID: <87y25gcfk3.mognet@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Marco Elver <elver@google.com>, Michal Marek <michal.lkml@markovi.net>,
 Peter Zijlstra <peterz@infradead.org>,
 Frederic Weisbecker <frederic@kernel.org>, Mike Galbraith <efault@gmx.de>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@kernel.org>,
 Paul Mackerras <paulus@samba.org>, Masahiro Yamada <masahiroy@kernel.org>,
 Dmitry Vyukov <dvyukov@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 16/11/21 14:29, Christophe Leroy wrote:
> Le 10/11/2021 =C3=A0 21:24, Valentin Schneider a =C3=A9crit=C2=A0:
>> CONFIG_PREEMPT{_NONE, _VOLUNTARY} designate either:
>> o The build-time preemption model when !PREEMPT_DYNAMIC
>> o The default boot-time preemption model when PREEMPT_DYNAMIC
>>
>> IOW, using those on PREEMPT_DYNAMIC kernels is meaningless - the actual
>> model could have been set to something else by the "preempt=3Dfoo" cmdli=
ne
>> parameter.
>>
>> Introduce a set of helpers to determine the actual preemption mode used =
by
>> the live kernel.
>>
>> Suggested-by: Marco Elver <elver@google.com>
>> Signed-off-by: Valentin Schneider <valentin.schneider@arm.com>
>> ---
>>   include/linux/sched.h | 16 ++++++++++++++++
>>   kernel/sched/core.c   | 11 +++++++++++
>>   2 files changed, 27 insertions(+)
>>
>> diff --git a/include/linux/sched.h b/include/linux/sched.h
>> index 5f8db54226af..0640d5622496 100644
>> --- a/include/linux/sched.h
>> +++ b/include/linux/sched.h
>> @@ -2073,6 +2073,22 @@ static inline void cond_resched_rcu(void)
>>   #endif
>>   }
>>
>> +#ifdef CONFIG_PREEMPT_DYNAMIC
>> +
>> +extern bool is_preempt_none(void);
>> +extern bool is_preempt_voluntary(void);
>> +extern bool is_preempt_full(void);
>
> Those are trivial tests supposed to be used in fast pathes. They should
> be static inlines in order to minimise the overhead.
>
>> +
>> +#else
>> +
>> +#define is_preempt_none() IS_ENABLED(CONFIG_PREEMPT_NONE)
>> +#define is_preempt_voluntary() IS_ENABLED(CONFIG_PREEMPT_VOLUNTARY)
>> +#define is_preempt_full() IS_ENABLED(CONFIG_PREEMPT)
>
> Would be better to use static inlines here as well instead of macros.
>

I realize I stripped all ppc folks from the cclist after dropping the ppc
snippet, but you guys might still be interested - my bad. That's done in
v3:

https://lore.kernel.org/lkml/20211112185203.280040-1-valentin.schneider@arm=
.com/

>> +
>> +#endif
>> +
>> +#define is_preempt_rt() IS_ENABLED(CONFIG_PREEMPT_RT)
>> +
>>   /*
>>    * Does a critical section need to be broken due to another
>>    * task waiting?: (technically does not depend on CONFIG_PREEMPTION,
>> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
>> index 97047aa7b6c2..9db7f77e53c3 100644
>> --- a/kernel/sched/core.c
>> +++ b/kernel/sched/core.c
>> @@ -6638,6 +6638,17 @@ static void __init preempt_dynamic_init(void)
>>      }
>>   }
>>
>> +#define PREEMPT_MODE_ACCESSOR(mode) \
>> +	bool is_preempt_##mode(void)						 \
>> +	{									 \
>> +		WARN_ON_ONCE(preempt_dynamic_mode =3D=3D preempt_dynamic_undefined); \
>
> Not sure using WARN_ON is a good idea here, as it may be called very
> early, see comment on powerpc patch.

Bah, I was gonna say that you *don't* want users of is_preempt_*() to be
called before the "final" preemption model is set up (such users would need
to make use of static_calls), but I realize there's a debug interface to
flip the preemption model at will... Say an initcall sees
is_preempt_voluntary() and sets things up accordingly, and then the debug
knob switches to preempt_full. I don't think there's much we can really do
here though :/

>
>> +		return preempt_dynamic_mode =3D=3D preempt_dynamic_##mode;		 \
>> +	}
>
> I'm not sure that's worth a macro. You only have 3 accessors, 2 lines of
> code each. Just define all 3 in plain text.
>
> CONFIG_PREEMPT_DYNAMIC is based on using strategies like static_calls in
> order to minimise the overhead. For those accessors you should use the
> same kind of approach and use things like jump_labels in order to not
> redo the test at each time and minimise overhead as much as possible.
>

That's a valid point, though the few paths that need patching up and don't
make use of static calls already (AFAICT the ppc irq path I was touching in
v2 needs to make use of irqentry_exit_cond_resched()) really seem like
slow-paths.

>> +
>> +PREEMPT_MODE_ACCESSOR(none)
>> +PREEMPT_MODE_ACCESSOR(voluntary)
>> +PREEMPT_MODE_ACCESSOR(full)
>> +
>>   #else /* !CONFIG_PREEMPT_DYNAMIC */
>>
>>   static inline void preempt_dynamic_init(void) { }
>>
