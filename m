Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E8057BAC5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jul 2022 17:47:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lp0TP56B8z3bnP
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jul 2022 01:47:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=sIAZtEgu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com; envelope-from=irogers@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=sIAZtEgu;
	dkim-atps=neutral
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lp0Sr2k2Vz2xrj
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Jul 2022 01:47:23 +1000 (AEST)
Received: by mail-wm1-x32a.google.com with SMTP id j29-20020a05600c1c1d00b003a2fdafdefbso1536841wms.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Jul 2022 08:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mWnAaZCfU7C7OmxHqnYWgl+iLsNs720nTVq22EtgHY0=;
        b=sIAZtEguKhFTVPEcL45Kz2Y7TjZTXwniuvUqVOFt6zTUcFdJADS0J8AqBdnyMplZjY
         exEHIpC5cGIigKdZRLIrpUGSld8LfBC+X94IatTDzW+dLDf1k6TIHWW6ATZVIngS1Oos
         nXNorTzk3OQ+4Bw6EpGvQnLBrkMxd5it3oR2PPezjhMG5Q19ijxeGtIEqA74Qr5sjlGW
         N88s/rNDien3FWAJVSLrlCkT2frzA2AlziXYuogGSjxppzEPV90/SDc6MNYJGwkKv/to
         DVOUTZLRibFdeN8jUFaxX1PaFm9GcCgplfvOEKFNijKoimUdpo/tP/OlK08U7ey7KuN7
         RXiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mWnAaZCfU7C7OmxHqnYWgl+iLsNs720nTVq22EtgHY0=;
        b=KtejXRJktNtyBuDw+zUpJGSTkhtuAFzGgaqiWz7VOZ5tOJ/7XeWD+XeOR1bs/DsT5J
         wJ8mRMblS9XY51z0JXLsOPwHJXvNSWyyIdDWyxT7LHAtl27xF2fdh1vhM80HllZX8K9V
         pJXAxCXtgQHxHQilScgTwix07qgVwygXeI+1BuC4RNcBa0OYhX6VV5foc/b+1crDQvOW
         L5uyAd/x7eoc6NfiNaF9vbXlA106r25JwxYqXyJ8w+AQwt3Mnnn6H79SFPsaND5+mum8
         4Z8hY+Nne04k+vNSs8tbnazz8C4aJz558+KBB+X7EBJQJDCMTQz+C/Q9qBfPRC2ENGAF
         /POw==
X-Gm-Message-State: AJIora9TUP/lZ3uyBuG5ajDj8jJi8KRyENYGRSENxKhXM569hTNDDLvO
	5IynH8HXLB/z3hvDUmJkjBZRI9++FXbLAmZfkneZcA==
X-Google-Smtp-Source: AGRyM1uVihkw2Sdalue9OE0oAHLSWWUsyLw0DH9Y+XMIaKbggZq5DpgzwDU0hZoWHWE5Iq2mk7j/ulCfYP4kQSqFlzU=
X-Received: by 2002:a7b:ce13:0:b0:3a3:102c:23d3 with SMTP id
 m19-20020a7bce13000000b003a3102c23d3mr4391193wmc.67.1658332040566; Wed, 20
 Jul 2022 08:47:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220704150514.48816-1-elver@google.com> <CANpmjNP0hPuhXmZmkX1ytCDh56LOAmxJjf7RyfxOvoaem=2d8Q@mail.gmail.com>
In-Reply-To: <CANpmjNP0hPuhXmZmkX1ytCDh56LOAmxJjf7RyfxOvoaem=2d8Q@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 20 Jul 2022 08:47:08 -0700
Message-ID: <CAP-5=fXgYWuHKkfAxxTeAzTuq7PLwMd6UvBu+J+6tnqHwraSCA@mail.gmail.com>
Subject: Re: [PATCH v3 00/14] perf/hw_breakpoint: Optimize for thousands of tasks
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Frederic Weisbecker <frederic@kernel.org>, x86@kernel.org, linuxppc-dev@lists.ozlabs.org, Arnaldo Carvalho de Melo <acme@kernel.org>, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, Alexander Shishkin <alexander.shishkin@linux.intel.com>, kasan-dev@googlegroups.com, Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Jiri Olsa <jolsa@redhat.com>, Ingo Molnar <mingo@kernel.org>, Dmitry Vyukov <dvyukov@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 12, 2022 at 6:41 AM Marco Elver <elver@google.com> wrote:
>
> On Mon, 4 Jul 2022 at 17:05, Marco Elver <elver@google.com> wrote:
> >
> > The hw_breakpoint subsystem's code has seen little change in over 10
> > years. In that time, systems with >100s of CPUs have become common,
> > along with improvements to the perf subsystem: using breakpoints on
> > thousands of concurrent tasks should be a supported usecase.
> [...]
> > Marco Elver (14):
> >   perf/hw_breakpoint: Add KUnit test for constraints accounting
> >   perf/hw_breakpoint: Provide hw_breakpoint_is_used() and use in test
> >   perf/hw_breakpoint: Clean up headers
> >   perf/hw_breakpoint: Optimize list of per-task breakpoints
> >   perf/hw_breakpoint: Mark data __ro_after_init
> >   perf/hw_breakpoint: Optimize constant number of breakpoint slots
> >   perf/hw_breakpoint: Make hw_breakpoint_weight() inlinable
> >   perf/hw_breakpoint: Remove useless code related to flexible
> >     breakpoints
> >   powerpc/hw_breakpoint: Avoid relying on caller synchronization
> >   locking/percpu-rwsem: Add percpu_is_write_locked() and
> >     percpu_is_read_locked()
> >   perf/hw_breakpoint: Reduce contention with large number of tasks
> >   perf/hw_breakpoint: Introduce bp_slots_histogram
> >   perf/hw_breakpoint: Optimize max_bp_pinned_slots() for CPU-independent
> >     task targets
> >   perf/hw_breakpoint: Optimize toggle_bp_slot() for CPU-independent task
> >     targets
> [...]
>
> This is ready from our side, and given the silence, assume it's ready
> to pick up and/or have a maintainer take a look. Since this is mostly
> kernel/events, would -tip/perf/core be appropriate?

These are awesome improvements, I've added my acked-by to every
change. I hope we can pull these changes, as you say, into tip.git
perf/core and get them into 5.20.

Thanks,
Ian

> Thanks,
> -- Marco
