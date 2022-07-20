Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F7857B987
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jul 2022 17:23:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lnzxb686wz3dsS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jul 2022 01:23:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=gJKMaw7O;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com; envelope-from=irogers@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=gJKMaw7O;
	dkim-atps=neutral
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lnzwv4yzRz3dB2
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Jul 2022 01:23:11 +1000 (AEST)
Received: by mail-wr1-x435.google.com with SMTP id h8so3884145wrw.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Jul 2022 08:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vOU8fNK31UdaRFTxZH7uUNE10MhT+gyU0GxNesrMTbk=;
        b=gJKMaw7OQwUE8Pl82nASUpBV4CsNQg2+F33xJj7v8amh288eCv9edv4bEuz5Ihf6zq
         Y1aZR7HfYF1dH9JYipjA7nh7IeXkWXwxfpZbzCLak3lfmkGNTBbq9zbzND9LvlhEJ0tw
         L7Cme0DFbAMsL+Km35Aq7T7mkyrZyjM3ejLCO1rACTQF2dGqR+2aT1yrne7DQtAZQ5nh
         l7FDfNdM+eaWlD01XQ3yzUFD91FtX5fidvr605rvCT2KxKPRdPBuQ9sjhmLrTbUrcs3f
         rgF+mmeeOlHYtIYYQyCKjUo0jSSu2lQOPc6mA6MlL03DQ9DndWc45505ylDGPpXPyp33
         GFug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vOU8fNK31UdaRFTxZH7uUNE10MhT+gyU0GxNesrMTbk=;
        b=T2vLxTQAKVVlfnXjqxsIBMbkJDeZkDN21KoPK5IDCVoOFPVBgdfU75AVU/tWy2FJHQ
         CbT46P0K7Zj3PbZLuqBVsuo76LXOjBtiYvtMPzYipZNSnz0Mt5q8lp31OvTAhAV/KL+I
         iGPsmSdXMIWa9y0AA32dFUvAkdzemVUr5hnjWg49AeSEljpiGqGdWKxYA4+iG99x+mDe
         oWqyihTzMeCA8Rkc6sysL+RhA1gL0BDKd5obq0BbQHbT0kCcuSQpjLB1fojI47sOJAGL
         c/I2cPl+xGryc51zRAhqIzLlBS7dtgDmeLuPvwrAcWd7AU+VsUbfrjFy4lY0Qyab2sbN
         xvAg==
X-Gm-Message-State: AJIora/JqUi2ZkOoRZoBafyedNVG+BBLpwYp6DftBsK5ZdlANRuWOA5X
	led/Uph+214hFaPvKxJyPt8exbsG6IzE4nNgz0mvWQ==
X-Google-Smtp-Source: AGRyM1tZmXjjuviW3um3Zs7KIJzIOIOdxEu1q/OkiLALO3+VsFJigpodFYG/Q1++/Z9jVmED5wEZC5v9q22r32zBYo8=
X-Received: by 2002:a05:6000:8e:b0:21d:7e97:67ed with SMTP id
 m14-20020a056000008e00b0021d7e9767edmr30017427wrx.343.1658330588252; Wed, 20
 Jul 2022 08:23:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220704150514.48816-1-elver@google.com> <20220704150514.48816-3-elver@google.com>
 <CACT4Y+aYCkTWu+vBdX2d5GNB9z8oZ+8=a330sK9s18FS8t+6=Q@mail.gmail.com>
In-Reply-To: <CACT4Y+aYCkTWu+vBdX2d5GNB9z8oZ+8=a330sK9s18FS8t+6=Q@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 20 Jul 2022 08:22:56 -0700
Message-ID: <CAP-5=fWBVm08LetcyRUh6MK+_gQmyJYxR2sfeZ8LvXfeeJs=zg@mail.gmail.com>
Subject: Re: [PATCH v3 02/14] perf/hw_breakpoint: Provide hw_breakpoint_is_used()
 and use in test
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
Cc: Mark Rutland <mark.rutland@arm.com>, Marco Elver <elver@google.com>, linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Frederic Weisbecker <frederic@kernel.org>, x86@kernel.org, linuxppc-dev@lists.ozlabs.org, Arnaldo Carvalho de Melo <acme@kernel.org>, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, Alexander Shishkin <alexander.shishkin@linux.intel.com>, kasan-dev@googlegroups.com, Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Jiri Olsa <jolsa@redhat.com>, Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 4, 2022 at 8:10 AM Dmitry Vyukov <dvyukov@google.com> wrote:
>
> On Mon, 4 Jul 2022 at 17:06, Marco Elver <elver@google.com> wrote:
> >
> > Provide hw_breakpoint_is_used() to check if breakpoints are in use on
> > the system.
> >
> > Use it in the KUnit test to verify the global state before and after a
> > test case.
> >
> > Signed-off-by: Marco Elver <elver@google.com>
>
> Reviewed-by: Dmitry Vyukov <dvyukov@google.com>

Acked-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> > ---
> > v3:
> > * New patch.
> > ---
> >  include/linux/hw_breakpoint.h      |  3 +++
> >  kernel/events/hw_breakpoint.c      | 29 +++++++++++++++++++++++++++++
> >  kernel/events/hw_breakpoint_test.c | 12 +++++++++++-
> >  3 files changed, 43 insertions(+), 1 deletion(-)
> >
> > diff --git a/include/linux/hw_breakpoint.h b/include/linux/hw_breakpoint.h
> > index 78dd7035d1e5..a3fb846705eb 100644
> > --- a/include/linux/hw_breakpoint.h
> > +++ b/include/linux/hw_breakpoint.h
> > @@ -74,6 +74,7 @@ register_wide_hw_breakpoint(struct perf_event_attr *attr,
> >  extern int register_perf_hw_breakpoint(struct perf_event *bp);
> >  extern void unregister_hw_breakpoint(struct perf_event *bp);
> >  extern void unregister_wide_hw_breakpoint(struct perf_event * __percpu *cpu_events);
> > +extern bool hw_breakpoint_is_used(void);
> >
> >  extern int dbg_reserve_bp_slot(struct perf_event *bp);
> >  extern int dbg_release_bp_slot(struct perf_event *bp);
> > @@ -121,6 +122,8 @@ register_perf_hw_breakpoint(struct perf_event *bp)  { return -ENOSYS; }
> >  static inline void unregister_hw_breakpoint(struct perf_event *bp)     { }
> >  static inline void
> >  unregister_wide_hw_breakpoint(struct perf_event * __percpu *cpu_events)        { }
> > +static inline bool hw_breakpoint_is_used(void)         { return false; }
> > +
> >  static inline int
> >  reserve_bp_slot(struct perf_event *bp)                 {return -ENOSYS; }
> >  static inline void release_bp_slot(struct perf_event *bp)              { }
> > diff --git a/kernel/events/hw_breakpoint.c b/kernel/events/hw_breakpoint.c
> > index f32320ac02fd..fd5cd1f9e7fc 100644
> > --- a/kernel/events/hw_breakpoint.c
> > +++ b/kernel/events/hw_breakpoint.c
> > @@ -604,6 +604,35 @@ void unregister_wide_hw_breakpoint(struct perf_event * __percpu *cpu_events)
> >  }
> >  EXPORT_SYMBOL_GPL(unregister_wide_hw_breakpoint);
> >
> > +/**
> > + * hw_breakpoint_is_used - check if breakpoints are currently used
> > + *
> > + * Returns: true if breakpoints are used, false otherwise.
> > + */
> > +bool hw_breakpoint_is_used(void)
> > +{
> > +       int cpu;
> > +
> > +       if (!constraints_initialized)
> > +               return false;
> > +
> > +       for_each_possible_cpu(cpu) {
> > +               for (int type = 0; type < TYPE_MAX; ++type) {
> > +                       struct bp_cpuinfo *info = get_bp_info(cpu, type);
> > +
> > +                       if (info->cpu_pinned)
> > +                               return true;
> > +
> > +                       for (int slot = 0; slot < nr_slots[type]; ++slot) {
> > +                               if (info->tsk_pinned[slot])
> > +                                       return true;
> > +                       }
> > +               }
> > +       }
> > +
> > +       return false;
> > +}
> > +
> >  static struct notifier_block hw_breakpoint_exceptions_nb = {
> >         .notifier_call = hw_breakpoint_exceptions_notify,
> >         /* we need to be notified first */
> > diff --git a/kernel/events/hw_breakpoint_test.c b/kernel/events/hw_breakpoint_test.c
> > index 433c5c45e2a5..5ced822df788 100644
> > --- a/kernel/events/hw_breakpoint_test.c
> > +++ b/kernel/events/hw_breakpoint_test.c
> > @@ -294,7 +294,14 @@ static struct kunit_case hw_breakpoint_test_cases[] = {
> >  static int test_init(struct kunit *test)
> >  {
> >         /* Most test cases want 2 distinct CPUs. */
> > -       return num_online_cpus() < 2 ? -EINVAL : 0;
> > +       if (num_online_cpus() < 2)
> > +               return -EINVAL;
> > +
> > +       /* Want the system to not use breakpoints elsewhere. */
> > +       if (hw_breakpoint_is_used())
> > +               return -EBUSY;
> > +
> > +       return 0;
> >  }
> >
> >  static void test_exit(struct kunit *test)
> > @@ -308,6 +315,9 @@ static void test_exit(struct kunit *test)
> >                 kthread_stop(__other_task);
> >                 __other_task = NULL;
> >         }
> > +
> > +       /* Verify that internal state agrees that no breakpoints are in use. */
> > +       KUNIT_EXPECT_FALSE(test, hw_breakpoint_is_used());
> >  }
> >
> >  static struct kunit_suite hw_breakpoint_test_suite = {
> > --
> > 2.37.0.rc0.161.g10f37bed90-goog
> >
