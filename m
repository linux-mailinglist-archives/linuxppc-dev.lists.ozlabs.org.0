Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 67DC6450853
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Nov 2021 16:30:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HtCnN2SKvz3bP7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Nov 2021 02:30:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=valentin.schneider@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4HtCmt5lrZz2x9Z
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Nov 2021 02:30:04 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6EF1C6D;
 Mon, 15 Nov 2021 07:30:02 -0800 (PST)
Received: from e113632-lin (e113632-lin.cambridge.arm.com [10.1.196.57])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 557F03F766;
 Mon, 15 Nov 2021 07:30:00 -0800 (PST)
From: Valentin Schneider <valentin.schneider@arm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, linuxppc-dev@lists.ozlabs.org,
 linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v2 3/5] powerpc: Use preemption model accessors
In-Reply-To: <87o86rmgu8.fsf@mpe.ellerman.id.au>
References: <20211110202448.4054153-1-valentin.schneider@arm.com>
 <20211110202448.4054153-4-valentin.schneider@arm.com>
 <87o86rmgu8.fsf@mpe.ellerman.id.au>
Date: Mon, 15 Nov 2021 15:29:53 +0000
Message-ID: <87lf1pqvwu.mognet@arm.com>
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
Cc: Marco Elver <elver@google.com>, Michal Marek <michal.lkml@markovi.net>,
 Peter Zijlstra <peterz@infradead.org>,
 Frederic Weisbecker <frederic@kernel.org>, Mike Galbraith <efault@gmx.de>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Steven Rostedt <rostedt@goodmis.org>, Paul Mackerras <paulus@samba.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Ingo Molnar <mingo@kernel.org>,
 Dmitry Vyukov <dvyukov@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Doh, thought I had sent this one out already...

On 11/11/21 15:55, Michael Ellerman wrote:
> Valentin Schneider <valentin.schneider@arm.com> writes:
>> Per PREEMPT_DYNAMIC, checking CONFIG_PREEMPT doesn't tell you the actual
>> preemption model of the live kernel. Use the newly-introduced accessors
>> instead.
>>
>> sched_init() -> preempt_dynamic_init() happens way before IRQs are set up,
>> so this should be fine.
>
> Despite the name interrupt_exit_kernel_prepare() is called before IRQs
> are setup, traps and page faults are "interrupts" here.
>
> So I'm not sure about adding that call there, because it will trigger a
> WARN if called early in boot, which will trigger a trap and depending on
> the context we may not survive.
>
> I'd be happier if we can make it a build-time check.
>

This can't be done at build-time for PREEMPT_DYNAMIC, but that can be
punted off to whoever will implement ppc support for that :-) AFAICT if
this can't use preempt_dynamic_mode (due to how "late" it is setup), the
preempt_schedule_irq() needs to go and ppc needs to use irqentry_exit() /
irqentry_exit_cond_resched().

I dropped that for v2.

> cheers
>
