Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B96595E23
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Aug 2022 16:13:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M6Y5t5C6Nz3bxp
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Aug 2022 00:13:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=fDj6Fopp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::112a; helo=mail-yw1-x112a.google.com; envelope-from=elver@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=fDj6Fopp;
	dkim-atps=neutral
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M6Y5H4RKxz3bXy
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Aug 2022 00:12:50 +1000 (AEST)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-333b049f231so42557807b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Aug 2022 07:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=Vyh7nX6aNSNUE119qdiIIT/EoXittiyqJ3KmpoRb3JU=;
        b=fDj6FoppCemEAwso3o7LaD74WUC1I9oEzmYzOiTRD1OOS+4Bh/MPtP7m5uo8mLYe8C
         zjiVBUaPQ3d7zM+BHkTObTgsVSBd9aM9wKIW8UUHuYI2CXJkxy+j0lvwAbiMhmbKWwl4
         a16VohoYwhqmH4juBAj0nl6EkhgDKPGuuylgPjsCBy90RROWdi4K+AERKW55Swmsat7e
         gnR7lOcShMaxofH2EhqaBVQcfGs2vhqk4kVv+35th/mz8bcupB5rEqa7i56L72oV8VbK
         VzJx+/RwAFTqDU3LqTCDymIJPC5R6KkqcOySUiJTzF/kKwXNS+QpJMPFKemJ/d79x23F
         eiQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=Vyh7nX6aNSNUE119qdiIIT/EoXittiyqJ3KmpoRb3JU=;
        b=0ckiLGsPseIFBvtnablqtUmkQF5SO9IRSK4DXxLwnUqQ1x385BuAzp+9mD+G0W/omJ
         /hVQ5kWjm+iVx9azYcEdgF42soIb2C01c6zHGTVtVv9vJ7Sh1JwbNDsieAH9i/2qyrf5
         cy0GoQbr2FUXvMfO7X0rnQh9mxQy+YI/jA5vwipRJ3QVRkdALmB+h5q+yzMgqxE74esN
         2Z8jFlA0RgU9z5wo1gtA7fb/uO7nr1ulUeydPCGoNL2F5W7d0U/Q+1D1TO2H8RBonvAq
         bEhInBeyCGqSFx0tVWtKW9vEEGFIUwf6zD9wztchY3kfnd0DZnqtBl06pn7Q93tnKG+A
         Xf5A==
X-Gm-Message-State: ACgBeo2pAks6+XycabRfPH6JhxhnkDuq+jjj4py78aSKV/sGmC9PPcLy
	3IUDRbJFr6Ag05lksp40z/2NkWokLFQMNmiT04NOfg==
X-Google-Smtp-Source: AA6agR6Cj7c7hUVt8CtUfA7vQh2q4zez305SpvmX/WRPpgHJLs/Mntp/ap6raCDGqlCGO9HtoAnpVoiUF1QjmGuI+uU=
X-Received: by 2002:a25:490:0:b0:67c:22be:65db with SMTP id
 138-20020a250490000000b0067c22be65dbmr15094214ybe.16.1660659166737; Tue, 16
 Aug 2022 07:12:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220704150514.48816-1-elver@google.com> <CANpmjNP0hPuhXmZmkX1ytCDh56LOAmxJjf7RyfxOvoaem=2d8Q@mail.gmail.com>
 <CAP-5=fXgYWuHKkfAxxTeAzTuq7PLwMd6UvBu+J+6tnqHwraSCA@mail.gmail.com>
In-Reply-To: <CAP-5=fXgYWuHKkfAxxTeAzTuq7PLwMd6UvBu+J+6tnqHwraSCA@mail.gmail.com>
From: Marco Elver <elver@google.com>
Date: Tue, 16 Aug 2022 16:12:10 +0200
Message-ID: <CANpmjNOnRNKUTeSB9+LBTjG=2+BC=ox20ain1F8T1krS+ah9HA@mail.gmail.com>
Subject: Re: [PATCH v3 00/14] perf/hw_breakpoint: Optimize for thousands of tasks
To: Peter Zijlstra <peterz@infradead.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>, linux-sh@vger.kernel.org, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Frederic Weisbecker <frederic@kernel.org>, x86@kernel.org, linuxppc-dev@lists.ozlabs.org, Arnaldo Carvalho de Melo <acme@kernel.org>, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, kasan-dev@googlegroups.com, Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Jiri Olsa <jolsa@redhat.com>, Ingo Molnar <mingo@kernel.org>, Dmitry Vyukov <dvyukov@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 20 Jul 2022 at 17:47, Ian Rogers <irogers@google.com> wrote:
> On Tue, Jul 12, 2022 at 6:41 AM Marco Elver <elver@google.com> wrote:
> > On Mon, 4 Jul 2022 at 17:05, Marco Elver <elver@google.com> wrote:
> > > The hw_breakpoint subsystem's code has seen little change in over 10
> > > years. In that time, systems with >100s of CPUs have become common,
> > > along with improvements to the perf subsystem: using breakpoints on
> > > thousands of concurrent tasks should be a supported usecase.
> > [...]
> > > Marco Elver (14):
> > >   perf/hw_breakpoint: Add KUnit test for constraints accounting
> > >   perf/hw_breakpoint: Provide hw_breakpoint_is_used() and use in test
> > >   perf/hw_breakpoint: Clean up headers
> > >   perf/hw_breakpoint: Optimize list of per-task breakpoints
> > >   perf/hw_breakpoint: Mark data __ro_after_init
> > >   perf/hw_breakpoint: Optimize constant number of breakpoint slots
> > >   perf/hw_breakpoint: Make hw_breakpoint_weight() inlinable
> > >   perf/hw_breakpoint: Remove useless code related to flexible
> > >     breakpoints
> > >   powerpc/hw_breakpoint: Avoid relying on caller synchronization
> > >   locking/percpu-rwsem: Add percpu_is_write_locked() and
> > >     percpu_is_read_locked()
> > >   perf/hw_breakpoint: Reduce contention with large number of tasks
> > >   perf/hw_breakpoint: Introduce bp_slots_histogram
> > >   perf/hw_breakpoint: Optimize max_bp_pinned_slots() for CPU-independent
> > >     task targets
> > >   perf/hw_breakpoint: Optimize toggle_bp_slot() for CPU-independent task
> > >     targets
> > [...]
> >
> > This is ready from our side, and given the silence, assume it's ready
> > to pick up and/or have a maintainer take a look. Since this is mostly
> > kernel/events, would -tip/perf/core be appropriate?
>
> These are awesome improvements, I've added my acked-by to every
> change. I hope we can pull these changes, as you say, into tip.git
> perf/core and get them into 5.20.

These still apply cleanly to 6.0-rc1 and the test passes, but let me
know if I shall send a rebased version.

Thanks
-- Marco
