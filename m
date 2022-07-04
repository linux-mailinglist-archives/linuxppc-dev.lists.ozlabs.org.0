Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 342CF565998
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jul 2022 17:15:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lc8WW0hcBz3fgb
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Jul 2022 01:15:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=ThmQg/xx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::133; helo=mail-lf1-x133.google.com; envelope-from=dvyukov@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=ThmQg/xx;
	dkim-atps=neutral
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lc8P300Mvz3f9d
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Jul 2022 01:09:58 +1000 (AEST)
Received: by mail-lf1-x133.google.com with SMTP id g11so1036557lfb.11
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Jul 2022 08:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7hCwDytAsB4d/o82PG/imXl6AB+798LjkY2ZfHNBYrI=;
        b=ThmQg/xxfdOOytGKZPYXFkjrB6rORV49rmwVnEzozNItIQovlnXYg1BPeS4b9eBnKn
         OuIGQ0fZkghqru/RvIC0zLh3jCDnd08wqc/mCaDkmdf8cUGR4xBtqHjEWYhfIVg06f7z
         T98O4cYhVvnA9/OHLuKcU2y2BnQrmbMlZ7TUsHxjTY+H4r2Hhzrl80a4N4BX4jnp6LNU
         3rIzy4JWOXJ+YyA3DzaNFrxJVuxyM5a/VyWFQqRuRUhXvCg5BUJx+8FUIBki6xNxiOtN
         h/YMHmeXX5Nuz5rb+LXzAFWQwWU+I/zDKBYeTdJXvOA+gdWh5NJh6H3G2G2HUZvP7YfM
         rjVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7hCwDytAsB4d/o82PG/imXl6AB+798LjkY2ZfHNBYrI=;
        b=hMZ1B2+m3WiLiSUjmFQG3Mm4ECJOKg9Q7T8SPasdi+qF3VG/uijYZVtyUEYYi8VCqJ
         J1HPhZDcNsvDvQwJTNcysWKzSj25+563GS0hZnkjUEju30lezoHPPNLZvwxsVDJqCf6w
         wKUTDLUmEvA8rEpPNMeMAxL9C+KKZLZF2ApGvdu3OrYX9Np0KnpYz0pKRZpl3BOPUsL+
         JnCInz6ZOsjRKUEE9OTw9h2Z/phcOOq3V0Ac8GWQcm1yndfYDEXxm1swVh8y58nsGzi6
         tqrLHVXsw52ifwBasiUNm4lSgM59hdhAO6EPhimL5QEdPDB8usFejtn9/7va6e81pb5T
         Amhg==
X-Gm-Message-State: AJIora+zqTecgWlzIQxncvhv4suSDiP21td6fyAwE1/qRV/WfvG2WvV6
	77v+E0atOIhAmH+9Yng1pBwLElTUj4SSrX39w4Jl6VvzyCc=
X-Google-Smtp-Source: AGRyM1vvveNlQAUCPmccpFZXd+iaYP+qw1ex9ZueZxdiA7XY/8IwWOFpzTbiGpETzSOHGeXOl0IWYwrQOMgSTw5OWLQ=
X-Received: by 2002:a05:6512:1056:b0:47f:6f00:66c2 with SMTP id
 c22-20020a056512105600b0047f6f0066c2mr18349441lfb.410.1656947393715; Mon, 04
 Jul 2022 08:09:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220704150514.48816-1-elver@google.com> <20220704150514.48816-3-elver@google.com>
In-Reply-To: <20220704150514.48816-3-elver@google.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Mon, 4 Jul 2022 17:09:42 +0200
Message-ID: <CACT4Y+aYCkTWu+vBdX2d5GNB9z8oZ+8=a330sK9s18FS8t+6=Q@mail.gmail.com>
Subject: Re: [PATCH v3 02/14] perf/hw_breakpoint: Provide hw_breakpoint_is_used()
 and use in test
To: Marco Elver <elver@google.com>
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

On Mon, 4 Jul 2022 at 17:06, Marco Elver <elver@google.com> wrote:
>
> Provide hw_breakpoint_is_used() to check if breakpoints are in use on
> the system.
>
> Use it in the KUnit test to verify the global state before and after a
> test case.
>
> Signed-off-by: Marco Elver <elver@google.com>

Reviewed-by: Dmitry Vyukov <dvyukov@google.com>

> ---
> v3:
> * New patch.
> ---
>  include/linux/hw_breakpoint.h      |  3 +++
>  kernel/events/hw_breakpoint.c      | 29 +++++++++++++++++++++++++++++
>  kernel/events/hw_breakpoint_test.c | 12 +++++++++++-
>  3 files changed, 43 insertions(+), 1 deletion(-)
>
> diff --git a/include/linux/hw_breakpoint.h b/include/linux/hw_breakpoint.h
> index 78dd7035d1e5..a3fb846705eb 100644
> --- a/include/linux/hw_breakpoint.h
> +++ b/include/linux/hw_breakpoint.h
> @@ -74,6 +74,7 @@ register_wide_hw_breakpoint(struct perf_event_attr *attr,
>  extern int register_perf_hw_breakpoint(struct perf_event *bp);
>  extern void unregister_hw_breakpoint(struct perf_event *bp);
>  extern void unregister_wide_hw_breakpoint(struct perf_event * __percpu *cpu_events);
> +extern bool hw_breakpoint_is_used(void);
>
>  extern int dbg_reserve_bp_slot(struct perf_event *bp);
>  extern int dbg_release_bp_slot(struct perf_event *bp);
> @@ -121,6 +122,8 @@ register_perf_hw_breakpoint(struct perf_event *bp)  { return -ENOSYS; }
>  static inline void unregister_hw_breakpoint(struct perf_event *bp)     { }
>  static inline void
>  unregister_wide_hw_breakpoint(struct perf_event * __percpu *cpu_events)        { }
> +static inline bool hw_breakpoint_is_used(void)         { return false; }
> +
>  static inline int
>  reserve_bp_slot(struct perf_event *bp)                 {return -ENOSYS; }
>  static inline void release_bp_slot(struct perf_event *bp)              { }
> diff --git a/kernel/events/hw_breakpoint.c b/kernel/events/hw_breakpoint.c
> index f32320ac02fd..fd5cd1f9e7fc 100644
> --- a/kernel/events/hw_breakpoint.c
> +++ b/kernel/events/hw_breakpoint.c
> @@ -604,6 +604,35 @@ void unregister_wide_hw_breakpoint(struct perf_event * __percpu *cpu_events)
>  }
>  EXPORT_SYMBOL_GPL(unregister_wide_hw_breakpoint);
>
> +/**
> + * hw_breakpoint_is_used - check if breakpoints are currently used
> + *
> + * Returns: true if breakpoints are used, false otherwise.
> + */
> +bool hw_breakpoint_is_used(void)
> +{
> +       int cpu;
> +
> +       if (!constraints_initialized)
> +               return false;
> +
> +       for_each_possible_cpu(cpu) {
> +               for (int type = 0; type < TYPE_MAX; ++type) {
> +                       struct bp_cpuinfo *info = get_bp_info(cpu, type);
> +
> +                       if (info->cpu_pinned)
> +                               return true;
> +
> +                       for (int slot = 0; slot < nr_slots[type]; ++slot) {
> +                               if (info->tsk_pinned[slot])
> +                                       return true;
> +                       }
> +               }
> +       }
> +
> +       return false;
> +}
> +
>  static struct notifier_block hw_breakpoint_exceptions_nb = {
>         .notifier_call = hw_breakpoint_exceptions_notify,
>         /* we need to be notified first */
> diff --git a/kernel/events/hw_breakpoint_test.c b/kernel/events/hw_breakpoint_test.c
> index 433c5c45e2a5..5ced822df788 100644
> --- a/kernel/events/hw_breakpoint_test.c
> +++ b/kernel/events/hw_breakpoint_test.c
> @@ -294,7 +294,14 @@ static struct kunit_case hw_breakpoint_test_cases[] = {
>  static int test_init(struct kunit *test)
>  {
>         /* Most test cases want 2 distinct CPUs. */
> -       return num_online_cpus() < 2 ? -EINVAL : 0;
> +       if (num_online_cpus() < 2)
> +               return -EINVAL;
> +
> +       /* Want the system to not use breakpoints elsewhere. */
> +       if (hw_breakpoint_is_used())
> +               return -EBUSY;
> +
> +       return 0;
>  }
>
>  static void test_exit(struct kunit *test)
> @@ -308,6 +315,9 @@ static void test_exit(struct kunit *test)
>                 kthread_stop(__other_task);
>                 __other_task = NULL;
>         }
> +
> +       /* Verify that internal state agrees that no breakpoints are in use. */
> +       KUNIT_EXPECT_FALSE(test, hw_breakpoint_is_used());
>  }
>
>  static struct kunit_suite hw_breakpoint_test_suite = {
> --
> 2.37.0.rc0.161.g10f37bed90-goog
>
