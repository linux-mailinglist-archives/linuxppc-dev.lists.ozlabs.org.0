Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4C344D567
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Nov 2021 11:57:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hqdvj0361z3cVM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Nov 2021 21:57:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=valentin.schneider@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4Hqdtz69tYz2yfZ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Nov 2021 21:56:27 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2B718101E;
 Thu, 11 Nov 2021 02:56:25 -0800 (PST)
Received: from e113632-lin (e113632-lin.cambridge.arm.com [10.1.196.57])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1099C3F70D;
 Thu, 11 Nov 2021 02:56:22 -0800 (PST)
From: Valentin Schneider <valentin.schneider@arm.com>
To: Mike Galbraith <efault@gmx.de>, Marco Elver <elver@google.com>
Subject: Re: [PATCH v2 2/5] preempt/dynamic: Introduce preempt mode accessors
In-Reply-To: <26fd47db11763a9c79662a66eed2dbdbcbedaa8a.camel@gmx.de>
References: <20211110202448.4054153-1-valentin.schneider@arm.com>
 <20211110202448.4054153-3-valentin.schneider@arm.com>
 <a7c704c2ae77e430d7f0657c5db664f877263830.camel@gmx.de>
 <803a905890530ea1b86db6ac45bd1fd940cf0ac3.camel@gmx.de>
 <a7febd8825a2ab99bd1999664c6d4aa618b49442.camel@gmx.de>
 <CANpmjNPeRwupeg=S8yGGUracoehSUbS-Fkfb8juv5mYN36uiqg@mail.gmail.com>
 <26fd47db11763a9c79662a66eed2dbdbcbedaa8a.camel@gmx.de>
Date: Thu, 11 Nov 2021 10:56:20 +0000
Message-ID: <8735o3rmej.mognet@arm.com>
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
 Frederic Weisbecker <frederic@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, Paul Mackerras <paulus@samba.org>,
 Steven Rostedt <rostedt@goodmis.org>, Masahiro Yamada <masahiroy@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, Ingo Molnar <mingo@kernel.org>,
 Dmitry Vyukov <dvyukov@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/11/21 11:32, Mike Galbraith wrote:
> On Thu, 2021-11-11 at 10:36 +0100, Marco Elver wrote:
>> I guess the question is if is_preempt_full() should be true also if
>> is_preempt_rt() is true?
>
> That's what CONFIG_PREEMPTION is.  More could follow, but it was added
> to allow multiple models to say "preemptible".
>

That's what I was gonna say, but you can have CONFIG_PREEMPTION while being
is_preempt_none() due to PREEMPT_DYNAMIC...

>> Not sure all cases are happy with that, e.g. the kernel/trace/trace.c
>> case, which wants to print the precise preemption level.
>
> Yeah, that's the "annoying" bit, needing one oddball model accessor
> that isn't about a particular model.
>
>> To avoid confusion, I'd introduce another helper that says true if the
>> preemption level is "at least full", currently that'd be "full or rt".
>> Something like is_preempt_full_or_rt() (but might as well write
>> "is_preempt_full() || is_preempt_rt()"), or is_preemption() (to match
>> that Kconfig variable, although it's slightly confusing). The
>> implementation of that helper can just be a static inline function
>> returning "is_preempt_full() || is_preempt_rt()".
>>
>> Would that help?
>
> Yeah, as it sits two accessors are needed, one that says PREEMPT the
> other PREEMPTION, spelling optional.
>

Per the above, I think we need the full || rt thingie.

>       -Mike
