Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A4357BA9B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jul 2022 17:40:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lp0Jc3JZKz3chB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jul 2022 01:40:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=KDo9ERkE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::112b; helo=mail-yw1-x112b.google.com; envelope-from=elver@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=KDo9ERkE;
	dkim-atps=neutral
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lp0J2321Sz3blV
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Jul 2022 01:39:46 +1000 (AEST)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-31e0d4ad6caso117480407b3.10
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Jul 2022 08:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JRcq3vKjIzJm9TVcaSce4sIDa9ZUrBaFgnnM4S7LNls=;
        b=KDo9ERkEPtznpuEHkYtWEOmYc/0qDr8bRu3EUez0IyX5/TKh8u5qZjnFAT2I4QfW9e
         ZMV0w1MMyUxfvRthzXQqkj33GhOJWLpqg7tC5ovWDjXoHPRDKr9EsCtlHlPSOfIpFx3D
         CXME498rdwmBEyTqTDuj2YvpweKS48GnrAqYmWnGH0cec8LzfEml3gIuCufit0mRKQYy
         bhkjqwrGOHKuMDfcfqbKXW1MoRee3DzPTOvyd4fX5Spr0cTN7I+DpvQ8KDEQHuD1KvZf
         okqE4UWVk+RHjtzl+ezoVyGLHMgwAygcaKP5BfZt7hvpynO42mZSfTTK9LYQs8LKGZOO
         R3fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JRcq3vKjIzJm9TVcaSce4sIDa9ZUrBaFgnnM4S7LNls=;
        b=RcRb36uuQvU35iGjRD4Ea1zISrpLRLM8RBhvsynUZbh13shqmOkaW06c8qgwcQcxtb
         yCp+nTy0XDny3AlwyQy0Vjo31FbnRihRNyDYip4K3z4qEz2PoiXACyJkTNWcrb/gf0+G
         /OMuOEXm7IgRxV622VDNKmOVdzFRJSHc2lYK2sM8q5jvCr3FI8CrAmPUREBac1P184Tw
         5cLjKmbs7ydqLiTc/JT1ADGVTHq9Mwaj2tMICHUWcLN1SrqksziwbSq8tBLG0Y9mvMJM
         yZGO0hgBD0p2yD2x8WLq5RTHbO1Vp48qe+3lKzHCKWUQPUuLz+BQ7OYGCXxhClfJQ2qO
         NHQw==
X-Gm-Message-State: AJIora8cdFGaZMtc1g2/XetvSLAf57ed4UFNUV1UAHx8qFsAu1dszFOz
	goGy9PtCOJpTtDNvwsKD3oGpeE/uZ8ZKRh9+sy3Uiw==
X-Google-Smtp-Source: AGRyM1vLajKuouK35jbILBRb3Kg0zRLUMXuWQoMOQdNY3/mojOBheS8cAO8ZsFxrXr5sAhOImjaLAsQQKMEv/xrTRkE=
X-Received: by 2002:a81:5794:0:b0:31d:e7b3:b8a3 with SMTP id
 l142-20020a815794000000b0031de7b3b8a3mr32091574ywb.333.1658331582641; Wed, 20
 Jul 2022 08:39:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220704150514.48816-1-elver@google.com> <20220704150514.48816-5-elver@google.com>
 <CAP-5=fXgi_RUOzSvPZvxNh6A14OY0S_oCHgAD0==nSLXzWqFFQ@mail.gmail.com>
In-Reply-To: <CAP-5=fXgi_RUOzSvPZvxNh6A14OY0S_oCHgAD0==nSLXzWqFFQ@mail.gmail.com>
From: Marco Elver <elver@google.com>
Date: Wed, 20 Jul 2022 17:39:06 +0200
Message-ID: <CANpmjNOcuacOv7DT4udZwMMuu+7QgaZO7wJ5MReVtC_Vg=ptTQ@mail.gmail.com>
Subject: Re: [PATCH v3 04/14] perf/hw_breakpoint: Optimize list of per-task breakpoints
To: Ian Rogers <irogers@google.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Frederic Weisbecker <frederic@kernel.org>, x86@kernel.org, linuxppc-dev@lists.ozlabs.org, Arnaldo Carvalho de Melo <acme@kernel.org>, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, Alexander Shishkin <alexander.shishkin@linux.intel.com>, kasan-dev@googlegroups.com, Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Jiri Olsa <jolsa@redhat.com>, Ingo Molnar <mingo@kernel.org>, Dmitry Vyukov <dvyukov@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 20 Jul 2022 at 17:29, Ian Rogers <irogers@google.com> wrote:
>
> On Mon, Jul 4, 2022 at 8:06 AM Marco Elver <elver@google.com> wrote:
> >
> > On a machine with 256 CPUs, running the recently added perf breakpoint
> > benchmark results in:
> >
> >  | $> perf bench -r 30 breakpoint thread -b 4 -p 64 -t 64
> >  | # Running 'breakpoint/thread' benchmark:
> >  | # Created/joined 30 threads with 4 breakpoints and 64 parallelism
> >  |      Total time: 236.418 [sec]
> >  |
> >  |   123134.794271 usecs/op
> >  |  7880626.833333 usecs/op/cpu
> >
> > The benchmark tests inherited breakpoint perf events across many
> > threads.
> >
> > Looking at a perf profile, we can see that the majority of the time is
> > spent in various hw_breakpoint.c functions, which execute within the
> > 'nr_bp_mutex' critical sections which then results in contention on that
> > mutex as well:
> >
> >     37.27%  [kernel]       [k] osq_lock
> >     34.92%  [kernel]       [k] mutex_spin_on_owner
> >     12.15%  [kernel]       [k] toggle_bp_slot
> >     11.90%  [kernel]       [k] __reserve_bp_slot
> >
> > The culprit here is task_bp_pinned(), which has a runtime complexity of
> > O(#tasks) due to storing all task breakpoints in the same list and
> > iterating through that list looking for a matching task. Clearly, this
> > does not scale to thousands of tasks.
> >
> > Instead, make use of the "rhashtable" variant "rhltable" which stores
> > multiple items with the same key in a list. This results in average
> > runtime complexity of O(1) for task_bp_pinned().
> >
> > With the optimization, the benchmark shows:
> >
> >  | $> perf bench -r 30 breakpoint thread -b 4 -p 64 -t 64
> >  | # Running 'breakpoint/thread' benchmark:
> >  | # Created/joined 30 threads with 4 breakpoints and 64 parallelism
> >  |      Total time: 0.208 [sec]
> >  |
> >  |      108.422396 usecs/op
> >  |     6939.033333 usecs/op/cpu
> >
> > On this particular setup that's a speedup of ~1135x.
> >
> > While one option would be to make task_struct a breakpoint list node,
> > this would only further bloat task_struct for infrequently used data.
> > Furthermore, after all optimizations in this series, there's no evidence
> > it would result in better performance: later optimizations make the time
> > spent looking up entries in the hash table negligible (we'll reach the
> > theoretical ideal performance i.e. no constraints).
> >
> > Signed-off-by: Marco Elver <elver@google.com>
> > Reviewed-by: Dmitry Vyukov <dvyukov@google.com>
> > ---
> > v2:
> > * Commit message tweaks.
> > ---
> >  include/linux/perf_event.h    |  3 +-
> >  kernel/events/hw_breakpoint.c | 56 ++++++++++++++++++++++-------------
> >  2 files changed, 37 insertions(+), 22 deletions(-)
> >
> > diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
> > index 01231f1d976c..e27360436dc6 100644
> > --- a/include/linux/perf_event.h
> > +++ b/include/linux/perf_event.h
> > @@ -36,6 +36,7 @@ struct perf_guest_info_callbacks {
> >  };
> >
> >  #ifdef CONFIG_HAVE_HW_BREAKPOINT
> > +#include <linux/rhashtable-types.h>
> >  #include <asm/hw_breakpoint.h>
> >  #endif
> >
> > @@ -178,7 +179,7 @@ struct hw_perf_event {
> >                          * creation and event initalization.
> >                          */
> >                         struct arch_hw_breakpoint       info;
> > -                       struct list_head                bp_list;
> > +                       struct rhlist_head              bp_list;
>
> nit: perhaps it would be more intention revealing here to rename this
> to bp_hashtable?

The naming convention for uses of rhlist_head appears to be either
'list' or 'node' (also inside lib/rhashtable.c). I think this makes
sense because internally this struct is used to just append to the
bucket's list.

> Acked-by: Ian Rogers <irogers@google.com>

Thanks!
-- Marco
