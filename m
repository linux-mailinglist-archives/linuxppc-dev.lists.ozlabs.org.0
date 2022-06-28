Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58BB455DD4D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 15:27:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXQPN1898z3cj0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 23:27:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=NSkLxKlt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b34; helo=mail-yb1-xb34.google.com; envelope-from=elver@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=NSkLxKlt;
	dkim-atps=neutral
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LXQNn6QXvz2xKX
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jun 2022 23:26:48 +1000 (AEST)
Received: by mail-yb1-xb34.google.com with SMTP id d5so22213715yba.5
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jun 2022 06:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=x1PdxBEhFalOAWbRKx82ZqW3VRMTFx8BscKp2q1d2zQ=;
        b=NSkLxKlthFbbgopUImR7ZEIlHMMGztOCr3eD8q6PfMTXQl90ybYLzrlC0esbBqD5A3
         1eYGscmtoONhp+O98Nmy0wRr5R452GQUTTxKa15lfN40VYs9hZSHzOY7Iw6NgdP/ATGC
         p5az4xcNgLdFIr/j7gTVQbnvxMeRoNuNLhXPDVCKwd2c9FpLL57NLN6U+SKVk8P5ZqmG
         z06IOUN+yKa/LsvLBZqxSsPsNh1+oLZiSmevfaZTY0zwZT3tVAPpA+XG4pxsyRuqFPe6
         RTtrf5yU6Jl1aPl5OV9wec7CYw4cmdy5iba0ki/sYJckiSZf80tgQm97CyTxyDK7H9mh
         FVfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=x1PdxBEhFalOAWbRKx82ZqW3VRMTFx8BscKp2q1d2zQ=;
        b=NRnW+qUTs6G15pqSLITu1nA39D4OFutAuu7xQnR+5xNaIDtQw9NmdPd2VOmOgdQnZk
         1tuJIW6FktIzUV8oxvV/V2ssXBU8BZ4kJrG3QpL+OfjFLu8LrCwcnBN/PMi9AQyE5tFS
         yvN7KuW7cmeIPaGF345NZgUwTCtXy75CsV5U9vcpi+CW1BQHB3+4sQckNMJm2apf1RVA
         JYtKsxAL4T+Ny9JcFWvluJER7bvjh9bDLb7fDBS2dB0A0eKTw6cNCUyG4x5zYRyQN2PJ
         b3NKmX7/df7muYef/DNuhwv2YbZpdxAVVcmXffDbnAgqK1xOQI5iMcsamVIsh77D4pBZ
         FaBA==
X-Gm-Message-State: AJIora/j1Sikkcdn6aidNPxq0FvOUphL3Nxzj7Vay+CZF8p5pHZugKMh
	w14mJXMUFWmp9R3XOroOHyn6NSjMhUJMMRgjctiMgA==
X-Google-Smtp-Source: AGRyM1uFLXgRLqXAUoOqJZMzCqxQhJrcnevmfJz6sq3en7AEn2uog+RxKnMuRlH/uclo0B3Xdh3mvjZbp0X+fsNH/8E=
X-Received: by 2002:a25:cc56:0:b0:66c:d0f6:2f0e with SMTP id
 l83-20020a25cc56000000b0066cd0f62f0emr11356145ybf.168.1656422805211; Tue, 28
 Jun 2022 06:26:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220628095833.2579903-1-elver@google.com> <20220628095833.2579903-2-elver@google.com>
 <CACT4Y+brMfpe1_T5eaki8YLRVeCsFqJ6WbUCAe2+ALNTT=By0w@mail.gmail.com>
In-Reply-To: <CACT4Y+brMfpe1_T5eaki8YLRVeCsFqJ6WbUCAe2+ALNTT=By0w@mail.gmail.com>
From: Marco Elver <elver@google.com>
Date: Tue, 28 Jun 2022 15:26:09 +0200
Message-ID: <CANpmjNPYMSWOFa5mG9HZnjZUGg7DhGDcLN2dsATZFZh1y5C36Q@mail.gmail.com>
Subject: Re: [PATCH v2 01/13] perf/hw_breakpoint: Add KUnit test for
 constraints accounting
To: Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Frederic Weisbecker <frederic@kernel.org>, x86@kernel.org, linuxppc-dev@lists.ozlabs.org, Arnaldo Carvalho de Melo <acme@kernel.org>, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, Alexander Shishkin <alexander.shishkin@linux.intel.com>, kasan-dev@googlegroups.com, Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Jiri Olsa <jolsa@redhat.com>, Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 28 Jun 2022 at 14:53, Dmitry Vyukov <dvyukov@google.com> wrote:
>
>  On Tue, 28 Jun 2022 at 11:59, Marco Elver <elver@google.com> wrote:
> >
> > Add KUnit test for hw_breakpoint constraints accounting, with various
> > interesting mixes of breakpoint targets (some care was taken to catch
> > interesting corner cases via bug-injection).
> >
> > The test cannot be built as a module because it requires access to
> > hw_breakpoint_slots(), which is not inlinable or exported on all
> > architectures.
> >
> > Signed-off-by: Marco Elver <elver@google.com>
> > ---
> > v2:
> > * New patch.
> > ---
> >  kernel/events/Makefile             |   1 +
> >  kernel/events/hw_breakpoint_test.c | 321 +++++++++++++++++++++++++++++
> >  lib/Kconfig.debug                  |  10 +
> >  3 files changed, 332 insertions(+)
> >  create mode 100644 kernel/events/hw_breakpoint_test.c
> >
> > diff --git a/kernel/events/Makefile b/kernel/events/Makefile
> > index 8591c180b52b..91a62f566743 100644
> > --- a/kernel/events/Makefile
> > +++ b/kernel/events/Makefile
> > @@ -2,4 +2,5 @@
> >  obj-y := core.o ring_buffer.o callchain.o
> >
> >  obj-$(CONFIG_HAVE_HW_BREAKPOINT) += hw_breakpoint.o
> > +obj-$(CONFIG_HW_BREAKPOINT_KUNIT_TEST) += hw_breakpoint_test.o
> >  obj-$(CONFIG_UPROBES) += uprobes.o
> > diff --git a/kernel/events/hw_breakpoint_test.c b/kernel/events/hw_breakpoint_test.c
> > new file mode 100644
> > index 000000000000..747a0249a606
> > --- /dev/null
> > +++ b/kernel/events/hw_breakpoint_test.c
> > @@ -0,0 +1,321 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * KUnit test for hw_breakpoint constraints accounting logic.
> > + *
> > + * Copyright (C) 2022, Google LLC.
> > + */
> > +
> > +#include <kunit/test.h>
> > +#include <linux/cpumask.h>
> > +#include <linux/hw_breakpoint.h>
> > +#include <linux/kthread.h>
> > +#include <linux/perf_event.h>
> > +#include <asm/hw_breakpoint.h>
> > +
> > +#define TEST_REQUIRES_BP_SLOTS(test, slots)                                            \
> > +       do {                                                                            \
> > +               if ((slots) > get_test_bp_slots()) {                                    \
> > +                       kunit_skip((test), "Requires breakpoint slots: %d > %d", slots, \
> > +                                  get_test_bp_slots());                                \
> > +               }                                                                       \
> > +       } while (0)
> > +
> > +#define TEST_EXPECT_NOSPC(expr) KUNIT_EXPECT_EQ(test, -ENOSPC, PTR_ERR(expr))
> > +
> > +#define MAX_TEST_BREAKPOINTS 512
> > +
> > +static char break_vars[MAX_TEST_BREAKPOINTS];
> > +static struct perf_event *test_bps[MAX_TEST_BREAKPOINTS];
> > +static struct task_struct *__other_task;
> > +
> > +static struct perf_event *register_test_bp(int cpu, struct task_struct *tsk, int idx)
> > +{
> > +       struct perf_event_attr attr = {};
> > +
> > +       if (WARN_ON(idx < 0 || idx >= MAX_TEST_BREAKPOINTS))
> > +               return NULL;
> > +
> > +       hw_breakpoint_init(&attr);
> > +       attr.bp_addr = (unsigned long)&break_vars[idx];
> > +       attr.bp_len = HW_BREAKPOINT_LEN_1;
> > +       attr.bp_type = HW_BREAKPOINT_RW;
> > +       return perf_event_create_kernel_counter(&attr, cpu, tsk, NULL, NULL);
> > +}
> > +
> > +static void unregister_test_bp(struct perf_event **bp)
> > +{
> > +       if (WARN_ON(IS_ERR(*bp)))
> > +               return;
> > +       if (WARN_ON(!*bp))
> > +               return;
> > +       unregister_hw_breakpoint(*bp);
> > +       *bp = NULL;
> > +}
> > +
> > +static int get_test_bp_slots(void)
> > +{
> > +       static int slots;
>
> Why is this function needed? Is hw_breakpoint_slots() very slow?

It seems non-trivial on some architectures (e.g.
arch/arm64/kernel/hw_breakpoint.c). Also the reason why
hw_breakpoint.c itself caches it, so I decided to follow the same
because it's called very often in the tests.

> > +
> > +       if (!slots)
> > +               slots = hw_breakpoint_slots(TYPE_DATA);
> > +
> > +       return slots;
> > +}
> > +
> > +static void fill_one_bp_slot(struct kunit *test, int *id, int cpu, struct task_struct *tsk)
> > +{
> > +       struct perf_event *bp = register_test_bp(cpu, tsk, *id);
> > +
> > +       KUNIT_ASSERT_NOT_NULL(test, bp);
> > +       KUNIT_ASSERT_FALSE(test, IS_ERR(bp));
> > +       KUNIT_ASSERT_NULL(test, test_bps[*id]);
> > +       test_bps[(*id)++] = bp;
> > +}
> > +
> > +/*
> > + * Fills up the given @cpu/@tsk with breakpoints, only leaving @skip slots free.
> > + *
> > + * Returns true if this can be called again, continuing at @id.
> > + */
> > +static bool fill_bp_slots(struct kunit *test, int *id, int cpu, struct task_struct *tsk, int skip)
> > +{
> > +       for (int i = 0; i < get_test_bp_slots() - skip; ++i)
> > +               fill_one_bp_slot(test, id, cpu, tsk);
> > +
> > +       return *id + get_test_bp_slots() <= MAX_TEST_BREAKPOINTS;
> > +}
> > +
> > +static int dummy_kthread(void *arg)
> > +{
> > +       return 0;
> > +}
> > +
> > +static struct task_struct *get_other_task(struct kunit *test)
> > +{
> > +       struct task_struct *tsk;
> > +
> > +       if (__other_task)
> > +               return __other_task;
> > +
> > +       tsk = kthread_create(dummy_kthread, NULL, "hw_breakpoint_dummy_task");
> > +       KUNIT_ASSERT_FALSE(test, IS_ERR(tsk));
> > +       __other_task = tsk;
> > +       return __other_task;
> > +}
> > +
> > +static int get_other_cpu(void)
> > +{
> > +       int cpu;
> > +
> > +       for_each_online_cpu(cpu) {
> > +               if (cpu != raw_smp_processor_id())
>
> Are we guaranteed to not be rescheduled in the middle of a test?
> If not, can't get_other_cpu() return the same CPU that was returned by
> raw_smp_processor_id() earlier in the test?

Yes, good point. I think I'll change it to just not use
raw_smp_processor_id() and instead have get_test_cpu(int num) and it
tries to find the 'num' online CPU. In the tests I'll just use CPU
#num 0 and 1.
